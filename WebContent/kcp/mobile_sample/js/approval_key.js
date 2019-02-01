    var ajax_flag = true;
    var req01_AJAX;
    var PayUrl="";

    function initRequest()
    {
        if ( window.XMLHttpRequest )
        {
            return new XMLHttpRequest();
        } else if ( window.ActiveXObject )
        {
            return new ActiveXObject( "Microsoft.XMLHTTP" );
        }
    }

    function sendRequest( url )
    {
        req01_AJAX = null;
        req01_AJAX = initRequest();

        if ( req01_AJAX )
        {
            req01_AJAX.onreadystatechange = process_AJAX;
            req01_AJAX.open( "POST", url, true );
            req01_AJAX.send( null );
        }
    }

    function kcp_AJAX()
    {
        // �ش� �ҽ��� jQuery�� ��� ���� �ʴ� ��ü������ �۵� �Ҽ� �ֵ��� �����Ǿ����ϴ�.
        // �� �κ��� javascript�� ������ jQuery�� �̿��ϸ� ���� ���� ���� �Ҽ� �ֽ��ϴ�. 
        // �Ǵ�
        // javascript�� ���� ajax ����� �� �ʿ� ���� �ҽ����� order_approval.jsp�� �����ؼ� ��� �ϼŵ� ���� ������
        // �����Ǵ� jar ���Ͽ� ���� ���޵� �����͸� ����Ҽ� �ֵ��� method�� ���� �Ǿ� �ֽ��ϴ�.
        if(ajax_flag)
        {
            var url    = "order_approval.jsp";
            var form = document.order_info;
            var params = "?site_cd=" + form.site_cd.value
                       + "&ordr_idxx=" + form.ordr_idxx.value
                       + "&good_mny=" + form.good_mny.value
                       + "&pay_method=" + form.pay_method.value
                       + "&escw_used=" + form.escw_used.value
                       + "&good_name=" + form.good_name.value
                       + "&response_type=" + form.response_type.value
                       + "&Ret_URL=" + form.Ret_URL.value;
            sendRequest( url + params );
            
            ajax_flag = false;
        }
        else
        {
            alert("��� ���Դϴ�. ��ø� ��ٷ� �ּ���.");
        }
            
    }

    function process_AJAX()
    {
        if ( req01_AJAX.readyState == 4 ) //READY_STATE_COMPLETE = 4
        {
            if ( req01_AJAX.status == 200 )
            {
                if ( req01_AJAX.responseText != null )
                {
                    // �ش� �ҽ��� jQuery�� ��� ���� �ʴ� ��ü������ �۵� �Ҽ� �ֵ��� �����Ǿ����ϴ�.
                    // �� �κ��� javascript�� ������ jQuery�� �̿��ϸ� ���� ���� ���� �Ҽ� �ֽ��ϴ�. 
                    // �Ǵ�
                    // javascript�� ���� ajax ����� �� �ʿ� ���� �ҽ����� order_approval.jsp�� �����ؼ� ��� �ϼŵ� ���� ������
                    // �����Ǵ� jar ���Ͽ� ���� ���޵� �����͸� ����Ҽ� �ֵ��� method�� ���� �Ǿ� �ֽ��ϴ�.
                    try
                    {
                        var form = document.order_info;
                        
                        if( form.response_type.value == "JSON" )
                        {
                            StateChangeForJSON( req01_AJAX ); // JSON ����� ���
                        }
                        else if( form.response_type.value == "XML" )
                        {
                            StateChangeForXML( req01_AJAX ); // XML ����� ���
                        }
                        else if( form.response_type.value == "TEXT" || form.response_type.value == "" )
                        {
                            StateChangeForText( req01_AJAX ); // TEXT ����� ���
                        }
                    }
                    catch( e )
                    {
                        StateChangeForText( req01_AJAX ); // TEXT ����� ���
                    }
                }
            }
            else
            {
                ajax_flag=true;
                alert( req01_AJAX.responseJSON );
            }
        }
    }
    
    function StateChangeForText( req )
    {
        var txt = req01_AJAX.responseText.split( ":" );

        if( txt[0].replace(/^\s*/,'').replace(/\s*$/,'') == '0000' )
        {
            document.getElementById( "approval" ).value = txt[1].replace(/^\s*/,'').replace(/\s*$/,'');
            // �Ʒ� alert�� ���� �ص���
            alert("���������� �ŷ��� ��� �Ǿ����ϴ�.");
            PayUrl = decodeURIComponent( txt[2].replace(/^\s*/,'').replace(/\s*$/,'') );
            
            document.getElementById( "traceNo" ).value = txt[3].replace(/^\s*/,'').replace(/\s*$/,'');
            
            if( txt.length == 6 )
            document.getElementById( "PayUrl"  ).value = txt[5].replace(/^\s*/,'').replace(/\s*$/,'');
            
            call_pay_form();
        }
        else
        {
            var res_msg = txt[2].replace(/^\s*/,'').replace(/\s*$/,'');
            
            ajax_flag=true;
            alert("���� �Ǿ����ϴ�.[" + res_msg + "]");
        }
    }
    
    function StateChangeForXML( req )
    {
        var xmlDoc = ( new DOMParser() ).parseFromString( req.responseText.replace(/^\s*/,'').replace(/\s*$/,''), "text/xml" ).documentElement;
        
        var x = xmlDoc.getElementsByTagName( "data" );
        
        if( x[0].getElementsByTagName( "Code" )[0].childNodes[0].nodeValue == '0000' )
        {
            document.getElementById( "approval" ).value = x[0].getElementsByTagName( "approvalKey" )[0].childNodes[0].nodeValue;
            // �Ʒ� alert�� ���� �ص���
            alert("���������� �ŷ��� ��� �Ǿ����ϴ�.");
            PayUrl = x[0].getElementsByTagName( "PayUrl" )[0].childNodes[0].nodeValue;
            
            document.getElementById( "traceNo" ).value = x[0].getElementsByTagName( "traceNo"     )[0].childNodes[0].nodeValue;
            
            try{
                document.getElementById( "PayUrl"  ).value = x[0].getElementsByTagName( "request_URI" )[0].childNodes[0].nodeValue;
            }catch(e){}
            
            call_pay_form();
        }
        else
        {
            ajax_flag=true;
            
            alert("���� �Ǿ����ϴ�.[" + x[0].getElementsByTagName( "Message" )[0].childNodes[0].nodeValue + "]");
        }
    }
    
    
    function StateChangeForJSON( xmlHttpRequest )
    {
        var json = eval('('+ xmlHttpRequest.responseText +')');
        
        if( json.Code == '0000' )
        {
            document.getElementById( "approval" ).value = json.approvalKey;
            // �Ʒ� alert�� ���� �ص���
            alert("���������� �ŷ��� ��� �Ǿ����ϴ�.");
            PayUrl = json.PayUrl;
            
            document.getElementById( "PayUrl"  ).value = json.request_URI;
            document.getElementById( "traceNo" ).value = json.traceNo;
            
            call_pay_form();
        }
        else
        {
            ajax_flag=true;
            
            alert("���� �Ǿ����ϴ�.[" + json.Message + "]");
        }
    }