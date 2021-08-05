<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<c:forEach var="p" items="${list}">

	<div class="col-sm-4">
		<div class="thumbnail">
			<a href="/product/detail/${p.id}"> 
			<img  class="vietstore-prod" src="/static/images/products/${p.image}"></a>

			<div class="caption">
			<div class="pull-center text-center"  data-id= "${p.id}">

				<p>${p.name}</p>
				<p style="color: red">
			
					<f:formatNumber value="${p.unitPrice }" pattern="#,##.00" />
					VNĐ
				</p>
				<button class="btn btn-sm btn-danger btn-add-to-cart ">
					<i class="glyphicon glyphicon-shopping-cart "></i>
				</button>
				<button class="btn btn-sm btn-warning btn-star">
					<i class="glyphicon glyphicon-star"></i>
				</button>
				<button class="btn btn-sm btn-success btn-open-dialog" data-toggle="modal" data-target="#myModal">

					<i class="glyphicon glyphicon-envelope"></i>
				</button>

			</div>
		</div>
	</div>
	</div>


</c:forEach>
<jsp:include page="dialog.jsp"/>