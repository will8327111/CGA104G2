package com.storetype.modle;

import com.mail.common.MailCommon;

public interface StoreTypeDAO_interface extends MailCommon{
	public void insert(StoreTypeVO storeTypeVO);
    public void update(StoreTypeVO storeTypeVO);
    public void delete(Integer storeTypeVO);
}
