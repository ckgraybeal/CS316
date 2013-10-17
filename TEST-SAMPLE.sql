--display information on all concerts 
SELECT * FROM Events
WHERE category = 'Concert';

--display events on october 20, 2013
SELECT * FROM Events
WHERE date = '2013-10-20';

--display popular events after october 16
SELECT DISTINCT e.name, e.date, e.venue FROM Events AS e, Attending AS a
WHERE date >= '2013-10-16'
AND e.EID IN 
(SELECT EID FROM Attending 
WHERE Attending.confirmed=TRUE
GROUP BY EID
);

--display number of people attending each event
SELECT EID, Count(*) FROM Attending
WHERE Confirmed = TRUE
GROUP BY EID;

--display event search by keyword "Montreal"
SELECT * FROM Events
WHERE name LIKE '%Montreal%' OR venue LIKE '%Montreal%' 
OR category LIKE '%Montreal%' OR additional_info LIKE '%Montreal%';

--display events that cost less than $15
SELECT * FROM Events
WHERE cost<=15;
