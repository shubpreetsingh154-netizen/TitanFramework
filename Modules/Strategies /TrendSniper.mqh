#ifndef __TREND_SNIPER__
#define __TREND_SNIPER__

bool TrendSniperSignal(string symbol)
{
   double maFast = iMA(symbol, 0, 10, 0, MODE_EMA, PRICE_CLOSE, 0);
   double maSlow = iMA(symbol, 0, 50, 0, MODE_EMA, PRICE_CLOSE, 0);

   if(maFast > maSlow)
   {
      Print("📈 TrendSniper: BUY signal on ", symbol);
      return true;
   }
   else if(maFast < maSlow)
   {
      Print("📉 TrendSniper: SELL signal on ", symbol);
      return true;
   }

   return false;
}

#endif
