#ifndef __REVERSAL_HUNTER__
#define __REVERSAL_HUNTER__

bool ReversalHunterSignal(string symbol)
{
   double rsi = iRSI(symbol, PERIOD_CURRENT, 14, PRICE_CLOSE, 0);

   if(rsi < 30)
   {
      Print("🌀 ReversalHunter: Oversold detected (RSI=", rsi, ")");
      return true;
   }

   if(rsi > 70)
   {
      Print("🌀 ReversalHunter: Overbought detected (RSI=", rsi, ")");
      return true;
   }

   Print("🌀 ReversalHunter: RSI neutral (", rsi, ")");
   return false;
}

#endif
