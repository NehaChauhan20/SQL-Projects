# Project Overview
This Sql Project contains basic projects according to beginners and the purpose of this project is to showcase my skills.

## Installation
1.Prerequisites:
Use MySql for this project.

2.Setup:
Clone the repository: git clone [https://github.com/NehaChauhan20/SQL-Projects.git]

```bash
#Query Examples
Example 1: Retrieve the average temperature for a given month.
SELECT AVG(temperature) AS avg_temperature
FROM weather_records
WHERE city_id = (SELECT city_id FROM cities WHERE city_name = 'Hyderabad') 
AND DATE_FORMAT(date, '%Y-%m') = '2024-07';
Description: Calculates the average temperature for Hyderabad in July 2024.

Example 2: Get the top 3 cities with the highest temperatures in a specific month.
SELECT c.city_name, wr.temperature
FROM weather_records wr
JOIN cities c ON wr.city_id = c.city_id
WHERE DATE_FORMAT(wr.date, '%Y-%m') = '2024-07'
ORDER BY wr.temperature DESC
LIMIT 3;
Description: Lists the top 3 cities with the highest temperatures recorded in July 2024.
```
## Contributing
How to Contribute:
1.Fork the repository and create a pull request with your changes.
2.Ensure your changes are well-documented and tested.

## License
License Information:
MIT License

## Contact
Author:
Neha Chauhan
analysiswithneha@gmail.com
