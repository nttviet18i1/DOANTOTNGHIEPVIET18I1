<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<br/>
<div class="container">
	<div class=dang-nhap>
		<h4 style="font-weight: 600">Thông tin cá nhân</h4>
					<hr>
					<form:form action="/account/edit" modelAttribute="form" enctype="multipart/form-data">
					<h4 class="label label-success">${message}</h4>
						<br>
						<div class="row">
							<div class="col-sm-4">
								<p>Ảnh:</p>
							</div>
							<div class="col-sm-8">
								<p>
									<img src="/static/images/customers/${form.photo}"
										style="width: 80px; height: 90px;" /> <input type="file"
										name="photo_file" />
									<form:hidden path="photo" class="form-control" />
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<p>Tên đăng nhập:</p>
							</div>
							<div class="col-sm-8">
								<p>
									<form:input style="width: 90%;" path="id" class="form-control" />
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<p>Họ tên:</p>
							</div>
							<div class="col-sm-8">
								<p>
									<form:input style="width: 90%;" path="fullname" class="form-control" />
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<p>Điện thoại:</p>
							</div>
							<div class="col-sm-8">
								<p>
									<form:input style="width: 90%;" path="telephone" class="form-control" />
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<p>Email:</p>
							</div>
							<div class="col-sm-8">
								<p>
									<form:input style="width: 90%;" path="email" class="form-control"/>
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4"></div>
							<div class="col-sm-8">
								<form:hidden path="password" />
								<form:hidden path="activated" />
								<form:hidden path="admin" />
								<button class="btn btn-success" style="width: 90%;">Cập nhật</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
<br/>

<style>
.dang-nhap{
	background-color: white;
	padding: 30px 120px;
	margin: 0 auto;
	width: 60%;
}
</style>




