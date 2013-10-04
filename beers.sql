--a
SELECT beer
FROM Serves
WHERE bar = 'Satisfaction';

--b
SELECT Bar.name, Bar.address
FROM Frequents, Bar
WHERE drinker = 'Amy'
AND Frequents.bar = Bar.name;

--c
SELECT Serves.bar
FROM Serves, Likes
WHERE Likes.drinker = 'Amy'
AND Likes.beer = Serves.beer
AND Serves.price <= 2.50;

--d
(SELECT bar
FROM Frequents
WHERE drinker = 'Ben')
INTERSECT
(SELECT bar
FROM Frequents
WHERE drinker = 'Dan');

--e
((SELECT bar
FROM Frequents
WHERE drinker = 'Ben')
UNION
(SELECT bar
FROM Frequents
WHERE drinker = 'Dan'))
EXCEPT
((SELECT bar
FROM Frequents
WHERE drinker = 'Ben')
INTERSECT
(SELECT bar
FROM Frequents
WHERE drinker = 'Dan'));

--f
(SELECT bar, beer
FROM Serves)
EXCEPT
(SELECT Frequents.bar, Likes.beer
FROM Frequents, Likes
WHERE Frequents.drinker = Likes.drinker);

--g
(SELECT drinker
FROM Frequents)
EXCEPT
(SELECT foo.drinker
FROM 	((SELECT drinker, bar FROM Frequents)
	EXCEPT
	(SELECT Likes.drinker, Serves.bar
	FROM Likes, Serves
	WHERE Likes.beer = Serves.beer)) AS foo
);

--h
(SELECT drinker
FROM Frequents)
EXCEPT
(SELECT foo.drinker
FROM 	((SELECT Likes.drinker, Serves.bar
	FROM Likes, Serves
	WHERE Likes.beer = Serves.beer)
	EXCEPT
	(SELECT drinker, bar FROM Frequents)) AS foo
);

--i
SELECT Frequents.drinker, Frequents.bar
FROM Frequents,
	(SELECT Frequents.drinker as drinker_name,  MAX(Frequents.times_a_week) AS times
	FROM Drinker LEFT OUTER JOIN Frequents
	ON Drinker.name = Frequents.drinker
	GROUP BY Frequents.drinker
	) AS foo
WHERE foo.times = Frequents.times_a_week
AND foo.drinker_name = Frequents.drinker
;

--j
SELECT foo.bar, foo.num_drinkers, goo.avg_price
FROM	--total number of frequenters
	((SELECT Frequents.bar AS bar,  COUNT(Frequents.drinker) AS num_drinkers
	FROM Frequents
	GROUP BY Frequents.bar)) as foo
	JOIN
	--avg price of beers
	((SELECT Serves.bar AS bar, AVG(Serves.price) AS avg_price
	FROM Serves
	GROUP BY Serves.bar)) AS goo
	ON foo.bar = goo.bar
ORDER BY num_drinkers DESC;

--serves
SELECT * FROM Serves;
--frequents
SELECT * FROM Frequents;
