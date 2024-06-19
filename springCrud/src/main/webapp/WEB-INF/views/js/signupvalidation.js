
/*function isValidPassword(password) {
    // Password should have at least one uppercase, one lowercase, one special character,
    // one numeric, and a minimum length of 8 characters.
    var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    return passwordRegex.test(password);
}*/

$('form').submit(function(event) {
    // Prevent the form from submitting if validation fails
    if (!validateForm()) {
        event.preventDefault();
        $('#myalert').removeClass('d-none');
    }
});

function validateForm() {
    // Validate First Name
    var fname = $('#fname').val();
    if (fname.trim() < 2) {
        //alert('First Name is required');
        $('#myalert').text('Please Enter First name');
        return false;
    }

    var lname = $('#lname').val();
    if (lname.trim() < 3) {
        //alert('First Name is required');
        $('#myalert').text('Please Enter Last name');
        return false;
    }

    var email = $('#email').val().trim();
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (email === '' || !emailRegex.test(email)) {
        $('#myalert').text('Please enter a valid email address. (Exp: abc@abc.abc) ');
        return false;
    }
     var password = $('#password').val();
    if (!isValidPassword(password)) {
        $('#myalert').text('Please enter a valid password.(Exp: One UpperCase, One LowerCase, One Special charactor, One numeric value, Minimum Length 8)');
        return false;
    }
}
