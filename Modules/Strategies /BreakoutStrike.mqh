#ifndef __BREAKOUT_STRIKE__
#define __BREAKOUT_STRIKE__

bool BreakoutStrikeSignal(string symbol)
{
   double prevHigh = iHigh(symbol, PERIOD_CURRENT, 1);
   double prevLow  = iLow(symbol, PERIOD_CURRENT, 1);
   double currentPrice = SymbolInfoDouble(symbol, SYMBOL_BID);

   if(currentPrice > prevHigh)
   {
      Print("🚀 BreakoutStrike: Bullish breakout detected");
      return true;
   }

   if(currentPrice < prevLow)
   {
      Print("🚀 BreakoutStrike: Bearish breakout detected");
      return true;
   }

   Print("🚀 BreakoutStrike: No breakout");
   return false;
}

#endif
