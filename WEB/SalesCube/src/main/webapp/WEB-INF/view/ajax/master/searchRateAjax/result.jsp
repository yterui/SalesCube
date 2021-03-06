<div style="width: 910px; height: 25px;">
		<input type="hidden" id="searchResultCount" value="${f:h(searchResultCount)}">
		<div style="position:absolute; left: 0px;">検索結果件数： ${searchResultCount}件</div>
		<div style="position:absolute; width: 910px; text-align: center;">
			${sw:pageLink(searchResultCount,rowCount,pageNo)}
		</div>
        <jsp:include page="/WEB-INF/view/common/rowcount.jsp"/>
</div>

<table summary="検索結果"  class="forms" style="table-layout: fixed;">

                <colgroup>
    				<col span="1" style="width: 80px">
    				<col span="1" style="width:200px">
    				<col span="1" style="width:120px">
    				<col span="1" style="width:120px">
    				<col span="1" style="">
    				<col span="1" style="width:120px">
                </colgroup>
                <tr>
		<th style="cursor: pointer" onclick="sort('rateId');">レート<br>タイプID
			<c:if test="${sortColumn == 'rateId'}">
				<c:if test="${sortOrderAsc}">▲</c:if>
				<c:if test="${!sortOrderAsc}">▼</c:if>
			</c:if>
		</th>
		<th style="cursor: pointer" onclick="sort('name');">レートタイプ名称
			<c:if test="${sortColumn == 'name'}">
				<c:if test="${sortOrderAsc}">▲</c:if>
				<c:if test="${!sortOrderAsc}">▼</c:if>
			</c:if>
		</th>
		<th style="cursor: pointer" onclick="sort('rate');">本日付の<br>最新レート
			<c:if test="${sortColumn == 'rate'}">
				<c:if test="${sortOrderAsc}">▲</c:if>
				<c:if test="${!sortOrderAsc}">▼</c:if>
			</c:if>
		</th>
		<th style="cursor: pointer" onclick="sort('startDate');">最新レートの<br>適用開始日
			<c:if test="${sortColumn == 'startDate'}">
				<c:if test="${sortOrderAsc}">▲</c:if>
				<c:if test="${!sortOrderAsc}">▼</c:if>
			</c:if>
		</th>
		<th style="cursor: pointer" onclick="sort('remarks');">レートタイプ備考
			<c:if test="${sortColumn == 'remarks'}">
				<c:if test="${sortOrderAsc}">▲</c:if>
				<c:if test="${!sortOrderAsc}">▼</c:if>
			</c:if>
		</th>
                    <th>&nbsp;</th>
     </tr>
	<c:forEach var="bean" items="${searchResultList}" varStatus="status">
	<tr>
		<td>${bean.rateId}</td>
		<td style="white-space: normal">${f:h(bean.name)}</td>
		<td style="white-space: normal;text-align: right;">${f:h(bean.rate)}</td>
		<td style="white-space: normal;text-align: center;">${f:h(bean.startDate)}</td>
		<td style="white-space: normal">${f:h(bean.remarks)}</td>
		<td style="text-align: center">
			<c:if test="${isUpdate}">
			<button onclick="editRate('${bean.rateId}');">編集</button>
			<button onclick="deleteRate('${bean.rateId}', '${bean.updDatetm}');">削除</button>
			</c:if>
			<c:if test="${!isUpdate}">
			<button onclick="editRate('${bean.rateId}');">参照</button>
			</c:if>
		</td>
	</tr>
	</c:forEach>
</table>

<div style="position:absolute; width: 910px; text-align: center;">
	${sw:pageLink(searchResultCount,rowCount,pageNo)}
</div>


<input type="hidden" id="prev_name" name="prev_name" value="${f:h(name)}">
<input type="hidden" id="prev_remarks" name="prev_remarks" value="${f:h(remarks)}">
<input type="hidden" id="prev_startDate1" name="prev_startDate1" value="${f:h(startDate1)}">
<input type="hidden" id="prev_startDate2" name="prev_startDate2" value="${f:h(startDate2)}">
<input type="hidden" id="prev_sortColumn" name="prev_sortColumn" value="${sortColumn}">
<input type="hidden" id="prev_sortOrderAsc" name="prev_sortOrderAsc" value="${sortOrderAsc}">
<input type="hidden" id="prev_pageNo" name="prev_pageNo" value="${pageNo}">
<input type="hidden" id="prev_rowCount" name="prev_rowCount" value="${rowCount}">


<c:if test="${searchResultCount == 1}">

<c:forEach var="bean" items="${searchResultList}" varStatus="status">
<input type="hidden" id="singleRateId" name="singleRateId" value="${bean.rateId}">
</c:forEach>
</c:if>


