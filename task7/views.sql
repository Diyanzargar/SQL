use real_estate;

-- CREATE VIEW AvailableProperties AS
-- SELECT 
--     property_id,
--     address,
--     bedrooms,
--     bathrooms,
--     square_feet,
--     listing_price,
--     listing_date
-- FROM PropertyListings
-- WHERE property_id NOT IN (SELECT property_id FROM Sales);

-- SELECT * FROM AvailableProperties;

-- CREATE VIEW LuxuryProperties AS
-- SELECT 
--     property_id,
--     address,
--     bedrooms,
--     bathrooms,
--     listing_price,-- 
--     square_feet
-- FROM PropertyListings
-- WHERE listing_price > 450000;

-- CREATE VIEW BudgetProperties AS
-- SELECT 
--     property_id,
--     address,
--     bedrooms,
--     bathrooms,
--     listing_price,
--     listing_price / square_feet AS price_per_sqft
-- FROM PropertyListings
-- WHERE listing_price < 350000;



-- CREATE VIEW PropertyDetails AS
-- SELECT 
--     p.property_id,
--     p.address,
--     p.bedrooms,
--     p.bathrooms,
--     p.listing_price,
--     n.neighborhood_name,
--     n.safety_rating,
--     n.average_price_per_sqft
-- FROM PropertyListings p
-- LEFT JOIN Neighborhoods n ON p.neighborhood_id = n.neighborhood_id;

-- CREATE VIEW SalesComplete AS
-- SELECT 
--     s.sale_id,
--     p.address AS property_address,
--     b.buyer_name,
--     a.agent_name,
--     s.sale_price,
--     s.sale_date,
--     s.days_on_market,
--     n.neighborhood_name
-- FROM Sales s
-- INNER JOIN PropertyListings p ON s.property_id = p.property_id
-- INNER JOIN Buyers b ON s.buyer_id = b.buyer_id
-- INNER JOIN Agents a ON s.agent_id = a.agent_id
-- LEFT JOIN Neighborhoods n ON p.neighborhood_id = n.neighborhood_id;

-- CREATE VIEW AgentListings AS
-- SELECT 
--     a.agent_name,
--     a.email,
--     a.experience_years,
--     p.address,
--     p.listing_price,
--     p.bedrooms,
--     p.listing_date,
--     CASE 
--         WHEN s.sale_id IS NOT NULL THEN 'Sold'
--         ELSE 'Available'
--     END AS status
-- FROM Agents a
-- LEFT JOIN PropertyListings p ON a.agent_id = p.agent_id
-- LEFT JOIN Sales s ON p.property_id = s.property_id;


-- CREATE VIEW NeighborhoodStats AS
-- SELECT 
--     n.neighborhood_name,
--     n.safety_rating,
--     COUNT(DISTINCT p.property_id) AS total_properties,
--     COUNT(DISTINCT s.sale_id) AS properties_sold,
--     AVG(p.listing_price) AS avg_listing_price,
--     AVG(s.sale_price) AS avg_sale_price,
--     MIN(p.listing_price) AS min_price,
--     MAX(p.listing_price) AS max_price
-- FROM Neighborhoods n
-- LEFT JOIN PropertyListings p ON n.neighborhood_id = p.neighborhood_id
-- LEFT JOIN Sales s ON p.property_id = s.property_id
-- GROUP BY n.neighborhood_name, n.safety_rating;


-- CREATE VIEW AgentPerformance AS
-- SELECT 
--     a.agent_name,
--     a.experience_years,
--     a.commission_rate,
--     COUNT(DISTINCT p.property_id) AS total_listings,
--     COUNT(DISTINCT s.sale_id) AS total_sales,
--     ROUND(COUNT(DISTINCT s.sale_id) * 100.0 / 
--           NULLIF(COUNT(DISTINCT p.property_id), 0), 2) AS success_rate,
--     SUM(s.sale_price) AS total_sales_value,
--     SUM(s.sale_price * a.commission_rate / 100) AS total_commission
-- FROM Agents a
-- LEFT JOIN PropertyListings p ON a.agent_id = p.agent_id
-- LEFT JOIN Sales s ON p.property_id = s.property_id
-- GROUP BY a.agent_name, a.experience_years, a.commission_rate;



-- CREATE VIEW BuyerActivity AS
-- SELECT 
--     b.buyer_name,
--     b.email,
--     b.budget,
--     COUNT(s.sale_id) AS properties_purchased,
--     SUM(s.sale_price) AS total_spent,
--     b.budget - COALESCE(SUM(s.sale_price), 0) AS remaining_budget
-- FROM Buyers b
-- LEFT JOIN Sales s ON b.buyer_id = s.buyer_id
-- GROUP BY b.buyer_name, b.email, b.budget;


-- CREATE VIEW PublicPropertyListings AS
-- SELECT 
--     p.address,
--     p.bedrooms,
--     p.bathrooms,
--     p.square_feet,
--     p.listing_price,
--     n.neighborhood_name,
--     n.safety_rating,
--     a.agent_name,
--     a.phone AS contact_phone
--     -- Note: agent_id, commission_rate are hidden
-- FROM PropertyListings p
-- LEFT JOIN Neighborhoods n ON p.neighborhood_id = n.neighborhood_id
-- LEFT JOIN Agents a ON p.agent_id = a.agent_id;

-- CREATE VIEW BuyerContactInfo AS
-- SELECT 
--     buyer_name,
--     email,
--     phone
--     -- Note: buyer_id and budget are hidden for privacy
-- FROM Buyers;



-- CREATE VIEW RecentSales AS
-- SELECT 
--     p.address,
--     s.sale_price,
--     s.sale_date,
--     n.neighborhood_name,
--     s.days_on_market
-- FROM Sales s
-- INNER JOIN PropertyListings p ON s.property_id = p.property_id
-- LEFT JOIN Neighborhoods n ON p.neighborhood_id = n.neighborhood_id
-- WHERE s.sale_date >= DATE('now', '-90 days');

-- CREATE VIEW InvestmentOpportunities AS
-- SELECT 
--     p.address,
--     p.listing_price,
--     n.neighborhood_name,
--     n.safety_rating,
--     p.bedrooms,
--     p.bathrooms,
--     p.square_feet,
--     p.listing_price / p.square_feet AS price_per_sqft,
--     n.average_price_per_sqft,
--     CASE 
--         WHEN p.listing_price / p.square_feet < n.average_price_per_sqft * 0.9
--              AND n.safety_rating >= 8
--         THEN 'Excellent'
--         WHEN p.listing_price / p.square_feet < n.average_price_per_sqft
--              AND n.safety_rating >= 7
--         THEN 'Good'
--         ELSE 'Fair'
--     END AS investment_rating
-- FROM PropertyListings p
-- INNER JOIN Neighborhoods n ON p.neighborhood_id = n.neighborhood_id
-- WHERE p.property_id NOT IN (SELECT property_id FROM Sales);

-- CREATE VIEW MarketTrends AS
-- SELECT 
--     n.neighborhood_name,
--     AVG(p.listing_price) AS avg_asking_price,
--     AVG(s.sale_price) AS avg_sold_price,
--     AVG(s.sale_price - p.listing_price) AS avg_price_change,
--     ROUND((AVG(s.sale_price) - AVG(p.listing_price)) * 100.0 / 
--           AVG(p.listing_price), 2) AS price_change_percent,
--     AVG(s.days_on_market) AS avg_days_to_sell,
--     COUNT(*) AS sales_count
-- FROM Sales s
-- INNER JOIN PropertyListings p ON s.property_id = p.property_id
-- INNER JOIN Neighborhoods n ON p.neighborhood_id = n.neighborhood_id
-- GROUP BY n.neighborhood_name;


-- CREATE VIEW EditableProperties AS
-- SELECT 
--     property_id,
--     address,
--     listing_price,
--     bedrooms,
--     bathrooms
-- FROM PropertyListings
-- WHERE property_id NOT IN (SELECT property_id FROM Sales);

-- CREATE VIEW SafeNeighborhoodProperties AS
-- SELECT 
--     p.property_id,
--     p.address,
--     p.listing_price,
--     p.bedrooms,
--     p.neighborhood_id
-- FROM PropertyListings p
-- WHERE p.neighborhood_id IN (
--     SELECT neighborhood_id FROM Neighborhoods WHERE safety_rating >= 8
-- );

