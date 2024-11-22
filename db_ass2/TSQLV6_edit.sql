USE TSQLV6;

-- Update the postal code of employee no. 8 and show the old and new postal codes
UPDATE HR.Employees
SET postalcode = '10010'
OUTPUT DELETED.postalcode AS OldPostalCode, INSERTED.postalcode AS NewPostalCode
WHERE empid = 8;



-- Check the scores table before deleting any rows
SELECT *
FROM stats.scores
WHERE score < 60 AND testid LIKE '%ABC%';


-- Delete all rows from the scores table where the score is less than 60 and the testid contains the string 'ABC'
DELETE FROM stats.scores
WHERE score < 60 AND testid LIKE '%ABC%';