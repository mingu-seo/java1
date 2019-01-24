package test.json;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class Json {

	public static void main(String[] args) {
		Json j = new Json();
		j.getJson();
	}

	// 웹 서버로 부터 받은 웹 페이지 결과를 콘솔에 출력하는 메소드
	public static String printByInputStream(InputStream is) {

		byte[] buf = new byte[1024];
		int len = -1;
		StringBuffer sf = new StringBuffer();
		try {
			while ((len = is.read(buf, 0, buf.length)) != -1) {
				// System.out.write(buf, 0, len);
				sf.append(new String(buf, 0, len));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sf.toString();
	}

	// 웹 서버로 파라미터명과 값의 쌍을 전송하는 메소드
	public static void printByOutputStream(OutputStream os, String msg) {

		try {
			byte[] msgBuf = msg.getBytes("UTF-8");
			os.write(msgBuf, 0, msgBuf.length);
			os.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String getJson() {
		URL url = null;

		URLConnection urlConnection = null;
		String rst="";

		// URL 주소
		//String sUrl = "http://nanna.withsky.co.kr:8080/movie.jsp";
		String sUrl = "http://localhost/api/movie/index.do";

		try {
			// Get방식으로 전송 하기
			// url = new URL(sUrl + "?" + paramName + "=" + paramValue);
			// urlConnection = url.openConnection();
			// printByInputStream(urlConnection.getInputStream());

			// Post방식으로 전송 하기
			url = new URL(sUrl);
			urlConnection = url.openConnection();
			urlConnection.setDoOutput(true);

			printByOutputStream(urlConnection.getOutputStream(), "");
			rst = printByInputStream(urlConnection.getInputStream());
			//System.out.println(rst);

			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(rst);

			// Top레벨 단계인 response 키를 가지고 데이터를 파싱합니다.
			JSONArray dataList = (JSONArray) obj.get("movie");
			String totCount = (String) obj.get("totCount");
			
			System.out.println("총 갯수 : "+totCount);
			for (int i=0; i<dataList.size(); i++) {
				JSONObject data = (JSONObject) dataList.get(i);
				System.out.print(data.get("no")+"\t");
				System.out.print(java.net.URLDecoder.decode(String.valueOf(data.get("title")),"UTF-8")+"\t");
				System.out.print(data.get("image")+"\t");
				System.out.print(data.get("date"));
				System.out.println();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return rst;
	}
}
