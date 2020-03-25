SELECT * FROM réalise
INNER JOIN Videos ON Videos.video_url = réalise.video_url
INNER JOIN Casting ON Casting.id_casting = réalise.id_casting
WHERE nom='John' AND prenom = 'wick'
