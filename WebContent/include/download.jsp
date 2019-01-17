<%@page import="property.SiteProperty"%>
<%@ page contentType="application;charset=utf-8" %>
<%@ page import="java.net.URLDecoder"%>
<%
	// Download file
	String path = request.getParameter("path");	// PATH
	String vf	= request.getParameter("vf");	// 서버에저장된 파일명
	String af	= request.getParameter("af");	// 다운로드할 파일명
	
	if(path==null || path.indexOf("..")>-1 || vf==null || vf.indexOf("..")>-1  || af==null || af.indexOf("..")>-1 ) {
		throw new Exception("Do you want something?");
	}
	//String vf2 = java.net.URLEncoder.encode(vf, "UTF-8");		// 다시 UTF-8로 인코딩 필요
	String vf2 = vf;
	//path = request.getRealPath(path+af); 			 			// 로컬
	path = SiteProperty.REAL_PATH+path+af;

	try {
		java.io.File f = new java.io.File(path);
		byte b[] = new byte[1024];

		java.io.BufferedInputStream  fin  = new java.io.BufferedInputStream(new java.io.FileInputStream(f));
		java.io.BufferedOutputStream fout = new java.io.BufferedOutputStream(response.getOutputStream());
		
		String strClient=request.getHeader("User-Agent");
		response.reset();
		if(strClient.indexOf("MSIE 5.5")>-1) {
			response.setHeader("Content-Type", "doesn/matter");
			response.setHeader("Content-Disposition", "filename=" + vf2 + ";");
		} else {
			response.setHeader("Content-Type", "application/octet-stream");
			response.setHeader("Content-Disposition", "attachment;filename=" + vf2 + ";");
		}

		response.setHeader("Content-Transfer-Encoding", "binary"); 
		response.setHeader("Content-Length", "" + f.length());

		for (int i; (i = fin.read(b)) != -1; ) {
			fout.write(b, 0, i);
			fout.flush();
		}
		
		fin.close();
		fout.flush();
		fout.close();		

	} catch (java.io.FileNotFoundException e) {
		System.out.println(e.toString());
	} catch (Exception e) {
		System.out.println(e.toString());
	}
%>
