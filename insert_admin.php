<?php
session_start();
include 'connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $role = $_POST['role'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Common Login for Admin, Volunteer, Citizen, Authority
    $stmt = $conn->prepare("SELECT id, name, password FROM users WHERE email = ? AND role = ?");
    $stmt->bind_param("ss", $email, $role);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows == 1) {
        $stmt->bind_result($id, $name, $hashed_password);
        $stmt->fetch();

        // Debugging lines to see the hashed password and entered password
        echo "Hashed password in DB: " . $hashed_password . "<br>";  // Print hashed password from DB
        echo "Entered password: " . $password . "<br>";  // Print entered password

        // Check password using password_verify
        if (password_verify($password, $hashed_password)) {
            $_SESSION['user_id'] = $id;
            $_SESSION['user_name'] = $name;
            $_SESSION['user_role'] = $role;

            // Redirect based on the role
            switch($role) {
                case 'admin':
                    $_SESSION['admin_logged_in'] = true;
                    header("Location: admin_dashboard.php");
                    break;
                case 'volunteer':
                    header("Location: volunteer_dashboard.php");
                    break;
                case 'citizen':
                    header("Location: donor_dashboard.php");
                    break;
                case 'authority':
                    header("Location: authority_dashboard.php");
                    break;
            }
            exit();
        } else {
            echo "<script>alert('Invalid password!'); window.location.href='../login.html';</script>";
        }
    } else {
        echo "<script>alert('User not found or role mismatch!'); window.location.href='../login.html';</script>";
    }
    $stmt->close();
}
$conn->close();
?>
