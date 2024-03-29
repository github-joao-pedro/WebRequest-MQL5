//+------------------------------------------------------------------+
//|                                                  WebRequest-MQL5 |
//|                                     Copyright 2024 - Quantstone  |
//|                                        https://quantstone.com.br |
//|                                               João Pedro Sampaio |
//+------------------------------------------------------------------+
#include "Interfaces/IHttpTransport.mqh"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CHttpTransport : public IHttpTransport
  {
public:
                     CHttpTransport(void);
                    ~CHttpTransport(void);

   int               Request(const string method,const string url,const string cookie,const string referer,int timeout,const char &data[],int data_size,char &result[],string &result_headers);
   int               Request(const string method,const string url,const string headers,int timeout,const char &data[],char &result[],string &result_headers);
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CHttpTransport::CHttpTransport(void)
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CHttpTransport::~CHttpTransport(void)
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CHttpTransport::Request(const string method,const string url,const string cookie,const string referer,int timeout,const char &data[],int data_size,char &result[],string &result_headers)
  {
   return(WebRequest(method,url,cookie,referer,timeout,data,data_size,result,result_headers));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CHttpTransport::Request(const string method,const string url,const string headers,int timeout,const char &data[],char &result[],string &result_headers)
  {
   return(WebRequest(method,url,headers,timeout,data,result,result_headers));
  }
//+------------------------------------------------------------------+
