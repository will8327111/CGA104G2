package com.store.model;

import java.math.BigDecimal;

public class StoreVO {
	private Integer storeId;
	private Integer storeTypeId;
	private String storeInfo;
	private String storeLoc;
	private BigDecimal storeLon;
	private BigDecimal storeLat;
	private byte[] storePhoto;
	private String base64img;

	public Integer getStoreId() {
		return storeId;
	}

	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}

	public Integer getStoreTypeId() {
		return storeTypeId;
	}

	public void setStoreTypeId(Integer storeTypeId) {
		this.storeTypeId = storeTypeId;
	}

	public String getStoreInfo() {
		return storeInfo;
	}

	public void setStoreInfo(String storeInfo) {
		this.storeInfo = storeInfo;
	}

	public String getStoreLoc() {
		return storeLoc;
	}

	public void setStoreLoc(String storeLoc) {
		this.storeLoc = storeLoc;
	}

	public BigDecimal getStoreLon() {
		return storeLon;
	}

	public void setStoreLon(BigDecimal storeLon) {
		this.storeLon = storeLon;
	}

	public BigDecimal getStoreLat() {
		return storeLat;
	}

	public void setStoreLat(BigDecimal storeLat) {
		this.storeLat = storeLat;
	}

	public byte[] getStorePhoto() {
		return storePhoto;
	}

	public void setStorePhoto(byte[] storePhoto) {
		this.storePhoto = storePhoto;
	}

	public String getBase64img() {
		return base64img;
	}

	public void setBase64img(String base64img) {
		this.base64img = base64img;
	}

}
//<table class="content">
//<tr><td>商店編號:</td><td><input type="text" name="storeId" value="1"></td></tr>
//<tr><td>商店項目編號:</td><td><input type="text" name="storeTypeId" value="1"></td></tr>
//<tr><td>商店位置:</td><td><input type="text" id="storeLoc" name="storeLoc" value="桃園市中壢區"></td></tr>
//<tr><td>商店經度:</td><td><input type="text" name="storeLon" value="0.99999"></td></tr>
//<tr><td>商店緯度:</td><td><input type="text" name="storeLat" value="0.99999"></td></tr>
//<tr><td>商店圖片:</td><td><input type="file" name="storePhoto"></td></tr>
//<tr><td>商店內容:</td><td><textarea name="storeInfo" rows="10px" cols="30px">餐廳餐廳餐廳餐廳餐廳餐廳餐廳餐廳餐廳餐廳</textarea></td></tr>
//<tr><td><input type="hidden" name="action" value="insert"><button id="addStore" type="submit" value="資料送出">資料送出</button></td></tr>
