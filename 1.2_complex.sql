/*
Задача 1. У вас есть социальная сеть, где пользователи (id, имя) могут ставить друг другу лайки.
Создайте необходимые таблицы для хранения данной информации. Создайте запрос, который выведет информацию:
id пользователя;
имя;
лайков получено;
лайков поставлено;
взаимные лайки.
 */


WITH
	send_likes as (SELECT u.id, u.name, count(l.sender_id) as "Поставлено_лайков"
					from users u
					left join likes l on u.id=l.sender_id 
					group by u.id),
	received_likes as (SELECT u.id, u.name, count(l.receiver_id) as "Получено_лайков"
						from users u
						left join likes l on u.id=l.receiver_id 
						group by u.id),
	mutual_likes as (SELECT users.id, users.name, count_mutual."Взаимных_лайков" from users
						left Join 
						(SELECT sender,count(sender) as "Взаимных_лайков" FROM (
													SELECT distinct l1.sender_id as sender,l1.receiver_id as receiver from likes l1
													join likes l2 on l1.sender_id=l2.receiver_id AND l1.receiver_id=l2.sender_id ) as mutual
						GROUP BY sender ) as count_mutual on count_mutual.sender=users.id)
SELECT send_likes.id, send_likes.name,send_likes."Поставлено_лайков",received_likes."Получено_лайков",mutual_likes."Взаимных_лайков"
FROM send_likes
JOIN received_likes on send_likes.id=received_likes.id
JOIN mutual_likes on mutual_likes.id=send_likes.id;
	


