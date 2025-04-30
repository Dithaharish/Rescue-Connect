<?php
$entered_password = 'admin123'; // The password entered in the login form
$hashed_password_from_db = '$2y$10$OyIRu8BCFXabGi4crIvdpuSQPRmVyxAbkzvYhudpiYoZkYbFxM2Le'; // The hashed password from the DB

// Check if the entered password matches the hashed password
if (password_verify($entered_password, $hashed_password_from_db)) {
    echo "Password is correct!";
} else {
    echo "Password is incorrect!";
}
?>
