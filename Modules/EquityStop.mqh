#ifndef __EQUITY_STOP__
#define __EQUITY_STOP__

double EquityStopLevel = 400; // Absolute equity floor

bool EquityStopCheck()
{
   double equity = AccountInfoDouble(ACCOUNT_EQUITY);

   if(equity < EquityStopLevel)
   {
      Print("🛑 EquityStop triggered: Equity below hard stop (", equity, ")");
      return false;
   }

   return true;
}

#endif
