//+------------------------------------------------------------------+
//|                                                  WebRequest-MQL5 |
//|                                     Copyright 2024 - Quantstone  |
//|                                        https://quantstone.com.br |
//|                                               João Pedro Sampaio |
//+------------------------------------------------------------------+

#include "IHttpTransport.mqh"
#include "IHttpObserver.mqh"

interface IHttpClient
  {
   void              SetObjectObserver(IHttpObserver *observer);
   void              SetObjectTransport(IHttpTransport *transport);
   
   bool              Send(CHttpRequest &request, CHttpResponse &response);
  };
//+------------------------------------------------------------------+
