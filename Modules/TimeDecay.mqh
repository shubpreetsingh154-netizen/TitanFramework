#ifndef __TIME_DECAY__
#define __TIME_DECAY__

datetime SignalTimestamp;
int MaxSignalAgeMinutes = 15;

bool TimeDecayCheck()
{
   datetime now = TimeCurrent();
   int age = (int)((now - SignalTimestamp) / 60);

   if(age > MaxSignalAgeMinutes)
   {
      Print("⏳ TimeDecay triggered: Signal too old (", age, " mins)");
      return false;
   }

   return true;
}

// Call this when signal is generated
void MarkSignalTime()
{
   SignalTimestamp = TimeCurrent();
}

#endif
