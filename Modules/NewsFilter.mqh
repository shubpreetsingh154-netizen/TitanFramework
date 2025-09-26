#ifndef __NEWS_FILTER__
#define __NEWS_FILTER__

datetime LastNewsTime = D'1970.01.01 00:00';
int NewsBlockMinutes = 30;

bool NewsFilterCheck()
{
   datetime now = TimeCurrent();

   if((now - LastNewsTime) < NewsBlockMinutes * 60)
   {
      Print("📰 NewsFilter triggered: Blocking trades near news event");
      return false;
   }

   return true;
}

// Placeholder: In future, update LastNewsTime from CSV or API
#endif
