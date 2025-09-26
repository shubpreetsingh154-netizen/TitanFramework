#ifndef __STEALTH_MODE__
#define __STEALTH_MODE__

bool UseStealthMode = true;

bool ExecuteStealthTrade(string symbol, double lot, int direction)
{
   double price = (direction == OP_BUY) ? MarketInfo(symbol, MODE_ASK) : MarketInfo(symbol, MODE_BID);
   double sl = 0; // Hidden stop loss
   double tp = 0; // Hidden take profit

   int ticket = OrderSend(symbol, direction, lot, price, 3, sl, tp, "Titan Stealth", 0, clrNONE);

   if(ticket < 0)
   {
      Print("❌ StealthMode failed: ", GetLastError());
      return false;
   }

   Print("✅ Stealth trade executed: ", symbol, " Lot=", lot);
   return true;
}

#endif
