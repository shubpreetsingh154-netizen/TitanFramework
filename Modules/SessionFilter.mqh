#ifndef __SESSION_FILTER__
#define __SESSION_FILTER__

datetime sessionStart = D'2024.01.01 09:00';
datetime sessionEnd   = D'2024.01.01 17:00';

bool SessionFilterCheck()
{
   datetime now = TimeCurrent();

   if(now >= sessionStart && now <= sessionEnd)
   {
      Print("🕒 SessionFilter: Within trading session");
      return true;
   }

   Print("⛔ SessionFilter: Outside trading session");
   return false;
}

#endif
