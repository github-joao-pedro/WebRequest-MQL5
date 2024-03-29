//+------------------------------------------------------------------+
//|                                                  WebRequest-MQL5 |
//|                                     Copyright 2024 - Quantstone  |
//|                                        https://quantstone.com.br |
//|                                               João Pedro Sampaio |
//+------------------------------------------------------------------+
#include "HttpRequest.mqh"
#include "HttpResponse.mqh"
#include "HttpTransport.mqh"
#include "Interfaces/IHttpClient.mqh"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CHttpClient : public IHttpClient
  {
private:
   
   IHttpTransport    *m_transport;
   IHttpObserver     *m_observer;
   
public:
                     CHttpClient(IHttpObserver *observer, IHttpTransport *transport);
                     CHttpClient(void);
                    ~CHttpClient(void);
   
   void              SetObjectObserver(IHttpObserver *observer);
   void              SetObjectTransport(IHttpTransport *transport);
   bool              Send(CHttpRequest &request, CHttpResponse &response);

private:
   
   void              OnSend(CHttpRequest *request);
   void              OnRecv(CHttpResponse *response);
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CHttpClient::CHttpClient(IHttpObserver *observer, IHttpTransport *transport)
  {
   m_transport = GetPointer(transport);
   m_observer = GetPointer(observer);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CHttpClient::CHttpClient(void)
  {
   m_transport = new CHttpTransport();
   m_observer = NULL;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CHttpClient::~CHttpClient(void)
  {
   delete m_transport;
   delete m_observer;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpClient::SetObjectObserver(IHttpObserver *observer)
  {
   m_observer = GetPointer(observer);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpClient::SetObjectTransport(IHttpTransport *transport)
  {
   m_transport = GetPointer(transport);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CHttpClient::Send(CHttpRequest &request, CHttpResponse &response)
  {
   //--- Request
   char body[];
   request.Body().Serialize(body);
   
   //--- Result
   string result_headers;
   char result_body[];
   
   
   //--- Send
   this.OnSend(GetPointer(request));
   response.Status() = m_transport.Request(request.Method().HttpMethodsDescription(),request.Url().Serialize(),request.Header().Serialize(),request.Timeout(),body,result_body,result_headers);
   
   //--- Parse response
   response.Body().Parse(result_body);
   response.Header().Parse(result_headers);
   
   this.OnRecv(GetPointer(response));
   
   //--- Check status
   return(response.GetStatus() >= HTTP_STATUS_OK && response.GetStatus() < HTTP_STATUS_BAD_REQUEST);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpClient::OnSend(CHttpRequest *request)
  {
   if(m_observer != NULL)
     {
      m_observer.OnSend(request);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpClient::OnRecv(CHttpResponse *response)
  {
   if(m_observer != NULL)
     {
      m_observer.OnRecv(response);
     }
  }
//+------------------------------------------------------------------+
