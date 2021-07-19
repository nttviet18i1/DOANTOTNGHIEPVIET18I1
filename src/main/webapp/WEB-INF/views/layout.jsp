<%@ page  pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="titles" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Vietstore</title>
 <titles:insertAttribute name="head"></titles:insertAttribute>

 
 
  
</head>
<body>

<div class="container">
  <header class="row">
 		<h1>VietStore</h1> 
  </header>
  
  <nav class="row">
  
   <titles:insertAttribute name="menu"></titles:insertAttribute>
  
  
  </nav>
  
  <div class="row">
  
  <article class="col-sm-9">
    <titles:insertAttribute name="body"></titles:insertAttribute>
  	
  </article>
  <aside class="col-sm-3">
  
   <titles:insertAttribute name="aside"></titles:insertAttribute>

  </aside>
  
  </div>
  <footer class="row">
   <titles:insertAttribute name="footer"></titles:insertAttribute>
  
  	 
  </footer>
 
  
  
</div>

</body>
</html>