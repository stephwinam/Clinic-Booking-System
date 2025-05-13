-- Clinic Booking System Database

-- 1. Patients Table
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- 2. Doctors Table
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100),
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- 3. Departments Table
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

-- 4. Doctor_Department Table
-- This models the many-to-many relationship between doctors and departments
CREATE TABLE Doctor_Department (
    doctor_id INT,
    department_id INT,
    PRIMARY KEY (doctor_id, department_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- 5. Appointments Table
-- This connects patients with doctors for a specific appointment date/time
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    reason TEXT,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Sample data (optional, comment/remove if not required)
-- INSERT INTO Departments (department_name) VALUES ('Cardiology'), ('Dermatology'), ('Neurology');
-- INSERT INTO Doctors (first_name, last_name, specialization, phone_number, email) VALUES 
-- ('John', 'Doe', 'Cardiologist', '1234567890', 'john.doe@clinic.com'),
-- ('Jane', 'Smith', 'Dermatologist', '0987654321', 'jane.smith@clinic.com');
