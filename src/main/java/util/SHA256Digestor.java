package util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public enum SHA256Digestor {
	INSTANCE;
	public String digestString(String text) {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-256");
			md.update(text.getBytes());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] disgeted = md.digest();
		return Base64.getEncoder().encodeToString(disgeted);
	}
}
