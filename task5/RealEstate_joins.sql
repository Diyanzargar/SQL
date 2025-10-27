USE REAL_ESTATE;

-- SELECT 
--     p.property_id,
--     p.address,
--     n.neighborhood_name,
--     p.listing_price
-- FROM PropertyListings p
-- INNER JOIN Neighborhoods n ON p.neighborhood_id = n.neighborhood_id;


-- SELECT 
--     s.sale_id,
--     p.address,
--     b.buyer_name,
--     s.sale_price
-- FROM Sales s
-- INNER JOIN PropertyListings p ON s.property_id = p.property_id
-- INNER JOIN Buyers b ON s.buyer_id = b.buyer_id;

-- SELECT 
--     b.buyer_name,
--     b.budget,
--     p.address,
--     s.sale_price
-- FROM Buyers b
-- LEFT JOIN Sales s ON b.buyer_id = s.buyer_id
-- LEFT JOIN PropertyListings p ON s.property_id = p.property_id;

-- SELECT 
--     p.address,
--     n.neighborhood_name,
--     n.city,
--     n.safety_rating
-- FROM PropertyListings p
-- LEFT JOIN Neighborhoods n ON p.neighborhood_id = n.neighborhood_id;

-- SELECT 
--     n.neighborhood_name,
--     n.average_price_per_sqft,
--     p.address,
--     p.listing_price
-- FROM PropertyListings p
-- RIGHT JOIN Neighborhoods n ON p.neighborhood_id = n.neighborhood_id;

-- SELECT 
--     a.agent_name,
--     a.experience_years,
--     p.address,
--     p.listing_price
-- FROM PropertyListings p
-- RIGHT JOIN Agents a ON p.agent_id = a.agent_id;

-- SELECT 
--     s.sale_id,
--     p.address,
--     b.buyer_name,
--     a.agent_name,
--     s.sale_price,
--     s.sale_date
-- FROM Sales s
-- INNER JOIN PropertyListings p ON s.property_id = p.property_id
-- INNER JOIN Buyers b ON s.buyer_id = b.buyer_id
-- INNER JOIN Agents a ON s.agent_id = a.agent_id;

-- SELECT 
--     p.address,
--     n.neighborhood_name,
--     a.agent_name,
--     b.buyer_name,
--     s.sale_price,
--     s.days_on_market
-- FROM Sales s
-- INNER JOIN PropertyListings p ON s.property_id = p.property_id
-- INNER JOIN Neighborhoods n ON p.neighborhood_id = n.neighborhood_id
-- INNER JOIN Buyers b ON s.buyer_id = b.buyer_id
-- INNER JOIN Agents a ON s.agent_id = a.agent_id;

    
-- SELECT 
--     b1.buyer_name AS buyer1,
--     b2.buyer_name AS buyer2,
--     b1.budget AS budget1,
--     b2.budget AS budget2,
--     ABS(b1.budget - b2.budget) AS budget_difference    -- absolute difference
-- FROM Buyers b1
-- INNER JOIN Buyers b2 
--     ON b1.buyer_id < b2.buyer_id
--     AND ABS(b1.budget - b2.budget) <= 50000;

-- SELECT 
--     b.buyer_name,
--     a.agent_name
-- FROM Buyers b
-- CROSS JOIN Agents a;

-- SELECT *
-- FROM PropertyListings
-- NATURAL JOIN Neighborhoods;

-- SELECT 
--     p.address,
--     p.listing_price,
--     b.buyer_name,
--     b.budget
-- FROM PropertyListings p
-- INNER JOIN Buyers b 
--     ON p.listing_price <= b.budget 
--     AND p.listing_price >= (b.budget * 0.8);


-- SELECT 
--     p.address,
--     p.listing_price,
--     n.neighborhood_name,
--     n.safety_rating
-- FROM PropertyListings p
-- INNER JOIN (
--     SELECT neighborhood_id, neighborhood_name, safety_rating
--     FROM Neighborhoods
--     WHERE safety_rating >= 8
-- ) n ON p.neighborhood_id = n.neighborhood_id;


-- SELECT 
--     a.agent_name,
--     a.experience_years,
--     COUNT(DISTINCT p.property_id) AS properties_listed,
--     COUNT(DISTINCT s.sale_id) AS properties_sold,
--     ROUND(COUNT(DISTINCT s.sale_id) * 100.0 / COUNT(DISTINCT p.property_id), 2) AS success_rate,
--     SUM(s.sale_price) AS total_sales_value,
--     SUM(s.sale_price * a.commission_rate / 100) AS total_commission
-- FROM Agents a
-- LEFT JOIN PropertyListings p ON a.agent_id = p.agent_id
-- LEFT JOIN Sales s ON p.property_id = s.property_id
-- GROUP BY a.agent_id, a.agent_name, a.experience_years
-- ORDER BY total_sales_value DESC;

-- SELECT 
--     n.neighborhood_name,
--     n.average_price_per_sqft,
--     n.safety_rating,
--     COUNT(DISTINCT p.property_id) AS total_listings,
--     COUNT(DISTINCT s.sale_id) AS total_sales,
--     AVG(p.listing_price) AS avg_listing_price,
--     AVG(s.sale_price) AS avg_sale_price,
--     AVG(s.days_on_market) AS avg_days_to_sell,
--     ROUND((AVG(s.sale_price) - AVG(p.listing_price)) * 100.0 / AVG(p.listing_price), 2) AS avg_price_change_pct
-- FROM Neighborhoods n
-- LEFT JOIN PropertyListings p ON n.neighborhood_id = p.neighborhood_id
-- LEFT JOIN Sales s ON p.property_id = s.property_id
-- GROUP BY n.neighborhood_id, n.neighborhood_name, n.average_price_per_sqft, n.safety_rating
-- ORDER BY total_sales DESC;

-- SELECT 
--     p.address,
--     n.neighborhood_name,
--     s.sale_price
-- FROM PropertyListings p
-- INNER JOIN Neighborhoods n ON p.neighborhood_id = n.neighborhood_id
-- INNER JOIN Sales s ON p.property_id = s.property_id
-- WHERE n.safety_rating >= 8  -- Filter applied early
--   AND p.bedrooms >= 3;