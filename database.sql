-- Database: rescue_connect

-- Table structure for table `alerts`
CREATE TABLE IF NOT EXISTS `alerts` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255),
    `message` TEXT,
    `date_created` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `campaigns`
CREATE TABLE IF NOT EXISTS `campaigns` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255),
    `description` TEXT,
    `start_date` DATE,
    `end_date` DATE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `disasters`
CREATE TABLE IF NOT EXISTS `disasters` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `type` VARCHAR(100),
    `location` VARCHAR(255),
    `date_reported` DATE,
    `severity` VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `donations`
CREATE TABLE IF NOT EXISTS `donations` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `donor_name` VARCHAR(100),
    `amount` DECIMAL(10, 2),
    `donation_type` VARCHAR(100),
    `donation_date` DATETIME,
    `campaign_id` INT,
    `payment_method` VARCHAR(50),
    `donor_email` VARCHAR(255),
    `donation_message` TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `donors`
CREATE TABLE IF NOT EXISTS `donors` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100),
    `email` VARCHAR(255),
    `password` VARCHAR(255),
    `phone` VARCHAR(20),
    `address` TEXT,
    `registration_date` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `events`
CREATE TABLE IF NOT EXISTS `events` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255),
    `description` TEXT,
    `event_date` DATE,
    `location` VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `mental_health_requests`
CREATE TABLE IF NOT EXISTS `mental_health_requests` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT,
    `description` TEXT,
    `status` VARCHAR(50),
    `submitted_at` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `notifications`
CREATE TABLE IF NOT EXISTS `notifications` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT,
    `message` TEXT,
    `status` VARCHAR(20),
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `reports`
CREATE TABLE IF NOT EXISTS `reports` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `report_type` VARCHAR(100),
    `description` TEXT,
    `submitted_by` INT,
    `submitted_at` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `resources`
CREATE TABLE IF NOT EXISTS `resources` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `type` VARCHAR(100),
    `quantity` INT,
    `location` VARCHAR(255),
    `status` VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `support_messages`
CREATE TABLE IF NOT EXISTS `support_messages` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100),
    `email` VARCHAR(255),
    `subject` VARCHAR(255),
    `message` TEXT,
    `status` VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `tasks`
CREATE TABLE IF NOT EXISTS `tasks` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255),
    `description` TEXT,
    `assigned_to` INT,
    `status` VARCHAR(50),
    `due_date` DATE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `users`
CREATE TABLE IF NOT EXISTS `users` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100),
    `email` VARCHAR(255),
    `password` VARCHAR(255),
    `role` VARCHAR(50),
    `location` VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
