//+------------------------------------------------------------------+
//|                                                  WebRequest-MQL5 |
//|                                     Copyright 2024 - Quantstone  |
//|                                        https://quantstone.com.br |
//|                                               João Pedro Sampaio |
//+------------------------------------------------------------------+
interface IHttpHeaders
  {
   //--- Basic methods
   void              Add(string value);
   void              Add(string key, string value);
   
   //--- Acess data
   string            GetKey(const int index);
   string            GetValue(const string key);
   bool              KeyIsPresent(const string key);
   int               Size(void);
   
   //--- Serialize/parse
   void              Parse(const string header);
   void              Parse(const char &header[], uint codepage = CP_UTF8);
   string            Serialize(void);
   string            Serialize(uchar &header[], uint codepage = CP_UTF8);
   void              Free(void);
  };
//+------------------------------------------------------------------+
