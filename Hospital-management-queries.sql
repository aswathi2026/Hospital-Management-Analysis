create database hospital_management;
use hospital_management;
show databases;
select * from patients;
select * from doctors;
select * from appointments limit 10;
select * from admissions limit 10;
select * from medical_records limit 10;
select * from appointments limit 10;
select * from billing limit 10;


select count(*) as total_patients from patients;
select count(*) as total_doctors from doctors;
select count(*) as total_appointments from appointments;
select count(*) as total_admissions from admissions;
select count(*) as total_medical_records from medical_records;
select count(*) as total_bills from billing;


select * from patients where patient_name is null or gender is null or age is null or blood_group is null or city is null or registration_date is null;
select * from doctors where doctor_name is null or department is null or experience_years is null or consultation_fee is null;
select * from appointments where patient_id is null or doctor_id is null or appointment_date is null or appointment_type is null or status is null;
select * from admissions where patient_id is null or doctor_id is null or admission_date is null or room_type is null or admission_type is null or length_of_stay is null;
select * from medical_records where patient_id is null or doctor_id is null or record_date is null or diagnosis is null or treatment is null;
select * from billing where patient_id is null or doctor_id is null or bill_date is null or service_type is null or amount is null or payment_method is null or payment_status is null;

select patient_id, count(*) as total from patients group by patient_id having count(*) > 1;
select doctor_id, count(*) as total from doctors group by doctor_id having count(*) > 1;
select appointment_id, count(*) as total from appointments group by appointment_id having count(*) > 1;
select admission_id, count(*) as total from admissions group by admission_id having count(*) > 1;
select record_id, count(*) as total from medical_records group by record_id having count(*) > 1;
select bill_id, count(*) as total from billing group by bill_id having count(*) > 1;

select * from patients where age < 0 or age > 120;
select * from doctors where experience_years < 0 or consultation_fee < 0;
select * from appointments where appointment_date > curdate();
select * from admissions where discharge_date < admission_date;
select * from admissions where length_of_stay < 0;
select * from medical_records where record_date > curdate();
select * from billing where amount < 0;


select d.doctor_id, d.doctor_name, d.department, count(a.appointment_id) as total_appointments from doctors d join appointments a on d.doctor_id = a.doctor_id group by d.doctor_id, d.doctor_name, d.department order by total_appointments desc limit 10;
select d.department, count(a.appointment_id) as total_appointments from doctors d join appointments a on d.doctor_id = a.doctor_id group by d.department order by total_appointments desc;
select d.doctor_id, d.doctor_name, d.department, sum(b.amount) as total_revenue from doctors d join billing b on d.doctor_id = b.doctor_id group by d.doctor_id, d.doctor_name, d.department order by total_revenue desc limit 10;
select payment_status, count(*) as total_bills, sum(amount) as total_amount from billing group by payment_status order by total_bills desc;
select city, count(*) as total_patients from patients group by city order by total_patients desc limit 10;
select diagnosis, count(*) as total_cases from medical_records group by diagnosis order by total_cases desc limit 10;
select avg(length_of_stay) as average_stay_days, max(length_of_stay) as longest_stay_days, min(length_of_stay) as shortest_stay_days from admissions;
select status, count(*) as total_appointments from appointments group by status order by total_appointments desc;
select date_format(appointment_date, '%Y-%m') as appointment_month, count(*) as total_appointments from appointments group by date_format(appointment_date, '%Y-%m') order by appointment_month;
select room_type, count(*) as total_admissions from admissions group by room_type order by total_admissions desc;
select payment_method, count(*) as total_bills, sum(amount) as total_amount from billing group by payment_method order by total_amount desc;
select department, round(avg(consultation_fee), 2) as average_consultation_fee from doctors group by department order by average_consultation_fee desc;

