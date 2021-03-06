<div style="width: 910px; height: 25px;">
		<input type="hidden" id="searchResultCount" value="${f:h(searchResultCount)}">
		<div style="position:absolute; left: 0px;">検索結果件数： ${searchResultCount}件</div>
		<div style="position:absolute; width: 910px; text-align: center;">
			${sw:pageLink(searchResultCount,rowCount,pageNo)}
		</div>
        <jsp:include page="/WEB-INF/view/common/rowcount.jsp"/>
</div>

<table summary="検索結果"  class="forms">

                <colgroup>
                    <col span="1" style="width: 10%">
                    <col span="1" style="width: 10%">
                    <col span="1" style="width: 10%">
                    <col span="1" style="width: 20%">
                    <col span="1" style="width: 45%">
                    <col span="1" style="width: 15%">
                </colgroup>
                <tr>
		<th style="cursor: pointer" onclick="sort('warehouseCode');">倉庫コード
			<c:if test="${sortColumn == 'warehouseCode'}">
				<c:if test="${sortOrderAsc}">▲</c:if>
				<c:if test="${!sortOrderAsc}">▼</c:if>
			</c:if>
		</th>
		<th style="cursor: pointer" onclick="sort('warehouseName');">倉庫名
			<c:if test="${sortColumn == 'warehouseName'}">
				<c:if test="${sortOrderAsc}">▲</c:if>
				<c:if test="${!sortOrderAsc}">▼</c:if>
			</c:if>
		</th>
		<th style="cursor: pointer" onclick="sort('rackCode');">棚番コード
			<c:if test="${sortColumn == 'rackCode'}">
				<c:if test="${sortOrderAsc}">▲</c:if>
				<c:if test="${!sortOrderAsc}">▼</c:if>
			</c:if>
		</th>
		<th style="cursor: pointer" onclick="sort('rackName');">棚番名
			<c:if test="${sortColumn == 'rackName'}">
				<c:if test="${sortOrderAsc}">▲</c:if>
				<c:if test="${!sortOrderAsc}">▼</c:if>
			</c:if>
		</th>
		<th>商品コード</th>
        <th>&nbsp;</th>
     </tr>
	<c:forEach var="bean" items="${searchResultList}" varStatus="status">
	<tr>
		<td>${f:h(bean.warehouseCode)}</td>
		<td>${f:h(bean.warehouseName)}</td>
		<td>${f:h(bean.rackCode)}</td>
		<td style="white-space: normal">${f:h(bean.rackName)}</td>
		<td style="white-space: normal">
			<c:forEach var="productCode" items="${bean.productCodeList}" varStatus="status">
				<c:if test="${status.index != 0}">,</c:if>${f:h(productCode)}
			</c:forEach>
		</td>
		<td style="text-align: center">
			<c:if test="${isUpdate}">
			<button onclick="editRack('${sw:u(bean.rackCode)}');">編集</button>
			<button onclick="deleteRack('${bean.rackCode}', '${bean.updDatetm}');">削除</button>
			</c:if>
			<c:if test="${!isUpdate}">
			<button onclick="editRack('${sw:u(bean.rackCode)}');">参照</button>
			</c:if>
		</td>
	</tr>
	</c:forEach>
</table>

<div style="position:absolute; width: 910px; text-align: center;">
	${sw:pageLink(searchResultCount,rowCount,pageNo)}
</div>


<input type="hidden" id="prev_rackCode" name="prev_rackCode" value="${rackCode}">
<input type="hidden" id="prev_rackName" name="prev_rackName" value="${f:h(rackName)}">
<input type="hidden" id="prev_emptyRack" name="prev_emptyRack" value="${emptyRack}">
<input type="hidden" id="prev_sortColumn" name="prev_sortColumn" value="${sortColumn}">
<input type="hidden" id="prev_sortOrderAsc" name="prev_sortOrderAsc" value="${sortOrderAsc}">
<input type="hidden" id="prev_pageNo" name="prev_pageNo" value="${pageNo}">
<input type="hidden" id="prev_rowCount" name="prev_rowCount" value="${rowCount}">


<c:if test="${searchResultCount == 1}">

<c:forEach var="bean" items="${searchResultList}" varStatus="status">
<input type="hidden" id="singleRackCode" name="singleRackCode" value="${sw:u(bean.rackCode)}">
</c:forEach>
</c:if>


