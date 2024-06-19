<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.Base64"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
<link rel="stylesheet"
	href="https://cdn.datatables.net/2.0.1/css/dataTables.dataTables.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://cdn.datatables.net/2.0.1/js/dataTables.js"></script>
<script>
	$('#example').DataTable()
</script>

</head>
<body>


	<table id="example" class="display" style="width: 100%">
		<thead>
			<tr>
				<th>Title</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Date of Birth</th>
				<th>Gender</th>
				<th>Country</th>
				<th>Langauge</th>
				<th>Hobby</th>
				<th>Mobile Number</th>
				<th>Action</th>

			</tr>
		</thead>

		<tbody>
			<c:forEach items="${showAllUsers}" var="user">
				<tr>
					<td> ${user.getTitle()}</td>
					<td> ${user.getFirstName()}</td>
					<td> ${user.getLastName()}</td>
					<td> ${user.getDob()}</td>
					<td> ${user.getGender()}</td>
					<td> ${user.getCountry()}</td>
					<td> ${user.getLangauge()}</td>
					<td> ${user.getHobby()}</td>
					<td> ${user.getMobileNumber()}</td>
					<td><img  style="width: 100px; height: auto; border: 1px solid black;"src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(user.getImage())}" alt="Image" /></td>
						
					<td><a class="btn btn-outline-primary"
							href="adminupdate/${user.getUserId()}" role="button">Edit</a></td>
						<td><a type="button" class="btn btn-outline-danger"
							id="delete" data-toggle="modal" data-target="#confirmationModal"
							onclick="openConfrimationModal(${user.getUserId()})">Delete</a></td>
				</tr>
			</c:forEach>


		</tbody>
	</table>
	
	
	<div class="modal" id="confirmationModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Confirm Deletion</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal Body -->
				<div class="modal-body">Are you sure you want to delete this
					user?</div>
				<!-- Modal Footer -->
				<div class="modal-footer">
					<!-- Confirm Button -->
					<button type="button" class="btn btn-danger" onclick="deleteUser()">Yes</button>
					<!-- Close Button -->
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">No</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
var userIdToDelete;

function openConfrimationModal(userId){
	userIdToDelete = userId;
	$('#confirmationModal').modal('show');
}

function deleteUser(){
	$.ajax({
		type: 'POST',
		url: 'delete',
		data: {userId: userIdToDelete },
		success: function(resp){
			location.reload();   
		    
		    
		},
		error: function(xhr, status, error) {
            // Handle error response
			Swal
            .fire({
                icon : "error",
                title : "Oops...",
                text : "Something Went Wrong.",
            });
		}
	});
	$('#confirmationModal').modal('hide');
	
}
</script>
	<div class="d-flex justify-content-center mt-3">
		<a
			class="btn btn-success btn-lg gradient-custom-4 text-body"
			href="Logout" role="button">Logout</a>

	</div>
</body>
</html>