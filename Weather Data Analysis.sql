CREATE DATABASE Weather;
USE Weather;

CREATE TABLE cities(
city_id INT PRIMARY KEY,
city_name VARCHAR(50),
country VARCHAR(50)
);

INSERT INTO cities(city_id,city_name,country) VALUES 
(1 , 'New Delhi' , 'India'),
(2 , 'Mumbai' , 'India'),
(3 , 'Hyderabad' , 'India'),
(4 , 'Chennai' , 'India'),
(5 , 'Jaipur' , 'India');


CREATE TABLE weather_records(
record_id INT PRIMARY KEY,
city_id INT,
date DATE,
conditions VARCHAR(80),
temperature VARCHAR(15),
humidity VARCHAR(10) , 
wind VARCHAR(10) ,
FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

drop table weather_records;

INSERT INTO weather_records(record_id,city_id,date,conditions,temperature,humidity,wind) VALUES
(001 , 1 , str_to_date('13-07-2024' , '%d-%m-%Y') , 'Mist' , '31.4°C' , '92%' , '5.6km\h' ),
(002 , 2 , str_to_date('10-07-2024' , '%d-%m-%Y') , 'Light rain' , '29°C' , '86%' , '13km\h'),
(003 , 3 , str_to_date('12-07-2024' , '%d-%m-%Y') , 'Rain' , '27°C' , '83%' , 'Calm'),
(004 , 4 , str_to_date('11-07-2024' , '%d-%m-%Y') , 'Partly cloudy' , '31°C' , '70%' , '11km\h'),
(005 , 5 , str_to_date('9-07-2024' , '%d-%m-%Y') , 'Cloudy' , '28°C' , '75%' , '8km\h' );


SELECT * FROM cities;
SELECT * FROM weather_records;

SELECT date , temperature, humidity, wind, conditions 
FROM weather_records
WHERE city_id = (SELECT city_id FROM cities WHERE city_name = 'Jaipur') ;

SELECT AVG(temperature) AS avg_temperature
FROM weather_records
WHERE city_id = (SELECT city_id FROM cities WHERE city_name = 'Hyderabad') 
  AND DATE_FORMAT(date, '%Y-%m') = '2024-07';
  
    
SELECT c.city_name, wr.temperature
FROM weather_records wr
JOIN cities c ON wr.city_id = c.city_id
WHERE DATE_FORMAT(wr.date, '%Y-%m') = '2024-07'
ORDER BY wr.temperature DESC
LIMIT 3;



  
  
  









