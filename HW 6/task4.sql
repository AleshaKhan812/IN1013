--1

SELECT DISTINCT restBill.cust_name
FROM restBill 
INNER JOIN restStaff 
ON restBill.waiter_no = restStaff.staff_no
WHERE restBill.bill_total > 450.00 AND restStaff.first_name = 'Charles';

--2

SELECT restStaff.first_name, restStaff.surname
FROM restRoom_management 
INNER JOIN restStaff 
ON restRoom_management.headwaiter = restStaff.staff_no
WHERE 
    restRoom_management.room_date = 160111
    AND restRoom_management.room_name IN (SELECT room_name 
                          FROM restBill 
                          WHERE cust_name = 'Nerida Smith' 
                          AND bill_date = 160111);

--3

SELECT restBill.cust_name
FROM restBill 
WHERE restBill.bill_total = (SELECT MIN(bill_total) FROM restBill);

--4

SELECT restStaff.first_name, restStaff.surname
FROM restStaff
LEFT JOIN restBill 
ON restStaff.staff_no = restBill.waiter_no
WHERE restBill.waiter_no IS NULL;

--5

SELECT 
    restBill.cust_name AS Customer_Name,
    restStaff.first_name,
    restStaff.surname, 
    restRest_table.room_name AS Room_Name,
    restBill.bill_total AS Largest_Bill
FROM restBill 
JOIN restRest_table  
ON restBill.table_no = restRest_table.table_no
JOIN restRoom_management  
ON restRest_table.room_name = restRoom_management.room_name
  AND restBill.bill_date = restRoom_management.room_date
JOIN restStaff  
ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restBill.bill_total = (SELECT MAX(bill_total) FROM restBill);
