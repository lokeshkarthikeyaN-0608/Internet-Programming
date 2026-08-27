document.getElementById('registrationForm').addEventListener('submit', function(event) { 

    event.preventDefault(); 

    getElementById('firstName').value.trim(); 

    const middleName = document.getElementById('middleName').value.trim(); 

    const lastName = document.getElementById('lastName').value.trim(); 

    const email = document.getElementById('email').value.trim(); 

    const password = document.getElementById('password').value.trim(); 

    const role = document.getElementById('role').value; 

    const experience = document.getElementById('experience').value; 

    const resumeInput = document.getElementById('resume'); 

 

    let isValid = true; 

    const namePattern = /^[A-Za-z\s]+$/; 

    const firstNameField = document.getElementById('firstName'); 

    const firstNameError = document.getElementById('firstNameError'); 

    if (firstName === '') { 

        setError(firstNameField, firstNameError, 'First name is mandatory.'); 

        isValid = false; 

    } else if (!namePattern.test(firstName)) { 

        setError(firstNameField, firstNameError, 'First name cannot contain numbers or special characters.'); 

        isValid = false; 

    } else { 

        setSuccess(firstNameField, firstNameError); 

    } 

    const middleNameField = document.getElementById('middleName'); 

    const middleNameError = document.getElementById('middleNameError'); 

    if (middleName !== '' && !namePattern.test(middleName)) { 

        setError(middleNameField, middleNameError, 'Middle name cannot contain numbers or special characters.'); 

        isValid = false; 

    } else { 

        setSuccess(middleNameField, middleNameError); 

    } 

    const lastNameField = document.getElementById('lastName'); 

    const lastNameError = document.getElementById('lastNameError'); 

    if (lastName === '') { 

        setError(lastNameField, lastNameError, 'Last name is mandatory.'); 

        isValid = false; 

    } else if (!namePattern.test(lastName)) { 

        setError(lastNameField, lastNameError, 'Last name cannot contain numbers or special characters.'); 

        isValid = false; 

    } else { 

        setSuccess(lastNameField, lastNameError); 

    } 

    const emailField = document.getElementById('email'); 

    const emailError = document.getElementById('emailError'); 

    const gmailPattern = /^[^\s@]+@gmail\.com$/i; 

    if (email === '') { 

        setError(emailField, emailError, 'Email address is mandatory.'); 

        isValid = false; 

    } else if (!gmailPattern.test(email)) { 

        setError(emailField, emailError, 'Please enter a valid Gmail address (e.g., name@gmail.com).'); 

        isValid = false; 

    } else { 

        setSuccess(emailField, emailError); 

    } 

    const passwordField = document.getElementById('password'); 

    const passwordError = document.getElementById('passwordError'); 

    if (password === '') { 

        setError(passwordField, passwordError, 'Password is mandatory.'); 

        isValid = false; 

    } else if (password.length < 6) { 

        setError(passwordField, passwordError, 'Password must be at least 6 characters long.'); 

        isValid = false; 

    } else { 

        setSuccess(passwordField, passwordError); 

    } 

    const roleField = document.getElementById('role'); 

    const roleError = document.getElementById('roleError'); 

    if (role === '') { 

        setError(roleField, roleError, 'Please select your role of work.'); 

        isValid = false; 

    } else { 

        setSuccess(roleField, roleError); 

    } 

    const experienceField = document.getElementById('experience'); 

    const experienceError = document.getElementById('experienceError'); 

    if (experience === '') { 

        setError(experienceField, experienceError, 'Please select your experience level.'); 

        isValid = false; 

    } else { 

        setSuccess(experienceField, experienceError); 

    } 

    const resumeError = document.getElementById('resumeError'); 

    if (resumeInput.files.length === 0) { 

        setError(resumeInput, resumeError, 'Resume upload is mandatory.'); 

        isValid = false; 

    } else { 

        const file = resumeInput.files[0]; 

        const allowedExtensions = /(\.pdf|\.doc|\.docx)$/i; 

        const maxSize = 5 * 1024 * 1024;  

        if (!allowedExtensions.exec(file.name)) { 

            setError(resumeInput, resumeError, 'Invalid file type. Only PDF, DOC, or DOCX are allowed.'); 

            isValid = false; 

        } else if (file.size > maxSize) { 

            setError(resumeInput, resumeError, 'File size exceeds 5MB limit.'); 

            isValid = false; 

        } else { 

            setSuccess(resumeInput, resumeError); 

        } 

    } 

    if (isValid) { 

        alert('Registration successful! Form data is ready to be submitted.'); 

    } 

}); 

function setError(inputElement, errorElement, message) { 

    if (errorElement) errorElement.textContent = message; 

    inputElement.classList.add('invalid'); 

    inputElement.classList.remove('valid'); 

} 

function setSuccess(inputElement, errorElement) { 

    if (errorElement) errorElement.textContent = ''; 

    inputElement.classList.remove('invalid'); 

    inputElement.classList.add('valid'); 

} 

 

 
