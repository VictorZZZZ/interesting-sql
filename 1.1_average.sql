/*
Выбрать пользователе чей возраст выше среднего
*/
SELECT * FROM users where age>(SELECT AVG(age) FROM users);