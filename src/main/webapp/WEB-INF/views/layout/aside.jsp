<%@ page pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<div class="panel panel-default">
	<div class="panel-heading">ShoppingCart</div>
	<div class="panel-body">
		<img src="/static/images/shopping_cart.gif" class="col-sm-5">
		<ul class="col-sm-7">
			<li>10 mặt hàng</li>
			<li>150 ngàn đồng</li>
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
	<div class="panel-heading">Đặc Biệt</div>
	<div class="list-group">
		<a href="#" class="list-group-item">Hàng Mới</a> <a href="#"
			class="list-group-item">Hàng Bán Chạy</a> <a href="#"
			class="list-group-item">Hàng Yêu Thích</a> <a href="#"
			class="list-group-item">Hàng Khuyến Mãi</a>
	</div>

</div>
