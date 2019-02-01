package util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.StringTokenizer;

public class DateUtil {

	/**
	 *  인자로 받은 String 값을 Timestamp 객체로 돌러준다. 인자의 값이 없으면 현재 날짜와 시간을 Timestamp 객체로 돌러준다.
	 * @param todayTime String
	 * @return Timestamp
	 * @throws ParseException
	 */
	public static Timestamp getTimestamp(String todayTime) throws ParseException {
		Timestamp today = null;
		if ("".equals(Function.checkNull(todayTime))) {
			today = Timestamp.valueOf(getFullToday());
		} else {
			today = Timestamp.valueOf(todayTime);
		}
		return today;
	}

	/**
	 *  인자로 받은 Timestamp 값을 String 객체로 돌러준다.
	 * @param todayTime Timestamp
	 * @return String
	 * @throws ParseException
	 */
	public static String getStrDatestamp(Timestamp todayTime) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");		// 날짜정보 유형 설정
		String strTimestamp = sdf.format(todayTime);
		return strTimestamp;
	}

	/**
	 *  인자로 받은 Timestamp 값을 String 객체로 돌러준다.
	 * @param todayTime Timestamp
	 * @return String
	 * @throws ParseException
	 */
	public static String getStrTimestamp(Timestamp todayTime) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");		// 날짜정보 유형 설정
		String strTimestamp = sdf.format(todayTime);
		return strTimestamp;
	}
	
	//startYear부터 endYear까지 select 박스후 selectYear 값으로 선택한다.
		public String getSelectYear(int startYear, int endYear, int selectYear) {
			StringBuffer returnHtml = new StringBuffer();
			
			for (int j=0;j<=(endYear-startYear);j++) {
				if (selectYear == (startYear+j)) {
					returnHtml.append("<option value="+(startYear+j)+" selected>"+(startYear+j)+"</option>\n");
				} else {
					returnHtml.append("<option value="+(startYear+j)+">"+(startYear+j)+"</option>\n");
				}
			}
			return returnHtml.toString();
		}
		
		// int형의 parameter 값이 선택된 월 select 박스를 만든다.
		public String getSelectMonth(int month) {
			StringBuffer returnHtml = new StringBuffer();
			for (int j=1;j<=12;j++) {
				if (j >= 10) {
					if (j == month) {
						returnHtml.append("<option value="+j+" selected>"+j+"</option>\n");
					} else {
						returnHtml.append("<option value="+j+">"+j+"</option>\n");
					}
				} else {
					if (j == month) {
						returnHtml.append("<option value=0"+j+" selected>"+j+"</option>\n");
					} else {
						returnHtml.append("<option value=0"+j+">"+j+"</option>\n");
					}
				}
			}
			return returnHtml.toString();
		}
	
	/**
	 *  오늘 날짜 풀로 구하기
	 * @return String 날짜
	 */
	public static String getFullToday() {

		String smonth = "";
		String sday = "";
		String shour = "";
		String smin = "";
		String ssec = "";

		Calendar cDate = Calendar.getInstance();		//	Calendar 클래스의 인스턴스 생성

		int year = cDate.get(Calendar.YEAR);			//	현재 년도를 구하다.
		int month = cDate.get(Calendar.MONTH)+1;		//	현재 월을 구하다.
		int day = cDate.get(Calendar.DATE);				//	현재 일을 구하다.
		int hour = cDate.get(Calendar.HOUR_OF_DAY);		//	현재 년도를 구하다.
		int min = cDate.get(Calendar.MINUTE);			//	현재 월을 구하다.
		int sec = cDate.get(Calendar.SECOND);			//	현재 일을 구하다.

		// 달수가 10보다 작을 경우 앞에 '0'을 붙인다.
		if (month < 10) {
			smonth = "0"+month;
		} else {
			smonth = month+"";
		}

		// 일수가 10보다 작을 경우 앞에 '0'을 붙인다.
		if (day < 10) {
			sday = "0"+day;
		} else {
			sday = day+"";
		}

		// 시간이 10보다 작을 경우 앞에 '0'을 붙인다.
		if (hour < 10) {
			shour = "0"+hour;
		} else {
			shour = hour+"";
		}

		// 분이 10보다 작을 경우 앞에 '0'을 붙인다.
		if (min < 10) {
			smin = "0"+min;
		} else {
			smin = min+"";
		}

		// 초가 10보다 작을 경우 앞에 '0'을 붙인다.
		if (sec < 10) {
			ssec = "0"+sec;
		} else {
			ssec = sec+"";
		}

		return year+"-"+smonth+"-"+sday+" "+shour+":"+smin+":"+ssec;
	}

	/**
	 * yearMonth에 interval(개월)만큼 월을 더한다.
	 * @param yearMonth String
	 * @param interval int
	 * @return String
	 */
	public static String getYearMonth(String yearMonth, int interval) {

		Calendar date = Calendar.getInstance();											// Calendar 클래스의 인스턴스 생성
		date.set(date.DATE, 1);
		int year = date.get(Calendar.YEAR);												// 현재년를 구한다.
		int month = date.get(Calendar.MONTH);											// 현재월을 구한다.
		String result = "";

		if (!"".equals(yearMonth)) {
			year = Integer.parseInt(yearMonth.substring(0, 4));
			month = Integer.parseInt(yearMonth.substring(5))-1;
			date.set(date.YEAR, year);
			date.set(date.MONTH, month);
		}

		date.set(date.MONTH, month+interval);											// 월을 설정 한다.
		result = ( date.get(Calendar.YEAR)*100)+((date.get(Calendar.MONTH))+1)+"";		// 년월을 yyyymm 형태로 만든다.
		result = result.substring(0, 4)+"-"+result.substring(4);						// 년월을 yyyy-mm 형태로 만든다.

		return result;
	}

	/**
	 *  오늘 날짜 구하기 yyyy-mm-dd
	 * @return String 날짜
	 */
	public static String getToday() {

		String smonth = "";
		String sday = "";

		Calendar cDate = Calendar.getInstance();		//	Calendar 클래스의 인스턴스 생성

		int year = cDate.get(Calendar.YEAR);			//	현재 년도를 구하다.
		int month = cDate.get(Calendar.MONTH)+1;		//	현재 월을 구하다.
		int day = cDate.get(Calendar.DATE);				//	현재 일을 구하다.

		// 달수가 10보다 작을 경우 앞에 '0'을 붙인다.
		if (month < 10) {
			smonth = "0"+month;
		} else {
			smonth = month+"";
		}

		// 일수가 10보다 작을 경우 앞에 '0'을 붙인다.
		if (day < 10) {
			sday = "0"+day;
		} else {
			sday = day+"";
		}

		return year+"-"+smonth+"-"+sday;
	}

	/**
	 *  thisday일짜에  num(일수)만큼 더한다.
	 * @param num int(일수)
	 * @param thisday String
	 * @return String
	 */
	public static String getDayDateAdd(int num, String thisday) {

		int year = 0;
		int month = 0;
		int day = 0;

		String temp = "";

		Calendar cDate = Calendar.getInstance();		//	Calendar 클래스의 인스턴스 생성

		StringTokenizer st = new StringTokenizer(thisday, "-");

		if	(st.hasMoreTokens()) {
			 year = Integer.parseInt(st.nextToken());
			 month = Integer.parseInt(st.nextToken());
			 day = Integer.parseInt(st.nextToken());
		}

		cDate.set(year, month-1, day);
		cDate.add(cDate.DATE, num);

		String mMonth = "";	// 시작 날짜 월
		String mDay = "";	// 시작 날짜 일

		// 달수가 10보다 작을 경우 앞에 '0'을 붙인다.
		if ((cDate.get(Calendar.MONTH)+1) < 10) {
			mMonth = "0"+(cDate.get(Calendar.MONTH)+1);
		} else {
			mMonth = (cDate.get(Calendar.MONTH)+1) + "";
		}

		// 일수가 10보다 작을 경우 앞에 '0'을 붙인다.
		if (cDate.get(Calendar.DATE) < 10) {
			mDay = "0" + cDate.get(Calendar.DATE);
		} else {
			mDay = cDate.get(Calendar.DATE) + "";
		}

		return cDate.get(Calendar.YEAR)+"-"+mMonth+"-"+mDay;

	}

	/**
	 *  thisday일짜에  num(개월)만큼 더한다.
	 * @param num int (월수)
	 * @param thisday String
	 * @return String
	 */
	public static String getMonthDateAdd(int num, String thisday) {

		int year = 0;
		int month = 0;
		int day = 0;

		String temp = "";

		Calendar cDate = Calendar.getInstance();		//	Calendar 클래스의 인스턴스 생성

		StringTokenizer st = new StringTokenizer(thisday, "-");

		if	(st.hasMoreTokens()) {
			 year = Integer.parseInt(st.nextToken());
			 month = Integer.parseInt(st.nextToken());
			 day = Integer.parseInt(st.nextToken());
		}

		cDate.set(year, month-1, day);
		cDate.add(cDate.MONTH, num);

		String mMonth = "";	// 시작 날짜 월
		String mDay = "";	// 시작 날짜 일

		// 달수가 10보다 작을 경우 앞에 '0'을 붙인다.
		if ((cDate.get(Calendar.MONTH)+1) < 10) {
			mMonth = "0"+(cDate.get(Calendar.MONTH)+1);
		} else {
			mMonth = (cDate.get(Calendar.MONTH)+1) + "";
		}

		// 일수가 10보다 작을 경우 앞에 '0'을 붙인다.
		if (cDate.get(Calendar.DATE) < 10) {
			mDay = "0" + cDate.get(Calendar.DATE);
		} else {
			mDay = cDate.get(Calendar.DATE) + "";
		}

		return cDate.get(Calendar.YEAR)+"-"+mMonth+"-"+mDay;

	}

	/**
	 *  thisday일짜에  num(년수)만큼 더한다.
	 * @param num int (년수)
	 * @param thisday String
	 * @return String
	 */
	public static String getYearDateAdd(int num, String thisday) {

		int year = 0;
		int month = 0;
		int day = 0;

		String temp = "";

		Calendar cDate = Calendar.getInstance();		//	Calendar 클래스의 인스턴스 생성

		StringTokenizer st = new StringTokenizer(thisday, "-");

		if	(st.hasMoreTokens()) {
			 year = Integer.parseInt(st.nextToken());
			 month = Integer.parseInt(st.nextToken());
			 day = Integer.parseInt(st.nextToken());
		}

		cDate.set(year, month-1, day);
		cDate.add(cDate.YEAR, num);

		String mMonth = "";	// 시작 날짜 월
		String mDay = "";	// 시작 날짜 일

		// 달수가 10보다 작을 경우 앞에 '0'을 붙인다.
		if ((cDate.get(Calendar.MONTH)+1) < 10) {
			mMonth = "0"+(cDate.get(Calendar.MONTH)+1);
		} else {
			mMonth = (cDate.get(Calendar.MONTH)+1) + "";
		}

		// 일수가 10보다 작을 경우 앞에 '0'을 붙인다.
		if (cDate.get(Calendar.DATE) < 10) {
			mDay = "0" + cDate.get(Calendar.DATE);
		} else {
			mDay = cDate.get(Calendar.DATE) + "";
		}

		return cDate.get(Calendar.YEAR)+"-"+mMonth+"-"+mDay;

	}

	/**
	 *  해당 주의 몇번째 요일인지 (1이면 일요일, 2이면 월요일 7은 토요일) 자바버젼
	 * @param thisday String
	 * @return int
	 */
	public static int getDatePart(String thisday) {

		int year = 0;
		int month = 0;
		int day = 0;

		Calendar cDate = Calendar.getInstance();		//	Calendar 클래스의 인스턴스 생성

		StringTokenizer st = new StringTokenizer(thisday, "-");

		if	(st.hasMoreTokens()) {
			 year = Integer.parseInt(st.nextToken());
			 month = Integer.parseInt(st.nextToken());
			 day = Integer.parseInt(st.nextToken());
		}

		cDate.set(year, month-1, day);

		return cDate.get(Calendar.DAY_OF_WEEK);

	}

	public static String getDateFormat(Timestamp arg1){
		String pattern = "yyyy-MM-dd";
		String date = getDateFormat(arg1, pattern); 
		return date;
	}
	
	public static String getDateTimeFormat(Timestamp arg1){
		String pattern = "yyyy-MM-dd HH:mm:ss";
		String date = getDateFormat(arg1, pattern); 
		return date;
	}
	
	public static String getDateFormat(Timestamp arg1, String pattern) {
		java.text.SimpleDateFormat df = new java.text.SimpleDateFormat(pattern);
		String dfArg1 = "";
		if(arg1 != null){
			dfArg1 = df.format(arg1); 
		}
		return dfArg1;
	}
	
	
	public static String getDateFormat1(DateTime arg1, String pattern) {
		java.text.SimpleDateFormat df = new java.text.SimpleDateFormat(pattern);
		return df.format(arg1);
	}
	public static String getDateFormat2(String arg1, String pattern) {
		java.text.SimpleDateFormat df = new java.text.SimpleDateFormat(pattern);
		return df.format(arg1);
	}


	/**
	 * i값을 받아서 요일 이름으로 반환함.
	 * @param i Integer
	 * @return
	 */
	public static String getDayName(int i) {
		String dayname = "";
		switch (i) {
			case 0:
				dayname = "일";
				break;
			case 1:
				dayname = "월";
				break;
			case 2:
				dayname = "화";
				break;
			case 3:
				dayname = "수";
				break;
			case 4:
				dayname = "목";
				break;
			case 5:
				dayname = "금";
				break;
			case 6:
				dayname = "토";
				break;
		}
		return dayname;
	}

	/**
	 * i값을 받아서 휴일 이름으로 반환함.
	 * @param i Integer
	 * @return
	 */
	public static String getLegalHolidayName(int i) {
		String holidayName = "";
		switch (i) {
		case 0:
			holidayName = "설날[신정]";
			break;
		case 1:
			holidayName = "설날[구정]";
			break;
		case 2:
			holidayName = "삼일절";
			break;
		case 3:
			holidayName = "어린이날";
			break;
		case 4:
			holidayName = "석가탄신일";
			break;
		case 5:
			holidayName = "현충일";
			break;
		case 6:
			holidayName = "광복절";
			break;
		case 7:
			holidayName = "추석";
			break;
		case 8:
			holidayName = "개천절";
			break;
		case 9:
			holidayName = "한글날";
			break;
		case 10:
			holidayName = "성탄절";
			break;
		default:
			holidayName = "";
			break;
		}
		return holidayName;
	}

	/**
	 * 두 날짜간 일자 구하기
	 * @param enddate 종료일
	 * @param startdate 시작일
	 * @return
	 */
	public static int getDiff(String enddate, String startdate) {

		int year = 0;
		int month = 0;
		int day = 0;

		StringTokenizer st = new StringTokenizer(enddate, "-");
		StringTokenizer st2 = new StringTokenizer(startdate, "-");

		Date sd = new Date();
		Date ed = new Date();

		if	(st.hasMoreTokens()) {
			 year = Integer.parseInt(st.nextToken());
			 month = Integer.parseInt(st.nextToken());
			 day = Integer.parseInt(st.nextToken());
		}
		sd.setYear(year);
		sd.setMonth(month-1);
		sd.setDate(day);
		if	(st2.hasMoreTokens()) {
			 year = Integer.parseInt(st2.nextToken());
			 month = Integer.parseInt(st2.nextToken());
			 day = Integer.parseInt(st2.nextToken());
		}
		ed.setYear(year);
		ed.setMonth(month-1);
		ed.setDate(day);
		long temp = (sd.getTime() - ed.getTime()) / (1000L*60L*60L*24L);
		int diff = (int)temp;

		return diff;

	}

	/**
	 * 일요일제외 증가 경희봄 휴가기간(8월 13일부터 8월 16일까지)
	 * @param thisday
	 * @return
	 */
	public static int[] getSundayIgnoreAdd(String thisday) {

		int[] dayCnt = new int[7];
		int temp = 0;
		String tempDay = "";

		for(int i=0; i<7; i++) {

			do {

				tempDay = getDayDateAdd(temp, thisday);

				if(getDatePart(tempDay) == 1 || "2012-08-13".equals(tempDay) || "2012-08-14".equals(tempDay) || "2012-08-15".equals(tempDay) || "2012-08-16".equals(tempDay)) {
					temp++;
				}

			} while	(getDatePart(tempDay) == 1  || "2012-08-13".equals(tempDay) || "2012-08-14".equals(tempDay) || "2012-08-15".equals(tempDay) || "2012-08-16".equals(tempDay));

			dayCnt[i] = temp;

			temp++;
		}

		return dayCnt;

	}

	/**
	 * 글 등록 날짜와 날수, newicon 표기 여부를 받아와 날수 만큼 뉴아이콘 표시여부 반환
	 * @param regidate Timestamp, newicon String, day int
	 * @return yesno boolean
	 */
	public static boolean getNewIcon(Timestamp regidate, String newicon, int day) throws ParseException  {
		boolean yesno = false;
		if("1".equals(newicon) || ("2".equals(newicon) && (getTimestamp("").getTime() / 1000) - (regidate.getTime() / 1000) < (86400 * day))) {
			yesno = true;
		}
		return yesno;
	}

	/**
	 * 글 등록 날짜와 날수, newicon 표기 여부를 받아와 날수 만큼 뉴아이콘 표
	 * @param regidate Timestamp, newicon String, day int
	 * @return yesno boolean
	 */
	public static String getNewIcon(Timestamp regidate, String newicon) throws ParseException  {
		String icon = "";
		if("1".equals(newicon) || ("2".equals(newicon) && (getTimestamp("").getTime() / 1000) - (regidate.getTime() / 1000) < (86400))) {
			icon = "<img src='/img/m_new_icon.gif' alt='new' />";
		}
		return icon;
	}
	
	/**
	 * 글 등록 날짜와 날수, newicon 표기 여부를 받아와 날수 만큼 뉴아이콘 표
	 * @param regidate Timestamp, newicon String, day int
	 * @return yesno boolean
	 */
	public static String getNewIcon(Timestamp regidate, String newicon, String imgSrc) throws ParseException  {
		String icon = "";
		if("1".equals(newicon) || ("2".equals(newicon) && (getTimestamp("").getTime() / 1000) - (regidate.getTime() / 1000) < (86400))) {
			if(!Function.checkNull(imgSrc).equals("")){
				icon = "<img src='/img/"+imgSrc+"' alt='new' />";
			} else {
				icon = "<img src='/img/m_new_icon.gif' alt='new' />";
			}
		}
		return icon;
	}
	
	public static void main(String[] args) {
		String day = "2013-06-01";
		System.out.println(getToday());
		System.out.println(getDiff("2019-01-31", getToday()));
	}

}
