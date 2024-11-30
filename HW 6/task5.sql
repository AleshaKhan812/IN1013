--1

SELECT 
    Waiter_Bills.first_name AS Waiter_First_Name,
    Waiter_Bills.surname AS Waiter_Surname,
    Waiter_Bills.bill_date AS Bill_Date,
    Waiter_Bills.Bill_Count
FROM 
    (SELECT 
        restStaff.first_name,
        restStaff.surname,
        restBill.bill_date,
        COUNT(restBill.bill_no) AS Bill_Count
     FROM 
        restBill
     JOIN 
        restStaff ON restBill.waiter_no = restStaff.staff_no
     GROUP BY 
        restStaff.first_name, restStaff.surname, restBill.bill_date) AS Waiter_Bills
WHERE 
    Waiter_Bills.Bill_Count >= 2;

--2

SELECT 
  room_name ,
  COUNT(*) AS Table_Count
FROM restRest_table
WHERE no_of_seats > 6
GROUP BY room_name;

--3

SELECT 
  restRest_table.room_name AS Room_Name, 
  SUM(restBill.bill_total) AS Total_Bill_Amount
FROM restBill
JOIN restRest_table 
ON restBill.table_no = restRest_table.table_no
GROUP BY restRest_table.room_name;

--4

SELECT 
    headwaiter.first_name AS Headwaiter_First_Name,
    headwaiter.surname AS Headwaiter_Surname,
    SUM(restBill.bill_total) AS Total_Bill_Amount
FROM restBill
JOIN restStaff AS waiter 
ON restBill.waiter_no = waiter.staff_no
JOIN restStaff AS headwaiter 
ON waiter.headwaiter = headwaiter.staff_no
GROUP BY headwaiter.first_name, headwaiter.surname
ORDER BY Total_Bill_Amount DESC;

--5

SELECT 
    Customer_Averages.cust_name AS Customer_Name,
    Customer_Averages.Average_Spending
FROM 
    (SELECT 
        restBill.cust_name,
        AVG(restBill.bill_total) AS Average_Spending
     FROM restBill
     GROUP BY restBill.cust_name) AS Customer_Averages
WHERE Customer_Averages.Average_Spending > 400;


--6

SELECT 
    Waiter_Bills.first_name AS Waiter_First_Name,
    Waiter_Bills.surname AS Waiter_Surname,
    Waiter_Bills.bill_date AS Bill_Date,
    Waiter_Bills.Bill_Count
FROM 
    (SELECT 
        restStaff.first_name,
        restStaff.surname,
        restBill.bill_date,
        COUNT(restBill.bill_no) AS Bill_Count
     FROM 
        restBill
     JOIN 
        restStaff ON restBill.waiter_no = restStaff.staff_no
     GROUP BY 
        restStaff.first_name, restStaff.surname, restBill.bill_date) AS Waiter_Bills
WHERE 
    Waiter_Bills.Bill_Count >= 3;


