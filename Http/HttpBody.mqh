//+------------------------------------------------------------------+
//|                                                  WebRequest-MQL5 |
//|                                     Copyright 2024 - Quantstone  |
//|                                        https://quantstone.com.br |
//|                                               João Pedro Sampaio |
//+------------------------------------------------------------------+
#include "Interfaces/IHttpBody.mqh"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CHttpBody : public IHttpBody
  {
private:
   
   string            m_body;
   
public:
                     CHttpBody(void);
                    ~CHttpBody(void);
   
   void              Parse(const string body);
   void              Parse(const char &body[], uint codepage = CP_UTF8);
   
   string            Serialize(void);
   string            Serialize(uchar &body[], uint codepage = CP_UTF8);
   void              Free(void);
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CHttpBody::CHttpBody(void)
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CHttpBody::~CHttpBody(void)
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpBody::Parse(const string body)
  {
   m_body = body;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpBody::Parse(const char &body[], uint codepage = CP_UTF8)
  {
   m_body = CharArrayToString(body,0,WHOLE_ARRAY,codepage);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CHttpBody::Serialize(void)
  {
   return(m_body);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CHttpBody::Serialize(uchar &body[],uint codepage=CP_UTF8)
  {
   int res = StringToCharArray(m_body,body,0,WHOLE_ARRAY,codepage);
   ArrayRemove(body,res-1,1);
   return(m_body);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpBody::Free(void)
  {
   m_body = "";
  }
//+------------------------------------------------------------------+
