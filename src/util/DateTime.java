package util;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.time.DateUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class DateTime {

	public static final boolean TYPE_PLAIN = false;
	public static final boolean TYPE_FULL = true;
	
	protected final Log logger = LogFactory.getLog(getClass());
	private Calendar calendar = Calendar.getInstance();

    // ------------------------------------------------------------ Constructors
	/**
     * 생성자 
     */
    public DateTime() {
    }
    
    public DateTime(Date date) {
    	calendar.setTime(date);
    }

    public DateTime(Calendar cal) {
    	calendar.setTime(cal.getTime());
    }
    
    public DateTime(int year) {
    	setYear(year);
    	
    	DateUtils.truncate(calendar, Calendar.YEAR);
    }

    public DateTime(int year, int month) {
    	setYear(year);
    	setMonth(month);
    }
    
    public DateTime(int year, int month, boolean monthType) {
    	setYear(year);
    	setMonth(month, monthType);
    	
    	DateUtils.truncate(calendar, Calendar.MONTH);
    }
    
    public DateTime(int year, int month, int date) {
    	setYear(year);
    	setMonth(month);
    	setDate(date);
    }
    
    public DateTime(int year, int month, int date, boolean monthType) {
    	setYear(year);
    	setMonth(month, monthType);
    	setDate(date);
    	
    	DateUtils.truncate(calendar, Calendar.DATE);
    }

    public DateTime(int year, int month, int date, int hour) {
    	setYear(year);
    	setMonth(month);
    	setDate(date);
    	setHourOfDay(hour);

    	DateUtils.truncate(calendar, Calendar.HOUR);
    }
    
    public DateTime(int year, int month, int date, int hour, boolean monthType) {
    	setYear(year);
    	setMonth(month, monthType);
    	setDate(date);
    	setHourOfDay(hour);

    	DateUtils.truncate(calendar, Calendar.HOUR);
    }
    
    public DateTime(int year, int month, int date, int hour, int minute) {
    	setYear(year);
    	setMonth(month);
    	setDate(date);
    	setHourOfDay(hour);
    	setMinute(minute);

    	DateUtils.truncate(calendar, Calendar.MINUTE);
    }
    
    public DateTime(int year, int month, int date, int hour, int minute, boolean monthType) {
    	setYear(year);
    	setMonth(month, monthType);
    	setDate(date);
    	setHourOfDay(hour);
    	setMinute(minute);

    	DateUtils.truncate(calendar, Calendar.MINUTE);
    }

    public DateTime(int year, int month, int date, int hour, int minute, int second) {
    	setYear(year);
    	setMonth(month);
    	setDate(date);
    	setHourOfDay(hour);
    	setMinute(minute);
    	setSecond(second);

    	DateUtils.truncate(calendar, Calendar.SECOND);
    }
    
    public DateTime(int year, int month, int date, int hour, int minute, int second, boolean monthType) {
    	setYear(year);
    	setMonth(month, monthType);
    	setDate(date);
    	setHourOfDay(hour);
    	setMinute(minute);
    	setSecond(second);

    	DateUtils.truncate(calendar, Calendar.SECOND);
    }

    public DateTime(int year, int month, int date, int hour, int minute, int second, int millisecond) {
    	setYear(year);
    	setMonth(month);
    	setDate(date);
    	setHourOfDay(hour);
    	setMinute(minute);
    	setSecond(second);
    	setMilliSecond(millisecond);
    }
    
    public DateTime(int year, int month, int date, int hour, int minute, int second, int millisecond, boolean monthType) {
    	setYear(year);
    	setMonth(month, monthType);
    	setDate(date);
    	setHourOfDay(hour);
    	setMinute(minute);
    	setSecond(second);
    	setMilliSecond(millisecond);
    }

    // ---------------------------------------------------------- Operation
    public Object clone() {
    	return new DateTime(getTime());
    }

    // ---------------------------------------------------------- Getter / Setter
    public int getYear() {
    	return calendar.get(Calendar.YEAR);
    }

    public void setYear(int year) {
    	calendar.set(Calendar.YEAR, year);
    }
    
    public int getMonth() {
    	return calendar.get(Calendar.MONTH);
    }

    public void setMonth(int month) {
    	calendar.set(Calendar.MONTH, month);
    }
    
    public int getFullMonth() {
    	return calendar.get(Calendar.MONTH)+1;
    }

    public void setFullMonth(int month) {
    	calendar.set(Calendar.MONTH, month-1);
    }
    
    public void setMonth(int month, boolean type) {
    	if (type == TYPE_PLAIN) setMonth(month);
    	else setFullMonth(month);
    }
    
    public int getDate() {
    	return calendar.get(Calendar.DATE);
    }

    public void setDate(int date) {
    	calendar.set(Calendar.DATE, date);
    }
    
    public int getHour() {
    	return calendar.get(Calendar.HOUR);
    }

    public void setHour(int hour) {
    	calendar.set(Calendar.HOUR, hour);
    }
    
    public int getHourOfDay() {
    	return calendar.get(Calendar.HOUR_OF_DAY);
    }

    public void setHourOfDay(int hourOfDay) {
    	calendar.set(Calendar.HOUR_OF_DAY, hourOfDay);
    }
    
    public int getMinute() {
    	return calendar.get(Calendar.MINUTE);
    }

    public void setMinute(int minute) {
    	calendar.set(Calendar.MINUTE, minute);
    }
    
    public int getSecond() {
    	return calendar.get(Calendar.SECOND);
    }

    public void setSecond(int second) {
    	calendar.set(Calendar.SECOND, second);
    }
    
    public int getMilliSecond() {
    	return calendar.get(Calendar.MILLISECOND);
    }

    public void setMilliSecond(int millisecond) {
    	calendar.set(Calendar.MILLISECOND, millisecond);
    }
    
	public int getDayOfWeek() {
		return calendar.get(Calendar.DAY_OF_WEEK);
	}
	
	public Log getLogger() {
		return logger;
	}
	
	public boolean isMonday() {
		return getDayOfWeek()==Calendar.MONDAY;
	}

	public boolean isTuesday() {
		return getDayOfWeek()==Calendar.TUESDAY;
	}
	
	public boolean isWednesday() {
		return getDayOfWeek()==Calendar.WEDNESDAY;
	}
	
	public boolean isThursday() {
		return getDayOfWeek()==Calendar.THURSDAY;
	}

	public boolean isFriday() {
		return getDayOfWeek()==Calendar.FRIDAY;
	}

	public boolean isSaturday() {
		return getDayOfWeek()==Calendar.SATURDAY;
	}

	public boolean isSunday() {
		return getDayOfWeek()==Calendar.SUNDAY;
	}
	
	public boolean isToday() {
		Date today = new Date();
		
		return DateUtils.isSameDay(calendar.getTime(), today);
	}
	
	public DateTime getPreviousDate() {
		Calendar cal = (Calendar)calendar.clone();
		cal.add(Calendar.DATE, -1);
		
		return new DateTime(cal.getTime());
	}

	public DateTime getYesterday() {
		return getPreviousDate();
	}
	
	public DateTime getNextDate() {
		Calendar cal = (Calendar)calendar.clone();
		cal.add(Calendar.DATE, 1);
		
		return new DateTime(cal.getTime());
	}

	public DateTime getTomorrow() {
		return getNextDate();
	}
	
	public DateTime getPreviousMonth() {
		Calendar cal = (Calendar)calendar.clone();
		cal.add(Calendar.MONTH, -1);
		
		return new DateTime(cal.getTime());
	}

	public DateTime getNextMonth() {
		Calendar cal = (Calendar)calendar.clone();
		cal.add(Calendar.MONTH, 1);
		
		return new DateTime(cal.getTime());
	}

	public DateTime getPreviousYear() {
		Calendar cal = (Calendar)calendar.clone();
		cal.add(Calendar.YEAR, -1);
		
		return new DateTime(cal.getTime());
	}

	public DateTime getNextYear() {
		Calendar cal = (Calendar)calendar.clone();
		cal.add(Calendar.YEAR, 1);
		
		return new DateTime(cal.getTime());
	}
	
	public Date getTime() {
		return calendar.getTime();
	}
	
	public java.sql.Date getSqlTime() {
		return new java.sql.Date(calendar.getTimeInMillis());
	}
	
	public Timestamp getTimestamp() {
		return new Timestamp(calendar.getTimeInMillis());
	}
	
	public long getTimeInMillis() {
		return calendar.getTimeInMillis();
	}

	public Calendar getCalendar() {
		return calendar;
	}

	public void setCalendar(Calendar calendar) {
		this.calendar = calendar;
	}
	
	public int[][] getDaysInMonth() {
		int min = calendar.getActualMinimum(Calendar.DAY_OF_MONTH);
		int max = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		int maxWeek = calendar.getActualMaximum(Calendar.WEEK_OF_MONTH);
		if (logger.isDebugEnabled()) {
			logger.debug("maxWeek=" + maxWeek);
		}
		
		Calendar first = (Calendar)calendar.clone();
		first.set(Calendar.DATE, min);
		int dayOfWeek = first.get(Calendar.DAY_OF_WEEK);
		int space = 0;
		if (dayOfWeek!=Calendar.SUNDAY) {
			space = dayOfWeek - 1;
		}
		
		int data[][] = new int[maxWeek][7];
		int week = 0;
		
		for (int i=0; i<space; i++)
			data[week][i] = 0;
		
		for (int i=min; i<=max; i++) {
			data[week][space] = i;
			space++;
			if (space==7) {
				space=0;
				week++;
			}
		}
		
		return data;
	}

	public int getMaxDayInMonth() {
		return calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
	}
	// ---------------------------------------------------------- ToString Methods
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
