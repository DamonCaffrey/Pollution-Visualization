use pollution_db;

SELECT * FROM pollution;

SELECT COUNT(*) FROM pollution
WHERE gas is null;

SELECT * FROM pollution p JOIN continents c
ON p.country = c.country;


SELECT DISTINCT country FROM pollution 
WHERE country NOT IN (SELECT country FROM continents);

SELECT DISTINCT country FROM continents 
WHERE country NOT IN (SELECT country FROM pollution)
order by 1;

-- pollution
-- Bonaire, Saint Eustatius and Saba		Bonaire Sint Eustatius and Saba
-- Brunei Darussalam						Brunei
-- Czech Republic							Czechia
-- Côte d Ivoire							Cote d'Ivoire
-- Democratic Republic of the Congo			Democratic Republic of Congo
-- French Equatorial Africa
-- French West Africa
-- Global
-- International Transport
-- Kuwaiti Oil Fires
-- Leeward Islands
-- Micronesia (Federated States of)			Micronesia (country)
-- Occupied Palestinian Territory			Palestine
-- Pacific Islands (Palau)
-- Panama Canal Zone
-- Ryukyu Islands
-- St. Kitts-Nevis-Anguilla
-- Swaziland
-- Timor-Leste
-- USA										United States
-- Viet Nam									Vietnam
-- Wallis and Futuna Islands				Wallis and Futuna


UPDATE continents SET country = "Bonaire, Saint Eustatius and Saba"
WHERE country = "Bonaire Sint Eustatius and Saba";

UPDATE pollution SET country = "Brunei"
WHERE country = "Brunei Darussalam";

UPDATE pollution SET country = "Czechia"
WHERE country = "Czech Republic";

UPDATE pollution SET country = "Democratic Republic of Congo"
WHERE country = "Democratic Republic of the Congo";

UPDATE pollution SET country = "Micronesia"
WHERE country = "Micronesia (Federated States of)";

UPDATE continents SET country = "Micronesia"
WHERE country = "Micronesia (country)";

UPDATE pollution SET country = "Palestine"
WHERE country = "Occupied Palestinian Territory";

UPDATE pollution SET country = "United States"
WHERE country = "USA";

UPDATE pollution SET country = "Wallis and Futuna"
WHERE country = "Wallis and Futuna Islands";

UPDATE pollution SET country = "Vietnam"
WHERE country = "Viet Nam";

UPDATE pollution SET country = "Ivory Coast"
WHERE country = "Côte d Ivoire";

UPDATE continents SET country = "Ivory Coast"
WHERE country = "Cote d'Ivoire";



UPDATE pollution SET Total = 0
WHERE Total IS NULL;

UPDATE pollution SET Coal = 0
WHERE Coal IS NULL;

UPDATE pollution SET Oil = 0
WHERE Oil IS NULL;

UPDATE pollution SET Gas = 0
WHERE Gas IS NULL;

UPDATE pollution SET Cement = 0
WHERE Cement IS NULL;

UPDATE pollution SET Flaring = 0
WHERE Flaring IS NULL;

UPDATE pollution SET Other = 0
WHERE Other IS NULL;

UPDATE pollution SET Per_Capita = 0
WHERE Per_Capita IS NULL;








select * FROM pollution;

SELECT * FROM continents;

SELECT p.*, c.continent FROM pollution p LEFT JOIN continents c
ON p.country = c.country;


WITH cte AS(
SELECT p.*, c.continent FROM pollution p LEFT JOIN continents c
ON p.country = c.country)

SELECT COUNT(*) FROM cte WHERE continent IS NULL;


WITH cte AS(
SELECT p.*, c.continent FROM pollution p LEFT JOIN continents c
ON p.country = c.country)

SELECT COUNT(*) FROM cte WHERE continent IS NOT NULL;


WITH cte AS(
SELECT p.*, c.continent FROM pollution p LEFT JOIN continents c
ON p.country = c.country)

SELECT continent, country, Year, Total, Coal, Oil, Gas, Cement, Flaring, Other, Per_Capita 
FROM cte WHERE continent IS NOT NULL;