//+------------------------------------------------------------------+
//|                                                  WebRequest-MQL5 |
//|                                     Copyright 2024 - Quantstone  |
//|                                        https://quantstone.com.br |
//|                                               João Pedro Sampaio |
//+------------------------------------------------------------------+
enum ENUM_HTTP_STATUS
  {
//--- Mql error
   HTTP_STATUS_URL_NOT_ALLOWED = -1,

//--- Informational
   HTTP_STATUS_CONTINUE = 100,
   HTTP_STATUS_SWITCHING_PROTOCOLS = 101,
   HTTP_STATUS_PROCESSING = 102,
   HTTP_STATUS_EARLY_HINTS = 103,

//--- Successul
   HTTP_STATUS_OK = 200,
   HTTP_STATUS_CREATED = 201,
   HTTP_STATUS_ACCEPTED = 202,
   HTTP_STATUS_NON_AUTHORITATIVE_INFORMATION = 203,
   HTTP_STATUS_NO_CONTENT = 204,
   HTTP_STATUS_RESET_CONTENT = 205,
   HTTP_STATUS_PARTIAL_CONTENT = 206,
   HTTP_STATUS_MULTI_STATUS = 207,
   HTTP_STATUS_ALREADY_REPORTED = 208,
   HTTP_STATUS_IM_USED = 226,

//--- Redirection messages
   HTTP_STATUS_MULTIPLE_CHOICES = 300,
   HTTP_STATUS_MOVED_PERMANENTLY = 301,
   HTTP_STATUS_FOUND = 302,
   HTTP_STATUS_SEE_OTHER = 303,
   HTTP_STATUS_NOT_MODIFIED = 304,
   HTTP_STATUS_USE_PROXY = 305,
   HTTP_STATUS_SWITCH_PROXY = 306,
   HTTP_STATUS_TEMPORARY_REDIRECT = 307,
   HTTP_STATUS_PERMANENT_REDIRECT = 308,

//--- Client error
   HTTP_STATUS_BAD_REQUEST = 400,
   HTTP_STATUS_UNAUTHORIZED = 401,
   HTTP_STATUS_PAYMENT_REQUIRED = 402,
   HTTP_STATUS_FORBIDDEN = 403,
   HTTP_STATUS_NOT_FOUND = 404,
   HTTP_STATUS_METHOD_NOT_ALLOWED = 405,
   HTTP_STATUS_NOT_ACCEPTABLE = 406,
   HTTP_STATUS_PROXY_AUTHENTICATION_REQUIRED = 407,
   HTTP_STATUS_REQUEST_TIMEOUT = 408,
   HTTP_STATUS_CONFLICT = 409,
   HTTP_STATUS_GONE = 410,
   HTTP_STATUS_LENGTH_REQUIRED = 411,
   HTTP_STATUS_PRECONDITION_FAILED = 412,
   HTTP_STATUS_PAYLOAD_TOO_LARGE = 413,
   HTTP_STATUS_URI_TOO_LONG = 414,
   HTTP_STATUS_UNSUPPORTED_MEDIA_TYPE = 415,
   HTTP_STATUS_RANGE_NOT_SATISFIABLE = 416,
   HTTP_STATUS_EXPECTATION_FAILED = 417,
   HTTP_STATUS_MISDIRECTED_REQUEST = 421,
   HTTP_STATUS_UNPROCESSABLE_ENTITY = 422,
   HTTP_STATUS_LOCKED = 423,
   HTTP_STATUS_FAILED_DEPENDENCY = 424,
   HTTP_STATUS_TOO_EARLY = 425,
   HTTP_STATUS_UPGRADE_REQUIRED = 426,
   HTTP_STATUS_PRECONDITION_REQUIRED = 428,
   HTTP_STATUS_TOO_MANY_REQUESTS = 429,
   HTTP_STATUS_REQUEST_HEADER_FIELDS_TOO_LARGE = 431,
   HTTP_STATUS_UNAVAILABLE_FOR_LEGAL_REASONS = 451,

//--- Server error
   HTTP_STATUS_INTERNAL_SERVER_ERROR = 500,
   HTTP_STATUS_NOT_IMPLEMENTED = 501,
   HTTP_STATUS_BAD_GATEWAY = 502,
   HTTP_STATUS_SERVICE_UNAVAILABLE = 503,
   HTTP_STATUS_GATEWAY_TIMEOUT = 504,
   HTTP_STATUS_HTTP_VERSION_NOT_SUPPORTED = 505,
   HTTP_STATUS_VARIANT_ALSO_NEGOTIATES = 506,
   HTTP_STATUS_INSUFFICIENT_STORAGE = 507,
   HTTP_STATUS_LOOP_DETECTED = 508,
   HTTP_STATUS_NOT_EXTENDED = 510,
   HTTP_STATUS_NETWORK_AUTHENTICATION_REQUIRED = 511
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CHttpStatusCodes
  {
private:
   
   ENUM_HTTP_STATUS  m_status;
   
public:
                     CHttpStatusCodes(void);
                    ~CHttpStatusCodes(void);

   void              operator=(int status);
   void              operator=(ENUM_HTTP_STATUS status);
   void              SetStatus(ENUM_HTTP_STATUS status);
   ENUM_HTTP_STATUS  GetStatus(void);
   int               GetStatusCode(void);
   
   ENUM_HTTP_STATUS  HttpStatusCode(int status);
   string            HttpStatusCodeFormat(void);
   string            HttpStatusCodeDescriptionEnglish(void);
   string            HttpStatusCodeDescriptionPortuguese(void);
   string            HttpStatusCodeFormat(ENUM_HTTP_STATUS status);
   string            HttpStatusCodeDescriptionEnglish(ENUM_HTTP_STATUS status);
   string            HttpStatusCodeDescriptionPortuguese(ENUM_HTTP_STATUS status);
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CHttpStatusCodes::CHttpStatusCodes(void)
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CHttpStatusCodes::~CHttpStatusCodes(void)
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpStatusCodes::operator=(int status)
  {
   m_status = this.HttpStatusCode(status);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpStatusCodes::operator=(ENUM_HTTP_STATUS status)
  {
   m_status = status;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpStatusCodes::SetStatus(ENUM_HTTP_STATUS status)
  {
   m_status = status;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ENUM_HTTP_STATUS CHttpStatusCodes::GetStatus(void)
  {
   return(m_status);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CHttpStatusCodes::GetStatusCode(void)
  {
   return((int)m_status);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ENUM_HTTP_STATUS CHttpStatusCodes::HttpStatusCode(int status)
  {
   return((ENUM_HTTP_STATUS)status);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CHttpStatusCodes::HttpStatusCodeFormat(void)
  {
   return(this.HttpStatusCodeFormat(m_status));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CHttpStatusCodes::HttpStatusCodeDescriptionEnglish(void)
  {
   return(this.HttpStatusCodeDescriptionEnglish(m_status));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CHttpStatusCodes::HttpStatusCodeDescriptionPortuguese(void)
  {
   return(this.HttpStatusCodeDescriptionPortuguese(m_status));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CHttpStatusCodes::HttpStatusCodeFormat(ENUM_HTTP_STATUS status)
  {
   return(EnumToString(status)+" ["+IntegerToString((int)status)+"] - "+this.HttpStatusCodeDescriptionEnglish(status));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CHttpStatusCodes::HttpStatusCodeDescriptionEnglish(ENUM_HTTP_STATUS status)
  {
   switch(status)
     {
      case HTTP_STATUS_CONTINUE:
         return "Continue";
      case HTTP_STATUS_SWITCHING_PROTOCOLS:
         return "Switching Protocols";
      case HTTP_STATUS_PROCESSING:
         return "Processing";
      case HTTP_STATUS_EARLY_HINTS:
         return "Early Hints";

      case HTTP_STATUS_OK:
         return "OK";
      case HTTP_STATUS_CREATED:
         return "Created";
      case HTTP_STATUS_ACCEPTED:
         return "Accepted";
      case HTTP_STATUS_NON_AUTHORITATIVE_INFORMATION:
         return "Non-Authoritative Information";
      case HTTP_STATUS_NO_CONTENT:
         return "No Content";
      case HTTP_STATUS_RESET_CONTENT:
         return "Reset Content";
      case HTTP_STATUS_PARTIAL_CONTENT:
         return "Partial Content";
      case HTTP_STATUS_MULTI_STATUS:
         return "Multi-Status";
      case HTTP_STATUS_ALREADY_REPORTED:
         return "Already Reported";
      case HTTP_STATUS_IM_USED:
         return "IM Used";

      case HTTP_STATUS_MULTIPLE_CHOICES:
         return "Multiple Choices";
      case HTTP_STATUS_MOVED_PERMANENTLY:
         return "Moved Permanently";
      case HTTP_STATUS_FOUND:
         return "Found";
      case HTTP_STATUS_SEE_OTHER:
         return "See Other";
      case HTTP_STATUS_NOT_MODIFIED:
         return "Not Modified";
      case HTTP_STATUS_USE_PROXY:
         return "Use Proxy";
      case HTTP_STATUS_SWITCH_PROXY:
         return "Switch Proxy";
      case HTTP_STATUS_TEMPORARY_REDIRECT:
         return "Temporary Redirect";
      case HTTP_STATUS_PERMANENT_REDIRECT:
         return "Permanent Redirect";

      case HTTP_STATUS_BAD_REQUEST:
         return "Bad Request";
      case HTTP_STATUS_UNAUTHORIZED:
         return "Unauthorized";
      case HTTP_STATUS_PAYMENT_REQUIRED:
         return "Payment Required";
      case HTTP_STATUS_FORBIDDEN:
         return "Forbidden";
      case HTTP_STATUS_NOT_FOUND:
         return "Not Found";
      case HTTP_STATUS_METHOD_NOT_ALLOWED:
         return "Method Not Allowed";
      case HTTP_STATUS_NOT_ACCEPTABLE:
         return "Not Acceptable";
      case HTTP_STATUS_PROXY_AUTHENTICATION_REQUIRED:
         return "Proxy Authentication Required";
      case HTTP_STATUS_REQUEST_TIMEOUT:
         return "Request Timeout";
      case HTTP_STATUS_CONFLICT:
         return "Conflict";
      case HTTP_STATUS_GONE:
         return "Gone";
      case HTTP_STATUS_LENGTH_REQUIRED:
         return "Length Required";
      case HTTP_STATUS_PRECONDITION_FAILED:
         return "Precondition Failed";
      case HTTP_STATUS_PAYLOAD_TOO_LARGE:
         return "Payload Too Large";
      case HTTP_STATUS_URI_TOO_LONG:
         return "URI Too Long";
      case HTTP_STATUS_UNSUPPORTED_MEDIA_TYPE:
         return "Unsupported Media Type";
      case HTTP_STATUS_RANGE_NOT_SATISFIABLE:
         return "Range Not Satisfiable";
      case HTTP_STATUS_EXPECTATION_FAILED:
         return "Expectation Failed";
      case HTTP_STATUS_MISDIRECTED_REQUEST:
         return "Misdirected Request";
      case HTTP_STATUS_UNPROCESSABLE_ENTITY:
         return "Unprocessable Entity";
      case HTTP_STATUS_LOCKED:
         return "Locked";
      case HTTP_STATUS_FAILED_DEPENDENCY:
         return "Failed Dependency";
      case HTTP_STATUS_TOO_EARLY:
         return "Too Early";
      case HTTP_STATUS_UPGRADE_REQUIRED:
         return "Upgrade Required";
      case HTTP_STATUS_PRECONDITION_REQUIRED:
         return "Precondition Required";
      case HTTP_STATUS_TOO_MANY_REQUESTS:
         return "Too Many Requests";
      case HTTP_STATUS_REQUEST_HEADER_FIELDS_TOO_LARGE:
         return "Request Header Fields Too Large";
      case HTTP_STATUS_UNAVAILABLE_FOR_LEGAL_REASONS:
         return "Unavailable For Legal Reasons";

      case HTTP_STATUS_INTERNAL_SERVER_ERROR:
         return "Internal Server Error";
      case HTTP_STATUS_NOT_IMPLEMENTED:
         return "Not Implemented";
      case HTTP_STATUS_BAD_GATEWAY:
         return "Bad Gateway";
      case HTTP_STATUS_SERVICE_UNAVAILABLE:
         return "Service Unavailable";
      case HTTP_STATUS_GATEWAY_TIMEOUT:
         return "Gateway Timeout";
      case HTTP_STATUS_HTTP_VERSION_NOT_SUPPORTED:
         return "HTTP Version Not Supported";
      case HTTP_STATUS_VARIANT_ALSO_NEGOTIATES:
         return "Variant Also Negotiates";
      case HTTP_STATUS_INSUFFICIENT_STORAGE:
         return "Insufficient Storage";
      case HTTP_STATUS_LOOP_DETECTED:
         return "Loop Detected";
      case HTTP_STATUS_NOT_EXTENDED:
         return "Not Extended";
      case HTTP_STATUS_NETWORK_AUTHENTICATION_REQUIRED:
         return "Network Authentication Required";
      default:
         return "Unknown HTTP Status";
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CHttpStatusCodes::HttpStatusCodeDescriptionPortuguese(ENUM_HTTP_STATUS status)
  {
   switch(status)
     {
      case HTTP_STATUS_CONTINUE:
         return "Continuar";
      case HTTP_STATUS_SWITCHING_PROTOCOLS:
         return "Mudando Protocolos";
      case HTTP_STATUS_PROCESSING:
         return "Processando";
      case HTTP_STATUS_EARLY_HINTS:
         return "Dicas Antecipadas";

      case HTTP_STATUS_OK:
         return "OK";
      case HTTP_STATUS_CREATED:
         return "Criado";
      case HTTP_STATUS_ACCEPTED:
         return "Aceito";
      case HTTP_STATUS_NON_AUTHORITATIVE_INFORMATION:
         return "Informação Não Autoritativa";
      case HTTP_STATUS_NO_CONTENT:
         return "Sem Conteúdo";
      case HTTP_STATUS_RESET_CONTENT:
         return "Redefinir Conteúdo";
      case HTTP_STATUS_PARTIAL_CONTENT:
         return "Conteúdo Parcial";
      case HTTP_STATUS_MULTI_STATUS:
         return "Múltiplos Estados";
      case HTTP_STATUS_ALREADY_REPORTED:
         return "Já Reportado";
      case HTTP_STATUS_IM_USED:
         return "IM Usado";

      case HTTP_STATUS_MULTIPLE_CHOICES:
         return "Múltipla Escolha";
      case HTTP_STATUS_MOVED_PERMANENTLY:
         return "Movido Permanentemente";
      case HTTP_STATUS_FOUND:
         return "Encontrado";
      case HTTP_STATUS_SEE_OTHER:
         return "Ver Outro";
      case HTTP_STATUS_NOT_MODIFIED:
         return "Não Modificado";
      case HTTP_STATUS_USE_PROXY:
         return "Usar Proxy";
      case HTTP_STATUS_SWITCH_PROXY:
         return "Trocar Proxy";
      case HTTP_STATUS_TEMPORARY_REDIRECT:
         return "Redirecionamento Temporário";
      case HTTP_STATUS_PERMANENT_REDIRECT:
         return "Redirecionamento Permanente";

      case HTTP_STATUS_BAD_REQUEST:
         return "Pedido Inválido";
      case HTTP_STATUS_UNAUTHORIZED:
         return "Não Autorizado";
      case HTTP_STATUS_PAYMENT_REQUIRED:
         return "Pagamento Necessário";
      case HTTP_STATUS_FORBIDDEN:
         return "Proibido";
      case HTTP_STATUS_NOT_FOUND:
         return "Não Encontrado";
      case HTTP_STATUS_METHOD_NOT_ALLOWED:
         return "Método Não Permitido";
      case HTTP_STATUS_NOT_ACCEPTABLE:
         return "Não Aceitável";
      case HTTP_STATUS_PROXY_AUTHENTICATION_REQUIRED:
         return "Autenticação de Proxy Necessária";
      case HTTP_STATUS_REQUEST_TIMEOUT:
         return "Tempo Limite de Pedido Expirado";
      case HTTP_STATUS_CONFLICT:
         return "Conflito";
      case HTTP_STATUS_GONE:
         return "Desaparecido";
      case HTTP_STATUS_LENGTH_REQUIRED:
         return "Comprimento Necessário";
      case HTTP_STATUS_PRECONDITION_FAILED:
         return "Pré-condição Falhou";
      case HTTP_STATUS_PAYLOAD_TOO_LARGE:
         return "Carga Útil Muito Grande";
      case HTTP_STATUS_URI_TOO_LONG:
         return "URI Muito Longo";
      case HTTP_STATUS_UNSUPPORTED_MEDIA_TYPE:
         return "Tipo de Mídia Não Suportado";
      case HTTP_STATUS_RANGE_NOT_SATISFIABLE:
         return "Faixa Não Satisfatória";
      case HTTP_STATUS_EXPECTATION_FAILED:
         return "Expectativa Falhou";
      case HTTP_STATUS_MISDIRECTED_REQUEST:
         return "Pedido Desencaminhado";
      case HTTP_STATUS_UNPROCESSABLE_ENTITY:
         return "Entidade Não Processável";
      case HTTP_STATUS_LOCKED:
         return "Trancado";
      case HTTP_STATUS_FAILED_DEPENDENCY:
         return "Dependência Falhou";
      case HTTP_STATUS_TOO_EARLY:
         return "Muito Cedo";
      case HTTP_STATUS_UPGRADE_REQUIRED:
         return "Atualização Necessária";
      case HTTP_STATUS_PRECONDITION_REQUIRED:
         return "Pré-condição Necessária";
      case HTTP_STATUS_TOO_MANY_REQUESTS:
         return "Muitos Pedidos";
      case HTTP_STATUS_REQUEST_HEADER_FIELDS_TOO_LARGE:
         return "Campos de Cabeçalho do Pedido Muito Grandes";
      case HTTP_STATUS_UNAVAILABLE_FOR_LEGAL_REASONS:
         return "Indisponível por Motivos Legais";

      case HTTP_STATUS_INTERNAL_SERVER_ERROR:
         return "Erro Interno do Servidor";
      case HTTP_STATUS_NOT_IMPLEMENTED:
         return "Não Implementado";
      case HTTP_STATUS_BAD_GATEWAY:
         return "Gateway Ruim";
      case HTTP_STATUS_SERVICE_UNAVAILABLE:
         return "Serviço Indisponível";
      case HTTP_STATUS_GATEWAY_TIMEOUT:
         return "Tempo Limite do Gateway Expirado";
      case HTTP_STATUS_HTTP_VERSION_NOT_SUPPORTED:
         return "Versão do HTTP Não Suportada";
      case HTTP_STATUS_VARIANT_ALSO_NEGOTIATES:
         return "Variante Também Negocia";
      case HTTP_STATUS_INSUFFICIENT_STORAGE:
         return "Armazenamento Insuficiente";
      case HTTP_STATUS_LOOP_DETECTED:
         return "Detectado Loop";
      case HTTP_STATUS_NOT_EXTENDED:
         return "Não Estendido";
      case HTTP_STATUS_NETWORK_AUTHENTICATION_REQUIRED:
         return "Autenticação de Rede Necessária";

      default:
         return "Código de Status HTTP Desconhecido";
     }
  }
//+------------------------------------------------------------------+
