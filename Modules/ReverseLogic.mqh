#ifndef __REVERSE_LOGIC__
#define __REVERSE_LOGIC__

bool EnableReverseLogic = false;

int ApplyReverseLogic(int direction)
{
   if(!EnableReverseLogic) return direction;

   int reversed = (direction == OP_BUY) ? OP_SELL : OP_BUY;
   Print("🔁 ReverseLogic: Direction flipped from ", direction, " to ", reversed);
   return reversed;
}

#endif
