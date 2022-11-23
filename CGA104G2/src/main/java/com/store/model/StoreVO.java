package com.store.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class StoreVO {
	private Integer storeId;
	private Integer storeTypeId;
	private String storeName;
	private String storeInfo;
	private String storeLoc;
	private BigDecimal storeLon;
	private BigDecimal storeLat;
	private byte[] storePhoto;
	private String base64img;
	private String storeTypeName;

}