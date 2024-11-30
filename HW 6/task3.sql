-- 1

SELECT DISTINCT restStaff.first_name, restStaff.surname
FROM restBill
INNER JOIN restStaff 
ON restBill.waiter_no = restStaff.staff_no
WHERE restBill.cust_name = 'Tanya Singh';

--2

SELECT DISTINCT restRoom_management.room_date
FROM restRoom_management 
INNER JOIN restStaff  
ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restStaff.first_name = 'Charles' AND restRoom_management.room_name = 'Green' AND restRoom_management.room_date BETWEEN 160201 AND 160229;

--3

SELECT DISTINCT first_name, surname
FROM restStaff
WHERE 
    headwaiter = (
        SELECT headwaiter 
        FROM restStaff 
        WHERE first_name = 'Zoe' 
        AND surname = 'Ball'
    )
    AND staff_no != (
        SELECT staff_no 
        FROM restStaff 
        WHERE first_name = 'Zoe' 
        AND surname = 'Ball'
    );

--4 
SELECT DISTINCT restBill.cust_name, restBill.bill_total, restStaff.first_name AS waiter_first_name, restStaff.surname AS waiter_surname
FROM restBill 
INNER JOIN restStaff  
ON restBill.waiter_no = restStaff.staff_no
ORDER BY restBill.bill_total DESC;

--5

SELECT DISTINCT restStaff.first_name, restStaff.surname
FROM restBill 
INNER JOIN restStaff  
ON restBill.waiter_no = restStaff.staff_no
WHERE 
    restBill.table_no IN (
        SELECT table_no
        FROM restBill
        WHERE bill_no IN (00014, 00017)
    )
    AND restBill.waiter_no != restStaff.staff_no;

--6

SELECT DISTINCT restStaff.first_name, restStaff.surname
FROM restRoom_management 
INNER JOIN restStaff 
ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restRoom_management.room_name = 'Blue'AND restRoom_management.room_date = 160312;





