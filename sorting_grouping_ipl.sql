SELECT * FROM campusx.ipl;

-- top 5 batsmen ipl
select batter, sum(batsman_run) as 'cb'
FROM campusx.ipl
GROUP BY batter
ORDER BY cb DESC LIMIT 5;

-- second highest 6 hitter in ipl 
select batter, count(*) as 'count'
FROM campusx.ipl
WHERE batsman_run = 6
GROUP BY batter
ORDER BY count DESC LIMIT 1,1;

-- name of batsman with centuries 
select batter, id, sum(batsman_run) as 'total_score' FROM campusx.ipl
Group by batter, id
having total_score > 99
ORDER BY batter DESC;

-- find top 5 batsman with highest strike rate who have palyed a min of 1000 balls 
select batter, count(*) as 'balls', round((sum(batsman_run)/count(batsman_run))*100,2) as 'score'
FROM campusx.ipl
Group by batter
having balls >= 1000
order by score desc limit 5;
