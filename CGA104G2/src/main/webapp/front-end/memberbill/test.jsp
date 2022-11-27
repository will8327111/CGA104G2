<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="result">
    ${result}
    <form id="allPayAPIForm" action="https://payment-stage.ecPay.com.tw/Cashier/AioCheckOut/V5" method="post">
    	<input type="hidden" name="NeedExtraPaidInfo" value="N">
    	<input type="hidden" name="ReturnURL" value="http://localhost:8081/CGA104G2/front-end/memberbill/card.jsp">
    	<input type="hidden" name="BidingCard" value="">
    	<input type="hidden" name="CheckMacValue" value="FCAD3B076BC85518310C9521612582DD3AD27836C4CEBC179532ADF6A49088F7">
    	<input type="hidden" name="StoreExpireDate" value="">
    	<input type="hidden" name="PeriodAmount" value="">
    	<input type="hidden" name="PaymentInfoURL" value="">
    	<input type="hidden" name="ClientRedirectURL" value="">
    	<input type="hidden" name="StoreID" value="">
    	<input type="hidden" name="EncryptType" value="1">
    	<input type="hidden" name="IgnorePayment" value="">
    	<input type="hidden" name="CreditInstallment" value="">
    	<input type="hidden" name="PaymentType" value="aio">
    	<input type="hidden" name="OrderResultURL" value="http://localhost:8081/CGA104G2/member/bill.do">
    	<input type="hidden" name="PeriodReturnURL" value="">
    	<input type="hidden" name="PlatformID" value="">
    	<input type="hidden" name="MerchantMemberID" value="">
    	<input type="hidden" name="Frequency" value="">
    	<input type="hidden" name="ExpireDate" value="">
    	<input type="hidden" name="ItemName" value="繳費總金額:3000元整">
    	<input type="hidden" name="InvoiceMark" value="N">
    	<input type="hidden" name="ExecTimes" value="">
    	<input type="hidden" name="ChoosePayment" value="ALL">
    	<input type="hidden" name="MerchantID" value="2000132">
    	<input type="hidden" name="TradeDesc" value="test">
    	<input type="hidden" name="ClientBackURL" value="http://localhost:8081/CGA104G2/member/bill.do">
    	<input type="hidden" name="PeriodType" value="">
    	<input type="hidden" name="CustomField4" value="">
    	<input type="hidden" name="Desc_4" value="">
    	<input type="hidden" name="TotalAmount" value="3000">
    	<input type="hidden" name="CustomField3" value="">
    	<input type="hidden" name="Desc_3" value="">
    	<input type="hidden" name="CustomField2" value="">
    	<input type="hidden" name="Desc_2" value="">
    	<input type="hidden" name="MerchantTradeDate" value="2022/11/18 14:06:14">
    	<input type="hidden" name="CustomField1" value="1,3000">
    	<input type="hidden" name="Desc_1" value="">
    	<input type="hidden" name="ChooseSubPayment" value="">
    	<input type="hidden" name="UnionPay" value="">
    	<input type="hidden" name="InstallmentAmount" value="">
    	<input type="hidden" name="MerchantTradeNo" value="1elifenedyhmsd">
    	<input type="hidden" name="ItemURL" value="">
    	<input type="hidden" name="Remark" value="">
    	<input type="hidden" name="DeviceSource" value="">
    	<input type="hidden" name="Language" value="">
    	<input type="hidden" name="Redeem" value="">
    	<script language="JavaScript">allPayAPIForm.submit()</script>
    </form>
    
  </div>
</body>
</html>