9. Wyświetl wszystkie kraje w których istnieją klienci, którzy mają na swoim koncie co najmniej 5 wypożyczeń.

SELECT c.first_name, c.last_name, co.country,count(rental_id)
FROM rental r JOIN customer c ON r.customer_id=c.customer_id JOIN address a ON c.address_id=a.address_id JOIN city ON a.city_id=city.city_id JOIN country co ON city.country_id=co.country_id
GROUP BY c.first_name, c.last_name
HAVING count(rental_id)>=5

10. Wyświetl adres e-mail najaktywniejszego pracownika.

SELECT s.email, count(rental_id)
FROM staff s JOIN rental r ON s.staff_id=r.staff_id
GROUP BY s.email
ORDER BY count(rental_id) desc
LIMIT 1

11. Znajdź trzy wersje językowe filmów, które są najrzadziej wypożyczane. Wyświetl ich łączną liczbę wypożyczeń.

SELECT l.name, count(r.rental_id)
FROM film f JOIN inventory i ON f.film_id=i.film_id JOIN rental r ON i.inventory_id=r.inventory_id JOIN language l ON f.language_id=l.language_id
GROUP BY l.name
ORDER BY count(r.rental_id) desc
LIMIT 3

12. Znajdź największą płatność spośród wszystkich klientów z Bydgoszczy.

SELECT c.first_name, c.last_name, p.amount
FROM rental r JOIN customer c ON r.customer_id=c.customer_id JOIN address a ON c.address_id=a.address_id JOIN city ON a.city_id=city.city_id JOIN payment p ON c.customer_id=p.customer_id
WHERE city='Bydgoszcz'
ORDER BY p.amount desc
LIMIT 1

13. Czy klienci z Francji najbardziej preferują filmy w języku francuskim?

SELECT l.name, co.country, count(r.rental_id)
FROM film f JOIN inventory i ON f.film_id=i.film_id JOIN rental r ON i.inventory_id=r.inventory_id JOIN language l ON f.language_id=l.language_id JOIN customer c ON r.customer_id=c.customer_id JOIN address a ON c.address_id=a.address_id JOIN city ON a.city_id=city.city_id JOIN country co ON city.country_id=co.country_id
GROUP BY l.name, co.country
ORDER BY count(r.rental_id) desc

14. Jakie jest najpopularniejsze imię wśród aktorów, klientów i obsługi? Czy jest to te same imię?

SELECT (SELECT first_name FROM actor GROUP BY first_name ORDER BY count(actor_id) desc LIMIT 1) AS name_actor,
(SELECT first_name FROM customer GROUP BY first_name ORDER BY count(customer_id) desc LIMIT 1) AS name_customer, 
(SELECT first_name FROM staff GROUP BY first_name ORDER BY count(staff_id) desc LIMIT 1) AS name_staff

15. Oblicz całkowitą kwotę wypożyczeń najaktywniejszego klienta z Polski.

SELECT c.first_name, c.last_name, sum(p.amount)
FROM rental r JOIN customer c ON r.customer_id=c.customer_id JOIN address a ON c.address_id=a.address_id JOIN city ON a.city_id=city.city_id JOIN payment p ON c.customer_id=p.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY count(r.rental_id) desc
LIMIT 1