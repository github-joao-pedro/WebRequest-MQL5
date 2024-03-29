//+------------------------------------------------------------------+
//|                                                  WebRequest-MQL5 |
//|                                     Copyright 2024 - Quantstone  |
//|                                        https://quantstone.com.br |
//|                                               João Pedro Sampaio |
//+------------------------------------------------------------------+

#include "IURL.mqh"
#include "QueryParam/QueryParam.mqh"

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CURL : public IURL
  {
private:
   
   ENUM_URL_PROTOCOL m_protocol;
   string            m_host;
   uint              m_port;
   string            m_path;
   string            m_resource;
   IQueryParam       *m_query_param;

public:
                     CURL(const string url);
                     CURL(void);
                    ~CURL(void);
   
   //--- Prorocol
   string            ProtocolStr(void);
   string            ProtocolStr(const ENUM_URL_PROTOCOL protocol);
   
   //--- Get
   ENUM_URL_PROTOCOL Protocol(void);
   string            Host(void);
   uint              Port(void);
   string            Path(void);
   string            Resource(void);
   IQueryParam       *QueryParam(void);
   
   //--- Set
   void              Protocol(ENUM_URL_PROTOCOL protocol);
   void              Host(const string host);
   void              Port(const uint port);
   void              Path(const string path);
   void              Resource(const string resourse);
   void              QueryParam(IQueryParam *query_param);
   
   //--- Parse/serialize
   void              operator=(const string url);
   bool              Parse(const string url);
   string            Serialize(void);
   void              Free(void);
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CURL::CURL(const string url)
  {
   m_query_param = new CQueryParam();
   this.Parse(url);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CURL::CURL(void)
  {
   m_query_param = new CQueryParam();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CURL::~CURL(void)
  {
   delete m_query_param;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CURL::ProtocolStr(void)
  {
   if(m_protocol == URL_PROTOCOL_HTTP)   { return("http://");    }
   if(m_protocol == URL_PROTOCOL_HTTPS)  { return("https://");   }
   if(m_protocol == URL_PROTOCOL_WS)     { return("ws://");      }
   if(m_protocol == URL_PROTOCOL_WSS)    { return("wss://");     }
   return(NULL);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CURL::ProtocolStr(ENUM_URL_PROTOCOL protocol)
  {
   if(protocol == URL_PROTOCOL_HTTP)   { return("http://");    }
   if(protocol == URL_PROTOCOL_HTTPS)  { return("https://");   }
   if(protocol == URL_PROTOCOL_WS)     { return("ws://");      }
   if(protocol == URL_PROTOCOL_WSS)    { return("wss://");     }
   return(NULL);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ENUM_URL_PROTOCOL CURL::Protocol(void)
  {
   return(m_protocol);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CURL::Host(void)
  {
   return(m_port == 80? m_host : m_host+":"+IntegerToString(m_port));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
uint CURL::Port(void)
  {
   return(m_port);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CURL::Path(void)
  {
   return(m_path);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CURL::Resource(void)
  {
   return(m_resource);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
IQueryParam *CURL::QueryParam(void)
  {
   return(GetPointer(m_query_param));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CURL::Protocol(ENUM_URL_PROTOCOL protocol)
  {
   m_protocol = protocol;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CURL::Host(const string host)
  {
   m_host = host;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CURL::Port(const uint port)
  {
   m_port = port;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CURL::Path(const string path)
  {
   m_path = path;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CURL::Resource(const string resourse)
  {
   m_resource = resourse;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CURL::QueryParam(IQueryParam *query_param)
  {
   m_query_param = query_param;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CURL::operator=(const string url)
  {
   this.Parse(url);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CURL::Parse(const string url)
  {
   this.Free();
   
   //--- Protocol
   int index_end_protocol = 0;
   if(StringFind(url,"http://") >= 0)
     {
      m_protocol = URL_PROTOCOL_HTTP;
      index_end_protocol = 7;
     }
   else if(StringFind(url,"https://") >= 0)
     {
      m_protocol = URL_PROTOCOL_HTTPS;
      index_end_protocol = 8;
     }
   else if(StringFind(url,"ws://") >= 0)
     {
      m_protocol = URL_PROTOCOL_WS;
      index_end_protocol = 5;
     }
   else if(StringFind(url,"wss://") >= 0)
     {
      m_protocol = URL_PROTOCOL_WSS;
      index_end_protocol = 6;
     }
   else
     {
      return(false);
     }
   
   //--- Separate endpoint of protocol
   string endpoint = StringSubstr(url,index_end_protocol);
   string parts[];
   int size = StringSplit(endpoint,StringGetCharacter("/",0),parts);
   
   //--- Host and port
   string host_port[];
   if(StringSplit(parts[0],StringGetCharacter(":",0),host_port) > 1)
     {
      m_host = host_port[0];
      m_port = (uint)StringToInteger(host_port[1]);
     }
   else
     {
      m_host = parts[0];
      
      if(m_protocol == URL_PROTOCOL_HTTP
      || m_protocol == URL_PROTOCOL_WS)
        {
         m_port = 80;
        }
      if(m_protocol == URL_PROTOCOL_HTTPS
      || m_protocol == URL_PROTOCOL_WSS)
        {
         m_port = 443;
        }
     }
   
   //--- Path and query params
   if(size == 1)
     {
      m_path += "/";
     }
   for(int i=1;i<size;i++)
     {
      if(StringFind(parts[i],"?") >= 0)
        {
         string resource_query[];
         if(StringSplit(parts[i],StringGetCharacter("?",0),resource_query) > 0)
           {
            m_resource = "/"+resource_query[0];
            m_query_param.Parse(resource_query[1]);
           }
        }
      else
        {
         m_path += "/"+parts[i];
        }
     }
   
   return(true);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CURL::Serialize(void)
  {
   return(this.ProtocolStr(m_protocol)+this.Host()+m_path+m_resource+m_query_param.Serialize());
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CURL::Free(void)
  {
   m_host = "";
   m_path = "";
   m_port = 0;
   m_protocol = URL_PROTOCOL_NULL;
   m_resource = "";
   m_query_param.Free();
  }
//+------------------------------------------------------------------+
