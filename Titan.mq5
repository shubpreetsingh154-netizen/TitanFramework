#property strict

#include <Modules/DrawdownGuard.mqh>
#include <Modules/SessionFilter.mqh>
#include <Modules/VolatilityShield.mqh>
#include <Modules/TradeLimiter.mqh>
#include <Modules/CapitalProtector.mqh>
#include <Modules/NewsFilter.mqh>
#include <Modules/EquityStop.mqh>
#include <Modules/StealthMode.mqh>
#include <Modules/ReverseLogic.mqh>
#include <Modules/SymbolWeight.mqh>
#include <Modules/TimeDecay.mqh>

#include <Strategies/TrendSniper.mqh>
#include <Strategies/ReversalHunter.mqh>
#include <Strategies/BreakoutStrike.mqh>

input string ConfigFile = "Titan.cfg";

double InitialCapital = 1000;
double RiskPerTradePercent = 2;
double DefaultLotSize = 0.02;

bool UseTrendSniper = true;
bool UseReversalHunter = true;
bool UseBreakoutStrike = false;

bool UseStealthMode = true;

int OnInit()
{
   Print("🛡️ Titan EA Initialized");
   LoadConfig(ConfigFile);
   InitializeModules();
   return INIT_SUCCEEDED;
}

void OnTick()
{
   if(!CheckAllFilters()) return;

   string symbol = Symbol();
   double lotSize = CalculateLotSize(symbol);

   if(ShouldTrade(symbol))
   {
      ExecuteTrade(symbol, lotSize);
   }
}

void LoadConfig(string file)
{
   // Placeholder: Load settings from Titan.cfg
}

void InitializeModules()
{
   // Placeholder: Initialize all tactical modules
}

bool CheckAllFilters()
{
   return DrawdownGuardCheck() &&
          SessionFilterCheck() &&
          VolatilityShieldCheck() &&
          TradeLimiterCheck() &&
          CapitalProtectorCheck() &&
          NewsFilterCheck() &&
          EquityStopCheck() &&
          IsSymbolEligible(Symbol());
}

bool ShouldTrade(string symbol)
{
   MarkSignalTime();

   bool signal = false;
   if(UseTrendSniper) signal = TrendSniperSignal(symbol);
   if(UseReversalHunter) signal = ReversalHunterSignal(symbol);
   if(UseBreakoutStrike) signal = BreakoutStrikeSignal(symbol);

   if(!signal || !TimeDecayCheck()) return false;

   return true;
}

void ExecuteTrade(string symbol, double lot)
{
   int direction = OP_BUY; // Placeholder
   direction = ApplyReverseLogic(direction);

   MqlTradeRequest request;
   MqlTradeResult result;
   ZeroMemory(request);

   request.action   = TRADE_ACTION_DEAL;
   request.symbol   = symbol;
   request.volume   = lot;
   request.type     = (direction == OP_BUY) ? ORDER_TYPE_BUY : ORDER_TYPE_SELL;
   request.price    = (direction == OP_BUY) ? SymbolInfoDouble(symbol, SYMBOL_ASK) : SymbolInfoDouble(symbol, SYMBOL_BID);
   request.deviation= 10;
   request.magic    = 123456;
   request.comment  = "Titan";

   if(UseStealthMode)
      ExecuteStealthTrade(symbol, lot, direction);
   else
   {
      if(!OrderSend(request, result))
         Print("❌ Trade failed: ", result.retcode);
      else
         Print("✅ Trade executed: ", result.order);
   }
}

double CalculateLotSize(string symbol)
{
   double equity = AccountInfoDouble(ACCOUNT_EQUITY);
   double riskAmount = equity * RiskPerTradePercent / 100;
   double stopLossPoints = 50;
   double tickValue = SymbolInfoDouble(symbol, SYMBOL_TRADE_TICK_VALUE);
   double lotSize = riskAmount / (stopLossPoints * tickValue);

   if(lotSize < 0.01) lotSize = 0.01;
   if(lotSize > 2.0) lotSize = 2.0;

   return NormalizeDouble(lotSize, 2);
}
