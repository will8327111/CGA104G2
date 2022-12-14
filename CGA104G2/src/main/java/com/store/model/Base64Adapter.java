package com.store.model;

import java.util.Base64;

public class Base64Adapter {
	
	public String Encoder(byte[] b) {
		String s = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(b);
		return s;
	}
	
	public byte[] Decoder(String s) {
		
		s = s.replace("data:image/jpeg;base64,", "");
		byte[] b = Base64.getDecoder().decode(s);
		return b;
	}
}
