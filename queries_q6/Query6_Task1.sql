CREATE VIEW MostActiveRobbers AS 
SELECT r.RobberId 
FROM Accomplices a NATURAL JOIN Robbers r;

CREATE VIEW AverageNoRobberies AS
Select r.RobberID 
 