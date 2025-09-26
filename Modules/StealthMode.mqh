#ifndef __STEALTH_MODE__
#define __STEALTH_MODE__

void ExecuteStealthTrade(string symbol, double lot, int direction)
{
   MqlTradeRequest request;
   MqlTradeResult result;
   ZeroMemory(request);

   request.action   = TRADE_ACTION_DEAL;
   request.symbol   = symbol;
   request.volume   = lot;
   request.type     = (direction == OP_BUY) ? ORDER_TYPE_BUY : ORDER_TYPE_SELL;
   request.price    = (direction == OP_BUY) ? SymbolInfoDouble(symbol, SYMBOL_ASK) : SymbolInfoDouble(symbol, SYMBOL_BID);
   request.deviation= 10;
   request.magic    = 987654;
   request.comment  = "Titan Stealth";

   if(!OrderSend(request, result))
      Print("❌ StealthMode: Trade failed - ", result.retcode);
   else
      Print("🕶️ StealthMode: Trade executed - Order #", result.order);
}

#endif
