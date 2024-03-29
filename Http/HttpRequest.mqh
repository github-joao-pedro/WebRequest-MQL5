//+------------------------------------------------------------------+
//|                                                  WebRequest-MQL5 |
//|                                     Copyright 2024 - Quantstone  |
//|                                        https://quantstone.com.br |
//|                                               João Pedro Sampaio |
//+------------------------------------------------------------------+
#include "Interfaces/IHttpHeaders.mqh"
#include "Interfaces/IHttpBody.mqh"
#include "HttpMethods.mqh"
#include "HttpHeaders.mqh"
#include "HttpBody.mqh"
#include "../URL/URL.mqh"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CHttpRequest
  {
private:
   
   IURL              *m_url;
   IHttpHeaders      *m_header;
   IHttpBody         *m_body;
   CHttpMethods      m_method;
   uint              m_timeout;
   
public:
                     CHttpRequest(void);
                    ~CHttpRequest(void);
   
   void              Request(ENUM_HTTP_METHOD method, string url, uint timeout = 5000);
   void              Request(ENUM_HTTP_METHOD method, string url, CJson *body, uint timeout = 5000);
   void              Request(ENUM_HTTP_METHOD method, string url, IHttpBody *body, uint timeout = 5000);
   void              Request(ENUM_HTTP_METHOD method, string url, IHttpHeaders *headers, uint timeout = 5000);
   void              Request(ENUM_HTTP_METHOD method, string url, string headers, uint timeout = 5000);
   void              Request(ENUM_HTTP_METHOD method, string url, CJson *body, IHttpHeaders *headers, uint timeout = 5000);
   void              Request(ENUM_HTTP_METHOD method, string url, IHttpBody *body, IHttpHeaders *headers, uint timeout = 5000);
   void              Request(ENUM_HTTP_METHOD method, string url, CJson *body, string headers, uint timeout = 5000);
   void              Request(ENUM_HTTP_METHOD method, string url, IHttpBody *body, string headers, uint timeout = 5000);
   void              Request(ENUM_HTTP_METHOD method, IURL *url, uint timeout = 5000);
   void              Request(ENUM_HTTP_METHOD method, IURL *url, CJson *body, uint timeout = 5000);
   void              Request(ENUM_HTTP_METHOD method, IURL *url, IHttpBody *body, uint timeout = 5000);
   void              Request(ENUM_HTTP_METHOD method, IURL *url, IHttpHeaders *headers, uint timeout = 5000);
   void              Request(ENUM_HTTP_METHOD method, IURL *url, string headers, uint timeout = 5000);
   void              Request(ENUM_HTTP_METHOD method, IURL *url, CJson *body, IHttpHeaders *headers, uint timeout = 5000);
   void              Request(ENUM_HTTP_METHOD method, IURL *url, IHttpBody *body, IHttpHeaders *headers, uint timeout = 5000);
   void              Request(ENUM_HTTP_METHOD method, IURL *url, CJson *body, string headers, uint timeout = 5000);
   void              Request(ENUM_HTTP_METHOD method, IURL *url, IHttpBody *body, string headers, uint timeout = 5000);
   
   void              SetURL(string url);
   void              SetURL(IURL *url);
   void              SetHeader(string header);
   void              SetHeader(IHttpHeaders *header);
   void              SetBody(string body);
   void              SetBody(CJson *json);
   void              SetBody(IHttpBody *body);
   void              SetMethod(string method);
   void              SetMethod(ENUM_HTTP_METHOD method);
   void              SetTimeout(uint timeout);
   
   IURL              *Url(void);
   IHttpHeaders      *Header(void);
   IHttpBody         *Body(void);
   CHttpMethods      *Method(void);
   uint              Timeout(void);
   void              Clear(void);
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::CHttpRequest(void)
  {
   m_url = new CURL();
   m_header = new CHttpHeaders();
   m_body = new CHttpBody();
   this.Clear();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::Request(ENUM_HTTP_METHOD method, string url, uint timeout = 5000)
  {
   m_method = method;
   m_url.Parse(url);
   m_timeout = timeout;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::Request(ENUM_HTTP_METHOD method, string url, CJson *body, uint timeout = 5000)
  {
   m_method = method;
   m_url.Parse(url);
   m_body.Parse(body.Serialize());
   m_timeout = timeout;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::Request(ENUM_HTTP_METHOD method, string url, IHttpBody *body, uint timeout = 5000)
  {
   delete m_body;
   
   m_method = method;
   m_url.Parse(url);
   m_body = body;
   m_timeout = timeout;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::Request(ENUM_HTTP_METHOD method, string url, IHttpHeaders *headers, uint timeout = 5000)
  {
   delete m_header;
   
   m_method = method;
   m_url.Parse(url);
   m_header = headers;
   m_timeout = timeout;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::Request(ENUM_HTTP_METHOD method, string url, string headers, uint timeout = 5000)
  {
   m_method = method;
   m_url.Parse(url);
   m_header.Parse(headers);
   m_timeout = timeout;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::Request(ENUM_HTTP_METHOD method, string url, CJson *body, IHttpHeaders *headers, uint timeout = 5000)
  {
   delete m_header;
   
   m_method = method;
   m_url.Parse(url);
   m_body.Parse(body.Serialize());
   m_header = headers;
   m_timeout = timeout;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::Request(ENUM_HTTP_METHOD method, string url, IHttpBody *body, IHttpHeaders *headers, uint timeout = 5000)
  {
   delete m_header;
   delete m_body;
   
   m_method = method;
   m_url.Parse(url);
   m_body = body;
   m_header = headers;
   m_timeout = timeout;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::Request(ENUM_HTTP_METHOD method, string url, CJson *body, string headers, uint timeout = 5000)
  {
   m_method = method;
   m_url.Parse(url);
   m_body.Parse(body.Serialize());
   m_header.Parse(headers);
   m_timeout = timeout;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::Request(ENUM_HTTP_METHOD method, string url, IHttpBody *body, string headers, uint timeout = 5000)
  {
   delete m_body;
   
   m_method = method;
   m_url.Parse(url);
   m_body = body;
   m_header.Parse(headers);
   m_timeout = timeout;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::Request(ENUM_HTTP_METHOD method, IURL *url, uint timeout = 5000)
  {
   delete m_url;
   
   m_method = method;
   m_url = url;
   m_timeout = timeout;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::Request(ENUM_HTTP_METHOD method, IURL *url, CJson *body, uint timeout = 5000)
  {
   delete m_url;
   
   m_method = method;
   m_url = url;
   m_body.Parse(body.Serialize());
   m_timeout = timeout;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::Request(ENUM_HTTP_METHOD method, IURL *url, IHttpBody *body, uint timeout = 5000)
  {
   delete m_url;
   delete m_body;
   
   m_method = method;
   m_url = url;
   m_body = body;
   m_timeout = timeout;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::Request(ENUM_HTTP_METHOD method, IURL *url, IHttpHeaders *headers, uint timeout = 5000)
  {
   delete m_url;
   delete m_header;
   
   m_method = method;
   m_url = url;
   m_header = headers;
   m_timeout = timeout;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::Request(ENUM_HTTP_METHOD method, IURL *url, string headers, uint timeout = 5000)
  {
   delete m_url;
   
   m_method = method;
   m_url = url;
   m_header.Parse(headers);
   m_timeout = timeout;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::Request(ENUM_HTTP_METHOD method, IURL *url, CJson *body, IHttpHeaders *headers, uint timeout = 5000)
  {
   delete m_url;
   delete m_header;
   
   m_method = method;
   m_url = url;
   m_body.Parse(body.Serialize());
   m_header = headers;
   m_timeout = timeout;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::Request(ENUM_HTTP_METHOD method, IURL *url, IHttpBody *body, IHttpHeaders *headers, uint timeout = 5000)
  {
   delete m_url;
   delete m_header;
   delete m_body;
   
   m_method = method;
   m_url = url;
   m_body = body;
   m_header = headers;
   m_timeout = timeout;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::Request(ENUM_HTTP_METHOD method, IURL *url, CJson *body, string headers, uint timeout = 5000)
  {
   delete m_url;
   
   m_method = method;
   m_url = url;
   m_body.Parse(body.Serialize());
   m_header.Parse(headers);
   m_timeout = timeout;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::Request(ENUM_HTTP_METHOD method, IURL *url, IHttpBody *body, string headers, uint timeout = 5000)
  {
   delete m_url;
   delete m_body;
   
   m_method = method;
   m_url = url;
   m_body = body;
   m_header.Parse(headers);
   m_timeout = timeout;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CHttpRequest::~CHttpRequest(void)
  {
   delete m_url;
   delete m_header;
   delete m_body;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::SetURL(string url)
  {
   m_url.Parse(url);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::SetURL(IURL *url)
  {
   m_url = url;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::SetHeader(string header)
  {
   m_header.Parse(header);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::SetHeader(IHttpHeaders *header)
  {
   m_header = header;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::SetBody(string body)
  {
   m_body.Parse(body);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::SetBody(CJson *json)
  {
   m_body.Parse(json.Serialize());
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::SetBody(IHttpBody *body)
  {
   m_body = body;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::SetMethod(string method)
  {
   m_method.SetMethod(method);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::SetMethod(ENUM_HTTP_METHOD method)
  {
   m_method = method;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::SetTimeout(uint timeout)
  {
   m_timeout = timeout;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
IURL *CHttpRequest::Url(void)
  {
   return(m_url);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
IHttpHeaders *CHttpRequest::Header(void)
  {
   return(m_header);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
IHttpBody *CHttpRequest::Body(void)
  {
   return(m_body);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CHttpMethods *CHttpRequest::Method(void)
  {
   return(GetPointer(m_method));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
uint CHttpRequest::Timeout(void)
  {
   return(m_timeout);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpRequest::Clear(void)
  {
   m_url.Free();
   m_header.Free();
   m_body.Free();
   m_method = HTTP_METHOD_NULL;
   m_timeout = 5000;
  }
//+------------------------------------------------------------------+
