<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Base64"%>


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



<link rel="stylesheet" type="text/css" href="/css/signup.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/virtual-select.min.css">



<!-- js  -->
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
	src="<%=request.getContextPath()%>/js/multivalue.js"></script>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/virtual-select.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<meta charset="ISO-8859-1">
<title>Profile</title>
</head>
<body>


<%-- 
	
<c:set var="Flag1" value="${sessionScope.Flag1}"></c:set>
<c:if test="${Flag1==true }">
<script> Swal.fire({
    icon : "success",
    title : "Login Successfully!!",
    text : "Thanks For Login.",
    
});</script>
</c:if>

<c:set var="Flag2" value="${sessionScope.Flag2}"></c:set>
<c:if test="${Flag2==true }">
<script> Swal.fire({
    icon : "success",
    title : "Upadate Successfully!!",
    text : "Thanks For Update your Profile.",
    
});</script>
</c:if>
 --%>


<c:set var="users" value="${users}"></c:set>
	<div>
		<section class="vh-100 bg-image"
			style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
			<div class="mask d-flex align-items-center h-100 gradient-custom-3">
				<div class="container h-100">
					<div
						class="row d-flex justify-content-center align-items-center h-100">
						<div class="col-12 col-md-9 col-lg-7 col-xl-6">
							<div class="card" style="border-radius: 15px;">
								<div class="card-body p-5">
									<h2 class="text-uppercase text-center mb-5">Profile Page</h2>


									<form  method="get" enctype="multipart/form-data" >


										<div class="form-outline mb-3">
											<label class="form-label" for="form3Example1cg">First
												Name</label> <input type="text" name="FirstName" id="FirstName"
												class="form-control form-control-lg"
												value="${users.getFirstName() }" disabled />
										</div>


										<div class="form-outline mb-3">
											<label class="form-label" for="form3Example1cg">Last
												Name</label> <input type="text" name="LastName" id="LastName"
												class="form-control form-control-lg"
												value="${users.getLastName() }" disabled />
										</div>


										<div class="form-outline mb-3">
											<label class="form-label" for="form3Example3cg">Email
												ID</label> <input type="email" name="Email" id="Email"
												class="form-control form-control-lg"
												value="${users.getEmail() }" disabled />
										</div>


										<div class="form-outline mb-3">
											<label class="form-label" for="form3Example4cg">Password</label>
											<input type="password" name="Password" id="Password"
												class="form-control form-control-lg"
												value="${users.getPassword() }" disabled />
										</div>


										<div class="form-outline mb-3">
											<label class="form-label" for="form3Example4cg">Date
												Of Birth</label> <input type="date" name="Dob" id="Dob"
												class="form-control form-control-lg"
												 value="${users.getDob() }" disabled/>
											

										</div>


										<div class="form-outline mb-3">
											<label class="form-label" for="form3Example4cg">Mobile
												Number</label> <input type="tel" name="MobileNumber" id="MobileNumber"
												class="form-control form-control-lg"
												value="${users.getMobileNumber() }" disabled />
										</div>


										<div class="form-outline mb-3">
											<h6 class="mb-0 me-4">Gender</h6>
											<div class="form-check form-check-inline mb-0 me-4">
												<input class="form-check-input" type="radio" name="Gender"
													id="Gender" value="Male"
													${ users.getGender().equals("Male") ? "checked" : "" }
													disabled> <label class="form-check-label"
													for="maleGender">Male</label>
											</div>
											<div class="form-check form-check-inline mb-0 me-4">
												<input class="form-check-input" type="radio" name="Gender"
													id="Gender" value="Female"
													${ users.getGender().equals("Female") ? "checked" : "" }
													disabled> <label class="form-check-label"
													for="femaleGender">Female</label>
											</div>
											<div class="form-check form-check-inline mb-0">
												<input class="form-check-input" type="radio" name="Gender"
													id="Gender" value="Other"
													${ users.getGender().equals("Other") ? "checked" : "" }
													disabled /> <label class="form-check-label"
													for="otherGender">Other</label>
											</div>
										</div>


										<div class="form-outline mb-3">
											<h6 class="mb-0 me-4">Title</h6>
											<div class="form-check form-check-inline mb-0">
												<input class="form-check-input" type="radio" name="Title"
													id="mr" value="Mr."
													${ users.getTitle().equals("Mr.") ? "checked" : "" }
													disabled> <label class="form-check-label"
													for="otherGender">Mr.</label>
											</div>
											<div class="form-check form-check-inline mb-0">
												<input class="form-check-input" type="radio" name="Title"
													id="mrs" value="Mrs."
													${ users.getTitle().equals("Mrs.") ? "checked" : "" }
													disabled><label class="form-check-label"
													for="otherGender">Mrs.</label>
											</div>
											<div class="form-check form-check-inline mb-0">
												<input class="form-check-input" type="radio" name="Title"
													id="miss" value="Miss."
													${ users.getTitle().equals("Miss.") ? "checked" : "" }
													disabled> <label class="form-check-label"
													for="otherGender">Miss.</label>
											</div>

											<div class="form-check form-check-inline mb-0">
												<input class="form-check-input" type="radio" name="Title"
													id="mx" value="Mx."
													${ users.getTitle().equals("Mx.") ? "checked" : "" }
													disabled><label class="form-check-label"
													for="otherGender">Mx.</label>
											</div>


										</div>


										<div>

											<h6 class="mb-1 me-4">Select Your Langauge</h6>
											<select id="multipleSelect" multiple name="Langauge"
												placeholder="Select" data-search="false"
												data-silent-initial-value-set="true" disabled>
												<option value="English"
													${users.getLangauge().contains("English") ? "selected" : "" }>English</option>
												<option value="Hindi"
													${users.getLangauge().contains("Hindi") ? "selected" : "" }>Hindi</option>
												<option value="Gujarati"
													${users.getLangauge().contains("Gujarati") ? "selected" : "" }>Gujarati</option>
												<option value="Spanish"
													${users.getLangauge().contains("Spanish") ? "selected" : "" }>Spanish</option>
												<option value="German"
													${users.getLangauge().contains("German") ? "selected" : "" }>German</option>
												<option value="Marathi"
													${users.getLangauge().contains("Marathi") ? "selected" : "" }>Marathi</option>
												<option value="Bengali"
													${users.getLangauge().contains("Bengali") ? "selected" : "" }>Bengali</option>

											</select>
										</div>
										<script type="text/javascript">
											VirtualSelect.init({
												ele : '#multipleSelect'
											});
										</script>


										<div class="form-outline mb-3 mt-3">
											<h6 class="mb-1 me-4">Your Hobbies</h6>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="checkbox" name="Hobby"
													id="hobby1" value="OutDoor Games"
													${users.getHobby().contains("OutDoorGames") ? "checked" : "" }
													disabled> <label
													class="form-check-label" for="inlineCheckbox1">OutDoor
													Games</label>
											</div>

											<div class="form-check form-check-inline">
												<input class="form-check-input" type="checkbox" name="Hobby"
													id="hobby2" value="InDoor Games"
													${users.getHobby().contains("InDoorGames") ? "checked" : "" }
													disabled> <label
													class="form-check-label" for="inlineCheckbox2">InDoor
													Games</label>
											</div>
										</div>




										<div class=" country-container" style="">

											<h6 class="mb-1 me-3">Select Your country</h6>
											<select class="countries" name="Country" id="Country"
												disabled>
												<option>${users.getCountry()}</option>
											</select>
										</div>



										 <div class="input-group mt-4 mb-3">
											<h6 class="mb-1 mr-2 me-3">Upload image</h6>
											
											<img  style="width: 100px; height: auto; border: 1px solid black;" src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(users.getImage())}" alt="Image" />
											
											
										</div> 



										<div class="d-flex justify-content-center">
											<a	
												class="btn btn-success btn-block btn-lg gradient-custom-4 text-body"
												href="UserUpdate" role="button">Edit Your Profile</a>
										</div>
										<div class="d-flex justify-content-center mt-3">
											<a
												class="btn btn-success btn-block btn-lg gradient-custom-4 text-body"
												href="Logout" role="button">Logout</a>

										</div>


									</form>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>



	</div>

</body>
</html>