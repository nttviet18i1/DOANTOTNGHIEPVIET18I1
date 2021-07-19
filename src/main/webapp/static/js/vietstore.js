$(document).ready(function(){
	
	$(".btn-add-to-cart").click(function(){
		
		var id = $(this).closest("div").attr("data-id");
		
		$.ajax({
			url:"/cart/add/"+id,
			success:function(response){
				$("#cart-cnt").html(response[0]);
				$("#cart-amt").html(response[1]);
			}
			});
			
		var img= $(this).closest("div").find("a>img");
		alert(img.attr("src"));
		
	});
	
	
	
	//email send
	$(".btn-send").click(function() {
		var form={
		 id: $("#myModal #id").val(),
		 to: $("#myModal #sender").val(),
		 body: $("#myModal #comments").val(),
		 from: $("#myModal #email").val()
		}
		$.ajax({
			url:"/product/send-to-friend",
			data:form,
			type:'post',
			success: function(response){
				if(response){
					$("[data-dismiss]").click();
					alert("phản hồi thành công !")
				}
				else{
					alert("lỗi gửi  mail")
			}
			}
		})
	});
		
	});
	$(".btn-star").click(function(){
	var id=$(this).closest("div").attr("data-id")
		$.ajax({
			url:"/product/add-to-favo/"+id,
			success:function(response){
			if(response){
				alert("Đã thêm sản phẩm yêu thích thành công !")
			}
			else{
				alert(" Sản phẩm yêu thích đã tồn tại!")
			 }
			}
		})
	})
});
			
