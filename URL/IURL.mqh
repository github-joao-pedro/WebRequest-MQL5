//+------------------------------------------------------------------+
//|                                                  WebRequest-MQL5 |
//|                                     Copyright 2024 - Quantstone  |
//|                                        https://quantstone.com.br |
//|                                               João Pedro Sampaio |
//+------------------------------------------------------------------+
#include "QueryParam/QueryParam.mqh"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
enum ENUM_URL_PROTOCOL
  {
   URL_PROTOCOL_NULL = 0,
   URL_PROTOCOL_HTTP,
   URL_PROTOCOL_HTTPS,
   URL_PROTOCOL_WS,
   URL_PROTOCOL_WSS,
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
interface IURL
  {
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
