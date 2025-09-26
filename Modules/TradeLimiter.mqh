#ifndef __TRADE_LIMITER__
#define __TRADE_LIMITER__

int MaxTradesAllowed = 5;

bool TradeLimiterCheck()
{
   int totalTrades = OrdersTotal();
   int activeTrades = 0;

   for(int i = 0; i < totalTrades; i++)
   {
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
         if(OrderSymbol() == Symbol())
            activeTrades++;
   }

   if(activeTrades >= MaxTradesAllowed)
   {
      Print("⛔ TradeLimiter: Max trades reached (", activeTrades, ")");
      return false;
   }

   Print("✅ TradeLimiter: Trades within limit (", activeTrades, ")");
   return true;
}

#endif
