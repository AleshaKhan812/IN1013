--1
SELECT DISTINCT restBill.cust_name
FROM restBill 
INNER JOIN restStaff 
ON restBill.waiter_no = restStaff.staff_no
WHERE restBill.bill_total > 450.00 AND restStaff.first_name = 'Charles';
