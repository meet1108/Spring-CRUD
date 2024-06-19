
    

/*function validateFname(firstname) {
    var fnameError = document.getElementById("fnameError");
    var regex = /^[a-zA-Z]{2,}$/; // Regex for at least 2 alphabetic characters only
    var regex2 = /^[0-9]+$/;
    var regex3 = /^[^a-zA-Z0-9]+$/;

    if (firstname.length === 0) {
        fnameError.innerText = "can not be empty";
        return false;
    }
    else if (regex2.test(firstname)) {
        fnameError.innerText = "can not contain digits";
        return false;
    }
    else if (regex3.test(firstname)) {
        fnameError.innerText = "can not contain special characters";
        return false;
    }
    else if (!regex.test(firstname)) {
        fnameError.innerText = "firstname must be at least 2 characters long and contain only alphabetic characters.";
        return false;
    }
    else {
        fnameError.innerText = ""; // Clear error message
        return true;
    }
}
*/
/*function validateLname(lastname) {

    var lnameError = document.getElementById("lnameError");
    var regex = /^[a-zA-Z]{2,}$/; // Regex for at least 2 alphabetic characters only
    var regex2 = /^[0-9]+$/;
    var regex3 = /^[^a-zA-Z0-9]+$/;

    if (lastname.length === 0) {
        lnameError.innerText = "can not be empty";
    }
    else if (regex2.test(lastname)) {
        lnameError.innerText = "can not contain digits";
    }
    else if (regex3.test(lastname)) {
        lnameError.innerText = "can not contain special characters";
    }
    else if (!regex.test(lastname)) {
        lnameError.innerText = "Lastname must be at least 2 characters long and contain only alphabetic characters.";
    }
    else {
        lnameError.innerText = ""; // Clear error message
    }
}
*/
/*function validateEmail(email) {

    var EmailError = document.getElementById("EmailError");
    var regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (!regex.test(email)) {
        EmailError.innerText = "Please Enter Valid email!";
    } else {
        EmailError.innerText = "";
    }
}*/
/*
function validatePassword(password) {

    var PasswordError = document.getElementById("PasswordError");
    var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    if (password.length === 0) {
        PasswordError.innertext = "can not be empty!";
    } else if (!regex.test(password)) {
        PasswordError.innerText = "Please Enter Valid Password!!";
    } else {
        PasswordError.innerText = "";
    }

}
*/
/*
function validateMobileNumber(phone) {

    var PhoneError = document.getElementById("PhoneError");
    var regex = /^[0-9]{10}$/;

    if (!regex.test(phone)) {
        PhoneError.innerText = "Please Enter Valid Mobile Number!!";
    } else {
        PhoneError.innerText = "";
    }
}*/


/*
    function myform() {
        var a = document.forms.gender;
        for (i = 0; i < a.length; i++) {
            if (a[i].checked == true)
                return true;
            document.getElementById("radioError").innerText = "";
        }
        document.getElementById("radioError").innerText = "Please select the Gender!!";
        return false;
    }
*/


