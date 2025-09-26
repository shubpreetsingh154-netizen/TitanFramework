#ifndef __REVERSAL_HUNTER__
#define __REVERSAL_HUNTER__

bool ReversalHunterSignal(string symbol)
{
   double rsi = iRSI(symbol, 0, 14, PRICE_CLOSE, 0);

   if(rsi > 70)
   {
      Print("🔻 ReversalHunter: SELL signal on ", symbol, " (RSI=", rsi, ")");
      return true;
   }
   else if(rsi < 30)
   {
      Print("🔺 ReversalHunter: BUY signal on ", symbol, " (RSI=", rsi, ")");
      return true;
   }

   return false;
}

#endif
