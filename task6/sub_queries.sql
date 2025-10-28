USE REAL_ESTATE;

-- SELECT 
--     address,
--     listing_price,
--     (SELECT AVG(listing_price) FROM PropertyListings) AS avg_price,
--     listing_price - (SELECT AVG(listing_price) FROM PropertyListings) AS price_diff
-- FROM PropertyListings
-- WHERE listing_price > (SELECT AVG(listing_price) FROM PropertyListings);


-- SELECT 
--     agent_name,
--     commission_rate,
--     (SELECT AVG(commission_rate) FROM Agents) AS avg_commission
-- FROM Agents
-- WHERE commission_rate > (SELECT AVG(commission_rate) FROM Agents);


-- SELECT 
--     address,
--     listing_price,
--     (SELECT neighborhood_name 
--      FROM Neighborhoods 
--      WHERE neighborhood_id = p.neighborhood_id) AS neighborhood
-- FROM PropertyListings p
-- WHERE neighborhood_id = (
--     SELECT neighborhood_id 
--     FROM Neighborhoods 
--     ORDER BY average_price_per_sqft DESC 
--     LIMIT 1
-- );

-- SELECT 
--     buyer_name,
--     budget,
--     (SELECT MIN(listing_price) FROM PropertyListings) AS cheapest_property
-- FROM Buyers
-- WHERE budget >= (SELECT MIN(listing_price) FROM PropertyListings);


-- SELECT 
--     buyer_name,
--     email,
--     budget
-- FROM Buyers
-- WHERE buyer_id IN (SELECT buyer_id FROM Sales);

-- SELECT 
--     buyer_name,
--     email,
--     budget
-- FROM Buyers
-- WHERE buyer_id NOT IN (SELECT buyer_id FROM Sales);


-- SELECT 
--     address,
--     listing_price,
--     bedrooms
-- FROM PropertyListings
-- WHERE neighborhood_id IN (
--     SELECT neighborhood_id 
--     FROM Neighborhoods 
--     WHERE safety_rating >= 8
-- );

-- SELECT 
--     address,
--     listing_price,
--     bedrooms,
--     bathrooms
-- FROM PropertyListings
-- WHERE listing_price = (SELECT MAX(listing_price) FROM PropertyListings);


-- SELECT 
--     address,
--     listing_price,
--     square_feet
-- FROM PropertyListings
-- WHERE listing_price < (SELECT AVG(listing_price) FROM PropertyListings)
-- ORDER BY listing_price DESC;

-- SELECT 
--     address,
--     listing_price,
--     bedrooms
-- FROM PropertyListings
-- WHERE listing_price > ANY (
--     SELECT listing_price 
--     FROM PropertyListings 
--     WHERE bedrooms = 2
-- );


-- SELECT 
--     address,
--     listing_price,
--     bedrooms
-- FROM PropertyListings
-- WHERE listing_price > ALL (
--     SELECT listing_price 
--     FROM PropertyListings 
--     WHERE bedrooms = 2
-- );

-- SELECT 
--     agent_name,
--     experience_years,
--     commission_rate
-- FROM Agents a
-- WHERE EXISTS (
--     SELECT 1 
--     FROM Sales s 
--     WHERE s.agent_id = a.agent_id
-- );

-- SELECT 
--     agent_name,
--     experience_years,
--     email
-- FROM Agents a
-- WHERE NOT EXISTS (
--     SELECT 1 
--     FROM Sales s 
--     WHERE s.agent_id = a.agent_id
-- );

-- SELECT 
--     address,
--     listing_price,
--     bedrooms,
--     listing_date
-- FROM PropertyListings p
-- WHERE NOT EXISTS (
--     SELECT 1 
--     FROM Sales s 
--     WHERE s.property_id = p.property_id
-- );

-- SELECT 
--     neighborhood_name,
--     average_price_per_sqft,
--     safety_rating
-- FROM Neighborhoods n
-- WHERE EXISTS (
--     SELECT 1 
--     FROM PropertyListings p
--     INNER JOIN Sales s ON p.property_id = s.property_id
--     WHERE p.neighborhood_id = n.neighborhood_id
-- );

-- SELECT 
--     buyer_name,
--     budget
-- FROM Buyers b
-- WHERE EXISTS (
--     SELECT 1 
--     FROM PropertyListings p
--     WHERE p.listing_price <= b.budget
--     AND NOT EXISTS (SELECT 1 FROM Sales s WHERE s.property_id = p.property_id)
-- );


-- SELECT 
--     p.address,
--     p.listing_price,
--     (SELECT neighborhood_name FROM Neighborhoods WHERE neighborhood_id = p.neighborhood_id) AS neighborhood
-- FROM PropertyListings p
-- WHERE p.listing_price > (
--     SELECT AVG(listing_price)
--     FROM PropertyListings p2
--     WHERE p2.neighborhood_id = p.neighborhood_id
-- );


-- SELECT 
--     a.agent_name,
--     (SELECT MAX(listing_price) 
--      FROM PropertyListings p 
--      WHERE p.agent_id = a.agent_id) AS highest_listing
-- FROM Agents a;

-- SELECT 
--     neighborhood_name,
--     (SELECT COUNT(*) 
--      FROM PropertyListings p 
--      WHERE p.neighborhood_id = n.neighborhood_id) AS property_count
-- FROM Neighborhoods n;

-- SELECT 
--     buyer_name,
--     budget,
--     (SELECT neighborhood_name 
--      FROM Neighborhoods 
--      WHERE neighborhood_id = b.preferred_neighborhood_id) AS preferred_area
-- FROM Buyers b
-- WHERE budget >= (
--     SELECT AVG(listing_price)
--     FROM PropertyListings p
--     WHERE p.neighborhood_id = b.preferred_neighborhood_id
-- );


-- SELECT 
--     p.address,
--     s.days_on_market,
--     (SELECT AVG(s2.days_on_market)
--      FROM Sales s2
--      INNER JOIN PropertyListings p2 ON s2.property_id = p2.property_id
--      WHERE p2.neighborhood_id = p.neighborhood_id) AS avg_days_in_neighborhood
-- FROM PropertyListings p
-- INNER JOIN Sales s ON p.property_id = s.property_id;


-- SELECT 
--     address,
--     listing_price,
--     (SELECT COUNT(*) FROM PropertyListings) AS total_properties,
--     (SELECT AVG(listing_price) FROM PropertyListings) AS market_avg,
--     listing_price - (SELECT AVG(listing_price) FROM PropertyListings) AS diff_from_avg
-- FROM PropertyListings;

-- SELECT 
--     agent_name,
--     experience_years,
--     (SELECT COUNT(*) 
--      FROM PropertyListings p 
--      WHERE p.agent_id = a.agent_id) AS properties_listed,
--     (SELECT COUNT(*) 
--      FROM Sales s 
--      WHERE s.agent_id = a.agent_id) AS properties_sold,
--     (SELECT SUM(sale_price) 
--      FROM Sales s 
--      WHERE s.agent_id = a.agent_id) AS total_sales_value
-- FROM Agents a;

-- SELECT 
--     address,
--     listing_price,
--     bedrooms,
--     (SELECT neighborhood_name 
--      FROM Neighborhoods 
--      WHERE neighborhood_id = p.neighborhood_id) AS neighborhood,
--     (SELECT AVG(listing_price) 
--      FROM PropertyListings p2 
--      WHERE p2.neighborhood_id = p.neighborhood_id) AS neighborhood_avg_price,
--     (SELECT COUNT(*) 
--      FROM PropertyListings p2 
--      WHERE p2.neighborhood_id = p.neighborhood_id) AS properties_in_neighborhood
-- FROM PropertyListings p;

-- SELECT 
--     buyer_name,
--     budget,
--     (SELECT COUNT(*) 
--      FROM PropertyListings p 
--      WHERE p.listing_price <= b.budget) AS affordable_count,
--     (SELECT MIN(listing_price) 
--      FROM PropertyListings p 
--      WHERE p.listing_price <= b.budget) AS cheapest_option,
--     (SELECT MAX(listing_price) 
--      FROM PropertyListings p 
--      WHERE p.listing_price <= b.budget) AS most_expensive_option
-- FROM Buyers b;

-- SELECT 
--     neighborhood,
--     avg_price,
--     property_count
-- FROM (
--     SELECT 
--         n.neighborhood_name AS neighborhood,
--         AVG(p.listing_price) AS avg_price,
--         COUNT(*) AS property_count
--     FROM PropertyListings p
--     INNER JOIN Neighborhoods n ON p.neighborhood_id = n.neighborhood_id
--     GROUP BY n.neighborhood_name
-- ) AS neighborhood_stats
-- WHERE property_count > 1;

-- SELECT 
--     agent_name,
--     total_sales,
--     avg_sale_price
-- FROM (
--     SELECT 
--         a.agent_name,
--         COUNT(s.sale_id) AS total_sales,
--         AVG(s.sale_price) AS avg_sale_price,
--         SUM(s.sale_price) AS total_value
--     FROM Agents a
--     INNER JOIN Sales s ON a.agent_id = s.agent_id
--     GROUP BY a.agent_name
-- ) AS agent_performance
-- WHERE total_sales >= 2
-- ORDER BY total_value DESC;


-- SELECT 
--     price_category,
--     COUNT(*) AS property_count,
--     AVG(listing_price) AS avg_price
-- FROM (
--     SELECT 
--         address,
--         listing_price,
--         CASE 
--             WHEN listing_price < 300000 THEN 'Budget'
--             WHEN listing_price BETWEEN 300000 AND 450000 THEN 'Mid-Range'
--             ELSE 'Luxury'
--         END AS price_category
--     FROM PropertyListings
-- ) AS categorized_properties
-- GROUP BY price_category;


-- SELECT 
--     sold.neighborhood,
--     sold.sold_count,
--     available.available_count,
--     sold.avg_sale_price
-- FROM (
--     SELECT 
--         n.neighborhood_name AS neighborhood,
--         COUNT(*) AS sold_count,
--         AVG(s.sale_price) AS avg_sale_price
--     FROM Sales s
--     INNER JOIN PropertyListings p ON s.property_id = p.property_id
--     INNER JOIN Neighborhoods n ON p.neighborhood_id = n.neighborhood_id
--     GROUP BY n.neighborhood_name
-- ) AS sold
-- INNER JOIN (
--     SELECT 
--         n.neighborhood_name AS neighborhood,
--         COUNT(*) AS available_count
--     FROM PropertyListings p
--     INNER JOIN Neighborhoods n ON p.neighborhood_id = n.neighborhood_id
--     LEFT JOIN Sales s ON p.property_id = s.property_id
--     WHERE s.sale_id IS NULL
--     GROUP BY n.neighborhood_name
-- ) AS available ON sold.neighborhood = available.neighborhood;



-- SELECT 
--     address,
--     listing_price
-- FROM PropertyListings
-- WHERE neighborhood_id IN (
--     SELECT neighborhood_id 
--     FROM Neighborhoods
--     WHERE average_price_per_sqft > (
--         SELECT AVG(average_price_per_sqft)
--         FROM Neighborhoods
--     )
-- );


-- SELECT 
--     address,
--     listing_price
-- FROM PropertyListings
-- WHERE neighborhood_id IN (
--     SELECT p.neighborhood_id
--     FROM PropertyListings p
--     INNER JOIN Sales s ON p.property_id = s.property_id
--     GROUP BY p.neighborhood_id
--     HAVING AVG(s.sale_price) > (
--         SELECT AVG(sale_price)
--         FROM Sales
--     )
-- );

-- SELECT 
--     address,
--     listing_price,
--     bedrooms
-- FROM PropertyListings p1
-- WHERE listing_price = (
--     SELECT MIN(listing_price)
--     FROM PropertyListings p2
--     WHERE p2.bedrooms = p1.bedrooms
--     AND p2.neighborhood_id IN (
--         SELECT neighborhood_id
--         FROM Neighborhoods
--         WHERE safety_rating >= 8
--     )
-- );


-- SELECT 
--     address,
--     listing_price
-- FROM PropertyListings
-- WHERE neighborhood_id IN (
--     SELECT neighborhood_id 
--     FROM Neighborhoods 
--     WHERE safety_rating >= 8
-- );


-- SELECT DISTINCT
--     p.address,
--     p.listing_price
-- FROM PropertyListings p
-- INNER JOIN Neighborhoods n ON p.neighborhood_id = n.neighborhood_id
-- WHERE n.safety_rating >= 8;


-- SELECT 
--     address,
--     listing_price,
--     (SELECT neighborhood_name 
--      FROM Neighborhoods 
--      WHERE neighborhood_id = p.neighborhood_id) AS neighborhood
-- FROM PropertyListings p
-- WHERE listing_price < (
--     SELECT AVG(listing_price)
--     FROM PropertyListings p2
--     WHERE p2.neighborhood_id = p.neighborhood_id
-- )
-- AND neighborhood_id IN (
--     SELECT neighborhood_id
--     FROM Neighborhoods
--     WHERE safety_rating >= 8
-- );


-- SELECT 
--     a.agent_name,
--     (SELECT AVG(s.days_on_market)
--      FROM Sales s
--      WHERE s.agent_id = a.agent_id) AS avg_days_to_sell,
--     (SELECT AVG(days_on_market) FROM Sales) AS market_avg
-- FROM Agents a
-- WHERE EXISTS (
--     SELECT 1 FROM Sales s WHERE s.agent_id = a.agent_id
-- )
-- AND (
--     SELECT AVG(s.days_on_market)
--     FROM Sales s
--     WHERE s.agent_id = a.agent_id
-- ) < (
--     SELECT AVG(days_on_market) FROM Sales
-- );



-- SELECT 
--     b.buyer_name,
--     b.budget,
--     (SELECT COUNT(*) 
--      FROM PropertyListings p
--      WHERE p.listing_price <= b.budget
--      AND (p.neighborhood_id = b.preferred_neighborhood_id 
--           OR b.preferred_neighborhood_id IS NULL)
--      AND NOT EXISTS (SELECT 1 FROM Sales s WHERE s.property_id = p.property_id)
--     ) AS matching_properties,
--     (SELECT MIN(listing_price)
--      FROM PropertyListings p
--      WHERE p.listing_price <= b.budget
--      AND NOT EXISTS (SELECT 1 FROM Sales s WHERE s.property_id = p.property_id)
--     ) AS cheapest_match
-- FROM Buyers b;


-- SELECT buyer_name
-- FROM Buyers b
-- WHERE EXISTS (SELECT 1 FROM Sales s WHERE s.buyer_id = b.buyer_id);


-- SELECT 
--     a.agent_name,
--     COUNT(s.sale_id) AS sales_count
-- FROM Agents a
-- LEFT JOIN Sales s ON a.agent_id = s.agent_id
-- GROUP BY a.agent_name;






