#ifndef __SYMBOL_WEIGHT__
#define __SYMBOL_WEIGHT__

double GetSymbolWeight(string symbol)
{
   if(symbol == "EURUSD") return 1.0;
   if(symbol == "GBPUSD") return 0.9;
   if(symbol == "USDJPY") return 0.8;
   if(symbol == "XAUUSD") return 1.2;

   return 0.5; // Default weight for unknown symbols
}

bool IsSymbolEligible(string symbol)
{
   double weight = GetSymbolWeight(symbol);
   return (weight >= 0.8); // Only trade symbols with weight ≥ 0.8
}

#endif
