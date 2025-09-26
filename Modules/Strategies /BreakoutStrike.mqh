#ifndef __BREAKOUT_STRIKE__
#define __BREAKOUT_STRIKE__

bool BreakoutStrikeSignal(string symbol)
{
   double high = iHigh(symbol, PERIOD_H1, 1);
   double low  = iLow(symbol, PERIOD_H1, 1);
   double current = iClose(symbol, 0, 0);

   double range = high - low;

   if(range < 50 * Point) // Tight range condition
   {
      if(current > high)
      {
         Print("🚀 BreakoutStrike: BUY breakout on ", symbol);
         return true;
      }
      else if(current < low)
      {
         Print("💥 BreakoutStrike: SELL breakout on ", symbol);
         return true;
      }
   }

   return false;
}

#endif
