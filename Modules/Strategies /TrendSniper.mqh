#ifndef __TREND_SNIPER__
#define __TREND_SNIPER__

bool TrendSniperSignal(string symbol)
{
   double maFast = iMA(symbol, PERIOD_CURRENT, 10, 0, MODE_EMA, PRICE_CLOSE, 0);
   double maSlow = iMA(symbol, PERIOD_CURRENT, 50, 0, MODE_EMA, PRICE_CLOSE, 0);

   if(maFast > maSlow)
   {
      Print("📈 TrendSniper: Bullish crossover detected");
      return true;
   }

   Print("📉 TrendSniper: No bullish crossover");
   return false;
}

#endif
