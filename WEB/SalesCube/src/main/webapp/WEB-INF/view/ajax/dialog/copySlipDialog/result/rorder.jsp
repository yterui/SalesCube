<table style="width: 550px;">
	<tr>
		<td style="text-align: left;">検索結果件数: ${searchResultCount}件</td>
		<td style="text-align: right; white-space: normal;">
			<span style="color: red">
			 	<html:messages id="resultThreshold" message="true">
			 		<bean:write name="resultThreshold" filter="false"/>
			 	</html:messages>
			</span>
		</td>
	</tr>
</table>

<div id="${dialogId}_RORDER_ListContainer">
	<div style="padding: 0px; border: none; width: 550px; height: 230px; overflow: hidden;">
		<table id="${dialogId}_RORDER_List" summary="伝票検索結果" style="width: 540px;">
			<colgroup>
				<col span="1" style="width: 5%">
				<col span="1" style="width: 15%">
				<col span="1" style="width: 15%">
				<col span="1" style="width: 15%">
				<col span="1" style="width: 50%">
			</colgroup>
			<tr>
				<th>&nbsp;</th>
				<th>受注番号</th>
				<th>受注日</th>
				<th>顧客コード</th>
				<th>顧客名</th>
			</tr>
			<c:forEach var="bean" items="${searchResultList}" varStatus="status">
			<tr>
				<td style="text-align: center;">
					<input type="radio" name="${dialogId}_RORDER_selectedSlip" value="${bean.roSlipId}"
					tabindex="14100" onclick="$('#${dialogId}_copyButton').attr('disabled', false);">
				</td>
				<td style="text-align: center;">${bean.roSlipId}</td>
				<td style="text-align: center;">${bean.roDate}</td>
				<td style="text-align: center;">${f:h(bean.customerCode)}</td>
				<td style="white-space: normal;">${f:h(bean.customerName)}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</div>