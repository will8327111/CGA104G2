package com.storetype.modle;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "APPOINTED_STORE_TYPE",catalog = "Community_Management")
public class StoreTypeVO implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "STORE_TYPE_ID",insertable = false)
	private Integer storetTypeId;
	@Column(name = "STORE_TYPE_NAME")
	private Integer storeTypeName;
}
