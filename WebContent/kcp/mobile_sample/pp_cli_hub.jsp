<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%
    /* ============================================================================== */
    /* =   PAGE : ���� ��û �� ��� ó�� PAGE                                       = */
    /* = -------------------------------------------------------------------------- = */
    /* =   ������ ������ �߻��ϴ� ��� �Ʒ��� �ּҷ� �����ϼż� Ȯ���Ͻñ� �ٶ��ϴ�.= */
    /* =   ���� �ּ� : http://kcp.co.kr/technique.requestcode.do                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2016  NHN KCP Inc.   All Rights Reserverd.                = */
    /* ============================================================================== */

    /* ============================================================================== */
    /* =   ȯ�� ���� ���� Include                                                   = */
    /* = -------------------------------------------------------------------------- = */
    /* =   �� �ʼ�                                                                  = */
    /* =   �׽�Ʈ �� �ǰ��� ������ site_conf_inc.jsp������ �����Ͻñ� �ٶ��ϴ�.     = */
    /* = -------------------------------------------------------------------------- = */
%>
    <%@ page import="com.kcp.*"%>
    <%@ page import="java.net.URLEncoder"%>
    <%@ include file="../cfg/site_conf_inc.jsp"%>
<%!
    /* = -------------------------------------------------------------------------- = */
    /* =   ȯ�� ���� ���� Include END                                               = */
    /* ============================================================================== */
%>

<%!
    /* ============================================================================== */
    /* =   null ���� ó���ϴ� �޼ҵ�                                                = */
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
    /* =   POST ���� üũ�κ�                                                       = */
    /* = -------------------------------------------------------------------------- = */
    if ( request.getMethod() != "POST" )
    {
        out.println("�߸��� ��η� �����Ͽ����ϴ�.");
        return;
    }
    /* ============================================================================== */
%>
<%
    request.setCharacterEncoding ( "euc-kr" ) ;
    /* ============================================================================== */
    /* =   01. ���� ��û ���� ����                                                  = */
    /* = -------------------------------------------------------------------------- = */
    String req_tx         = f_get_parm( request.getParameter( "req_tx"         ) ); // ��û ����
    String tran_cd        = f_get_parm( request.getParameter( "tran_cd"        ) ); // ó�� ����
    /* = -------------------------------------------------------------------------- = */
    String cust_ip        = f_get_parm( request.getRemoteAddr()                  ); // ��û IP
    String ordr_idxx      = f_get_parm( request.getParameter( "ordr_idxx"      ) ); // ���θ� �ֹ���ȣ
    String good_name      = f_get_parm( request.getParameter( "good_name"      ) ); // ��ǰ��
    /* = -------------------------------------------------------------------------- = */
    String res_cd         = "";                                                     // �����ڵ�
    String res_msg        = "";                                                     // ���� �޼���
    String tno            = f_get_parm( request.getParameter( "tno"            ) ); // KCP �ŷ� ���� ��ȣ
    /* = -------------------------------------------------------------------------- = */
    String buyr_name      = f_get_parm( request.getParameter( "buyr_name"      ) ); // �ֹ��ڸ�
    String buyr_tel1      = f_get_parm( request.getParameter( "buyr_tel1"      ) ); // �ֹ��� ��ȭ��ȣ
    String buyr_tel2      = f_get_parm( request.getParameter( "buyr_tel2"      ) ); // �ֹ��� �ڵ��� ��ȣ
    String buyr_mail      = f_get_parm( request.getParameter( "buyr_mail"      ) ); // �ֹ��� E-mail �ּ�
    /* = -------------------------------------------------------------------------- = */
    String use_pay_method = f_get_parm( request.getParameter( "use_pay_method" ) ); // ���� ���
    String bSucc          = "";                                                     // ��ü DB ó�� ���� ����
    /* = -------------------------------------------------------------------------- = */
    String app_time       = "";                                                     // ���νð� (��� ���� ���� ����)
    String amount         = "";                                                     // KCP ���� �ŷ��ݾ�         
    /* = -------------------------------------------------------------------------- = */
    String card_cd        = "";                                                     // �ſ�ī�� �ڵ�
    String card_name      = "";                                                     // �ſ�ī�� ��
    String app_no         = "";                                                     // �ſ�ī�� ���ι�ȣ
    String noinf          = "";                                                     // �ſ�ī�� ������ ����
    String quota          = "";                                                     // �ſ�ī�� �Һΰ���
    String partcanc_yn    = "";                                                     // �κ���� ��������
    String card_bin_type_01 = "";                                                   // ī�屸��1
    String card_bin_type_02 = "";                                                   // ī�屸��2
    /* = -------------------------------------------------------------------------- = */
    String bank_name      = "";                                                     // �����
    String bank_code      = "";                                                     // �����ڵ�
    /* = -------------------------------------------------------------------------- = */
    String bankname       = "";                                                     // �Ա� �����
    String depositor      = "";                                                     // �Ա� ���� ������ ����
    String account        = "";                                                     // �Ա� ���� ��ȣ
    String va_date        = "";                                                     // ������� �Աݸ����ð�
    /* = -------------------------------------------------------------------------- = */
    String pnt_issue      = "";                                                     // ���� ����Ʈ�� �ڵ�
    String pnt_amount     = "";                                                     // �����ݾ� or ���ݾ�
    String pnt_app_time   = "";                                                     // ���νð�
    String pnt_app_no     = "";                                                     // ���ι�ȣ
    String add_pnt        = "";                                                     // �߻� ����Ʈ
    String use_pnt        = "";                                                     // ��밡�� ����Ʈ
    String rsv_pnt        = "";                                                     // �� ���� ����Ʈ
    /* = -------------------------------------------------------------------------- = */
    String commid         = "";                                                     // ��Ż��ڵ�
    String mobile_no      = "";                                                     // �޴�����ȣ
    /* = -------------------------------------------------------------------------- = */
    String tk_van_code    = "";                                                     // �߱޻��ڵ�
    String tk_app_no      = "";                                                     // ���ι�ȣ
    /* = -------------------------------------------------------------------------- = */
    String cash_yn        = f_get_parm( request.getParameter( "cash_yn"        ) ); // ���� ������ ��� ����
    String cash_authno    = "";                                                     // ���� ������ ���� ��ȣ
    String cash_tr_code   = f_get_parm( request.getParameter( "cash_tr_code"   ) ); // ���� ������ ���� ����
    String cash_id_info   = f_get_parm( request.getParameter( "cash_id_info"   ) ); // ���� ������ ��� ��ȣ
    String cash_no        = "";                                                     // ���� ������ �ŷ� ��ȣ      

    String param_opt_1    = f_get_parm( request.getParameter( "param_opt_1" ) );
    String param_opt_2    = f_get_parm( request.getParameter( "param_opt_2" ) );
    String param_opt_3    = f_get_parm( request.getParameter( "param_opt_3" ) );

    /* ============================================================================== */
    /* =   01. ���� ��û ���� ���� END
    /* ============================================================================== */

    /* ============================================================================== */
    /* =   02. �ν��Ͻ� ���� �� �ʱ�ȭ(���� �Ұ�)                                   = */
    /* = -------------------------------------------------------------------------- = */
    /* =       ������ �ʿ��� �ν��Ͻ��� �����ϰ� �ʱ�ȭ �մϴ�.                     = */
    /* = -------------------------------------------------------------------------- = */
    J_PP_CLI_N c_PayPlus = new J_PP_CLI_N();

    c_PayPlus.mf_init( "", g_conf_gw_url, g_conf_gw_port, g_conf_tx_mode, g_conf_log_dir );
    c_PayPlus.mf_init_set();   

    /* ============================================================================== */
    /* =   02. �ν��Ͻ� ���� �� �ʱ�ȭ END                                          = */
    /* ============================================================================== */

    /* ============================================================================== */
    /* =   03. ó�� ��û ���� ����                                                  = */
    /* = -------------------------------------------------------------------------- = */
    /* = -------------------------------------------------------------------------- = */
    /* =   03-1. ���� ��û ���� ����                                                = */
    /* = -------------------------------------------------------------------------- = */
    if ( req_tx.equals( "pay" ) )
    {
            c_PayPlus.mf_set_enc_data( f_get_parm( request.getParameter( "enc_data" ) ),
                                       f_get_parm( request.getParameter( "enc_info" ) ) );
            
            /* 1 ���� ������ ��ü���� �����ϼž� �� �� �ݾ��� �־��ּž� �մϴ�. �����ݾ� ��ȿ�� ���� */

            int ordr_data_set_no;

            ordr_data_set_no = c_PayPlus.mf_add_set( "ordr_data" );

            c_PayPlus.mf_set_us( ordr_data_set_no, "ordr_mony", "1" );
            
    }
    /* = -------------------------------------------------------------------------- = */
    /* =   03. ó�� ��û ���� ���� END                                              = */
    /* = ========================================================================== = */

    /* = ========================================================================== = */
    /* =   04. ����                                                                 = */
    /* = -------------------------------------------------------------------------- = */
    if ( tran_cd.length() > 0 )
    {
        c_PayPlus.mf_do_tx( g_conf_site_cd, g_conf_site_key, tran_cd, "", ordr_idxx, g_conf_log_level, "0" );
    }
    else
    {
        c_PayPlus.m_res_cd  = "9562";
        c_PayPlus.m_res_msg = "���� ����|tran_cd���� �������� �ʾҽ��ϴ�.";
    }

        res_cd  = c_PayPlus.m_res_cd;  // ��� �ڵ�
        res_msg = c_PayPlus.m_res_msg; // ��� �޽���
    /* = -------------------------------------------------------------------------- = */
    /* =   04. ���� END                                                             = */
    /* ============================================================================== */

    /* ============================================================================== */
    /* =   05. ���� ��� �� ����                                                    = */
    /* = -------------------------------------------------------------------------- = */
      if ( req_tx.equals( "pay" ) )
      {
        if ( res_cd.equals( "0000" ) )
        {
          tno             = c_PayPlus.mf_get_res( "tno"       ); // KCP �ŷ� ���� ��ȣ
          amount          = c_PayPlus.mf_get_res( "amount"    ); // KCP ���� �ŷ� �ݾ�
          app_time        = c_PayPlus.mf_get_res( "app_time"  ); // ���νð�
          pnt_issue       = c_PayPlus.mf_get_res( "pnt_issue" ); // ���� ����Ʈ�� �ڵ�

    /* = -------------------------------------------------------------------------- = */
    /* =   05-1. �ſ�ī�� ���� ��� ó��                                            = */
    /* = -------------------------------------------------------------------------- = */
            if ( use_pay_method.equals( "100000000000" ) )
            {
                card_cd     = c_PayPlus.mf_get_res( "card_cd"   ); // ī��� �ڵ�
                card_name   = c_PayPlus.mf_get_res( "card_name" ); // ī��� ��
                app_no      = c_PayPlus.mf_get_res( "app_no"    ); // ���ι�ȣ
                noinf       = c_PayPlus.mf_get_res( "noinf"     ); // ������ ����
                quota       = c_PayPlus.mf_get_res( "quota"     ); // �Һ� ���� �� 
                partcanc_yn = c_PayPlus.mf_get_res( "partcanc_yn" ); // �κ���� ��������
            }

    /* = -------------------------------------------------------------------------- = */
    /* =   05-2. ������ü ���� ��� ó��                                            = */
    /* = -------------------------------------------------------------------------- = */
            if ( use_pay_method.equals("010000000000") )
            {
                bank_name = c_PayPlus.mf_get_res( "bank_name" ); // �����
                bank_code = c_PayPlus.mf_get_res( "bank_code" ); // �����ڵ�
            }

    /* = -------------------------------------------------------------------------- = */
    /* =   05-3. ������� ���� ��� ó��                                            = */
    /* = -------------------------------------------------------------------------- = */
            if ( use_pay_method.equals( "001000000000" ) )
            {
                bankname  = c_PayPlus.mf_get_res( "bankname"  ); // �Ա��� ���� �̸�
                depositor = c_PayPlus.mf_get_res( "depositor" ); // �Ա��� ���� ������
                account   = c_PayPlus.mf_get_res( "account"   ); // �Ա��� ���� ��ȣ
                va_date   = c_PayPlus.mf_get_res( "va_date"   ); // ������� �Աݸ����ð�
            }

    /* = -------------------------------------------------------------------------- = */
    /* =   05-4. ����Ʈ ���� ��� ó��                                              = */
    /* = -------------------------------------------------------------------------- = */
            if ( use_pay_method.equals( "000100000000" ) )
            {
                pnt_amount   = c_PayPlus.mf_get_res( "pnt_amount"   ); // �����ݾ� or ���ݾ�
                pnt_app_time = c_PayPlus.mf_get_res( "pnt_app_time" ); // ���νð�
                pnt_app_no   = c_PayPlus.mf_get_res( "pnt_app_no"   ); // ���ι�ȣ
                add_pnt      = c_PayPlus.mf_get_res( "add_pnt"      ); // �߻� ����Ʈ
                use_pnt      = c_PayPlus.mf_get_res( "use_pnt"      ); // ��밡�� ����Ʈ
                rsv_pnt      = c_PayPlus.mf_get_res( "rsv_pnt"      ); // �� ���� ����Ʈ
            }

    /* = -------------------------------------------------------------------------- = */
    /* =   05-5. �޴��� ���� ��� ó��                                              = */
    /* = -------------------------------------------------------------------------- = */
            if ( use_pay_method.equals( "000010000000" ) )
            {
                app_time = c_PayPlus.mf_get_res( "hp_app_time" ); // ���� �ð�
                commid   = c_PayPlus.mf_get_res( "commid"      ); // ��Ż� �ڵ�
                mobile_no= c_PayPlus.mf_get_res( "mobile_no"   ); // �޴��� ��ȣ
            }

    /* = -------------------------------------------------------------------------- = */
    /* =   05-6. ��ǰ�� ���� ��� ó��                                              = */
    /* = -------------------------------------------------------------------------- = */
            if ( use_pay_method.equals( "000000001000" ) )
            {
                app_time    = c_PayPlus.mf_get_res( "tk_app_time" ); // ���� �ð�
                tk_van_code = c_PayPlus.mf_get_res( "tk_van_code" ); // �߱޻� �ڵ�
                tk_app_no   = c_PayPlus.mf_get_res( "tk_app_no"   ); // ���� ��ȣ
            }

    /* = -------------------------------------------------------------------------- = */
    /* =   05-7. ���ݿ����� ���� ��� ó��                                          = */
    /* = -------------------------------------------------------------------------- = */
            cash_authno = c_PayPlus.mf_get_res( "cash_authno" ); // ���ݿ����� ���ι�ȣ
            cash_no     = c_PayPlus.mf_get_res( "cash_no"     ); // ���ݿ����� �ŷ���ȣ
        }
      }
    /* = -------------------------------------------------------------------------- = */
    /* =   05. ���� ��� ó�� END                                                   = */
    /* ============================================================================== */

    /* = ========================================================================== = */
    /* =   06. ���� �� ���� ��� DB ó��                                            = */
    /* = -------------------------------------------------------------------------- = */
    /* =      ����� ��ü ��ü������ DB ó�� �۾��Ͻô� �κ��Դϴ�.                 = */
    /* = -------------------------------------------------------------------------- = */

    if ( req_tx.equals( "pay" ) )
    {

    /* = -------------------------------------------------------------------------- = */
    /* =   06-1. ���� ��� DB ó��(res_cd == "0000")                                = */
    /* = -------------------------------------------------------------------------- = */
    /* =        �� ���������� �����Ͻþ� DB ó���� �Ͻñ� �ٶ��ϴ�.                 = */
    /* = -------------------------------------------------------------------------- = */
        if ( res_cd.equals( "0000" ) )
        {
            // 07-1-1. �ſ�ī��
            if ( use_pay_method.equals( "100000000000" ) )
            {

            }
            // 07-1-2. ������ü
            if ( use_pay_method.equals("010000000000") )
            {

            }
            // 07-1-3. �������
            if ( use_pay_method.equals("001000000000") )
            {

            }
            // 07-1-4. ����Ʈ
            if ( use_pay_method.equals("000100000000") )
            {

            }
            // 07-1-5. �޴���
            if ( use_pay_method.equals("000010000000") )
            {

            }
            // 07-1-6. ��ǰ��
            if ( use_pay_method.equals("000000001000") )
            {

            }
        }

        /* = -------------------------------------------------------------------------- = */
        /* =   06-2. ���� ���� DB ó��(res_cd != "0000")                                = */
        /* = -------------------------------------------------------------------------- = */
        if( !"0000".equals ( res_cd ) )
        {
        }
    }
    /* = -------------------------------------------------------------------------- = */
    /* =   06. ���� �� ���� ��� DB ó�� END                                        = */
    /* = ========================================================================== = */

    /* = ========================================================================== = */
    /* =   07. ���� ��� DB ó�� ���н� : �ڵ����                                  = */
    /* = -------------------------------------------------------------------------- = */
    /* =      ���� ����� DB �۾� �ϴ� �������� ���������� ���ε� �ǿ� ����         = */
    /* =      DB �۾��� �����Ͽ� DB update �� �Ϸ���� ���� ���, �ڵ�����          = */
    /* =      ���� ��� ��û�� �ϴ� ���μ����� �����Ǿ� �ֽ��ϴ�.                   = */
    /* =                                                                            = */
    /* =      DB �۾��� ���� �� ���, bSucc ��� ����(String)�� ���� "false"        = */
    /* =      �� ������ �ֽñ� �ٶ��ϴ�. (DB �۾� ������ ��쿡�� "false" �̿���    = */
    /* =      ���� �����Ͻø� �˴ϴ�.)                                              = */
    /* = -------------------------------------------------------------------------- = */

    // ���� ��� DB ó�� ������ bSucc���� false�� �����Ͽ� �ŷ����� ��� ��û
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

                c_PayPlus.mf_set_us( mod_data_set_no, "tno",      tno      ); // KCP ���ŷ� �ŷ���ȣ
                c_PayPlus.mf_set_us( mod_data_set_no, "mod_type", "STSC"   ); // ���ŷ� ���� ��û ����
                c_PayPlus.mf_set_us( mod_data_set_no, "mod_ip",   cust_ip  ); // ���� ��û�� IP
                c_PayPlus.mf_set_us( mod_data_set_no, "mod_desc", "������ ��� ó�� ���� - ���������� ��� ��û"  ); // ���� ����

                c_PayPlus.mf_do_tx( g_conf_site_cd, g_conf_site_key, tran_cd, "", ordr_idxx, g_conf_log_level, "0" );

                res_cd  = c_PayPlus.m_res_cd;                                 // ��� �ڵ�
                res_msg = c_PayPlus.m_res_msg;                                // ��� �޽���
            }
        }
    }
        // End of [res_cd = "0000"]
    /* = -------------------------------------------------------------------------- = */
    /* =   07. ���� ��� DB ó�� END                                                = */
    /* = ========================================================================== = */

    /* ============================================================================== */
    /* =   08. �� ���� �� ��������� ȣ��                                           = */
    /* -----------------------------------------------------------------------------= */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>����Ʈ�� �� ����â</title>
        <script type="text/javascript">
            function goResult()
            {
                document.pay_info.submit()
            }

            // ���� �� ���ΰ�ħ ���� ���� ��ũ��Ʈ
            function noRefresh()
            {
                /* CTRL + NŰ ����. */
                if ((event.keyCode == 78) && (event.ctrlKey == true))
                {
                    event.keyCode = 0;
                    return false;
                }
                /* F5 ��Ű ����. */
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
        <input type="hidden" name="site_cd"         value="<%= g_conf_site_cd   %>">    <!-- ����Ʈ �ڵ� -->
        <input type="hidden" name="req_tx"          value="<%= req_tx           %>">    <!-- ��û ���� -->
        <input type="hidden" name="use_pay_method"  value="<%= use_pay_method   %>">    <!-- ����� ���� ���� -->
        <input type="hidden" name="bSucc"           value="<%= bSucc            %>">    <!-- ���θ� DB ó�� ���� ���� -->

        <input type="hidden" name="res_cd"          value="<%= res_cd           %>">    <!-- ��� �ڵ� -->
        <input type="hidden" name="res_msg"         value="<%= res_msg          %>">    <!-- ��� �޼��� -->
        <input type="hidden" name="ordr_idxx"       value="<%= ordr_idxx        %>">    <!-- �ֹ���ȣ -->
        <input type="hidden" name="tno"             value="<%= tno              %>">    <!-- KCP �ŷ���ȣ -->
        <input type="hidden" name="good_name"       value="<%= good_name        %>">    <!-- ��ǰ�� -->
        <input type="hidden" name="buyr_name"       value="<%= buyr_name        %>">    <!-- �ֹ��ڸ� -->
        <input type="hidden" name="buyr_tel1"       value="<%= buyr_tel1        %>">    <!-- �ֹ��� ��ȭ��ȣ -->
        <input type="hidden" name="buyr_tel2"       value="<%= buyr_tel2        %>">    <!-- �ֹ��� �޴�����ȣ -->
        <input type="hidden" name="buyr_mail"       value="<%= buyr_mail        %>">    <!-- �ֹ��� E-mail -->
        <input type="hidden" name="app_time"        value="<%= app_time         %>">    <!-- ���νð� -->
        <input type="hidden" name="amount"          value="<%= amount           %>">    <!-- KCP ���� �ŷ� �ݾ� -->
        
        <!-- �ſ�ī�� ���� -->
        <input type="hidden" name="card_cd"         value="<%= card_cd          %>">    <!-- ī���ڵ� -->
        <input type="hidden" name="card_name"       value="<%= card_name        %>">    <!-- ī���̸� -->
        <input type="hidden" name="app_no"          value="<%= app_no           %>">    <!-- ���ι�ȣ -->
        <input type="hidden" name="noinf"           value="<%= noinf            %>">    <!-- �����ڿ��� -->
        <input type="hidden" name="quota"           value="<%= quota            %>">    <!-- �Һΰ��� -->
        <input type="hidden" name="partcanc_yn"     value="<%= partcanc_yn      %>">    <!-- �κ���Ұ������� -->
        <input type="hidden" name="card_bin_type_01"value="<%= card_bin_type_01 %>">    <!-- ī�屸��1 -->
        <input type="hidden" name="card_bin_type_02"value="<%= card_bin_type_02 %>">    <!-- ī�屸��2 -->
        <!-- ������ü ���� -->
        <input type="hidden" name="bank_name"       value="<%= bank_name        %>">    <!-- ����� -->
        <input type="hidden" name="bank_code"       value="<%= bank_code        %>">    <!-- �����ڵ� -->
        <!-- ������� ���� -->
        <input type="hidden" name="bankname"        value="<%= bankname         %>">    <!-- �Ա� ���� -->
        <input type="hidden" name="depositor"       value="<%= depositor        %>">    <!-- �Աݰ��� ������ -->
        <input type="hidden" name="account"         value="<%= account          %>">    <!-- �Աݰ��� ��ȣ -->
        <input type="hidden" name="va_date"         value="<%= va_date          %>">    <!-- ������� �Աݸ����ð� -->
        <!-- ����Ʈ ���� -->
        <input type="hidden" name="pnt_issue"       value="<%= pnt_issue        %>">    <!-- ����Ʈ ���񽺻� -->
        <input type="hidden" name="pnt_app_time"    value="<%= pnt_app_time     %>">    <!-- ���νð� -->
        <input type="hidden" name="pnt_app_no"      value="<%= pnt_app_no       %>">    <!-- ���ι�ȣ -->
        <input type="hidden" name="pnt_amount"      value="<%= pnt_amount       %>">    <!-- �����ݾ� or ���ݾ� -->
        <input type="hidden" name="add_pnt"         value="<%= add_pnt          %>">    <!-- �߻� ����Ʈ -->
        <input type="hidden" name="use_pnt"         value="<%= use_pnt          %>">    <!-- ��밡�� ����Ʈ -->
        <input type="hidden" name="rsv_pnt"         value="<%= rsv_pnt          %>">    <!-- �� ���� ����Ʈ -->
        <!-- �޴��� ���� -->
        <input type="hidden" name="commid"          value="<%= commid           %>">    <!-- ��Ż� �ڵ� -->
        <input type="hidden" name="mobile_no"       value="<%= mobile_no        %>">    <!-- �޴��� ��ȣ -->

        <!-- ��ǰ�� ���� -->
        <input type="hidden" name="tk_van_code"     value="<%= tk_van_code      %>">    <!-- �߱޻� �ڵ� -->
        <input type="hidden" name="tk_app_no"       value="<%= tk_app_no        %>">    <!-- ���� ��ȣ -->
        <!-- ���ݿ����� ���� -->
        <input type="hidden" name="cash_yn"         value="<%= cash_yn          %>">    <!-- ���ݿ����� ��� ���� -->
        <input type="hidden" name="cash_authno"     value="<%= cash_authno      %>">    <!-- ���� ������ ���� ��ȣ -->
        <input type="hidden" name="cash_tr_code"    value="<%= cash_tr_code     %>">    <!-- ���� ������ ���� ���� -->
        <input type="hidden" name="cash_id_info"    value="<%= cash_id_info     %>">    <!-- ���� ������ ��� ��ȣ -->
        <input type="hidden" name="cash_no"         value="<%= cash_no          %>">    <!-- ���� ������ �ŷ� ��ȣ -->          

        <input type="hidden" name="param_opt_1"     value="<%= param_opt_1 %>">
        <input type="hidden" name="param_opt_2"     value="<%= param_opt_2 %>">
        <input type="hidden" name="param_opt_3"     value="<%= param_opt_3 %>">
</form>
</body>
</html>
