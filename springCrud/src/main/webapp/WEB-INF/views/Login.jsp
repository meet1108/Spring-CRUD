<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<!-- Bootstrap  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">



<!-- <link rel="stylesheet" type="text/css" href="/css/admin.css"> -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/virtual-select.min.css">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/validation.js"></script>


<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/multivalue.js"></script>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/virtual-select.min.js"></script>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>

	<%-- <c:set var="flag" value="${sessionScope.flag}"></c:set>
 --%>
	<section class="vh-100 bg-image"
		style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
		<div class="mask d-flex align-items-center h-100 gradient-custom-3">
			<div class="container h-100">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-12 col-md-9 col-lg-7 col-xl-6">
						<div class="card" style="border-radius: 15px;">
							<div class="card-body p-5">
								<h2 class="text-uppercase text-center mb-5">Create an
									account</h2>

								<form id="myForm" action="Login" method="post" onsubmit="return submitForm()">

									<div class="form-outline mb-4">
										<label class="form-label" for="form3Example3cg">Your
											Email</label> <input type="email" name="email" id="form3Example3cg"
											class="form-control form-control-lg"
											onkeyup="validateEmail(this.value)" /> <small
											id="EmailError" class="text-danger"></small>
									</div>

									<div class="form-outline mb-4">
										<label class="form-label" for="form3Example4cg">Password</label>
										<input type="password" name="password" id="form3Example4cg"
											class="form-control form-control-lg"
											onkeyup="validatePassword(this.value)" /> <small
											id="PasswordError" class="text-danger"></small>

									</div>




									<div class="d-flex justify-content-center">
										<button type="submit" name="submit"
											class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Login</button>
									</div>

									<p class="text-center text-muted mt-5 mb-0">
										<a href="Register" class="fw-bold text-body">Create new
											Account</a>
									</p>
									<p class="text-center text-muted mt-3 mb-2">
										<a href="Forgot.jsp" class="fw-bold text-body">Forgot Your
											Password</a>
									</p>

								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!--#===========================================================Validation==============================================================  #-->

	<script>
		//validation Email
		function validateEmail(email) {

			var EmailError = document.getElementById("EmailError");
			EmailError.innerText = "";

			if (!email) {
				EmailError.innerText = "Please enter your Email";
				return false;
			}
			var regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
			if (!regex.test(email)) {
				EmailError.innerText = "Please Enter Valid Email!! (exp:aaa@ass.asa)";
				return false;
			}

			EmailError.innerText = "";
			return true;

		}

		//validation Password

		function validatePassword(password) {
			var PasswordError = document.getElementById("PasswordError");
			PasswordError.innerText = "";

			if (!password) {
				PasswordError.innerText = "Please enter your Password.";
				return false;
			}
			if (password.length === 0) {
				PasswordError.innertext = "Please enter the Password!";
				return false;
			}
			var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!*?&])[A-Za-z\d@$!*?&]{8,}$/;
			if (!regex.test(password)) {
				PasswordError.innerText = "Please Enter Valid Password!!";
				return false;
			}
			PasswordError.innerText = "";
			return true;
		}

		function submitForm() {

			var isValid = true;

			isValid = validateEmail(document.getElementById("email").value)
					&& isValid;
			isValid = validatePassword(document.getElementById("password").value)
					&& isValid;

			// If all validations pass, submit the form
			if (isValid) {

				return true;
				document.getElementById("myForm").submit();
			} else {

				Swal.fire({
					icon : "error",
					title : "Oops...",
					text : "Something went wrong!Please Check the Fields",
				});
				return false;

			}
		}
	</script>
</body>


</html>