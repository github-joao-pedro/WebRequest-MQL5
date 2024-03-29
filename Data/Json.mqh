//+------------------------------------------------------------------+
//| Arquivo original encontra-se em                                  |
//| https://www.mql5.com/en/code/13663                               |
//|                                                                  |
//| Este arquivo possui algumas alterações!                          |
//+------------------------------------------------------------------+


//------------------------------------------------------------------ enum enJAType
enum enJAType
  {
   jtUNDEF,
   jtNULL, 
   jtBOOL, 
   jtINT, 
   jtDBL, 
   jtSTR, 
   jtARRAY, 
   jtOBJ,
   jtCOLOR,
   jtDATETIME,
  };

//------------------------------------------------------------------ class CJson
class CJson
  {
public:
   virtual void      Clear(enJAType jt=jtUNDEF, bool savekey=false)
     {
      m_parent=NULL;
      if(!savekey)
         m_key="";
      m_type=jt;
      m_bv=false;
      m_iv=0;
      m_dv=0;
      m_prec=8;
      m_sv="";
      ArrayResize(m_e, 0, 100);
     }
   virtual bool      Copy(const CJson &a)
     {
      m_key=a.m_key;
      CopyData(a);
      return true;
     }
   virtual void      CopyData(const CJson& a)
     {
      m_type=a.m_type;
      m_bv=a.m_bv;
      m_iv=a.m_iv;
      m_dv=a.m_dv;
      m_prec=a.m_prec;
      m_sv=a.m_sv;
      CopyArr(a);
     }
   virtual void      CopyArr(const CJson& a)
     {
      int n=ArrayResize(m_e, ArraySize(a.m_e));
      for(int i=0; i<n; i++)
        {
         m_e[i]=a.m_e[i];
         m_e[i].m_parent=GetPointer(this);
        }
     }

public:
   CJson            m_e[];
   string            m_key;
   string            m_lkey;
   CJson*           m_parent;
   enJAType          m_type;
   bool              m_bv;
   long              m_iv;
   double            m_dv;
   int               m_prec;
   string            m_sv;
   color             m_cv;
   datetime          m_tv;
   static int        code_page;

public:
                     CJson()
     {
      Clear();
     }
                     CJson(CJson* aparent, enJAType atype)
     {
      Clear();
      m_type=atype;
      m_parent=aparent;
     }
                     CJson(enJAType t, string a)
     {
      Clear();
      FromStr(t, a);
     }
                     CJson(const int a)
     {
      Clear();
      m_type=jtINT;
      m_iv=a;
      m_dv=(double)m_iv;
      m_sv=IntegerToString(m_iv);
      m_bv=m_iv!=0;
     }
                     CJson(const long a)
     {
      Clear();
      m_type=jtINT;
      m_iv=a;
      m_dv=(double)m_iv;
      m_sv=IntegerToString(m_iv);
      m_bv=m_iv!=0;
     }
                     CJson(const double a, int aprec=-100)
     {
      Clear();
      m_type=jtDBL;
      m_dv=a;
      if(aprec>-100)
         m_prec=aprec;
      m_iv=(long)m_dv;
      m_sv=DoubleToString(m_dv, m_prec);
      m_bv=m_iv!=0;
     }
                     CJson(const bool a)
     {
      Clear();
      m_type=jtBOOL;
      m_bv=a;
      m_iv=m_bv;
      m_dv=m_bv;
      m_sv=IntegerToString(m_iv);
     }
                     CJson(const CJson& a)
     {
      Clear();
      Copy(a);
     }
                    ~CJson()
     {
      Clear();
     }

public:
   int               Size()
     {
      return ArraySize(m_e);
     }
   virtual bool      IsNumeric()
     {
      return m_type==jtDBL || m_type==jtINT;
     }
   virtual CJson*   FindKey(string akey)
     {
      for(int i=Size()-1; i>=0; --i)
         if(m_e[i].m_key==akey)
            return GetPointer(m_e[i]);
      return NULL;
     }
   virtual CJson*   HasKey(string akey, enJAType atype=jtUNDEF)
     {
      CJson* e=FindKey(akey);
      if(CheckPointer(e)!=POINTER_INVALID)
        {
         if(atype==jtUNDEF || atype==e.m_type)
            return GetPointer(e);
        }
      return NULL;
     }
   virtual CJson*   operator[](string akey);
   virtual CJson*   operator[](int i);
   void              operator=(const CJson &a)
     {
      Copy(a);
     }
   void              operator=(const int a)
     {
      m_type=jtINT;
      m_iv=a;
      m_dv=(double)m_iv;
      m_bv=m_iv!=0;
     }
   void              operator=(const long a)
     {
      m_type=jtINT;
      m_iv=a;
      m_dv=(double)m_iv;
      m_bv=m_iv!=0;
     }
   void              operator=(const double a)
     {
      m_type=jtDBL;
      m_dv=a;
      m_iv=(long)m_dv;
      m_bv=m_iv!=0;
     }
   void              operator=(const bool a)
     {
      m_type=jtBOOL;
      m_bv=a;
      m_iv=(long)m_bv;
      m_dv=(double)m_bv;
     }
   void              operator=(string a)
     {
      m_type=(a!=NULL)?jtSTR:jtNULL;
      m_sv=a;
      m_iv=StringToInteger(m_sv);
      m_dv=StringToDouble(m_sv);
      m_bv=a!=NULL;
     }
   void              operator=(color c)
     {
      m_type=jtCOLOR;
      m_cv=c;
      m_sv=ColorToString(c);
      m_iv=StringToInteger(m_sv);
      m_dv=StringToDouble(m_sv);
      m_bv=m_iv!=0;
     }
   void              operator=(datetime t)
     {
      m_type=jtDATETIME;
      m_tv=t;
      m_sv=TimeToString(t);
      m_iv=t;
      m_dv=0;
      m_bv=m_iv!=0;
     }

   bool              operator==(const int a)
     {
      return m_iv==a;
     }
   bool              operator==(const long a)
     {
      return m_iv==a;
     }
   bool              operator==(const double a)
     {
      return m_dv==a;
     }
   bool              operator==(const bool a)
     {
      return m_bv==a;
     }
   bool              operator==(string a)
     {
      return m_sv==a;
     }

   bool              operator!=(const int a)
     {
      return m_iv!=a;
     }
   bool              operator!=(const long a)
     {
      return m_iv!=a;
     }
   bool              operator!=(const double a)
     {
      return m_dv!=a;
     }
   bool              operator!=(const bool a)
     {
      return m_bv!=a;
     }
   bool              operator!=(string a)
     {
      return m_sv!=a;
     }

   long              ToInt() const
     {
      return m_iv;
     }
   double            ToDbl() const
     {
      return m_dv;
     }
   bool              ToBool() const
     {
      return m_bv;
     }
   string            ToStr()
     {
      return m_sv;
     }
   color             ToColor()
     {
      return m_cv;
     }
   datetime          ToDateTime()
     {
      return m_tv;
     }

   virtual void      FromStr(enJAType t, string a)
     {
      m_type=t;
      switch(m_type)
        {
         case jtBOOL:
            m_bv=(StringToInteger(a)!=0);
            m_iv=(long)m_bv;
            m_dv=(double)m_bv;
            m_sv=a;
            break;
         case jtINT:
            m_iv=StringToInteger(a);
            m_dv=(double)m_iv;
            m_sv=a;
            m_bv=m_iv!=0;
            break;
         case jtDBL:
            m_dv=StringToDouble(a);
            m_iv=(long)m_dv;
            m_sv=a;
            m_bv=m_iv!=0;
            break;
         case jtSTR:
            m_sv=Unescape(a);
            m_type=(m_sv!=NULL)?jtSTR:jtNULL;
            m_iv=StringToInteger(m_sv);
            m_dv=StringToDouble(m_sv);
            m_bv=m_sv!=NULL;
            break;
        }
     }
   virtual string    GetStr(char& js[], int i, int slen)
     {
      if(slen==0)
         return "";
      char cc[];
      ArrayCopy(cc, js, 0, i, slen);
      return CharArrayToString(cc, 0, WHOLE_ARRAY, CJson::code_page);
     }

   virtual void      Set(const CJson& a)
     {
      if(m_type==jtUNDEF)
         m_type=jtOBJ;
      CopyData(a);
     }
   virtual void      Set(const CJson& list[]);
   virtual CJson*   Add(const CJson& item)
     {
      if(m_type==jtUNDEF)
         m_type=jtARRAY; /*ASSERT(m_type==jtOBJ || m_type==jtARRAY);*/ return AddBase(item);   // ??????????
     }
   virtual CJson*   Add(const int a)
     {
      CJson item(a);
      return Add(item);
     }
   virtual CJson*   Add(const long a)
     {
      CJson item(a);
      return Add(item);
     }
   virtual CJson*   Add(const double a, int aprec=-2)
     {
      CJson item(a, aprec);
      return Add(item);
     }
   virtual CJson*   Add(const bool a)
     {
      CJson item(a);
      return Add(item);
     }
   virtual CJson*   Add(string a)
     {
      CJson item(jtSTR, a);
      return Add(item);
     }
   virtual CJson*   AddBase(const CJson &item)
     {
      int c=Size();   // ??????????
      ArrayResize(m_e, c+1, 100);
      m_e[c]=item;
      m_e[c].m_parent=GetPointer(this);
      return GetPointer(m_e[c]);
     }
   virtual CJson*   New()
     {
      if(m_type==jtUNDEF)
         m_type=jtARRAY; /*ASSERT(m_type==jtOBJ || m_type==jtARRAY);*/ return NewBase();   // ??????????
     }
   virtual CJson*   NewBase()
     {
      int c=Size();   // ??????????
      ArrayResize(m_e, c+1, 100);
      return GetPointer(m_e[c]);
     }

   virtual string    Escape(string a);
   virtual string    Unescape(string a);
public:
   virtual void      Serialize(string &js, bool bf=false, bool bcoma=false);
   virtual string    Serialize()
     {
      string js;
      Serialize(js);
      return js;
     }
   virtual bool      Deserialize(char& js[], int slen, int &i);
   virtual bool      ExtrStr(char& js[], int slen, int &i);
   virtual bool      Deserialize(string js, int acp=CP_ACP)
     {
      int i=0;
      Clear();
      CJson::code_page=acp;
      char arr[];
      int slen=StringToCharArray(js, arr, 0, WHOLE_ARRAY, CJson::code_page);
      return Deserialize(arr, slen, i);
     }
   virtual bool      Deserialize(char& js[], int acp=CP_ACP)
     {
      int i=0;
      Clear();
      CJson::code_page=acp;
      return Deserialize(js, ArraySize(js), i);
     }
  };

int CJson::code_page=CP_ACP;

//------------------------------------------------------------------ operator[]
CJson* CJson::operator[](string akey)
  {
   if(m_type==jtUNDEF)
      m_type=jtOBJ;
   CJson* v=FindKey(akey);
   if(v)
      return v;
   CJson b(GetPointer(this), jtUNDEF);
   b.m_key=akey;
   v=Add(b);
   return v;
  }
//------------------------------------------------------------------ operator[]
CJson* CJson::operator[](int i)
  {
   if(m_type==jtUNDEF)
      m_type=jtARRAY;
   while(i>=Size())
     {
      CJson b(GetPointer(this), jtUNDEF);
      if(CheckPointer(Add(b))==POINTER_INVALID)
         return NULL;
     }
   return GetPointer(m_e[i]);
  }
//------------------------------------------------------------------ Set
void CJson::Set(const CJson& list[])
  {
   if(m_type==jtUNDEF)
      m_type=jtARRAY;
   int n=ArrayResize(m_e, ArraySize(list), 100);
   for(int i=0; i<n; ++i)
     {
      m_e[i]=list[i];
      m_e[i].m_parent=GetPointer(this);
     }
  }

//------------------------------------------------------------------ Serialize
void CJson::Serialize(string& js, bool bkey/*=false*/, bool coma/*=false*/)
  {
   if(m_type==jtUNDEF)
      return;
   if(coma)
      js+=",";
   if(bkey)
      js+=StringFormat("\"%s\":", m_key);
   int _n=Size();
   switch(m_type)
     {
      case jtNULL:
         js+="null";
         break;
      case jtCOLOR:
         js+=m_sv;
         break;
      case jtDATETIME:
         js+=m_sv;
         break;
      case jtBOOL:
         js+=(m_bv?"true":"false");
         break;
      case jtINT:
         js+=IntegerToString(m_iv);
         break;
      case jtDBL:
         js+=DoubleToString(m_dv, m_prec);
         break;
      case jtSTR:
        {
         string ss=Escape(m_sv);
         if(StringLen(ss)>0)
            js+=StringFormat("\"%s\"", ss);
         else
            js+="null";
        }
      break;
      case jtARRAY:
         js+="[";
         for(int i=0; i<_n; i++)
            m_e[i].Serialize(js, false, i>0);
         js+="]";
         break;
      case jtOBJ:
         js+="{";
         for(int i=0; i<_n; i++)
            m_e[i].Serialize(js, true, i>0);
         js+="}";
         break;
     }
  }

//------------------------------------------------------------------ Deserialize
bool CJson::Deserialize(char& js[], int slen, int &i)
  {
   string num="0123456789+-.eE";
   int i0=i;
   for(; i<slen; i++)
     {
      char c=js[i];
      if(c==0)
         break;
      switch(c)
        {
         case '\t':
         case '\r':
         case '\n':
         case ' ': // ?????????? ?? ????? ???????
            i0=i+1;
            break;

         case '[':   // ?????? ???????. ??????? ??????? ? ???????? ?? js
           {
            i0=i+1;
            if(m_type!=jtUNDEF)
              {
               return false;
              }
            m_type=jtARRAY; // ?????? ??? ????????
            i++;
            CJson val(GetPointer(this), jtUNDEF);
            while(val.Deserialize(js, slen, i))
              {
               if(val.m_type!=jtUNDEF)
                  Add(val);
               if(val.m_type==jtINT || val.m_type==jtDBL || val.m_type==jtARRAY)
                  i++;
               val.Clear();
               val.m_parent=GetPointer(this);
               if(js[i]==']')
                  break;
               i++;
               if(i>=slen)
                 {
                  return false;
                 }
              }
            return js[i]==']' || js[i]==0;
           }
         break;
         case ']':
            if(!m_parent)
               return false;
            return m_parent.m_type==jtARRAY; // ????? ???????, ??????? ???????? ?????? ???? ????????

         case ':':
           {
            if(m_lkey=="")
              {
               return false;
              }
            CJson val(GetPointer(this), jtUNDEF);
            CJson *oc=Add(val); // ??? ??????? ???? ?? ?????????
            oc.m_key=m_lkey;
            m_lkey=""; // ?????? ??? ?????
            i++;
            if(!oc.Deserialize(js, slen, i))
              {
               return false;
              }
            break;
           }
         case ',': // ??????????? ???????? // ??? ???????? ??? ?????? ???? ?????????
            i0=i+1;
            if(!m_parent && m_type!=jtOBJ)
              {
               return false;
              }
            else
               if(m_parent)
                 {
                  if(m_parent.m_type!=jtARRAY && m_parent.m_type!=jtOBJ)
                    {
                     return false;
                    }
                  if(m_parent.m_type==jtARRAY && m_type==jtUNDEF)
                     return true;
                 }
            break;

         // ????????? ????? ???? ?????? ? ??????? / ???? ??????????????
         case '{': // ?????? ???????. ??????? ?????? ? ???????? ??? ?? js
            i0=i+1;
            if(m_type!=jtUNDEF)
              {
               return false;
              }
            m_type=jtOBJ; // ?????? ??? ????????
            i++;
            if(!Deserialize(js, slen, i))
              {
               return false;
              }
            return js[i]=='}' || js[i]==0;
            break;
         case '}':
            return m_type==jtOBJ; // ????? ???????, ??????? ???????? ?????? ???? ????????

         case 't':
         case 'T': // ?????? true
         case 'f':
         case 'F': // ?????? false
            if(m_type!=jtUNDEF)
              {
               return false;
              }
            m_type=jtBOOL; // ?????? ??? ????????
            if(i+3<slen)
              {
               if(StringCompare(GetStr(js, i, 4), "true", false)==0)
                 {
                  m_bv=true;
                  i+=3;
                  return true;
                 }
              }
            if(i+4<slen)
              {
               if(StringCompare(GetStr(js, i, 5), "false", false)==0)
                 {
                  m_bv=false;
                  i+=4;
                  return true;
                 }
              }
            return false; // ?? ??? ??? ??? ????? ??????
            break;
         case 'n':
         case 'N': // ?????? null
            if(m_type!=jtUNDEF)
              {
               return false;
              }
            m_type=jtNULL; // ?????? ??? ????????
            if(i+3<slen)
               if(StringCompare(GetStr(js, i, 4), "null", false)==0)
                 {
                  i+=3;
                  return true;
                 }
            return false; // ?? NULL ??? ????? ??????
            break;

         case '0':
         case '1':
         case '2':
         case '3':
         case '4':
         case '5':
         case '6':
         case '7':
         case '8':
         case '9':
         case '-':
         case '+':
         case '.':   // ?????? ?????
           {
            if(m_type!=jtUNDEF)
              {
               return false;
              }
            bool dbl=false;// ?????? ??? ????????
            int is=i;
            while(js[i]!=0 && i<slen)
              {
               i++;
               if(StringFind(num, GetStr(js, i, 1))<0)
                  break;
               if(!dbl)
                  dbl=(js[i]=='.' || js[i]=='e' || js[i]=='E');
              }
            m_sv=GetStr(js, is, i-is);
            if(dbl)
              {
               m_type=jtDBL;
               m_dv=StringToDouble(m_sv);
               m_iv=(long)m_dv;
               m_bv=m_iv!=0;
              }
            else
              {
               m_type=jtINT;   // ??????? ??? ????????
               m_iv=StringToInteger(m_sv);
               m_dv=(double)m_iv;
               m_bv=m_iv!=0;
              }
            i--;
            return true; // ???????????? ?? 1 ?????? ????? ? ?????
            break;
           }
         case '\"': // ?????? ??? ????? ??????
            if(m_type==jtOBJ)    // ???? ??? ??? ??????????? ? ???? ?? ?????
              {
               i++;
               int is=i;
               if(!ExtrStr(js, slen, i))
                 {
                  return false;
                 }
               m_lkey=GetStr(js, is, i-is);
              }
            else
              {
               if(m_type!=jtUNDEF)
                 {
                  return false;
                 }
               m_type=jtSTR; // ?????? ??? ????????
               i++;
               int is=i;
               if(!ExtrStr(js, slen, i))
                 {
                  return false;
                 }
               FromStr(jtSTR, GetStr(js, is, i-is));
               return true;
              }
            break;
        }
     }
   return true;
  }

//------------------------------------------------------------------ ExtrStr
bool CJson::ExtrStr(char& js[], int slen, int &i)
  {
   for(; js[i]!=0 && i<slen; i++)
     {
      char c=js[i];
      if(c=='\"')
         break; // ????? ??????
      if(c=='\\' && i+1<slen)
        {
         i++;
         c=js[i];
         switch(c)
           {
            case '/':
            case '\\':
            case '\"':
            case 'b':
            case 'f':
            case 'r':
            case 'n':
            case 't':
               break; // ??? ???????????
            case 'u':   // \uXXXX
              {
               i++;
               for(int j=0; j<4 && i<slen && js[i]!=0; j++, i++)
                 {
                  if(!((js[i]>='0' && js[i]<='9') || (js[i]>='A' && js[i]<='F') || (js[i]>='a' && js[i]<='f')))
                    {
                     return false;
                    }
                 }
               i--;
               break;
              }
            default:
               break; /*{ return false; } // ????????????? ?????? ? ?????????????? */
           }
        }
     }
   return true;
  }
//------------------------------------------------------------------ Escape
string CJson::Escape(string a)
  {
   ushort as[], s[];
   int n=StringToShortArray(a, as);
   if(ArrayResize(s, 2*n)!=2*n)
      return NULL;
   int j=0;
   for(int i=0; i<n; i++)
     {
      switch(as[i])
        {
         case '\\':
            s[j]='\\';
            j++;
            s[j]='\\';
            j++;
            break;
         case '"':
            s[j]='\\';
            j++;
            s[j]='"';
            j++;
            break;
         case '/':
            s[j]='\\';
            j++;
            s[j]='/';
            j++;
            break;
         case 8:
            s[j]='\\';
            j++;
            s[j]='b';
            j++;
            break;
         case 12:
            s[j]='\\';
            j++;
            s[j]='f';
            j++;
            break;
         case '\n':
            s[j]='\\';
            j++;
            s[j]='n';
            j++;
            break;
         case '\r':
            s[j]='\\';
            j++;
            s[j]='r';
            j++;
            break;
         case '\t':
            s[j]='\\';
            j++;
            s[j]='t';
            j++;
            break;
         default:
            s[j]=as[i];
            j++;
            break;
        }
     }
   a=ShortArrayToString(s, 0, j);
   return a;
  }
//------------------------------------------------------------------ Unescape
string CJson::Unescape(string a)
  {
   ushort as[], s[];
   int n=StringToShortArray(a, as);
   if(ArrayResize(s, n)!=n)
      return NULL;
   int j=0, i=0;
   while(i<n)
     {
      ushort c=as[i];
      if(c=='\\' && i<n-1)
        {
         switch(as[i+1])
           {
            case '\\':
               c='\\';
               i++;
               break;
            case '"':
               c='"';
               i++;
               break;
            case '/':
               c='/';
               i++;
               break;
            case 'b':
               c=8; /*08='\b'*/;
               i++;
               break;
            case 'f':
               c=12;/*0c=\f*/ i++;
               break;
            case 'n':
               c='\n';
               i++;
               break;
            case 'r':
               c='\r';
               i++;
               break;
            case 't':
               c='\t';
               i++;
               break;
            case 'u':   // \uXXXX
              {
               i+=2;
               ushort k=0;
               for(int jj=0; jj<4 && i<n; jj++, i++)
                 {
                  c=as[i];
                  ushort h=0;
                  if(c>='0' && c<='9')
                     h=c-'0';
                  else
                     if(c>='A' && c<='F')
                        h=c-'A'+10;
                     else
                        if(c>='a' && c<='f')
                           h=c-'a'+10;
                        else
                           break; // ?? hex
                  k+=h*(ushort)pow(16, (3-jj));
                 }
               i--;
               c=k;
               break;
              }
           }
        }
      s[j]=c;
      j++;
      i++;
     }
   a=ShortArrayToString(s, 0, j);
   return a;
  }
//+------------------------------------------------------------------+
