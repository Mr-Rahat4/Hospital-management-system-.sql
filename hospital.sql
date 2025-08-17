create database Hospital ;
use Hospital;

create table Patient (
	patient_id int primary key ,
    name varchar(50),
    age int ,
    gender varchar(50) ,
    city varchar(50)
);

create table Doctors(
	doctor_id int primary key ,
    name varchar(50),
    specialization varchar(50),
    fee float 
);
drop table Appointment;
create table Appointment (
	appointment_id int primary key,
    patient_id int ,
    doctor_id int,
    appointment_data date,
    foreign key (patient_id) references Patient(patient_id),
    foreign key (doctor_id) references Doctors(doctor_id)
);

create table Departments(
	department_id int  primary key,
    name varchar(60),
    floor varchar(50)
);

create table Medication (
	med_id int primary key ,
    patient_id int ,
    medicine_name varchar (50),
    dosage int,
    foreign key (patient_id) references Patient(patient_id)
    );
    
    INSERT INTO Patient (patient_id, name, age, gender, city) VALUES
(1,'Alice',30,'Female','Dhaka'),
(2,'Bob',45,'Male','Chittagong'),
(3,'Charlie',28,'Male','Dhaka'),
(4,'Diana',35,'Female','Khulna'),
(5,'Eva',50,'Female','Rajshahi'),
(6,'Frank',40,'Male','Sylhet'),
(7,'Grace',33,'Female','Dhaka'),
(8,'Hassan',38,'Male','Barishal'),
(9,'Ivy',29,'Female','Chittagong'),
(10,'Jack',55,'Male','Dhaka');

INSERT INTO Doctors (doctor_id, name, specialization, fee) VALUES
(1,'Dr. Karim','Cardiology',5000),
(2,'Dr. Rahim','Neurology',6000),
(3,'Dr. Sumi','Orthopedics',4000),
(4,'Dr. Rafi','Dermatology',3500),
(5,'Dr. Lima','Pediatrics',4500),
(6,'Dr. Tanvir','ENT',3000),
(7,'Dr. Shaila','Gastroenterology',5500),
(8,'Dr. Omar','Psychiatry',5000),
(9,'Dr. Nabila','Oncology',7000),
(10,'Dr. Zia','General Surgery',4000);

INSERT INTO Appointment (appointment_id, patient_id, doctor_id, appointment_data ) VALUES
(101,1,1,'2025-08-01'),
(102,2,2,'2025-08-02'),
(103,3,3,'2025-08-03'),
(104,4,4,'2025-08-04'),
(105,5,5,'2025-08-05'),
(106,6,6,'2025-08-06'),
(107,7,7,'2025-08-07'),
(108,8,8,'2025-08-08'),
(109,9,9,'2025-08-09'),
(110,10,10,'2025-08-10');


INSERT INTO Departments (department_id, name, floor) VALUES
(201,'Cardiology','1st'),
(202,'Neurology','2nd'),
(203,'Orthopedics','3rd'),
(204,'Dermatology','4th'),
(205,'Pediatrics','1st'),
(206,'ENT','2nd'),
(207,'Gastroenterology','3rd'),
(208,'Psychiatry','4th'),
(209,'Oncology','5th'),
(210,'General Surgery','1st');

INSERT INTO Medication (med_id, patient_id, medicine_name, dosage) VALUES
(301,1,'Paracetamol',500),
(302,2,'Aspirin',100),
(303,3,'Amoxicillin',250),
(304,4,'Ibuprofen',200),
(305,5,'Metformin',500),
(306,6,'Omeprazole',20),
(307,7,'Atorvastatin',10),
(308,8,'Captopril',25),
(309,9,'Losartan',50),
(310,10,'Lisinopril',10);


select 
from Patient where city='Dhaka';

select  from Doctors where fee5000;

SELECT 
    a.appointment_id,
    a.appointment_data,
    p.name AS patient_name,
    d.name AS doctor_name
FROM Appointment a
JOIN Patient p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id;


select d.name as dorctor_name , count(a.patient_id) as patient_count 
from Appointment a 
JOIN Patient p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
group by d.doctor_id,d.name
order by patient_count;


SELECT 
    p.name AS patient_name,
    m.medicine_name,
    m.dosage
FROM Medication m
JOIN Patient p ON m.patient_id = p.patient_id
ORDER BY p.name;

