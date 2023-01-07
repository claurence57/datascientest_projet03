DROP DATABASE IF EXISTS projet3;
DROP USER IF EXISTS projet3;
CREATE DATABASE projet3;
CREATE USER projet3 WITH PASSWORD 'datascience' ;
GRANT CONNECT ON DATABASE projet3 TO projet3;
\c projet3
CREATE TABLE datafinitielectronicsproductspricingdata (
	id VARCHAR NOT NULL, 
	"prices.amountMax" DECIMAL NOT NULL, 
	"prices.amountMin" DECIMAL NOT NULL, 
	"prices.availability" VARCHAR NOT NULL, 
	"prices.condition" VARCHAR NOT NULL, 
	"prices.currency" VARCHAR NOT NULL, 
	"prices.dateSeen" VARCHAR NOT NULL, 
	"prices.isSale" BOOLEAN NOT NULL, 
	"prices.merchant" VARCHAR NOT NULL, 
	"prices.shipping" VARCHAR, 
	"prices.sourceURLs" VARCHAR NOT NULL, 
	asins VARCHAR NOT NULL, 
	brand VARCHAR NOT NULL, 
	categories VARCHAR NOT NULL, 
	"dateAdded" TIMESTAMP WITHOUT TIME ZONE, 
	"dateUpdated" TIMESTAMP WITHOUT TIME ZONE, 
	ean VARCHAR, 
	"imageURLs" VARCHAR NOT NULL, 
	keys VARCHAR NOT NULL, 
	manufacturer VARCHAR, 
	"manufacturerNumber" VARCHAR NOT NULL, 
	name VARCHAR NOT NULL, 
	primaryCategories VARCHAR NOT NULL, 
	"sourceURLs" VARCHAR NOT NULL, 
	upc VARCHAR NOT NULL, 
	weight VARCHAR NOT NULL, 
	aa VARCHAR, 
	bb VARCHAR, 
	cc DECIMAL, 
	dd VARCHAR, 
	ee VARCHAR
);
COPY datafinitielectronicsproductspricingdata(
	id,
	"prices.amountMax",
	"prices.amountMin",
	"prices.availability",
	"prices.condition",
	"prices.currency",
	"prices.dateSeen",
	"prices.isSale",
	"prices.merchant",
	"prices.shipping",
	"prices.sourceURLs",
	asins,
	brand,
	categories,
	"dateAdded",
	"dateUpdated",
	ean,
	"imageURLs",
	keys,
	manufacturer,
	"manufacturerNumber",
	name,
	primaryCategories,
	"sourceURLs",
	upc,
	weight,
	aa, 
	bb, 
	cc, 
	dd, 
	ee 
)
FROM '/csvdata/datafinitielectronicsproductspricingdata.csv'
DELIMITER ','
CSV HEADER;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO projet3;
\c projet3 projet3
