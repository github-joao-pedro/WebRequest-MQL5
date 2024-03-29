//+------------------------------------------------------------------+
//|                                                  WebRequest-MQL5 |
//|                                     Copyright 2024 - Quantstone  |
//|                                        https://quantstone.com.br |
//|                                               João Pedro Sampaio |
//+------------------------------------------------------------------+
#include "Interfaces/IHttpHeaders.mqh"
#include "Interfaces/IHttpBody.mqh"
#include "HttpStatusCodes.mqh"
#include "HttpHeaders.mqh"
#include "HttpBody.mqh"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CHttpResponse
  {
private:
   
   CHttpStatusCodes  m_status;
   IHttpHeaders      *m_header;
   IHttpBody         *m_body;
   
public:
                     CHttpResponse(void);
                    ~CHttpResponse(void);
   
   string            GetStatusDes(void);
   ENUM_HTTP_STATUS  GetStatus(void);
   string            GetBodyStr(void);
   bool              GetBody(CJson *json);
   
   CHttpStatusCodes  *Status(void);
   IHttpHeaders      *Header(void);
   IHttpBody         *Body(void);
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CHttpResponse::CHttpResponse(void)
  {
   m_header = new CHttpHeaders();
   m_body = new CHttpBody();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CHttpResponse::~CHttpResponse(void)
  {
   delete m_header;
   delete m_body;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CHttpResponse::GetStatusDes(void)
  {
   return(m_status.HttpStatusCodeFormat());
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ENUM_HTTP_STATUS CHttpResponse::GetStatus(void)
  {
   return(m_status.GetStatus());
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CHttpResponse::GetBodyStr(void)
  {
   return(m_body.Serialize());
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CHttpResponse::GetBody(CJson *json)
  {
   return(json.Deserialize(m_body.Serialize()));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CHttpStatusCodes *CHttpResponse::Status(void)
  {
   return(GetPointer(m_status));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
IHttpHeaders *CHttpResponse::Header(void)
  {
   return(m_header);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
IHttpBody *CHttpResponse::Body(void)
  {
   return(m_body);
  }
//+------------------------------------------------------------------+
