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

void OnInit()
{
   Print("🛡️ Titan EA Initialized");
   LoadConfig(ConfigFile);
   InitializeModules();
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
   // For now, values are hardcoded above
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
   MarkSignalTime(); // Timestamp for TimeDecay

   bool signal = false;
   if(UseTrendSniper) signal = TrendSniperSignal(symbol);
   if(UseReversalHunter) signal = ReversalHunterSignal(symbol);
   if(UseBreakoutStrike) signal = BreakoutStrikeSignal(symbol);

   if(!signal || !TimeDecayCheck()) return false;

   return true;
}

void ExecuteTrade(string symbol, double lot)
{
   int direction = OP_BUY; // Placeholder — tu chahe toh strategy se derive kar sakta hai
   direction = ApplyReverseLogic(direction);

   if(UseStealthMode)
      ExecuteStealthTrade(symbol, lot, direction);
   else
      OrderSend(symbol, direction, lot, Ask, 3, 0, 0, "Titan", 0, clrGreen);
}

double CalculateLotSize(string symbol)
{
   double equity = AccountInfoDouble(ACCOUNT_EQUITY);
   double riskAmount = equity * RiskPerTradePercent / 100;
   double stopLossPoints = 50; // Placeholder SL
   double tickValue = MarketInfo(symbol, MODE_TICKVALUE);
   double lotSize = riskAmount / (stopLossPoints * tickValue);

   if(lotSize < 0.01) lotSize = 0.01;
   if(lotSize > 2.0) lotSize = 2.0;

   return NormalizeDouble(lotSize, 2);
}
