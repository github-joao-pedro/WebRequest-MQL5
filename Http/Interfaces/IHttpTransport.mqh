//+------------------------------------------------------------------+
//|                                                  WebRequest-MQL5 |
//|                                     Copyright 2024 - Quantstone  |
//|                                        https://quantstone.com.br |
//|                                               João Pedro Sampaio |
//+------------------------------------------------------------------+
interface IHttpTransport
  {
   int               Request(const string method,const string url,const string cookie,const string referer,int timeout,const char &data[],int data_size,char &result[],string &result_headers);
   int               Request(const string method,const string url,const string headers,int timeout,const char &data[],char &result[],string &result_headers);
  };
//+------------------------------------------------------------------+
