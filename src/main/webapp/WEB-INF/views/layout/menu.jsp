<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>


<!--   <nav class="navbar navbar-inverse"> 
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/home/index">Home</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="/home/about">About us</a></li>
			<li><a href="/home/contact">Contact Us</a></li>
			<li><a href="/home/feedback">Feedback</a></li>
			<li><a href="/home/faq">FAQs</a></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Account <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="/account/login">Đăng nhập</a></li>
					<li><a href="#">Đăng ký</a></li>
					<li><a href="#">Quên mật khẩu</a></li>
					<li><a href="#">Đăng Xuất</a></li>
					<li><a href="/account/logout">Đổi mật khẩu</a></li>
				</ul></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#">Tiếng Việt</a></li>
			<li><a href="#">English</a></li>
		</ul>

	</div>
</nav>
 -->
 <style>
.nav-item {
	width: 130px;
	text-align: center;
	font-weight: bold;
	color: white;
}

.nav-item:hover {
	background-color: #336666;
}

.nav-link:hover {
	background-color: #336666;
}
</style>
<nav class="navbar navbar-expand-sm navbar-dark"
	style="margin-top: -20px; background-color: #111111">
	<div class="container-fluid"
		style="height: 30px; padding: 0px 60px 0px 60px">
		<ul class="navbar-nav" style="margin-right: 450px">
			<li
				style="width: 280px; font-size: 18px; border-right: 1px solid gray;">
				<a class="nav-link" style="cursor: pointer; font-weight: bold; color: white;" data-toggle="collapse" href="#chungloai"> 
				<i class="fa fa-navicon"></i>&nbsp;&nbsp; <span class="danh_muc">DANH MỤC SẢN PHẨM</span>
			</a>
			</li>
			<li class="nav-item" style="margin-left: 12px"><a
				class="nav-link" style="color: white;" href="/">TRANG
					CHỦ</a></li>

			<li class="nav-item"><a class="nav-link" style="color: white;"
				href="/about">GIỚI THIỆU</a></li>
			<li class="nav-item"><a class="nav-link" style="color: white;"
				href="/contact">LIÊN HỆ</a></li>
			<li class="nav-item"><a class="nav-link" style="color: white;"
				href="/feedback">PHẢN HỒI</a></li>
			<li class="nav-item"><a class="nav-link" style="color: white;"
				href="/faq">HỎI ĐÁP</a></li>
			<!-- Dropdown -->
			<li class="nav-item dropdown"><a style="color: white;"
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown"> TÀI KHOẢN </a> <c:choose>
					<c:when test="${empty sessionScope.user }">
						<ul class="dropdown-menu">
							<li><a href="/account/login">Đăng nhập</a></li>
							<li><a href="/account/register">Đăng ký</a></li>
							<li><a href="/account/forgot">Quên mật khẩu?</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="dropdown-menu" style="background-color: #FFF">
							<li style="border-bottom: 2px solid #EEEEEE;"><a href="/account/logout">Đăng xuất</a></li>
							<li style="border-bottom: 2px solid #EEEEEE;"><a href="/account/change">Thay đổi mật khẩu</a></li>
							<li style="border-bottom: 2px solid #EEEEEE;"><a href="/account/edit">Cập nhật thông tin cá nhân</a></li>
							<li style="border-bottom: 2px solid #EEEEEE;"><a href="/order/list">Lịch sử đơn hàng</a></li>
							<li><a href="/order/items">Danh sách sản phẩm đã mua</a></li>
						</ul>
					</c:otherwise>
				</c:choose></li>
		</ul>
	</div>
</nav>

				<div class="list_danh_muc" style="position: absolute;z-index:1;display: none;width: 350px;padding-left: 70px;margin-top: -20px">

						<c:forEach var="c" items="${cates}">
							<a  class="list-group-item" href="/product/list-by-category/${c.id}">
								<img src="/static/images/icon/4.png" /> ${c.nameVN}
							</a>
						</c:forEach>

				</div>
	
<style>
	.list-group-item{
		background-color: #F8F8FF;
		border-bottom: 2px solid #EEEEEE;
	}

	.list-group-item:hover{
		color: black;
		font-weight: bold;
	}
</style>


