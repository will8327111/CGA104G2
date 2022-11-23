package com.backstageMailService.model;

public class GenAuthCode {

	public static void main(String[] args) {
		System.out.println("本次隨機產生驗證碼為:");
		GenAuthCode code = new GenAuthCode();
		code.getRandomPassword();
	};

	 public String getRandomPassword() {
		    int z;
		    StringBuilder sb = new StringBuilder();
		    int i;
		    for (i = 0; i < 8; i++) {
		      z = (int) ((Math.random() * 7) % 3);
		 
		      if (z == 1) { // 放數字
		        sb.append((int) ((Math.random() * 10) + 48));
		      } else if (z == 2) { // 放大寫英文
		        sb.append((char) (((Math.random() * 26) + 65)));
		      } else {// 放小寫英文
		        sb.append(((char) ((Math.random() * 26) + 97)));
		      }
		    }
		    return sb.toString();
		  }

}
