<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>



<div class="row">
	<div class="col-sm-5 text-center">
		<img class="detail-img" src="/static/images/products/${prod.image}">
	</div>
	<div class="col-sm-7">

		<ul class="detail-info">
			<li>Name: ${prod.name}</li>
			<li>unitPrice:<f:formatNumber value="${prod.unitPrice }"
					pattern="#,###.00" />VNĐ
			</li>
			<li>productDate:<f:formatDate value="${prod.productDate}"
					pattern="dd-MM-yyyy" /></li>
			<li>category: ${prod.category.nameVN}</li>
			<li>discount:<f:formatNumber value="${prod.discount }"
					type="percent" /></li>
			<li>quantity: ${prod.quantity}</li>
			<li>available: ${prod.available?'yes':'no'}</li>
			<li>viewCount: ${prod.viewCount}</li>
			<li>special: ${prod.special?'yes':'no'}</li>
		</ul>

	</div>

</div>
<div class="text-justify">
	<p>${prod.description}</p>
</div>


<ul class="nav nav-tabs">
	<li class="active"><a data-toggle="tab" href="#tab1">Sản phẩm
			cùng loại</a></li>
	<li><a data-toggle="tab" href="#tab2">Sản phẩm Yêu thích</a></li>
	<li><a data-toggle="tab" href="#tab3">Sản phẩm đã xem</a></li>
</ul>

<div class="tab-content">
	<div id="tab1" class="tab-pane fade in active">
		<div>
			<c:forEach var="p" items="${list}">
				<a href="/product/detail/${p.id }"></a>
				<img class="thumb-img" src="/static/images/products/${p.image}">

			</c:forEach>
		</div>
	</div>
	<div id="tab2" class="tab-pane fade">
		<div>
			<c:forEach var="p" items="${favo}">
				<a href="/product/detail/${p.id }"></a>
				<img class="thumb-img" src="/static/images/products/${p.image}">

			</c:forEach>
		</div>
	</div>
	<div id="tab3" class="tab-pane fade">
		<div>
			<c:forEach var="p" items="${viewed}">
				<a href="/product/detail/${p.id }"></a>
				<img class="thumb-img" src="/static/images/products/${p.image}">

			</c:forEach>
		</div>
	</div>
</div>

<%-- 
 <h3 style="color:blue">Sản phẩm cùng loại</h3>

<c:forEach var="p" items="${list}">
<a href="/product/detail/${p.id }"></a>
<img class="thumb-img" src="/static/images/products/${p.image}">

</c:forEach>

<h3 style="color:blue">Sản phẩm Yêu thích</h3>

<c:forEach var="p" items="${favo}">
<a href="/product/detail/${p.id }"></a>
<img class="thumb-img" src="/static/images/products/${p.image}">

</c:forEach>
<h3 style="color:blue">Sản phẩm đã xem</h3>

<c:forEach var="p" items="${viewed}">
<a href="/product/detail/${p.id }"></a>
<img class="thumb-img" src="/static/images/products/${p.image}">

</c:forEach> 
 --%>
--%>

