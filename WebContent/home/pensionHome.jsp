<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp" %>
		
		<title>Let's Pension</title>

		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <meta name="author" content="">
		
		<!-- Bootstrap core CSS -->
	    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	    <!-- Custom fonts for this template -->
	    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">
	    <link href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
	    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	
	    <!-- Custom styles for this template -->
	    <link href="css/coming-soon.min.css" rel="stylesheet">
	</head>
	
	<body>
		<table>
         <tr>
            <th> <jsp:include page="pensionHeader.jsp" flush="false"/> </th>	
			<th> <jsp:include page="pensionMenu.jsp" flush="false"/> </th>
         </tr>
		</table>
    	
    	<%-- <jsp:include page="pensionMain.jsp" flush="false"/> --%>  
		<div class="masthead">
			
			<div class="container h-100">
				<div class="row h-100">
					<div class="col-12 my-auto">
						<div class="masthead-content text-white py-5 py-md-0">
							<h1 class="mb-3">Coming Soon!</h1>
							<p class="mb-5">
								We're working hard to finish the development of this site. Our
								target launch date is <strong>August 2018</strong>! Sign up for
								updates using the form below!
							</p>
							<div class="input-group input-group-newsletter">
								<input type="email" class="form-control"
									placeholder="Enter email..." aria-label="Search for...">
								<span class="input-group-btn">
									<button class="btn btn-secondary" type="button">Notify Me!</button>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<!-- Bootstrap core JavaScript -->
	    <script src="vendor/jquery/jquery.min.js"></script>
	    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	    <!-- Plugin JavaScript -->
	    <script src="vendor/vide/jquery.vide.min.js"></script>
	
	    <!-- Custom scripts for this template -->
	    <script src="js/coming-soon.min.js"></script>
		<%-- <%@include file="pensionMain.html" %>  --%>
		<%-- <jsp:include page="pensionMain.jsp" flush="false"/> --%>
		
	</body>
	<jsp:include page="pensionBottom.jsp" flush="false"/>
</html>
	