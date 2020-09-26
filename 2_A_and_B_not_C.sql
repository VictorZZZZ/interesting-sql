/*
Задача 2. Для структуры из задачи 1 выведите список всех пользователей, 
которые поставили лайк пользователям A и B (id задайте произвольно), 
но при этом не поставили лайк пользователю C.
*/

SELECT l1.sender_id from likes l1
inner join (
	SELECT sender_id, count(sender_id) as "Поставил_всем" FROM
		( SELECT distinct * from likes l3
		 where l3.receiver_id IN (3,4) ) as query1 
	 group by sender_id 
	 having count(sender_id)=2
	) as query2 
on query2.sender_id=l1.sender_id
WHERE l1.sender_id not in (SELECT sender_id from likes where receiver_id=5) group by l1.sender_id;