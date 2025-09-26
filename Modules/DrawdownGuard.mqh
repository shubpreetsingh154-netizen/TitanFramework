#ifndef __DRAWDOWN_GUARD__
#define __DRAWDOWN_GUARD__

double MaxDrawdownPercent = 20;

bool DrawdownGuardCheck()
{
   double equity = AccountInfoDouble(ACCOUNT_EQUITY);
   double balance = AccountInfoDouble(ACCOUNT_BALANCE);
   double drawdown = (balance - equity) / balance * 100;

   if(drawdown > MaxDrawdownPercent)
   {
      Print("❌ DrawdownGuard triggered: ", drawdown, "%");
      return false;
   }

   return true;
}

#endif
