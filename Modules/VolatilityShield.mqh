#ifndef __VOLATILITY_SHIELD__
#define __VOLATILITY_SHIELD__

bool VolatilityShieldCheck()
{
   double atr = iATR(Symbol(), PERIOD_M15, 14, 0);

   if(atr > 50 * Point)
   {
      Print("⛔ VolatilityShield: ATR too high (", atr, ")");
      return false;
   }

   Print("✅ VolatilityShield: ATR acceptable (", atr, ")");
   return true;
}

#endif
