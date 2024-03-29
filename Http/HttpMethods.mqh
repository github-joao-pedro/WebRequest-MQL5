//+------------------------------------------------------------------+
//|                                                  WebRequest-MQL5 |
//|                                     Copyright 2024 - Quantstone  |
//|                                        https://quantstone.com.br |
//|                                               João Pedro Sampaio |
//+------------------------------------------------------------------+
enum ENUM_HTTP_METHOD
  {
   HTTP_METHOD_NULL = 0,
   HTTP_METHOD_CONNECT,
   HTTP_METHOD_DELETE,
   HTTP_METHOD_GET,
   HTTP_METHOD_HEAD,
   HTTP_METHOD_OPTION,
   HTTP_METHOD_PATCH,
   HTTP_METHOD_POST,
   HTTP_METHOD_PUT,
   HTTP_METHOD_TRACE,
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CHttpMethods
  {
private:

   ENUM_HTTP_METHOD  m_method;

public:
                     CHttpMethods(void);
                    ~CHttpMethods(void);

   void              operator=(ENUM_HTTP_METHOD method);
   void              SetMethod(ENUM_HTTP_METHOD method);
   bool              SetMethod(string method);
   ENUM_HTTP_METHOD  GetMethod(void);
   
   string            HttpMethodsDescription(void);
   string            HttpMethodsDescription(ENUM_HTTP_METHOD method);
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CHttpMethods::CHttpMethods(void)
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CHttpMethods::~CHttpMethods(void)
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpMethods::operator=(ENUM_HTTP_METHOD method)
  {
   m_method = method;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpMethods::SetMethod(ENUM_HTTP_METHOD method)
  {
   m_method = method;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CHttpMethods::SetMethod(string method)
  {
   if(method == "CONNECT")
     {
      m_method = HTTP_METHOD_CONNECT;
      return(true);
     }
   else if(method == "DELETE")
     {
      m_method = HTTP_METHOD_DELETE;
      return(true);
     }
   else if(method == "GET")
     {
      m_method = HTTP_METHOD_GET;
      return(true);
     }
   else if(method == "HEAD")
     {
      m_method = HTTP_METHOD_HEAD;
      return(true);
     }
   else if(method == "OPTIONS")
     {
      m_method = HTTP_METHOD_OPTION;
      return(true);
     }
   else if(method == "PATCH")
     {
      m_method = HTTP_METHOD_PATCH;
      return(true);
     }
   else if(method == "POST")
     {
      m_method = HTTP_METHOD_POST;
      return(true);
     }
   else if(method == "PUT")
     {
      m_method = HTTP_METHOD_PUT;
      return(true);
     }
   else if(method == "TRACE")
     {
      m_method = HTTP_METHOD_TRACE;
      return(true);
     }
   return(false);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ENUM_HTTP_METHOD CHttpMethods::GetMethod(void)
  {
   return(m_method);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CHttpMethods::HttpMethodsDescription(void)
  {
   return(this.HttpMethodsDescription(m_method));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CHttpMethods::HttpMethodsDescription(ENUM_HTTP_METHOD method)
  {
   switch(method)
     {
      case HTTP_METHOD_CONNECT:
         return "CONNECT";
      case HTTP_METHOD_DELETE:
         return "DELETE";
      case HTTP_METHOD_GET:
         return "GET";
      case HTTP_METHOD_HEAD:
         return "HEAD";
      case HTTP_METHOD_OPTION:
         return "OPTIONS";
      case HTTP_METHOD_PATCH:
         return "PATCH";
      case HTTP_METHOD_POST:
         return "POST";
      case HTTP_METHOD_PUT:
         return "PUT";
      case HTTP_METHOD_TRACE:
         return "TRACE";

      default:
         return "Unknown HTTP Method";
     }
  }
//+------------------------------------------------------------------+
