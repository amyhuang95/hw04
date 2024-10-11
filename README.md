# Media Database Queries

This project demonstrates the use of SQL to query a media database using SQLite. The database used is the Chinook database provided by [SQLite Tutorial](https://www.sqlitetutorial.net/sqlite-sample-database/).

## How to run the queries:

1. Download this repository.
2. Run the following commands in the terminal of the directory where the repository is located. Change the query number in the command to run the desired query.

   ```bash
   sqlite3 MediaDB.db < query1.sql
   ```

## Queries

1. What are the last names and emails of all customer who made purchased in the store?
2. What are the names of each album and the artist who created it?
3. What are the total number of unique customers for each state, ordered alphabetically by state?
4. Which states have more than 10 unique customers?
5. What are the names of the artists who made an album containing the substring "symphony" in the album title?
6. What are the names of all artists who performed MPEG (video or audio) tracks in either the "Brazilian Music" or the "Grunge" playlists?
7. How many artists published at least 10 MPEG tracks?
8. What is the total length of each playlist in hours? List the playlist id and name of only those playlists that are longer than 2 hours, along with the length in hours rounded to two decimals.
9. Creative addition - Determine the importance of each customer based on the total amount of money they have spent in the store in percentile, and include the Sales Support Representative who is responsible for each customer.

   Customers are ranked in five tiers:

   | Tier    | Percentile of Total Amount Spent |
   | ------- | -------------------------------- |
   | Diamond | Top 10%                          |
   | Tier 1  | Between top 10% and 20%          |
   | Tier 2  | Between top 20% and 30%          |
   | Tier 3  | Between top 30% and 50%          |
   | Tier 4  | Remaining customers              |

   This query will output the customer's first name, last name, tier, the Sales Support Representative's first name and last name, along with relevant data including customer ID, total amount spent, and percentile rank of sales by the customer. The results highlight the importance of each customer and the Sales Support Representative responsible for them from a revenue perspective.

---

_This project was developed as part of the course CS 5200 Database Management Systems taught by Professor John Alexis Guerra Gomez at Northeastern University (Oakland)._
