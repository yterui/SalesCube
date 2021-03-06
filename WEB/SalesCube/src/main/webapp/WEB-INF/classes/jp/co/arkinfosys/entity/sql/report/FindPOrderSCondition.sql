SELECT
	DISTINCT
	SLIP.HIST_ID,
	SLIP.ACTION_TYPE,
	SLIP.ACTION_FUNC,
	SLIP.REC_DATETM,
	SLIP.REC_USER,
	SLIP.PO_SLIP_ID,
	SLIP.STATUS,
	SLIP.PO_DATE,
	SLIP.PO_ANNUAL,
	SLIP.PO_MONTHLY,
	SLIP.PO_YM,
	SLIP.DELIVERY_DATE,
	SLIP.USER_ID,
	SLIP.USER_NAME,
	SLIP.REMARKS,
	SLIP.SUPPLIER_CODE,
	SLIP.SUPPLIER_NAME,
	SLIP.SUPPLIER_KANA,
	SLIP.SUPPLIER_ABBR,
	SLIP.SUPPLIER_DEPT_NAME,
	SLIP.SUPPLIER_ZIP_CODE,
	SLIP.SUPPLIER_ADDRESS_1,
	SLIP.SUPPLIER_ADDRESS_2,
	SLIP.SUPPLIER_PC_NAME,
	SLIP.SUPPLIER_PC_KANA,
	SLIP.SUPPLIER_PC_PRE_CATEGORY,
	SLIP.SUPPLIER_PC_PRE,
	SLIP.SUPPLIER_PC_POST,
	SLIP.SUPPLIER_TEL,
	SLIP.SUPPLIER_FAX,
	SLIP.SUPPLIER_EMAIL,
	SLIP.SUPPLIER_URL,
	SLIP.TRANSPORT_CATEGORY,
	SLIP.TAX_SHIFT_CATEGORY,
	SLIP.TAX_FRACT_CATEGORY,
	SLIP.PRICE_FRACT_CATEGORY,
	SLIP.RATE_ID,
	SLIP.SUPPLIER_CM_CATEGORY,
	SLIP.PRICE_TOTAL,
	SLIP.CTAX_TOTAL,
	SLIP.FE_PRICE_TOTAL,
	SLIP.PRINT_COUNT,
	SLIP.CRE_FUNC,
	SLIP.CRE_DATETM,
	SLIP.CRE_USER,
	SLIP.UPD_FUNC,
	SLIP.UPD_DATETM,
	SLIP.UPD_USER
FROM
	PO_SLIP_TRN_HIST_/*$domainId*/ SLIP
	INNER JOIN PO_LINE_TRN_HIST_/*$domainId*/ LINE ON SLIP.PO_SLIP_ID = LINE.PO_SLIP_ID
/*BEGIN*/
WHERE
	/*IF recDateFrom != null */
	AND CAST(SLIP.REC_DATETM AS DATE) >= CAST(/*recDateFrom*/'2010/01/01' AS DATE)
	/*END*/
	/*IF recDateTo != null */
	AND CAST(SLIP.REC_DATETM AS DATE) <= CAST(/*recDateTo*/'2010/01/01' AS DATE)
	/*END*/
	/*IF supplierCodeFrom != null */
	AND SLIP.SUPPLIER_CODE >= /*supplierCodeFrom*/'S'
	/*END*/
	/*IF supplierCodeTo != null */
	AND SLIP.SUPPLIER_CODE <= /*supplierCodeTo*/'S'
	/*END*/
	/*IF productCodeFrom != null */
	AND LINE.PRODUCT_CODE >= /*productCodeFrom*/'S'
	/*END*/
	/*IF productCodeTo != null */
	AND LINE.PRODUCT_CODE <= /*productCodeTo*/'S'
	/*END*/
/*END*/
ORDER BY SLIP.HIST_ID
