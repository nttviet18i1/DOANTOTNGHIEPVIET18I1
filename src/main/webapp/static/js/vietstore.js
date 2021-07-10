$(document).ready(function(){
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
			
