<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%
    /* ============================================================================== */
    /* =   PAGE : ���� ��� ��� PAGE                                               = */
    /* = -------------------------------------------------------------------------- = */
    /* =   ���� ��û ������� ����ϴ� �������Դϴ�.                                = */
    /* = -------------------------------------------------------------------------- = */
    /* =   ������ ������ �߻��ϴ� ��� �Ʒ��� �ּҷ� �����ϼż� Ȯ���Ͻñ� �ٶ��ϴ�.= */
    /* =   ���� �ּ� : http://kcp.co.kr/technique.requestcode.do                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2016  NHN KCP Inc.   All Rights Reserverd.                = */
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
    request.setCharacterEncoding("euc-kr") ;
    /* ============================================================================== */
    /* =   ���� ���                                                                = */
    /* = -------------------------------------------------------------------------- = */
    String site_cd          = f_get_parm( request.getParameter( "site_cd"        ) );      // ����Ʈ �ڵ�
    String req_tx           = f_get_parm( request.getParameter( "req_tx"         ) );      // ��û ����(����/���)
    String use_pay_method   = f_get_parm( request.getParameter( "use_pay_method" ) );      // ��� ���� ����
    String bSucc            = f_get_parm( request.getParameter( "bSucc"          ) );      // ��ü DB ����ó�� �Ϸ� ����
    /* = -------------------------------------------------------------------------- = */
    String res_cd           = f_get_parm( request.getParameter( "res_cd"         ) );      // ��� �ڵ�
    String res_msg          = f_get_parm( request.getParameter( "res_msg"        ) );      // ��� �޽���
    String res_msg_bsucc    = "";
    /* = -------------------------------------------------------------------------- = */
    String amount           = f_get_parm( request.getParameter( "amount"         ) );      // KCP ���� �ŷ� �ݾ�
    String ordr_idxx        = f_get_parm( request.getParameter( "ordr_idxx"      ) );      // �ֹ���ȣ
    String tno              = f_get_parm( request.getParameter( "tno"            ) );      // KCP �ŷ���ȣ
    String good_name        = f_get_parm( request.getParameter( "good_name"      ) );      // ��ǰ��
    String buyr_name        = f_get_parm( request.getParameter( "buyr_name"      ) );      // �����ڸ�
    String buyr_tel1        = f_get_parm( request.getParameter( "buyr_tel1"      ) );      // ������ ��ȭ��ȣ
    String buyr_tel2        = f_get_parm( request.getParameter( "buyr_tel2"      ) );      // ������ �޴�����ȣ
    String buyr_mail        = f_get_parm( request.getParameter( "buyr_mail"      ) );      // ������ E-Mail
    /* = -------------------------------------------------------------------------- = */
    // ����
    String pnt_issue        = f_get_parm( request.getParameter( "pnt_issue"      ) );      // ����Ʈ ���񽺻�
    String app_time         = f_get_parm( request.getParameter( "app_time"       ) );      // ���νð� (����)
    /* = -------------------------------------------------------------------------- = */
    // �ſ�ī��
    String card_cd          = f_get_parm( request.getParameter( "card_cd"        ) );      // ī�� �ڵ�
    String card_name        = f_get_parm( request.getParameter( "card_name"      ) );      // ī���
    String noinf            = f_get_parm( request.getParameter( "noinf"          ) );      // ������ ����
    String quota            = f_get_parm( request.getParameter( "quota"          ) );      // �Һΰ���
    String app_no           = f_get_parm( request.getParameter( "app_no"         ) );      // ���ι�ȣ
    /* = -------------------------------------------------------------------------- = */
    // ������ü
    String bank_name        = f_get_parm( request.getParameter( "bank_name"      ) );      // �����
    String bank_code        = f_get_parm( request.getParameter( "bank_code"      ) );      // �����ڵ�
    /* = -------------------------------------------------------------------------- = */
    // �������
    String bankname         = f_get_parm( request.getParameter( "bankname"       ) );      // �Ա��� ����
    String depositor        = f_get_parm( request.getParameter( "depositor"      ) );      // �Ա��� ���� ������
    String account          = f_get_parm( request.getParameter( "account"        ) );      // �Ա��� ���� ��ȣ
    String va_date          = f_get_parm( request.getParameter( "va_date"        ) );      // ������� �Աݸ����ð�
    /* = -------------------------------------------------------------------------- = */
    // ����Ʈ
    String add_pnt          = f_get_parm( request.getParameter( "add_pnt"        ) );      // �߻� ����Ʈ
    String use_pnt          = f_get_parm( request.getParameter( "use_pnt"        ) );      // ��밡�� ����Ʈ
    String rsv_pnt          = f_get_parm( request.getParameter( "rsv_pnt"        ) );      // ���� ����Ʈ
    String pnt_app_time     = f_get_parm( request.getParameter( "pnt_app_time"   ) );      // ���νð�
    String pnt_app_no       = f_get_parm( request.getParameter( "pnt_app_no"     ) );      // ���ι�ȣ
    String pnt_amount       = f_get_parm( request.getParameter( "pnt_amount"     ) );      // �����ݾ� or ���ݾ�
    /* = -------------------------------------------------------------------------- = */
    //�޴���
    String commid           = f_get_parm( request.getParameter( "commid"         ) );      // ��Ż� �ڵ�
    String mobile_no        = f_get_parm( request.getParameter( "mobile_no"      ) );      // �޴��� ��ȣ
    /* = -------------------------------------------------------------------------- = */
    //��ǰ��
    String tk_van_code      = f_get_parm( request.getParameter( "tk_van_code"    ) );      // �߱޻� �ڵ�
    String tk_app_no        = f_get_parm( request.getParameter( "tk_app_no"      ) );      // ���� ��ȣ
    /* = -------------------------------------------------------------------------- = */
    // ���ݿ�����
    String cash_yn          = f_get_parm( request.getParameter( "cash_yn"        ) );      // ���� ������ ��� ����
    String cash_authno      = f_get_parm( request.getParameter( "cash_authno"    ) );      // ���� ������ ���� ��ȣ
    String cash_tr_code     = f_get_parm( request.getParameter( "cash_tr_code"   ) );      // ���� ������ ���� ����
    String cash_id_info     = f_get_parm( request.getParameter( "cash_id_info"   ) );      // ���� ������ ��� ��ȣ
    String cash_no          = f_get_parm( request.getParameter( "cash_no"        ) );      // ���� ������ �ŷ� ��ȣ    
    /* ============================================================================== */

    String req_tx_name = "";

    if     ( req_tx.equals( "pay" ) ) 
    {
        req_tx_name = "����" ;
    }
    else if( req_tx.equals( "mod" ) )
    {
        req_tx_name = "���/����" ;
    }

    /* ============================================================================== */
    /* =   ������ �� DB ó�� ���н� �� ��� �޽��� ����                           = */
    /* = -------------------------------------------------------------------------- = */

    if ( "pay".equals ( req_tx ) )
    {
        // ��ü DB ó�� ����
        if ( "false".equals ( bSucc ) )
        {
            if ( "0000".equals ( res_cd ) )
            {
                res_msg_bsucc = "������ ���������� �̷�������� ���θ����� ���� ����� ó���ϴ� �� ������ �߻��Ͽ� �ý��ۿ��� �ڵ����� ��� ��û�� �Ͽ����ϴ�. <br> ���θ��� ��ȭ�Ͽ� Ȯ���Ͻñ� �ٶ��ϴ�." ;
            }
            else
            {
                res_msg_bsucc = "������ ���������� �̷�������� ���θ����� ���� ����� ó���ϴ� �� ������ �߻��Ͽ� �ý��ۿ��� �ڵ����� ��� ��û�� �Ͽ�����, <br> <b>��Ұ� ���� �Ǿ����ϴ�.</b><br> ���θ��� ��ȭ�Ͽ� Ȯ���Ͻñ� �ٶ��ϴ�." ;
            }
        }
    }

    /* = -------------------------------------------------------------------------- = */
    /* =   ������ �� DB ó�� ���н� �� ��� �޽��� ���� ��                        = */
    /* ============================================================================== */

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
    <title>*** NHN KCP [AX-HUB Version] ***</title>
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
	<meta http-equiv="Pragma" content="no-cache"> 
	<meta http-equiv="Expires" content="-1">
    <link href="css/style.css" rel="stylesheet" type="text/css" id="cssLink"/>
    <script type="text/javascript">
        /* �ſ�ī�� ������ */ 
        /* �ǰ����� : "https://admin8.kcp.co.kr/assist/bill.BillActionNew.do?cmd=card_bill&tno=" */ 
        /* �׽�Ʈ�� : "https://testadmin8.kcp.co.kr/assist/bill.BillActionNew.do?cmd=card_bill&tno=" */ 
         function receiptView( tno, ordr_idxx, amount ) 
        {
            receiptWin = "https://admin8.kcp.co.kr/assist/bill.BillActionNew.do?cmd=card_bill&tno=";
            receiptWin += tno + "&";
            receiptWin += "order_no=" + ordr_idxx + "&"; 
            receiptWin += "trade_mony=" + amount ;

            window.open(receiptWin, "", "width=455, height=815"); 
        }

        /* ���� ������ */ 
        /* �ǰ����� : "https://admin8.kcp.co.kr/assist/bill.BillActionNew.do" */ 
        /* �׽�Ʈ�� : "https://testadmin8.kcp.co.kr/assist/bill.BillActionNew.do" */   
        function receiptView2( cash_no, ordr_idxx, amount ) 
        {
            receiptWin2 = "https://testadmin8.kcp.co.kr/assist/bill.BillActionNew.do?cmd=cash_bill&cash_no=";
            receiptWin2 += cash_no + "&";             
            receiptWin2 += "order_id="     + ordr_idxx + "&";
            receiptWin2 += "trade_mony="  + amount ;

            window.open(receiptWin2, "", "width=370, height=625"); 
        }

        /* ���� ���� �����Ա� ������ ȣ�� */
        /* �׽�Ʈ�ÿ��� ��밡�� */
        /* �ǰ����� �ش� ��ũ��Ʈ �ּ�ó�� */
        function receiptView3() 
        {
            receiptWin3 = "http://devadmin.kcp.co.kr/Modules/Noti/TEST_Vcnt_Noti.jsp"; 
            window.open(receiptWin3, "", "width=520, height=300"); 
        }
    </script>
</head>

<body>
    <form name="cancel" method="post">
    <div id="sample_wrap">
        <h1>[������]<span> �� �������� ���� ����� ����ϴ� ����(����) �������Դϴ�.</span></h1>
    <div class="sample">
        <p>
          ��û ����� ����ϴ� ������ �Դϴ�.<br />
          ��û�� ���������� ó���� ��� ����ڵ�(res_cd)���� 0000���� ǥ�õ˴ϴ�.
        </p>
<%
    /* ============================================================================== */
    /* =   ���� ��� �ڵ� �� �޽��� ���(����������� �ݵ�� ������ֽñ� �ٶ��ϴ�.)= */
    /* = -------------------------------------------------------------------------- = */
    /* =   ���� ���� : res_cd���� 0000���� �����˴ϴ�.                              = */
    /* =   ���� ���� : res_cd���� 0000�̿��� ������ �����˴ϴ�.                     = */
    /* = -------------------------------------------------------------------------- = */
%>
                    <h2>&sdot; ó�� ���</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                        <!-- ��� �ڵ� -->
                        <tr>
                          <th>��� �ڵ�</th>
                          <td><%=res_cd%></td>
                        </tr>
                              <!-- ��� �޽��� -->
                        <tr>
                          <th>��� �޼���</th>
                          <td><%=res_msg%></td>
                        </tr>
<%
    // ó�� ������(pp_cli_hub.jsp)���� ������ DBó�� �۾��� ������ ��� �󼼸޽����� ����մϴ�.
    if( !"".equals ( res_msg_bsucc ) )
    {
%>
                         <tr>
                           <th>��� �� �޼���</th>
                           <td><%=res_msg_bsucc%></td>
                         </tr>
<%
    }
%>
                    </table>
<%
    /* = -------------------------------------------------------------------------- = */
    /* =   ���� ��� �ڵ� �� �޽��� ��� ��                                         = */
    /* ============================================================================== */
%>

<%
    /* ============================================================================== */
    /* =   01. ���� ��� ���                                                       = */
    /* = -------------------------------------------------------------------------- = */
    if ( "pay".equals ( req_tx ) )
    {
        /* ============================================================================== */
        /* =   01-1. ��ü DB ó�� ����(bSucc���� false�� �ƴ� ���)                     = */
        /* = -------------------------------------------------------------------------- = */
        if ( ! "false".equals ( bSucc ) )
        {
            /* ============================================================================== */
            /* =   01-1-1. ���� ������ ���� ��� ��� ( res_cd���� 0000�� ���)             = */
            /* = -------------------------------------------------------------------------- = */
            if ( "0000".equals ( res_cd ) )
            {
%>
                    <h2>&sdot; �ֹ� ����</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                        <!-- �ֹ���ȣ -->
                        <tr>
                          <th>�ֹ� ��ȣ</th>
                          <td><%= ordr_idxx %></td>
                        </tr>
                        <!-- KCP �ŷ���ȣ -->
                        <tr>
                          <th>KCP �ŷ���ȣ</th>
                          <td><%= tno %></td>
                        </tr>
                        <!-- KCP ���� �ŷ� �ݾ� -->
                        <tr>
                          <th>���� �ݾ�</th>
                          <td><%= amount %>��</td>
                        </tr>
                        <!-- ��ǰ��(good_name) -->
                        <tr>
                          <th>�� ǰ ��</th>
                          <td><%= good_name %></td>
                        </tr>
                        <!-- �ֹ��ڸ� -->
                        <tr>
                          <th>�ֹ��ڸ�</th>
                          <td><%= buyr_name %></td>
                        </tr>
                        <!-- �ֹ��� ��ȭ��ȣ -->
                        <tr>
                          <th>�ֹ��� ��ȭ��ȣ</th>
                          <td><%= buyr_tel1 %></td>
                        </tr>
                        <!-- �ֹ��� �޴�����ȣ -->
                        <tr>
                          <th>�ֹ��� �޴�����ȣ</th>
                          <td><%= buyr_tel2 %></td>
                        </tr>
                        <!-- �ֹ��� E-mail -->
                        <tr>
                          <th>�ֹ��� E-mail</th>
                          <td><%= buyr_mail %></td>
                        </tr>
                    </table>
<%
                /* ============================================================================== */
                /* =   �ſ�ī�� ���� ��� ���                                             = */
                /* = -------------------------------------------------------------------------- = */
                if ( use_pay_method.equals("100000000000") )
                {
%>
                    <h2>&sdot; �ſ�ī�� ����</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                        <!-- �������� : �ſ�ī�� -->
                        <tr>
                          <th>���� ����</th>
                          <td>�ſ� ī��</td>
                        </tr>
                        <!-- ���� ī�� -->
                        <tr>
                          <th>���� ī��</th>
                          <td><%= card_cd %> / <%= card_name %></td>
                        </tr>
                        <!-- ���νð� -->
                        <tr>
                          <th>���� �ð�</th>
                          <td><%= app_time %></td>
                        </tr>
                        <!-- ���ι�ȣ -->
                        <tr>
                          <th>���� ��ȣ</th>
                          <td><%= app_no %></td>
                        </tr>
                        <!-- �Һΰ��� -->
                        <tr>
                          <th>�Һ� ����</th>
                          <td><%= quota %></td>
                        </tr>
                        <!-- ������ ���� -->
                        <tr>
                          <th>������ ����</th>
                          <td><%= noinf %></td>
                        </tr>
<%
                    /* = -------------------------------------------------------------- = */
                    /* =   ���հ���(����Ʈ+�ſ�ī��) ���� ��� ó��                     = */
                    /* = -------------------------------------------------------------- = */
                     if ( pnt_issue.equals("SCSK") || pnt_issue.equals( "SCWB" ) )
                    {
%>
                    </table>
                    <h2>&sdot; ����Ʈ ����</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                    <!-- ����Ʈ�� -->
                        <tr>
                          <th>����Ʈ��</th>
                          <td><%= pnt_issue %></td>
                        </tr>
                    <!-- ����Ʈ ���� �ð� -->
                        <tr>
                          <th>����Ʈ ���νð�</th>
                          <td><%= pnt_app_time %></td>
                        </tr>
                    <!-- ����Ʈ ���ι�ȣ -->
                        <tr>
                          <th>����Ʈ ���ι�ȣ</th>
                          <td><%= pnt_app_no %></td>
                        </tr>
                    <!-- �����ݾ� or ���ݾ� -->
                        <tr>
                          <th>�����ݾ� or ���ݾ�</th>
                          <td><%= pnt_amount %></td>
                        </tr>
                    <!-- �߻� ����Ʈ -->
                        <tr>
                          <th>�߻� ����Ʈ</th>
                          <td><%= add_pnt %></td>
                        </tr>
                    <!-- ��밡�� ����Ʈ -->
                        <tr>
                          <th>��밡�� ����Ʈ</th>
                          <td><%= use_pnt %></td>
                        </tr>
                    <!-- �� ���� ����Ʈ -->
                        <tr>
                          <th>�� ���� ����Ʈ</th>
                          <td><%= rsv_pnt %></td>
                        </tr>
<%                  }
                    /* ============================================================================== */
                    /* =   �ſ�ī�� ������ ���                                                     = */
                    /* = -------------------------------------------------------------------------- = */
                    /* =   ���� �ŷ��ǿ� ���ؼ� �������� ����� �� �ֽ��ϴ�.                        = */
                    /* = -------------------------------------------------------------------------- = */
%>
                    <tr>
                        <th>������ Ȯ��</th>
                        <td class="sub_content1"><a href="javascript:receiptView('<%=tno%>','<%= ordr_idxx %>','<%= amount %>')"><img src="./img/btn_receipt.png" alt="�������� Ȯ���մϴ�." />
                    </td>
                    </table>
<%              }
                /* ============================================================================== */
                /* =   ������ü ���� ��� ���                                                  = */
                /* = -------------------------------------------------------------------------- = */
                else if (use_pay_method.equals("010000000000"))       // ������ü
                {
%>
                    <h2>&sdot; ������ü ����</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                    <!-- �������� : ������ü -->
                        <tr>
                          <th>���� ����</th>
                          <td>������ü</td>
                        </tr>
                    <!-- ��ü ���� -->
                        <tr>
                          <th>��ü ����</th>
                          <td><%= bank_name %></td>
                        </tr>
                    <!-- ��ü ���� �ڵ� -->
                        <tr>
                          <th>��ü �����ڵ�</th>
                          <td><%= bank_code %></td>
                        </tr>
                    <!-- ���νð� -->
                        <tr>
                          <th>���� �ð�</th>
                          <td><%= app_time %></td>
                        </tr>
                    </table>
<%
                }
                /* ============================================================================== */
                /* =   ������� ���� ��� ���                                                  = */
                /* = -------------------------------------------------------------------------- = */
                else if (use_pay_method.equals("001000000000"))
                {
%>
                    <h2>&sdot; ������� ����</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                    <!-- �������� : ������� -->
                        <tr>
                          <th>���� ����</th>
                          <td>�������</td>
                        </tr>
                    <!-- �Ա����� -->
                        <tr>
                          <th>�Ա� ����</th>
                          <td><%= bankname %></td>
                        </tr>
                    <!-- �Աݰ��� ������ -->
                        <tr>
                          <th>�Ա��� ���� ������</th>
                          <td><%= depositor %></td>
                        </tr>
                    <!-- �Աݰ��� ��ȣ -->
                        <tr>
                          <th>�Ա��� ���� ��ȣ</th>
                          <td><%= account %></td>
                        </tr>
                    <!-- ������� �Աݸ����ð� -->
                        <tr>
                          <th>������� �Աݸ����ð�</th>
                          <td><%= va_date %></td>
                        </tr>
                    <!-- ������� �����Ա�(�׽�Ʈ��) -->
                        <tr>
                          <th>������� �����Ա�</br>(�׽�Ʈ�� ���)</th>
                          <td class="sub_content1"><a href="javascript:receiptView3()"><img src="./img/btn_vcn.png" alt="�����Ա� �������� �̵��մϴ�." />
                        </tr>
                    </table>
<%
                }
                /* ============================================================================== */
                /* =   ����Ʈ ���� ��� ���                                                    = */
                /* = -------------------------------------------------------------------------- = */
                else if (use_pay_method.equals("000100000000"))
                {
%>
                    <h2>&sdot; ����Ʈ ����</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                    <!-- �������� : ����Ʈ -->
                        <tr>
                          <th>��������</th>
                          <td>�� �� Ʈ</td>
                        </tr>
                    <!-- ����Ʈ�� -->
                        <tr>
                          <th>����Ʈ��</th>
                          <td><%= pnt_issue %></td>
                        </tr>
                    <!-- ����Ʈ ���νð� -->
                        <tr>
                          <th>����Ʈ ���νð�</th>
                          <td><%= pnt_app_time %></td>
                        </tr>
                    <!-- ����Ʈ ���ι�ȣ -->
                        <tr>
                          <th>����Ʈ ���ι�ȣ</th>
                          <td><%= pnt_app_no %></td>
                        </tr>
                    <!-- �����ݾ� or ���ݾ� -->
                        <tr>
                          <th>�����ݾ� or ���ݾ�</th>
                          <td><%= pnt_amount %></td>
                        </tr>
                    <!-- �߻� ����Ʈ -->
                        <tr>
                          <th>�߻� ����Ʈ</th>
                          <td><%= add_pnt %></td>
                        </tr>
                    <!-- ��밡�� ����Ʈ -->
                        <tr>
                          <th>��밡�� ����Ʈ</th>
                          <td><%= use_pnt %></td>
                        </tr>
                    <!-- �� ���� ����Ʈ -->
                        <tr>
                          <th>�� ���� ����Ʈ</th>
                          <td><%= rsv_pnt %></td>
                        </tr>
                </table>
<%
                }
                /* ============================================================================== */
                /* =   �޴��� ���� ��� ���                                                    = */
                /* = -------------------------------------------------------------------------- = */
                else if (use_pay_method.equals("000010000000"))
                {
%>
                    <h2>&sdot; �޴��� ����</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                    <!-- �������� : �޴��� -->
                        <tr>
                          <th>���� ����</th>
                          <td>�� �� ��</td>
                        </tr>
                    <!-- ���νð� -->
                        <tr>
                          <th>���� �ð�</th>
                          <td><%= app_time %></td>
                        </tr>
                    <!-- ��Ż��ڵ� -->
                        <tr>
                          <th>��Ż� �ڵ�</th>
                          <td><%= commid %></td>
                        </tr>
                    <!-- ���νð� -->
                        <tr>
                          <th>�޴��� ��ȣ</th>
                          <td><%= mobile_no %></td>
                        </tr>
                </table>
<%
                }
                /* ============================================================================== */
                /* =   ��ǰ�� ���� ��� ���                                                    = */
                /* = -------------------------------------------------------------------------- = */
                else if (use_pay_method.equals("000000001000"))
                {
%>
                    <h2>&sdot; ��ǰ�� ����</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                    <!-- �������� : ��ǰ�� -->
                        <tr>
                          <th>���� ����</th>
                          <td>�� ǰ ��</td>
                        </tr>
                    <!-- �߱޻� �ڵ� -->
                        <tr>
                          <th>�߱޻� �ڵ�</th>
                          <td><%= tk_van_code %></td>
                        </tr>
                    <!-- ���νð� -->
                        <tr>
                          <th>���� �ð�</th>
                          <td><%= app_time %></td>
                        </tr>
                    <!-- ���ι�ȣ -->
                        <tr>
                          <th>���� ��ȣ</th>
                          <td><%= tk_app_no %></td>
                        </tr>
                </table>
<%
                }
                /* ============================================================================== */
                /* =   ���ݿ����� ���� ���                                                     = */
                /* = -------------------------------------------------------------------------- = */
                if( !"".equals ( cash_yn ) )
                {
                    if ( "010000000000".equals ( use_pay_method ) | "001000000000".equals ( use_pay_method ) )
                    {
%>
                <!-- ���ݿ����� ���� ���-->
                    <h2>&sdot; ���ݿ����� ����</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                        <tr>
                          <th>���ݿ����� ��Ͽ���</th>
                          <td><%= cash_yn %></td>
                        </tr>
<%
                    //���ݿ������� ��ϵ� ��� ���ι�ȣ ���� ����
                    if( !"".equals ( cash_authno ) )
                    {
%>
                        <tr>
                          <th>���ݿ����� ���ι�ȣ</th>
                          <td><%= cash_authno %></td>
                        </tr>
                        <tr>
                          <th>���ݿ����� �ŷ���ȣ</th>
                          <td><%= cash_no %></td>
                        </tr>
                    <tr>
                        <th>������ Ȯ��</th>
                        <td class="sub_content1"><a href="javascript:receiptView2('<%= cash_no %>', '<%= ordr_idxx %>', '<%= amount %>' )"><img src="./img/btn_receipt.png" alt="���ݿ�������  Ȯ���մϴ�." />
                    </td>

<%
                    }
%>
                </table>
<%
                    }
                }
            }
            /* = -------------------------------------------------------------------------- = */
            /* =   01-1-1. ���� ������ ���� ��� ��� END                                   = */
            /* ============================================================================== */
        }
        /* = -------------------------------------------------------------------------- = */
        /* =   01-1. ��ü DB ó�� ���� END                                              = */
        /* ============================================================================== */
    }
    /* = -------------------------------------------------------------------------- = */
    /* =   01. ���� ��� ��� END                                                   = */
    /* ============================================================================== */
%>
                    <!-- ���� ��û/ó������ �̹��� ��ư -->
                <tr>
                <div class="btnset">
                <a href="../index.html" class="home">ó������</a>
                </div>
                </tr>
              </tr>
            </div>
        <div class="footer">
                Copyright (c) NHN KCP INC. All Rights reserved.
        </div>
    </div>
  </body>
</html>
