<%@ page pageEncoding="utf8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>


<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}"/>


<div class="panel panel-default">
	<div class="panel-heading">ShoppingCart</div>
	<div class="panel-body">
		<img src="/static/images/shopping_cart.gif" class="col-sm-5">
		<ul class="col-sm-7">
			<li><b id="cart-cnt">${cart.count}</b>mặt hàng</li>
			<li><b id ="cart-amt">
			<f:formatNumber value="${cart.amount }" pattern="#,##.00" />
					</b>VNĐ</li>
			<li><a href="">Xem giỏ hàng</a></li>
		</ul>

	</div>
</div>

<div class="panel panel-default">
	<div class="panel-body">Tìm Kiếm</div>

	<form action="/product/list-by-keywords" method="post">
		<input value="${param.keywords}" name="keywords" class="form-control" placeholder="Keywords">
	</form>

</div>
<div class="panel panel-default">
	<div class="panel-heading">Danh Mục Sản Phẩm</div>
	<div class="list-group">
		<c:forEach var="c" items="${cates}">
		<a href="/product/list-by-category/${c.id }" class="list-group-item">${c.getNameVN()}</a> 
		</c:forEach>
		
	</div>
</div>
<div class="panel panel-default">
		<div class="panel-heading">ĐẶC BIỆT</div>
	<div class="list-group">
		<a href="/product/list-by-special/0" class="list-group-item">Hàng mới</a> 
		<a href="/product/list-by-special/1" class="list-group-item">Bán chạy</a> 
		<a href="/product/list-by-special/2" class="list-group-item">Xem nhiều</a>
		<a href="/product/list-by-special/3" class="list-group-item">Giảm giá</a>
	
	</div>
</div>


