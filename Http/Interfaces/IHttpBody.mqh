//+------------------------------------------------------------------+
//|                                                  WebRequest-MQL5 |
//|                                     Copyright 2024 - Quantstone  |
//|                                        https://quantstone.com.br |
//|                                               João Pedro Sampaio |
//+------------------------------------------------------------------+
interface IHttpBody
  {
   void              Parse(const string body);
   void              Parse(const char &body[], uint codepage = CP_UTF8);

   string            Serialize(void);
   string            Serialize(uchar &body[], uint codepage = CP_UTF8);
   void              Free(void);
  };
//+------------------------------------------------------------------+
