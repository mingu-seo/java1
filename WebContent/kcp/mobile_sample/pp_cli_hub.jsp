<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%
    /* ============================================================================== */
    /* =   PAGE : 지불 요청 및 결과 처리 PAGE                                       = */
    /* = -------------------------------------------------------------------------- = */
    /* =   연동시 오류가 발생하는 경우 아래의 주소로 접속하셔서 확인하시기 바랍니다.= */
    /* =   접속 주소 : http://kcp.co.kr/technique.requestcode.do                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2016  NHN KCP Inc.   All Rights Reserverd.                = */
    /* ============================================================================== */

    /* ============================================================================== */
    /* =   환경 설정 파일 Include                                                   = */
    /* = -------------------------------------------------------------------------- = */
    /* =   ※ 필수                                                                  = */
    /* =   테스트 및 실결제 연동시 site_conf_inc.jsp파일을 수정하시기 바랍니다.     = */
    /* = -------------------------------------------------------------------------- = */
%>
    <%@ page import="com.kcp.*"%>
    <%@ page import="java.net.URLEncoder"%>
    <%@ include file="../cfg/site_conf_inc.jsp"%>
<%!
    /* = -------------------------------------------------------------------------- = */
    /* =   환경 설정 파일 Include END                                               = */
    /* ============================================================================== */
%>

<%!
    /* ============================================================================== */
    /* =   null 값을 처리하는 메소드                                                = */
    /* = -------------------------------------------------------------------------- = */
    public String f_get_parm( String val )
    {
      if ( val == null ) val = "";
      return  val;
    }
    /* ============================================================================== */
%>
<%
    /* ============================================================================== */
    /* =   POST 형식 체크부분                                                       = */
    /* = -------------------------------------------------------------------------- = */
    if ( request.getMethod() != "POST" )
    {
        out.println("잘못된 경로로 접속하였습니다.");
        return;
    }
    /* ============================================================================== */
%>
<%
    request.setCharacterEncoding ( "euc-kr" ) ;
    /* ============================================================================== */
    /* =   01. 지불 요청 정보 설정                                                  = */
    /* = -------------------------------------------------------------------------- = */
    String req_tx         = f_get_parm( request.getParameter( "req_tx"         ) ); // 요청 종류
    String tran_cd        = f_get_parm( request.getParameter( "tran_cd"        ) ); // 처리 종류
    /* = -------------------------------------------------------------------------- = */
    String cust_ip        = f_get_parm( request.getRemoteAddr()                  ); // 요청 IP
    String ordr_idxx      = f_get_parm( request.getParameter( "ordr_idxx"      ) ); // 쇼핑몰 주문번호
    String good_name      = f_get_parm( request.getParameter( "good_name"      ) ); // 상품명
    /* = -------------------------------------------------------------------------- = */
    String res_cd         = "";                                                     // 응답코드
    String res_msg        = "";                                                     // 응답 메세지
    String tno            = f_get_parm( request.getParameter( "tno"            ) ); // KCP 거래 고유 번호
    /* = -------------------------------------------------------------------------- = */
    String buyr_name      = f_get_parm( request.getParameter( "buyr_name"      ) ); // 주문자명
    String buyr_tel1      = f_get_parm( request.getParameter( "buyr_tel1"      ) ); // 주문자 전화번호
    String buyr_tel2      = f_get_parm( request.getParameter( "buyr_tel2"      ) ); // 주문자 핸드폰 번호
    String buyr_mail      = f_get_parm( request.getParameter( "buyr_mail"      ) ); // 주문자 E-mail 주소
    /* = -------------------------------------------------------------------------- = */
    String use_pay_method = f_get_parm( request.getParameter( "use_pay_method" ) ); // 결제 방법
    String bSucc          = "";                                                     // 업체 DB 처리 성공 여부
    /* = -------------------------------------------------------------------------- = */
    String app_time       = "";                                                     // 승인시간 (모든 결제 수단 공통)
    String amount         = "";                                                     // KCP 실제 거래금액         
    /* = -------------------------------------------------------------------------- = */
    String card_cd        = "";                                                     // 신용카드 코드
    String card_name      = "";                                                     // 신용카드 명
    String app_no         = "";                                                     // 신용카드 승인번호
    String noinf          = "";                                                     // 신용카드 무이자 여부
    String quota          = "";                                                     // 신용카드 할부개월
    String partcanc_yn    = "";                                                     // 부분취소 가능유무
    String card_bin_type_01 = "";                                                   // 카드구분1
    String card_bin_type_02 = "";                                                   // 카드구분2
    /* = -------------------------------------------------------------------------- = */
    String bank_name      = "";                                                     // 은행명
    String bank_code      = "";                                                     // 은행코드
    /* = -------------------------------------------------------------------------- = */
    String bankname       = "";                                                     // 입금 은행명
    String depositor      = "";                                                     // 입금 계좌 예금주 성명
    String account        = "";                                                     // 입금 계좌 번호
    String va_date        = "";                                                     // 가상계좌 입금마감시간
    /* = -------------------------------------------------------------------------- = */
    String pnt_issue      = "";                                                     // 결제 포인트사 코드
    String pnt_amount     = "";                                                     // 적립금액 or 사용금액
    String pnt_app_time   = "";                                                     // 승인시간
    String pnt_app_no     = "";                                                     // 승인번호
    String add_pnt        = "";                                                     // 발생 포인트
    String use_pnt        = "";                                                     // 사용가능 포인트
    String rsv_pnt        = "";                                                     // 총 누적 포인트
    /* = -------------------------------------------------------------------------- = */
    String commid         = "";                                                     // 통신사코드
    String mobile_no      = "";                                                     // 휴대폰번호
    /* = -------------------------------------------------------------------------- = */
    String tk_van_code    = "";                                                     // 발급사코드
    String tk_app_no      = "";                                                     // 승인번호
    /* = -------------------------------------------------------------------------- = */
    String cash_yn        = f_get_parm( request.getParameter( "cash_yn"        ) ); // 현금 영수증 등록 여부
    String cash_authno    = "";                                                     // 현금 영수증 승인 번호
    String cash_tr_code   = f_get_parm( request.getParameter( "cash_tr_code"   ) ); // 현금 영수증 발행 구분
    String cash_id_info   = f_get_parm( request.getParameter( "cash_id_info"   ) ); // 현금 영수증 등록 번호
    String cash_no        = "";                                                     // 현금 영수증 거래 번호      

    String param_opt_1    = f_get_parm( request.getParameter( "param_opt_1" ) );
    String param_opt_2    = f_get_parm( request.getParameter( "param_opt_2" ) );
    String param_opt_3    = f_get_parm( request.getParameter( "param_opt_3" ) );

    /* ============================================================================== */
    /* =   01. 지불 요청 정보 설정 END
    /* ============================================================================== */

    /* ============================================================================== */
    /* =   02. 인스턴스 생성 및 초기화(변경 불가)                                   = */
    /* = -------------------------------------------------------------------------- = */
    /* =       결제에 필요한 인스턴스를 생성하고 초기화 합니다.                     = */
    /* = -------------------------------------------------------------------------- = */
    J_PP_CLI_N c_PayPlus = new J_PP_CLI_N();

    c_PayPlus.mf_init( "", g_conf_gw_url, g_conf_gw_port, g_conf_tx_mode, g_conf_log_dir );
    c_PayPlus.mf_init_set();   

    /* ============================================================================== */
    /* =   02. 인스턴스 생성 및 초기화 END                                          = */
    /* ============================================================================== */

    /* ============================================================================== */
    /* =   03. 처리 요청 정보 설정                                                  = */
    /* = -------------------------------------------------------------------------- = */
    /* = -------------------------------------------------------------------------- = */
    /* =   03-1. 승인 요청 정보 설정                                                = */
    /* = -------------------------------------------------------------------------- = */
    if ( req_tx.equals( "pay" ) )
    {
            c_PayPlus.mf_set_enc_data( f_get_parm( request.getParameter( "enc_data" ) ),
                                       f_get_parm( request.getParameter( "enc_info" ) ) );
            
            /* 1 원은 실제로 업체에서 결제하셔야 될 원 금액을 넣어주셔야 합니다. 결제금액 유효성 검증 */

            int ordr_data_set_no;

            ordr_data_set_no = c_PayPlus.mf_add_set( "ordr_data" );

            c_PayPlus.mf_set_us( ordr_data_set_no, "ordr_mony", "1" );
            
    }
    /* = -------------------------------------------------------------------------- = */
    /* =   03. 처리 요청 정보 설정 END                                              = */
    /* = ========================================================================== = */

    /* = ========================================================================== = */
    /* =   04. 실행                                                                 = */
    /* = -------------------------------------------------------------------------- = */
    if ( tran_cd.length() > 0 )
    {
        c_PayPlus.mf_do_tx( g_conf_site_cd, g_conf_site_key, tran_cd, "", ordr_idxx, g_conf_log_level, "0" );
    }
    else
    {
        c_PayPlus.m_res_cd  = "9562";
        c_PayPlus.m_res_msg = "연동 오류|tran_cd값이 설정되지 않았습니다.";
    }

        res_cd  = c_PayPlus.m_res_cd;  // 결과 코드
        res_msg = c_PayPlus.m_res_msg; // 결과 메시지
    /* = -------------------------------------------------------------------------- = */
    /* =   04. 실행 END                                                             = */
    /* ============================================================================== */

    /* ============================================================================== */
    /* =   05. 승인 결과 값 추출                                                    = */
    /* = -------------------------------------------------------------------------- = */
      if ( req_tx.equals( "pay" ) )
      {
        if ( res_cd.equals( "0000" ) )
        {
          tno             = c_PayPlus.mf_get_res( "tno"       ); // KCP 거래 고유 번호
          amount          = c_PayPlus.mf_get_res( "amount"    ); // KCP 실제 거래 금액
          app_time        = c_PayPlus.mf_get_res( "app_time"  ); // 승인시간
          pnt_issue       = c_PayPlus.mf_get_res( "pnt_issue" ); // 결제 포인트사 코드

    /* = -------------------------------------------------------------------------- = */
    /* =   05-1. 신용카드 승인 결과 처리                                            = */
    /* = -------------------------------------------------------------------------- = */
            if ( use_pay_method.equals( "100000000000" ) )
            {
                card_cd     = c_PayPlus.mf_get_res( "card_cd"   ); // 카드사 코드
                card_name   = c_PayPlus.mf_get_res( "card_name" ); // 카드사 명
                app_no      = c_PayPlus.mf_get_res( "app_no"    ); // 승인번호
                noinf       = c_PayPlus.mf_get_res( "noinf"     ); // 무이자 여부
                quota       = c_PayPlus.mf_get_res( "quota"     ); // 할부 개월 수 
                partcanc_yn = c_PayPlus.mf_get_res( "partcanc_yn" ); // 부분취소 가능유무
            }

    /* = -------------------------------------------------------------------------- = */
    /* =   05-2. 계좌이체 승인 결과 처리                                            = */
    /* = -------------------------------------------------------------------------- = */
            if ( use_pay_method.equals("010000000000") )
            {
                bank_name = c_PayPlus.mf_get_res( "bank_name" ); // 은행명
                bank_code = c_PayPlus.mf_get_res( "bank_code" ); // 은행코드
            }

    /* = -------------------------------------------------------------------------- = */
    /* =   05-3. 가상계좌 승인 결과 처리                                            = */
    /* = -------------------------------------------------------------------------- = */
            if ( use_pay_method.equals( "001000000000" ) )
            {
                bankname  = c_PayPlus.mf_get_res( "bankname"  ); // 입금할 은행 이름
                depositor = c_PayPlus.mf_get_res( "depositor" ); // 입금할 계좌 예금주
                account   = c_PayPlus.mf_get_res( "account"   ); // 입금할 계좌 번호
                va_date   = c_PayPlus.mf_get_res( "va_date"   ); // 가상계좌 입금마감시간
            }

    /* = -------------------------------------------------------------------------- = */
    /* =   05-4. 포인트 승인 결과 처리                                              = */
    /* = -------------------------------------------------------------------------- = */
            if ( use_pay_method.equals( "000100000000" ) )
            {
                pnt_amount   = c_PayPlus.mf_get_res( "pnt_amount"   ); // 적립금액 or 사용금액
                pnt_app_time = c_PayPlus.mf_get_res( "pnt_app_time" ); // 승인시간
                pnt_app_no   = c_PayPlus.mf_get_res( "pnt_app_no"   ); // 승인번호
                add_pnt      = c_PayPlus.mf_get_res( "add_pnt"      ); // 발생 포인트
                use_pnt      = c_PayPlus.mf_get_res( "use_pnt"      ); // 사용가능 포인트
                rsv_pnt      = c_PayPlus.mf_get_res( "rsv_pnt"      ); // 총 누적 포인트
            }

    /* = -------------------------------------------------------------------------- = */
    /* =   05-5. 휴대폰 승인 결과 처리                                              = */
    /* = -------------------------------------------------------------------------- = */
            if ( use_pay_method.equals( "000010000000" ) )
            {
                app_time = c_PayPlus.mf_get_res( "hp_app_time" ); // 승인 시간
                commid   = c_PayPlus.mf_get_res( "commid"      ); // 통신사 코드
                mobile_no= c_PayPlus.mf_get_res( "mobile_no"   ); // 휴대폰 번호
            }

    /* = -------------------------------------------------------------------------- = */
    /* =   05-6. 상품권 승인 결과 처리                                              = */
    /* = -------------------------------------------------------------------------- = */
            if ( use_pay_method.equals( "000000001000" ) )
            {
                app_time    = c_PayPlus.mf_get_res( "tk_app_time" ); // 승인 시간
                tk_van_code = c_PayPlus.mf_get_res( "tk_van_code" ); // 발급사 코드
                tk_app_no   = c_PayPlus.mf_get_res( "tk_app_no"   ); // 승인 번호
            }

    /* = -------------------------------------------------------------------------- = */
    /* =   05-7. 현금영수증 승인 결과 처리                                          = */
    /* = -------------------------------------------------------------------------- = */
            cash_authno = c_PayPlus.mf_get_res( "cash_authno" ); // 현금영수증 승인번호
            cash_no     = c_PayPlus.mf_get_res( "cash_no"     ); // 현금영수증 거래번호
        }
      }
    /* = -------------------------------------------------------------------------- = */
    /* =   05. 승인 결과 처리 END                                                   = */
    /* ============================================================================== */

    /* = ========================================================================== = */
    /* =   06. 승인 및 실패 결과 DB 처리                                            = */
    /* = -------------------------------------------------------------------------- = */
    /* =      결과를 업체 자체적으로 DB 처리 작업하시는 부분입니다.                 = */
    /* = -------------------------------------------------------------------------- = */

    if ( req_tx.equals( "pay" ) )
    {

    /* = -------------------------------------------------------------------------- = */
    /* =   06-1. 승인 결과 DB 처리(res_cd == "0000")                                = */
    /* = -------------------------------------------------------------------------- = */
    /* =        각 결제수단을 구분하시어 DB 처리를 하시기 바랍니다.                 = */
    /* = -------------------------------------------------------------------------- = */
        if ( res_cd.equals( "0000" ) )
        {
            // 07-1-1. 신용카드
            if ( use_pay_method.equals( "100000000000" ) )
            {

            }
            // 07-1-2. 계좌이체
            if ( use_pay_method.equals("010000000000") )
            {

            }
            // 07-1-3. 가상계좌
            if ( use_pay_method.equals("001000000000") )
            {

            }
            // 07-1-4. 포인트
            if ( use_pay_method.equals("000100000000") )
            {

            }
            // 07-1-5. 휴대폰
            if ( use_pay_method.equals("000010000000") )
            {

            }
            // 07-1-6. 상품권
            if ( use_pay_method.equals("000000001000") )
            {

            }
        }

        /* = -------------------------------------------------------------------------- = */
        /* =   06-2. 승인 실패 DB 처리(res_cd != "0000")                                = */
        /* = -------------------------------------------------------------------------- = */
        if( !"0000".equals ( res_cd ) )
        {
        }
    }
    /* = -------------------------------------------------------------------------- = */
    /* =   06. 승인 및 실패 결과 DB 처리 END                                        = */
    /* = ========================================================================== = */

    /* = ========================================================================== = */
    /* =   07. 승인 결과 DB 처리 실패시 : 자동취소                                  = */
    /* = -------------------------------------------------------------------------- = */
    /* =      승인 결과를 DB 작업 하는 과정에서 정상적으로 승인된 건에 대해         = */
    /* =      DB 작업을 실패하여 DB update 가 완료되지 않은 경우, 자동으로          = */
    /* =      승인 취소 요청을 하는 프로세스가 구성되어 있습니다.                   = */
    /* =                                                                            = */
    /* =      DB 작업이 실패 한 경우, bSucc 라는 변수(String)의 값을 "false"        = */
    /* =      로 설정해 주시기 바랍니다. (DB 작업 성공의 경우에는 "false" 이외의    = */
    /* =      값을 설정하시면 됩니다.)                                              = */
    /* = -------------------------------------------------------------------------- = */

    // 승인 결과 DB 처리 에러시 bSucc값을 false로 설정하여 거래건을 취소 요청
    bSucc = ""; 

    if (req_tx.equals("pay") )
    {
        if (res_cd.equals("0000") )
        {
            if ( bSucc.equals("false") )
            {
                int mod_data_set_no;

                c_PayPlus.mf_init_set();

                tran_cd = "00200000";

                mod_data_set_no = c_PayPlus.mf_add_set( "mod_data" );

                c_PayPlus.mf_set_us( mod_data_set_no, "tno",      tno      ); // KCP 원거래 거래번호
                c_PayPlus.mf_set_us( mod_data_set_no, "mod_type", "STSC"   ); // 원거래 변경 요청 종류
                c_PayPlus.mf_set_us( mod_data_set_no, "mod_ip",   cust_ip  ); // 변경 요청자 IP
                c_PayPlus.mf_set_us( mod_data_set_no, "mod_desc", "가맹점 결과 처리 오류 - 가맹점에서 취소 요청"  ); // 변경 사유

                c_PayPlus.mf_do_tx( g_conf_site_cd, g_conf_site_key, tran_cd, "", ordr_idxx, g_conf_log_level, "0" );

                res_cd  = c_PayPlus.m_res_cd;                                 // 결과 코드
                res_msg = c_PayPlus.m_res_msg;                                // 결과 메시지
            }
        }
    }
        // End of [res_cd = "0000"]
    /* = -------------------------------------------------------------------------- = */
    /* =   07. 승인 결과 DB 처리 END                                                = */
    /* = ========================================================================== = */

    /* ============================================================================== */
    /* =   08. 폼 구성 및 결과페이지 호출                                           = */
    /* -----------------------------------------------------------------------------= */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>스마트폰 웹 결제창</title>
        <script type="text/javascript">
            function goResult()
            {
                document.pay_info.submit()
            }

            // 결제 중 새로고침 방지 샘플 스크립트
            function noRefresh()
            {
                /* CTRL + N키 막음. */
                if ((event.keyCode == 78) && (event.ctrlKey == true))
                {
                    event.keyCode = 0;
                    return false;
                }
                /* F5 번키 막음. */
                if(event.keyCode == 116)
                {
                    event.keyCode = 0;
                    return false;
                }
            }
            document.onkeydown = noRefresh ;
        </script>
    </head>

<body onload="goResult()">
<form name="pay_info" method="post" action="result.jsp">
        <input type="hidden" name="site_cd"         value="<%= g_conf_site_cd   %>">    <!-- 사이트 코드 -->
        <input type="hidden" name="req_tx"          value="<%= req_tx           %>">    <!-- 요청 구분 -->
        <input type="hidden" name="use_pay_method"  value="<%= use_pay_method   %>">    <!-- 사용한 결제 수단 -->
        <input type="hidden" name="bSucc"           value="<%= bSucc            %>">    <!-- 쇼핑몰 DB 처리 성공 여부 -->

        <input type="hidden" name="res_cd"          value="<%= res_cd           %>">    <!-- 결과 코드 -->
        <input type="hidden" name="res_msg"         value="<%= res_msg          %>">    <!-- 결과 메세지 -->
        <input type="hidden" name="ordr_idxx"       value="<%= ordr_idxx        %>">    <!-- 주문번호 -->
        <input type="hidden" name="tno"             value="<%= tno              %>">    <!-- KCP 거래번호 -->
        <input type="hidden" name="good_name"       value="<%= good_name        %>">    <!-- 상품명 -->
        <input type="hidden" name="buyr_name"       value="<%= buyr_name        %>">    <!-- 주문자명 -->
        <input type="hidden" name="buyr_tel1"       value="<%= buyr_tel1        %>">    <!-- 주문자 전화번호 -->
        <input type="hidden" name="buyr_tel2"       value="<%= buyr_tel2        %>">    <!-- 주문자 휴대폰번호 -->
        <input type="hidden" name="buyr_mail"       value="<%= buyr_mail        %>">    <!-- 주문자 E-mail -->
        <input type="hidden" name="app_time"        value="<%= app_time         %>">    <!-- 승인시간 -->
        <input type="hidden" name="amount"          value="<%= amount           %>">    <!-- KCP 실제 거래 금액 -->
        
        <!-- 신용카드 정보 -->
        <input type="hidden" name="card_cd"         value="<%= card_cd          %>">    <!-- 카드코드 -->
        <input type="hidden" name="card_name"       value="<%= card_name        %>">    <!-- 카드이름 -->
        <input type="hidden" name="app_no"          value="<%= app_no           %>">    <!-- 승인번호 -->
        <input type="hidden" name="noinf"           value="<%= noinf            %>">    <!-- 무이자여부 -->
        <input type="hidden" name="quota"           value="<%= quota            %>">    <!-- 할부개월 -->
        <input type="hidden" name="partcanc_yn"     value="<%= partcanc_yn      %>">    <!-- 부분취소가능유무 -->
        <input type="hidden" name="card_bin_type_01"value="<%= card_bin_type_01 %>">    <!-- 카드구분1 -->
        <input type="hidden" name="card_bin_type_02"value="<%= card_bin_type_02 %>">    <!-- 카드구분2 -->
        <!-- 계좌이체 정보 -->
        <input type="hidden" name="bank_name"       value="<%= bank_name        %>">    <!-- 은행명 -->
        <input type="hidden" name="bank_code"       value="<%= bank_code        %>">    <!-- 은행코드 -->
        <!-- 가상계좌 정보 -->
        <input type="hidden" name="bankname"        value="<%= bankname         %>">    <!-- 입금 은행 -->
        <input type="hidden" name="depositor"       value="<%= depositor        %>">    <!-- 입금계좌 예금주 -->
        <input type="hidden" name="account"         value="<%= account          %>">    <!-- 입금계좌 번호 -->
        <input type="hidden" name="va_date"         value="<%= va_date          %>">    <!-- 가상계좌 입금마감시간 -->
        <!-- 포인트 정보 -->
        <input type="hidden" name="pnt_issue"       value="<%= pnt_issue        %>">    <!-- 포인트 서비스사 -->
        <input type="hidden" name="pnt_app_time"    value="<%= pnt_app_time     %>">    <!-- 승인시간 -->
        <input type="hidden" name="pnt_app_no"      value="<%= pnt_app_no       %>">    <!-- 승인번호 -->
        <input type="hidden" name="pnt_amount"      value="<%= pnt_amount       %>">    <!-- 적립금액 or 사용금액 -->
        <input type="hidden" name="add_pnt"         value="<%= add_pnt          %>">    <!-- 발생 포인트 -->
        <input type="hidden" name="use_pnt"         value="<%= use_pnt          %>">    <!-- 사용가능 포인트 -->
        <input type="hidden" name="rsv_pnt"         value="<%= rsv_pnt          %>">    <!-- 총 누적 포인트 -->
        <!-- 휴대폰 정보 -->
        <input type="hidden" name="commid"          value="<%= commid           %>">    <!-- 통신사 코드 -->
        <input type="hidden" name="mobile_no"       value="<%= mobile_no        %>">    <!-- 휴대폰 번호 -->

        <!-- 상품권 정보 -->
        <input type="hidden" name="tk_van_code"     value="<%= tk_van_code      %>">    <!-- 발급사 코드 -->
        <input type="hidden" name="tk_app_no"       value="<%= tk_app_no        %>">    <!-- 승인 번호 -->
        <!-- 현금영수증 정보 -->
        <input type="hidden" name="cash_yn"         value="<%= cash_yn          %>">    <!-- 현금영수증 등록 여부 -->
        <input type="hidden" name="cash_authno"     value="<%= cash_authno      %>">    <!-- 현금 영수증 승인 번호 -->
        <input type="hidden" name="cash_tr_code"    value="<%= cash_tr_code     %>">    <!-- 현금 영수증 발행 구분 -->
        <input type="hidden" name="cash_id_info"    value="<%= cash_id_info     %>">    <!-- 현금 영수증 등록 번호 -->
        <input type="hidden" name="cash_no"         value="<%= cash_no          %>">    <!-- 현금 영수증 거래 번호 -->          

        <input type="hidden" name="param_opt_1"     value="<%= param_opt_1 %>">
        <input type="hidden" name="param_opt_2"     value="<%= param_opt_2 %>">
        <input type="hidden" name="param_opt_3"     value="<%= param_opt_3 %>">
</form>
</body>
</html>
