function getXMLHttpRequest(){
        if(window.ActiveXObject){
              try{
                    return new ActiveXObject("Msxml2.XMLHTTP");
              }catch(e){
                     try{
                           return new ActiveXObject("Microsoft.XML");
                     }catch(e1){
                            return null;
                     }
              }    
        }else if(window.XMLHttpRequest){
              return new XMLHttpRequest();
        }else{
              return null;
        }
 }