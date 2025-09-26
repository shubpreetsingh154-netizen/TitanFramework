#ifndef __REVERSE_LOGIC__
#define __REVERSE_LOGIC__

bool EnableReverseLogic = false;

int ApplyReverseLogic(int originalSignal)
{
   if(!EnableReverseLogic)
      return originalSignal;

   if(originalSignal == OP_BUY)
      return OP_SELL;
   else if(originalSignal == OP_SELL)
      return OP_BUY;

   return originalSignal;
}

#endif
