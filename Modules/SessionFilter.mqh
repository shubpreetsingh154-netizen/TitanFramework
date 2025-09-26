#ifndef __SESSION_FILTER__
#define __SESSION_FILTER__

datetime sessionStart = D'1970.01.01 08:00'; // 8 AM server time
datetime sessionEnd   = D'1970.01.01 18:00'; // 6 PM server time

bool SessionFilterCheck()
{
   datetime now = TimeCurrent();
   int hour = TimeHour(now);

   if(hour < TimeHour(sessionStart) || hour > TimeHour(sessionEnd))
   {
      Print("⏳ SessionFilter blocked trade: Outside active hours");
      return false;
   }

   return true;
}

#endif
