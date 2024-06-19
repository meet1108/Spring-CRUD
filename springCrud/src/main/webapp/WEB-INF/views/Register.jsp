<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>



<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/signup.css">

<link rel="stylesheet" type="text/css"
    href="<%=request.getContextPath()%>/css/virtual-select.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/virtual-select.min.js"></script>
 <link href="<c:url value="/css/virtual-select.min.css" />" rel="stylesheet">
 
 
 	<!-- --------External Scripts------ -->



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


	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
		crossorigin="anonymous"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/validation.js"></script>
 
<body>



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
									<h2 class="text-uppercase text-center mb-5">Create an
										account</h2>

									<form  method="post" id="myForm" action="Register" onsubmit="return submitForm()" enctype="multipart/form-data">


										<div class="form-outline mb-3">
											<label class="form-label" for="form3Example1cg">First
												Name</label> <input type="text" name="firstName" id="firstName"
												placeholder="Enter Your First Name "
												onkeyup="validateFirstName(this.value)"
												class="form-control form-control-lg" /><small
												id="FirstNameError" class="text-danger"> </small>
										</div>


										<div class="form-outline mb-3">
											<label class="form-label" for="form3Example1cg">Last
												Name </label> <input type="text" name="lastName" id="lastName"
												placeholder="Enter Your Last Name "
												onkeyup="validateLastName(this.value)"
												class="form-control form-control-lg" /><small
												id="LastNameError" class="text-danger"> </small>
										</div>


										<div class="form-outline mb-3">
											<label class="form-label" for="form3Example3cg">Email
												ID</label> <input type="email" name="email" id="email"
												class="form-control form-control-lg"
												onkeyup="validateEmail(this.value)"
												placeholder="Enter Your Email Address " /><small
												id="EmailError" class="text-danger"></small>
										</div>


										<div class="form-outline mb-3">
											<label class="form-label" for="form3Example4cg">Password</label>
											<input type="password" name="password" id="password"
												class="form-control form-control-lg"
												onkeyup="validatePassword(this.value)"
												placeholder="Enter Your Password " /><small
												id="PasswordError" class="text-danger"></small>
										</div>


										<div class="form-outline mb-3">
											<label class="form-label" for="form3Example4cg">Date
												Of Birth</label> <input type="date" name="dob" id="dob"
												
												class="form-control form-control-lg" /><small id="DobError"
												class="text-danger"></small>
										</div>


										<div class="form-outline mb-3">
											<label class="form-label" for="form3Example4cg">Mobile
												Number</label> <input type="tel" name="mobileNumber"
												id="mobileNumber" class="form-control form-control-lg"
												onkeyup="validateMobileNumber(this.value)"
												placeholder="Enter Your Mobile Number " /><small
												id="MobileNumberError" class="text-danger"></small>
												
										</div>



										<div class="form-outline mb-3">
											<h6 class="mb-0 me-4">Gender</h6>

											<div class="form-check form-check-inline mb-0 me-4">
												<input class="form-check-input" type="radio" name="gender"
													id="gender" value="Male" /> <label
													class="form-check-label" for="maleGender">Male</label>
											</div>

											<div class="form-check form-check-inline mb-0 me-4">
												<input class="form-check-input" type="radio" name="gender"
													id="gender" value="Female" /> <label
													class="form-check-label" for="femaleGender">Female</label>
											</div>

											<div class="form-check form-check-inline mb-0">
												<input class="form-check-input" type="radio" name="gender"
													id="gender" value="Other" /> <label
													class="form-check-label" for="otherGender">Other</label>
											</div>
												<small id="radioError" class="text-danger"></small>
										</div>


 
										<div class="form-outline mb-3">
                                            <h6 class="mb-0 me-4">Title</h6>
                                            <div class="form-check form-check-inline mb-0">
                                                <input class="form-check-input" type="radio" name="title"
                                                    id="mr" value="Mr." /> <label class="form-check-label"
                                                    for="otherGender">Mr.</label>
                                            </div>
                                            <div class="form-check form-check-inline mb-0">
                                                <input class="form-check-input" type="radio" name="title"
                                                    id="mrs" value="Mrs." /> <label class="form-check-label"
                                                    for="otherGender">Mrs.</label>
                                            </div>
                                            <div class="form-check form-check-inline mb-0">
                                                <input class="form-check-input" type="radio" name="title"
                                                    id="miss" value="Miss." /> <label class="form-check-label"
                                                    for="otherGender">Miss.</label>
                                            </div>

                                            <div class="form-check form-check-inline mb-0">
                                                <input class="form-check-input" type="radio" name="title"
                                                    id="mx" value="Mx." /> <label class="form-check-label"
                                                    for="otherGender">Mx.</label>
                                            </div>

                                        </div>


                                        <script>
                                            $(document).ready(function() {
                                                                $('input[name="gender"]').change(function() {
                                                                        var selectedGender = $('input[name="gender"]:checked').val();

                                                                                     if (selectedGender === 'Male') {
                                                                                        $('#mr').prop('checked',true);
                                                                                    }
                                                                                    if (selectedGender === 'Female') {
                                                                                        $('#mrs').prop('checked',true);
                                                                                    }
                                                                                    if (selectedGender === 'Other') {
                                                                                        $('#mx').prop('checked',true);
                                                                                    }
                                                                                });
                                                            });
                                        </script> 



										 <div>

											<h6 class="mb-1 me-4">Select Your Langauge</h6>
											<select id="multipleSelect" multiple name="langauge"
												placeholder="Select" data-search="false"
												data-silent-initial-value-set="true">
												<option value="English">English</option>
												<option value="Hindi">Hindi</option>
												<option value="Gujarati">Gujarati</option>
												<option value="Spanish">Spanish</option>
												<option value="German">German</option>
												<option value="Marathi">Marathi</option>
												<option value="Bengali">Bengali</option>
												</select><br> <small id="LanguageError" class="text-danger"></small>
										</div>
										<script type="text/javascript">
											VirtualSelect.init({
												ele : '#multipleSelect'
											});
										</script> 



										


										<div class="form-outline mb-3 mt-3">
											<h6 class="mb-1 me-4">Your Hobbies</h6>

											<div class="form-check form-check-inline">
												<input class="form-check-input" type="checkbox" name="hobby"
													id="hobby" value="OutDoorGames" /> <label
													class="form-check-label" for="inlineCheckbox1">OutDoor
													Games</label>
											</div>

											<div class="form-check form-check-inline">
												<input class="form-check-input" type="checkbox" name="hobby"
													id="hobby" value="InDoorGames" /> <label
													class="form-check-label" for="inlineCheckbox2">InDoor
													Games</label>
											</div>
											<br> <small id="HobbyError" class="text-danger"></small>
										</div>



										<div class=" country-container">

											<h6 class="mb-1 me-3">Select Your country</h6>
											<select class="countries" name="country" id="country">
												<option value="select">---Select---</option>
												<option value="United States">United States</option>
												<option value="Canada">Canada</option>
												<option value="Mexico">Mexico</option>
												<option value="Brazil">Brazil</option>
												<option value="Argentina">Argentina</option>
												<option value="United Kingdom">United Kingdom</option>
												<option value="France">France</option>
												<option value="Germany">Germany</option>
												<option value="Italy">Italy</option>
												<option value="Spain">Spain</option>
												<option value="Russia">Russia</option>
												<option value="China">China</option>
												<option value="Japan">Japan</option>
												<option value="South Korea">South Korea</option>
												<option value="India">India</option>
												<option value="Australia">Australia</option>
												<option value="South Africa">South Africa</option>
												<option value="Saudi Arabia">Saudi Arabia</option>
												<option value="Egypt">Egypt</option>
											</select> <small id="countryError" class="text-danger"></small>
											
										</div>


										 <div class="input-group mt-4 mb-3">
											<h6 class="mb-1 mr-2 me-3">Upload image</h6>
											<input type="file" class="form-control" name="image"
												id="image"><small id="ImageError"
												class="text-danger"></small>
										</div> 


										<div class="d-flex justify-content-center">
											<button type="submit" name="Register" id="Register"
												class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Register</button>
										</div>

										 <div class="d-flex justify-content-center mt-2">
											<a type="button" name="button" href="Login"
												class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Login</a>
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

<!--#===========================================================Validation==============================================================  #-->
<script>
		//validate first name
		function validateFirstName(value) {
			var errorElement = document.getElementById("FirstNameError");

			errorElement.innerText = "";

			// Check for empty value
			if (!value) {
				errorElement.innerText = "Please enter your first name.";
				return false;
			}

			// Check for numeric value
			if (!isNaN(value)) {
				errorElement.innerText = "First name cannot contain numeric characters.";
				return false;
			}

			// Check for length less than 2
			if (value.length < 2) {
				errorElement.innerText = "First name must be at least 2 characters long.";
				return false;
			}

			// Check for special characters
			var regex = /^[a-zA-Z]*$/; // Regular expression to allow only alphabets and spaces
			if (!regex.test(value)) {
				errorElement.innerText = "First name contains Alphabates only.";
				return false;
			}

			errorElement.innerText = "";

			return true;

		}

		//validate last name
		function validateLastName(value) {
			var errorElement = document.getElementById("LastNameError");

			errorElement.innerText = "";

			// Check for empty value
			if (!value) {
				errorElement.innerText = "Please enter your Last name.";
				return false;
			}

			// Check for numeric value
			if (!isNaN(value)) {
				errorElement.innerText = "Last name cannot contain numeric characters.";
				return false;
			}

			// Check for length less than 2
			if (value.length < 2) {
				errorElement.innerText = "Last name must be at least 2 characters long.";
				return false;
			}

			// Check for special characters
			var regex = /^[a-zA-Z]*$/;
			if (!regex.test(value)) {
				errorElement.innerText = "Last name contains Alphabates only.";
				return false;
			}
			errorElement.innerText = "";

			return true;
		}
		
		
		//validation Email
		function validateEmail(Email) {

			var EmailError = document.getElementById("EmailError");
			EmailError.innerText = "";

			if (!Email) {
				EmailError.innerText = "Please enter your Email";
				return false;
			}
			var regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
			if (!regex.test(Email)) {
				EmailError.innerText = "Please Enter Valid Email!! (exp:aaa@ass.asa)";
				return false;
			}

			EmailError.innerText = "";
			return true;

		}

		
		//validation Password

		function validatePassword(Password) {
			var PasswordError = document.getElementById("PasswordError");
			PasswordError.innerText = "";

			if (!Password) {
				PasswordError.innerText = "Please enter your Password.";
				return false;
			}
			if (Password.length === 0) {
				PasswordError.innertext = "Please enter the Password!";
				return false;
			}
			var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!*?&])[A-Za-z\d@$!*?&]{8,}$/;
			if (!regex.test(Password)) {
				PasswordError.innerText = "Please Enter Valid Password!!";
				return false;
			}
			PasswordError.innerText = "";
			return true;
		}

		
		
		//validation dob
		$(document).ready(function() {

			validateDOB();

			$('#dob').change(validateDOB);

			$('#dob').attr('max', function() {
				return new Date().toISOString().split('T')[0];
			});
		});

		function validateDOB() {
			var dob = $('#dob').val();
			var errorElement = $('#DobError');

			if (!dob) {

				errorElement.text("Date of birth is required.");
				return false;
			}

			errorElement.text("");
			return true;
		}

		//Validation Mobile Number

		function validateMobileNumber(MobileNumber) {

			var MobileNumberError = document.getElementById("MobileNumberError");
			MobileNumberError.innerText = "";

			if (!MobileNumber) {
				MobileNumberError.innerText = "Please enter your Mobile Number!!";
				return false;
			}
			var regex = /^[6-9]\d{9}$/;

			if (!regex.test(MobileNumber)) {
				MobileNumberError.innerText = "Please Enter Valid Mobile Number!!";
				return false;
			}

			MobileNumberError.innerText = "";
			return true;
		}

		//validation Gender

		function validateGender() {
			var isChecked = $("input[name='gender']:checked").length > 0;
			if (!isChecked) {
				$('#radioError').text("Please select a gender.");
				return false;
			}
			$('#radioError').text("");
			return true;
		}
		$("input[name='gender']").change(validateGender);
		validateGender();

		
		
		//validation langauge

		$(document).ready(function() {
			validateLanguage();
		});

		$('#multipleSelect').change(validateLanguage);
		function validateLanguage() {
			var selectedValues = $('#multipleSelect').val();
			var errorElement = $('#LanguageError');

			if (selectedValues === null || selectedValues.length === 0) {
				errorElement.text("Please select at least one language.");
				return false;
			}
			errorElement.text("");
			return true;
		}

		//validate Hobbies
		$(document).ready(function() {
			validateHobbies();
		});

		$('input[type="checkbox"][name="hobby"]').change(validateHobbies);

		function validateHobbies() {
			var selectedCheckboxes = $('input[type="checkbox"][name="hobby"]:checked');
			var errorElement = $('#HobbyError');

			if (selectedCheckboxes.length === 0) {
				errorElement.text("Please select at least one hobby.");
				return false;
			}
			errorElement.text("");
			return true;
		}

		//validation country
		document.addEventListener("DOMContentLoaded", function() {
			validateCountry();
		});

		function validateCountry() {
			var selectedOption = document.getElementById("country").value;
			var errorElement = document.getElementById("countryError");

			if (selectedOption === "select") {
				errorElement.innerText = "Please select a country.";
				return false;
			}
			errorElement.innerText = "";
			return true;
		}

		document.getElementById("country").addEventListener("change",
				validateCountry);

		
		
		//Image validation

		$(document).ready(function() {
			$('#image').change(validateImage);
		});

		function validateImage() {
			var selectedFile = document.getElementById('image').files[0];
			var errorElement = $('#ImageError');

			if (!selectedFile) {
				errorElement.text("Please select an image.");
				return false;
			}
			errorElement.text("");
			return true;
		}
		function submitForm() {

			var isValid = true;
			isValid = validateFirstName(document.getElementById("firstName").value)
					&& isValid;
			isValid = validateLastName(document.getElementById("lastName").value)
					&& isValid;
			isValid = validateEmail(document.getElementById("email").value)
					&& isValid;
			isValid = validatePassword(document.getElementById("password").value)
					&& isValid;
			isValid = validateDOB() && isValid;
			isValid = validateMobileNumber(document.getElementById("mobileNumber").value)
					&& isValid;
			isValid = validateGender() && isValid;
			isValid = validateLanguage() && isValid;
			isValid = validateHobbies() && isValid;
			isValid = validateCountry() && isValid;
			isValid = validateImage() && isValid;

			// If all validations pass, submit the form
			if (isValid) {
                 
				return true;
				//document.getElementById("myForm").submit();
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