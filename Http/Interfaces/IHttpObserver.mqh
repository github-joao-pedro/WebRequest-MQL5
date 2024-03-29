//+------------------------------------------------------------------+
//|                                                  WebRequest-MQL5 |
//|                                     Copyright 2024 - Quantstone  |
//|                                        https://quantstone.com.br |
//|                                               João Pedro Sampaio |
//+------------------------------------------------------------------+
#include "../HttpRequest.mqh"
#include "../HttpResponse.mqh"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
interface IHttpObserver
  {
   void OnSend(CHttpRequest *request);
   void OnRecv(CHttpResponse *response);
  };
//+------------------------------------------------------------------+
