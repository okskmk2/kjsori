package util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class BhnUtil {
	public static String getCurrentLocalDateTimeStamp() {
	    return LocalDateTime.now()
	       .format(DateTimeFormatter.ofPattern("yyyy-MM-dd")); // yyyy-MM-dd HH:mm:ss
	}
}
