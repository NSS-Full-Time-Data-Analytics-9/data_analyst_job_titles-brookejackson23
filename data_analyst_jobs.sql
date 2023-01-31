--1. How many rows are in the data_analyst_jobs table?

SELECT COUNT(*)
FROM data_analyst_jobs;

--Answer: 1793

--2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT*
FROM data_analyst_jobs
LIMIT 10;

--Answer: ExxonMobil

--3. How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT location
FROM data_analyst_jobs
WHERE (location = 'KY')
	OR (location = 'TN');
	
--Answer: 21 postings in Tennessee and there are 6 in Kentucky. Altogether there are 27 postings.

--4. How many postings in Tennessee have a star rating above 4?

SELECT star_rating
FROM data_analyst_jobs
WHERE (star_rating > 4.0);

--Answer: 416

--5. How many postings in the dataset have a review count between 500 and 1000?

SELECT review_count
FROM data_analyst_jobs
WHERE (review_count BETWEEN 500 AND 1000);

--Answer: 151

--6. Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?

SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_rating DESC;

--Answer: NE has the highest average rating

--7. Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT DISTINCT title
FROM data_analyst_jobs;

--Answer: 881

--8. How many unique job titles are there for California companies?

SELECT DISTINCT title, location
FROM data_analyst_jobs
WHERE location = 'CA';

--Answer: 230

--9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT DISTINCT company, review_count,
	AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company, review_count;

--Answer: There are 46 companies with more than 5000 reviews

--10. Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT DISTINCT company, review_count, star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
ORDER BY star_rating DESC;

--Answer: American Express, General Motors, Kaiser Permanente, Microsoft, Unilever all have the highest star rating.

--11. Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?

SELECT title
FROM data_analyst_jobs
WHERE title LIKE 'Analyst'