#ifndef __CAPITAL_PROTECTOR__
#define __CAPITAL_PROTECTOR__

double MinEquityThreshold = 500; // Minimum equity to allow trading

bool CapitalProtectorCheck()
{
   double equity = AccountInfoDouble(ACCOUNT_EQUITY);

   if(equity < MinEquityThreshold)
   {
      Print("🛑 CapitalProtector triggered: Equity below survival threshold (", equity, ")");
      return false;
   }

   return true;
}

#endif
