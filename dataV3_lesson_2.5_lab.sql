USE sakila;

-- Select all the actors with the first name ‘Scarlett’.

SELECT * FROM sakila.actor
WHERE first_name = "Scarlett";

-- How many films (movies) are available for rent and how many films have been rented?

SELECT count(distinct inventory_id) as films_available_for_rent, count(distinct rental_id) as films_rented FROM sakila.rental;

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.

SELECT max(length) as Max_duration, min(length) as Min_duration FROM film;

-- What's the average movie duration expressed in format (hours, minutes)

SELECT concat(floor(avg(length) / 60)," hrs ",round(mod(avg(length),60),0), " min") as average_film_duration FROM film;

-- How many distinct (different) actors' last names are there?

SELECT count(distinct last_name) FROM actor;

-- Since how many days has the company been operating (check DATEDIFF() function)?

SELECT DATEDIFF(max(rental_date), min(rental_date)) FROM rental;

-- Show rental info with additional columns month and weekday. Get 20 results.

SELECT *, date_format(CONVERT(rental_date,date), '%M') as rental_month, WEEKDAY(rental_date) as rental_day FROM rental
LIMIT 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *,
CASE
WHEN WEEKDAY(rental_date) in (0,1,2,3,4) then 'Weekday'
WHEN WEEKDAY(rental_date) in (5,6) then 'Weekend'
END AS 'Day_of_week'
FROM rental;

-- Get release years.

SELECT distinct(release_year) FROM film;

-- Get all films with ARMAGEDDON in the title.

SELECT * FROM film
WHERE title regexp "ARMAGEDDON";

-- Get all films which title ends with APOLLO.

SELECT * FROM film
WHERE title regexp "APOLLO$";

-- Get 10 the longest films.

SELECT * FROM film
ORDER BY length Desc
LIMIT 10;

-- How many films include Behind the Scenes content?

SELECT count(special_features) FROM film
WHERE special_features = "Behind the Scenes";
