<%
    /* ============================================================================== */
    /* =   PAGE : 결제 정보 환경 설정 PAGE                                          = */
    /* =----------------------------------------------------------------------------= */
    /* =   연동시 오류가 발생하는 경우 아래의 주소로 접속하셔서 확인하시기 바랍니다.= */
    /* =   접속 주소 : http://kcp.co.kr/technique.requestcode.do                    = */
    /* =----------------------------------------------------------------------------= */
    /* =   Copyright (c)  2016  NHN KCP Inc.   All Rights Reserverd.                = */
    /* ============================================================================== */

    /* ============================================================================== */
    /* = ※ 주의 ※                                                                 = */
    /* = * 지불 데이터 설정                                                         = */
    /* =----------------------------------------------------------------------------= */
    /* = ※ 주의 ※                                                                 = */    
    /* = * g_conf_log_dir 변수 설정                                                 = */
    /* =   log 디렉토리 설정                                                        = */
    /* ============================================================================== */    
    String g_conf_log_dir   = "E:\\workspace\\java1\\log";             // LOG 디렉토리 절대경로 입력
    
    /* ============================================================================== */
    /* = ※ 주의 ※                                                                 = */
    /* = * g_conf_gw_url 설정                                                       = */
    /* =----------------------------------------------------------------------------= */
    /* = 테스트 시 : testpaygw.kcp.co.kr로 설정해 주십시오.                         = */
    /* = 실결제 시 : paygw.kcp.co.kr로 설정해 주십시오.                             = */
    /* ============================================================================== */
    String g_conf_gw_url    = "testpaygw.kcp.co.kr";

    /* ============================================================================== */
    /* = ※ 주의 ※                                                                 = */
    /* = * 표준웹 결제창 g_conf_js_url 설정                                         = */
    /* =----------------------------------------------------------------------------= */
	/* = 테스트 시 : src="https://testpay.kcp.co.kr/plugin/payplus_web.jsp"         = */
    /* = 실결제 시 : src="https://pay.kcp.co.kr/plugin/payplus_web.jsp"             = */
    /* =----------------------------------------------------------------------------= */
    /* ============================================================================== */
    String g_conf_js_url    = "https://testpay.kcp.co.kr/plugin/payplus_web.jsp";

    /* ============================================================================== */
    /* = 스마트폰 SOAP 통신 설정                                                    = */
    /* =----------------------------------------------------------------------------= */
    /* = 테스트 시 : false                                                          = */
    /* = 실결제 시 : true                                                           = */
    /* ============================================================================== */
    boolean g_conf_server    = false;

    /* ============================================================================== */
    /* = g_conf_site_cd, g_conf_site_key 설정                                       = */
    /* = 실결제시 KCP에서 발급한 사이트코드(site_cd), 사이트키(site_key)를 반드시   = */
    /* = 변경해 주셔야 결제가 정상적으로 진행됩니다.                                = */
    /* =----------------------------------------------------------------------------= */
    /* = 테스트 시 : 사이트코드(T0000)와 사이트키(3grptw1.zW0GSo4PQdaGvsF__)로      = */
    /* =            설정해 주십시오.                                                = */
    /* = 실결제 시 : 반드시 KCP에서 발급한 사이트코드(site_cd)와 사이트키(site_key) = */
    /* =            로 설정해 주십시오.                                             = */
    /* ============================================================================== */
    String g_conf_site_cd   = "T0000";
    String g_conf_site_key  = "3grptw1.zW0GSo4PQdaGvsF__";

    /* ============================================================================== */
    /* = g_conf_site_name 설정                                                      = */
    /* =----------------------------------------------------------------------------= */
    /* = 사이트명 설정(한글 불가) : 반드시 영문자로 설정하여 주시기 바랍니다.       = */
    /* ============================================================================== */
    String g_conf_site_name = "GIGABOX";

    /* ============================================================================== */
    /* = 지불 데이터 셋업 (변경 불가)                                               = */
    /* ============================================================================== */
    String g_conf_log_level = "3";
    String g_conf_gw_port   = "8090";        // 포트번호(변경불가)
    String module_type      = "01";          // 변경불가
    int    g_conf_tx_mode   = 0;             // 변경불가
%>
