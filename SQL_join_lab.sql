USE sakila;


#1 List the number of films per category.
SELECT C.name, COUNT(F.film_id) AS Total_Films from film_category AS F
INNER JOIN category AS C
ON C.category_id = F.category_id
GROUP BY C.name
ORDER BY Total_Films DESC;

#2 Display the first and the last names, as well as the address, of each staff member.
SELECT S.first_name, S.last_name, A.address
FROM address AS A
INNER JOIN staff AS S
ON S.address_id = A.address_id;

#3 Display the total amount rung up by each staff member in August 2005.
SELECT S.first_name, S.last_name, SUM(P.amount) AS Rung_Up
FROM payment AS P
INNER JOIN staff AS S
ON P.staff_id = S.staff_id
WHERE P.payment_date >= '2005-08-01 00:00:00.000'
AND P.payment_date <= '2005-08-31 00:00:00.000'
GROUP BY P.staff_id
ORDER BY Rung_Up DESC;


#4 List all films and the number of actors who are listed for each film.
SELECT F.title, COUNT(A.actor_id) AS Total_Actors from film AS F
INNER JOIN film_actor AS A
ON A.film_id = F.film_id
GROUP BY F.title
ORDER BY Total_Actors DESC;

#5 Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
SELECT CONCAT(C.last_name, ', ', C.first_name) AS Customer, SUM(P.amount) AS Total_Amount_Paid
FROM customer AS C
INNER JOIN payment AS P
ON C.customer_id = P.customer_id
GROUP BY C.customer_id
ORDER BY C.last_name ASC;
