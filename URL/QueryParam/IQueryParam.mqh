//+------------------------------------------------------------------+
//|                                                  WebRequest-MQL5 |
//|                                     Copyright 2024 - Quantstone  |
//|                                        https://quantstone.com.br |
//|                                               João Pedro Sampaio |
//+------------------------------------------------------------------+
interface IQueryParam
  {
   //--- Basic methods
   void              Add(string key, string value);
   
   //--- Acess data
   string            GetKey(const int index);
   string            GetValue(const string key);
   bool              KeyIsPresent(const string key);
   int               Size(void);
   
   //--- Serialize/parse
   bool              Parse(string query_param);
   string            Serialize(void);
   int               ToCharArray(uchar &char_array[], uint codepage = CP_UTF8);
   void              Free(void);
  };
//+------------------------------------------------------------------+
