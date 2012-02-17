SELECT
	S.SUPPLIER_CODE
	,R.NAME AS SUPPLIER_RATE_NAME
	,R.SIGN AS C_UNIT_SIGN
FROM
	SUPPLIER_MST_/*$domainId*/ S
		LEFT OUTER JOIN RATE_MST_/*$domainId*/ R
			ON S.RATE_ID = R.RATE_ID
WHERE
	S.SUPPLIER_CODE=/*supplierCode*/''