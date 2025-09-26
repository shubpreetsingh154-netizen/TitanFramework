#ifndef __TRADE_LIMITER__
#define __TRADE_LIMITER__

int MaxTradesPerSymbol = 2;
int MaxTradesTotal = 5;

bool TradeLimiterCheck()
{
   int totalTrades = OrdersTotal();
   int symbolTrades = 0;

   for(int i = 0; i < totalTrades; i++)
   {
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
      {
         if(OrderSymbol() == Symbol())
            symbolTrades++;
      }
   }

   if(symbolTrades >= MaxTradesPerSymbol)
   {
      Print("🚫 TradeLimiter blocked: Max trades per symbol reached");
      return false;
   }

   if(totalTrades >= MaxTradesTotal)
   {
      Print("🚫 TradeLimiter blocked: Max total trades reached");
      return false;
   }

   return true;
}

#endif
