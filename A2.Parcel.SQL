~~ Mikell Schoonover's Query
~~ finding sales over 300000 and acreage between 1-5
CREATE OR REPLACE VIEW student.v_parcels_final AS
SELECT
	pin,
	acres_poly,
	use1_desc,
	shape,
	emv_ttl,
	total_tax
FROM 
	defaultdb.enterprise.parcels_core
WHERE acres_poly > 10
#Layer of parcels containing acres above 10

SELECT 
	defaultdb.enterprise.parcels_core.pin,
	defaultdb.enterprise.parcels_core.acres_poly,
	defaultdb.enterprise.parcels_core.use1_desc,
	defaultdb.enterprise.parcels_core.shape,
	defaultdb.enterprise.parcel_sales.sale_date,
	defaultdb.enterprise.parcel_sales.sale_value
FROM
	defaultdb.enterprise.parcels_core
LEFT	JOIN
defaultdb.enterprise.parcel_sales
ON
defaultdb.enterprise.parcel_sales.pin = defaultdb.enterprise.parcels_core.pin
WHERE defaultdb.enterprise.parcel_sales.sale_value > 300000;


#Layer where sale value is above 300000 and joining two tables
