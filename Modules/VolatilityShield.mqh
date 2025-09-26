#ifndef __VOLATILITY_SHIELD__
#define __VOLATILITY_SHIELD__

double MaxSpread = 25; // in points
double MaxSlippage = 5;

bool VolatilityShieldCheck()
{
   double spread = (MarketInfo(Symbol(), MODE_SPREAD));
   double slippage = MarketInfo(Symbol(), MODE_SLIPPAGE);

   if(spread > MaxSpread || slippage > MaxSlippage)
   {
      Print("⚠️ VolatilityShield triggered: Spread=", spread, " Slippage=", slippage);
      return false;
   }

   return true;
}

#endif
