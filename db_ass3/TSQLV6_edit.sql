USE TSQLV6;

SELECT *
FROM Sales.Orders
WHERE orderdate BETWEEN '2021-06-01' AND '2021-06-30';


SELECT *
FROM Sales.Orders
WHERE orderdate = DATEADD(DAY, -1, EOMONTH(orderdate));


SELECT *
FROM HR.Employees
WHERE lastname LIKE '%e%e%';


SELECT *
FROM Sales.OrderDetails
WHERE qty * unitprice > 10000;


SELECT *
FROM HR.Employees
WHERE lastname COLLATE Latin1_General_BIN LIKE '[a-z]%';



SELECT TOP 3
    shipcountry, AVG(freight) AS avgfreight
FROM Sales.Orders
WHERE YEAR(orderdate) = 2021
GROUP BY shipcountry
ORDER BY avgfreight DESC;


SELECT orderid, custid, orderdate,
    ROW_NUMBER() OVER (PARTITION BY custid ORDER BY orderdate, orderid) AS rownum
FROM Sales.Orders;


SELECT empid,
    CASE 
           WHEN titleofcourtesy IN ('Ms.', 'Mrs.') THEN 'Female' 
           WHEN titleofcourtesy = 'Mr.' THEN 'Male' 
           ELSE 'Unknown' 
       END AS gender
FROM HR.Employees;


SELECT custid, region
FROM Sales.Customers
ORDER BY CASE WHEN region IS NULL THEN 1 ELSE 0 END, region;
