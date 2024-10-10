# music-database

This project demonstrates the use of SQL to query a media database using SQLite. The database used is the Chinook database provided by [SQLite Tutorial](https://www.sqlitetutorial.net/sqlite-sample-database/).

## How to run the queries:

1. Download this repository.
2. Run the following commands in the terminal.

   ```bash
   sqlite3 MediaDB.db < queries.sql
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
9. Creative addition: Determine the importance of each customer based on the total amount of money they have spent in the store, and include the Sales Support Agent who is responsible for each customer. Customers are ranked in five tiers:

   | Tier    | Description                                |
   | ------- | ------------------------------------------ |
   | Diamond | Total amount spent is greater than top 10% |
   | Tier 1  | Total amount spent is greater than top 20% |
   | Tier 2  | Total amount spent is greater than top 30% |
   | Tier 3  | Total amount spent is greater than top 50% |
   | Tier 4  | The rest of the customers                  |

---

_This project was developed as part of the course CS 5200 Database Management Systems taught by Professor John Alexis Guerra Gomez at Northeastern University (Oakland)._
