SELECT
	EAD_LINE.ENTRUST_EAD_LINE_ID,
	EAD_LINE.ENTRUST_EAD_SLIP_ID,
	EAD_LINE.LINE_NO,
	EAD_LINE.PRODUCT_CODE,
	EAD_LINE.PRODUCT_ABSTRACT,
	PO_LINE.PO_SLIP_ID,
	PO_LINE.SUPPLIER_PCODE,
	PO_LINE.LINE_NO AS PO_LINE_NO,
	EAD_LINE.QUANTITY,
	EAD_LINE.REMARKS,
	EAD_LINE.PO_LINE_ID,
	EAD_LINE.REL_ENTRUST_EAD_LINE_ID,
	EAD_LINE.ENTRUST_EAD_CATEGORY,
	EAD_LINE.CRE_FUNC,
	EAD_LINE.CRE_DATETM,
	EAD_LINE.CRE_USER,
	EAD_LINE.UPD_FUNC,
	EAD_LINE.UPD_DATETM,
	EAD_LINE.UPD_USER
FROM
	ENTRUST_EAD_LINE_TRN_/*$domainId*/ EAD_LINE LEFT OUTER JOIN PO_LINE_TRN_/*$domainId*/ PO_LINE
	ON EAD_LINE.PO_LINE_ID = PO_LINE.PO_LINE_ID
WHERE
	ENTRUST_EAD_SLIP_ID=/*entrustEadSlipId*/0
ORDER BY EAD_LINE.LINE_NO
