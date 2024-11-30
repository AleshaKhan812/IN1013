-- 1

SELECT  
    restStaff.first_name, 
    restStaff.surname
FROM 
    restBill
INNER JOIN 
    restStaff 
ON 
    restBill.waiter_no = restStaff.staff_no
WHERE 
    restBill.cust_name = 'Tanya Singh';
