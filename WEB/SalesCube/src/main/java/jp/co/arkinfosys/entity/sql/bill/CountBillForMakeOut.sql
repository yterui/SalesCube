SELECT
	BL.CNT + ZB.CNT
FROM
(
SELECT
		count(B.BILL_ID) CNT
    FROM
        BILL_TRN_/*$domainId*/'DEFAULT' B
		LEFT OUTER JOIN CUSTOMER_MST_/*$domainId*/ C
			ON B.CUSTOMER_CODE = C.CUSTOMER_CODE
		LEFT OUTER JOIN DELIVERY_MST_/*$domainId*/ D
			ON B.BA_CODE = D.DELIVERY_CODE
	WHERE
		B.BILL_CRT_CATEGORY = /*billCrtCategory*/'02'
		/*IF billId != null */
		AND B.BILL_ID = /*billId*/0
		/*END*/
		/*IF billCutoffDateFrom != null */
		AND B.BILL_CUTOFF_DATE >= CAST(/*billCutoffDateFrom*/ AS DATE)
		/*END*/
		/*IF billCutoffDateTo != null */
		AND B.BILL_CUTOFF_DATE <= CAST(/*billCutoffDateTo*/ AS DATE)
		/*END*/
		/*IF lastSalesDateFrom != null */
		AND B.LAST_SALES_DATE >= CAST(/*lastSalesDateFrom*/ AS DATE)
		/*END*/
		/*IF lastSalesDateTo != null */
		AND B.LAST_SALES_DATE <= CAST(/*lastSalesDateTo*/ AS DATE)
		/*END*/
		/*IF lastPrintDateFrom != null */
		AND B.LAST_PRINT_DATE >= CAST(/*lastPrintDateFrom*/ AS DATE)
		/*END*/
		/*IF lastPrintDateTo != null */
		AND B.LAST_PRINT_DATE <= CAST(/*lastPrintDateTo*/ AS DATE)
		/*END*/
		/*IF cutoffGroup != null */
		AND B.CUTOFF_GROUP = /*cutoffGroup*/'1'
		/*END*/
		/*IF paybackCycleCategory != null */
		AND B.PAYBACK_CYCLE_CATEGORY = /*paybackCycleCategory*/'1'
		/*END*/
		/*IF cutoffGroupCategory != null */
		AND concat( B.CUTOFF_GROUP , B.PAYBACK_CYCLE_CATEGORY ) = /*cutoffGroupCategory*/'1'
		/*END*/
		/*IF customerCode != null */
		AND B.CUSTOMER_CODE LIKE /*customerCode*/'S%'
		/*END*/
		/*IF customerName != null */
		AND C.CUSTOMER_NAME LIKE /*customerName*/'%S%'
		/*END*/
		/*IF covPriceZero != null || covPriceMinus != null || covPricePlus != null*/
		AND (
		/*BEGIN*/
			/*IF covPriceZero != null*/
			B.COV_PRICE = 0
			/*END*/
			/*IF covPriceMinus != null*/
			OR B.COV_PRICE < 0
			/*END*/
			/*IF covPricePlus != null*/
			OR B.COV_PRICE > 0
			/*END*/
		/*END*/
		)
		/*END*/

		/*IF thisBillPricePlus != null || thisBillPriceZero != null || thisBillPriceMinus != null*/
		AND (
		/*BEGIN*/
			/*IF thisBillPricePlus != null*/
			B.THIS_BILL_PRICE > 0
			/*END*/
			/*IF thisBillPriceZero != null*/
			OR B.THIS_BILL_PRICE = 0
			/*END*/
			/*IF thisBillPriceMinus != null*/
			OR B.THIS_BILL_PRICE < 0
			/*END*/
		/*END*/
		)
		/*END*/
		/*IF excludePrint != null */
		AND ( B.BILL_PRINT_COUNT = 0 or B.BILL_PRINT_COUNT is null )
		/*END*/
) BL,
(
SELECT
		count(Z.BILL_ID) CNT
    FROM
        BILL_OLD_/*$domainId*/'DEFAULT' Z
		LEFT OUTER JOIN CUSTOMER_MST_/*$domainId*/ C
			ON B.CUSTOMER_CODE = C.CUSTOMER_CODE
		LEFT OUTER JOIN DELIVERY_MST_/*$domainId*/ D
			ON B.BA_CODE = D.DELIVERY_CODE
	WHERE
		Z.BILL_CRT_CATEGORY = /*billCrtCategory*/'02'
		/*IF billId != null */
		AND Z.BILL_ID = /*billId*/0
		/*END*/
		/*IF billCutoffDateFrom != null */
		AND Z.BILL_CUTOFF_DATE >= CAST(/*billCutoffDateFrom*/ AS DATE)
		/*END*/
		/*IF billCutoffDateTo != null */
		AND Z.BILL_CUTOFF_DATE <= CAST(/*billCutoffDateTo*/ AS DATE)
		/*END*/
		/*IF lastSalesDateFrom != null */
		AND Z.LAST_SALES_DATE >= CAST(/*lastSalesDateFrom*/ AS DATE)
		/*END*/
		/*IF lastSalesDateTo != null */
		AND Z.LAST_SALES_DATE <= CAST(/*lastSalesDateTo*/ AS DATE)
		/*END*/
		/*IF lastPrintDateFrom != null */
		AND Z.LAST_PRINT_DATE >= CAST(/*lastPrintDateFrom*/ AS DATE)
		/*END*/
		/*IF lastPrintDateTo != null */
		AND Z.LAST_PRINT_DATE <= CAST(/*lastPrintDateTo*/ AS DATE)
		/*END*/
		/*IF cutoffGroup != null */
		AND Z.CUTOFF_GROUP = /*cutoffGroup*/'1'
		/*END*/
		/*IF paybackCycleCategory != null */
		AND Z.PAYBACK_CYCLE_CATEGORY = /*paybackCycleCategory*/'1'
		/*END*/
		/*IF cutoffGroupCategory != null */
		AND concat( Z.CUTOFF_GROUP , Z.PAYBACK_CYCLE_CATEGORY ) = /*cutoffGroupCategory*/'1'
		/*END*/
		/*IF customerCode != null */
		AND Z.CUSTOMER_CODE LIKE /*customerCode*/'S%'
		/*END*/
		/*IF customerName != null */
		AND C.CUSTOMER_NAME LIKE /*customerName*/'%S%'
		/*END*/
		/*IF covPriceZero != null || covPriceMinus != null || covPricePlus != null*/
		AND (
		/*BEGIN*/
			/*IF covPriceZero != null*/
			Z.COV_PRICE = 0
			/*END*/
			/*IF covPriceMinus != null*/
			OR Z.COV_PRICE < 0
			/*END*/
			/*IF covPricePlus != null*/
			OR Z.COV_PRICE > 0
			/*END*/
		/*END*/
		)
		/*END*/

		/*IF thisBillPricePlus != null || thisBillPriceZero != null || thisBillPriceMinus != null*/
		AND (
		/*BEGIN*/
			/*IF thisBillPricePlus != null*/
			Z.THIS_BILL_PRICE > 0
			/*END*/
			/*IF thisBillPriceZero != null*/
			OR Z.THIS_BILL_PRICE = 0
			/*END*/
			/*IF thisBillPriceMinus != null*/
			OR Z.THIS_BILL_PRICE < 0
			/*END*/
		/*END*/
		)
		/*END*/
		/*IF excludePrint != null */
		AND ( Z.BILL_PRINT_COUNT = 0 or Z.BILL_PRINT_COUNT is null )
		/*END*/

) ZB
