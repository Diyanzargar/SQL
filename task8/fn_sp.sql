use real_estate;

-- DELIMITER $$
-- CREATE PROCEDURE sp_CalcAgentCommission (IN p_agent INT)
-- BEGIN
--   SELECT a.agent_id, a.agent_name,
--          IFNULL(SUM(s.sale_price),0) AS total_sales,
--          ROUND(IFNULL(SUM(s.sale_price),0) * (a.commission_rate/100),2) AS total_commission
--   FROM Agents a
--   LEFT JOIN Sales s ON a.agent_id = s.agent_id
--   WHERE a.agent_id = p_agent
--   GROUP BY a.agent_id, a.agent_name, a.commission_rate;
-- END$$
-- DELIMITER ;

-- DELIMITER $$
-- CREATE PROCEDURE sp_AgentCommission_Out (
--   IN p_agent INT,
--   OUT p_tot_sales DECIMAL(14,2),
--   OUT p_tot_comm DECIMAL(14,2)
-- )
-- BEGIN
--   SELECT IFNULL(SUM(s.sale_price),0) INTO p_tot_sales FROM Sales s WHERE s.agent_id = p_agent;
--   SELECT ROUND(p_tot_sales * IFNULL(a.commission_rate,0) / 100,2) INTO p_tot_comm
--   FROM Agents a WHERE a.agent_id = p_agent;
-- END$$
-- DELIMITER ;

-- DELIMITER $$
-- CREATE PROCEDURE sp_SalesInRangeByNeighborhood (
--   IN p_nid INT,
--   IN p_from DATE,
--   IN p_to DATE
-- )
-- BEGIN
--   SELECT s.sale_id, p.property_id, p.address, s.sale_date, s.sale_price
--   FROM Sales s
--   JOIN PropertyListings p ON s.property_id = p.property_id
--   WHERE p.neighborhood_id = p_nid
--     AND s.sale_date BETWEEN p_from AND p_to
--   ORDER BY s.sale_date;
-- END$$
-- DELIMITER ;

-- DELIMITER $$
-- CREATE PROCEDURE sp_UpdateAgentCommissionRate (
--   IN p_agent INT,
--   IN p_new_rate DECIMAL(4,2),
--   OUT p_old_rate DECIMAL(4,2)
-- )
-- BEGIN
--   SELECT commission_rate INTO p_old_rate FROM Agents WHERE agent_id = p_agent;
--   UPDATE Agents SET commission_rate = p_new_rate WHERE agent_id = p_agent;
-- END$$
-- DELIMITER ;


-- DELIMITER $$
-- CREATE PROCEDURE sp_AnnualSalesForAgent (
--   IN p_agent INT,
--   IN p_start_year INT,
--   IN p_end_year INT
-- )
-- BEGIN
--   DECLARE yr INT DEFAULT p_start_year;
--   WHILE yr <= p_end_year DO
--     SELECT yr AS year, IFNULL(SUM(s.sale_price),0) AS total_sales
--     FROM Sales s
--     JOIN PropertyListings p ON s.property_id = p.property_id
--     WHERE s.agent_id = p_agent AND YEAR(s.sale_date) = yr;
--     SET yr = yr + 1;
--   END WHILE;
-- END$$


-- DELIMITER ;


-- DELIMITER $$
-- CREATE FUNCTION fn_AvgSalePrice (p_nid INT)
-- RETURNS DECIMAL(12,2)
-- DETERMINISTIC
-- BEGIN
--   RETURN (SELECT ROUND(AVG(s.sale_price),2)
--           FROM Sales s JOIN PropertyListings p ON s.property_id = p.property_id
--           WHERE p.neighborhood_id = p_nid);
-- END$$
-- DELIMITER ;

-- DELIMITER $$
-- CREATE FUNCTION fn_TotalSalesAgent (p_agent INT)
-- RETURNS DECIMAL(14,2)
-- DETERMINISTIC
-- BEGIN
--   RETURN (SELECT IFNULL(SUM(s.sale_price),0) FROM Sales s WHERE s.agent_id = p_agent);
-- END$$
-- DELIMITER ;

-- DELIMITER $$
-- CREATE FUNCTION fn_HighestSaleInNeighborhood (p_nid INT)
-- RETURNS DECIMAL(14,2)
-- DETERMINISTIC
-- BEGIN
--   RETURN (SELECT MAX(s.sale_price)
--           FROM Sales s JOIN PropertyListings p ON s.property_id = p.property_id
--           WHERE p.neighborhood_id = p_nid);
-- END$$
-- DELIMITER ;

-- DELIMITER $$
-- CREATE FUNCTION fn_EstCommissionForProperty (p_property INT)
-- RETURNS DECIMAL(12,2)
-- DETERMINISTIC
-- BEGIN
--   RETURN (SELECT ROUND(p.listing_price * IFNULL(a.commission_rate,0) / 100,2)
--           FROM PropertyListings p LEFT JOIN Agents a ON p.agent_id = a.agent_id
--           WHERE p.property_id = p_property);
-- END$$
-- DELIMITER ;


-- DELIMITER $$
-- CREATE FUNCTION fn_CountSalesInRange (p_nid INT, p_from DATE, p_to DATE)
-- RETURNS INT
-- DETERMINISTIC
-- BEGIN
--   RETURN (SELECT COUNT(*)
--           FROM Sales s JOIN PropertyListings p ON s.property_id = p.property_id
--           WHERE p.neighborhood_id = p_nid AND s.sale_date BETWEEN p_from AND p_to);
-- END$$
-- DELIMITER ;

-- CALL sp_CalcAgentCommission(1);

-- CALL sp_CalcAgentCommission(2);

-- CALL sp_SalesInRangeByNeighborhood(1, '2024-03-01', '2024-03-31');


-- CALL sp_SalesInRangeByNeighborhood(2, '2024-01-01', '2024-04-30');

-- CALL sp_UpdateAgentCommissionRate(3, 3.25, @old_rate_3);
-- SELECT @old_rate_3 AS previous_rate_agent3;

-- SELECT agent_id, commission_rate FROM Agents WHERE agent_id = 3;

-- CALL sp_AnnualSalesForAgent(1, 2022, 2024);

-- CALL sp_AnnualSalesForAgent(99, 2022, 2024);

-- SELECT fn_AvgSalePrice(1) AS avg_price_n1;

-- SELECT fn_AvgSalePrice(5) AS avg_price_n5;

-- SELECT fn_TotalSalesAgent(2) AS total_sales_agent2;

-- SELECT fn_HighestSaleInNeighborhood(3) AS highest_sale_n3;

-- SELECT fn_EstCommissionForProperty(1) AS est_commission_prop1;

-- SELECT fn_CountSalesInRange(1, '2024-03-01', '2024-03-31') AS count_march_n1;

-- CALL sp_AgentCommission_Out(1, @ats, @atc);
-- 	SELECT @ats AS agent1_total_sales, 
-- 	fn_AvgSalePrice((SELECT p.neighborhood_id 
--     FROM PropertyListings p 
--     JOIN Sales s ON p.property_id = s.property_id 
--     WHERE s.agent_id = 1 LIMIT 1)) AS sample_neighborhood_avg;

-- SELECT p.property_id, fn_EstCommissionForProperty(p.property_id) AS est_comm
-- FROM PropertyListings p
-- WHERE p.agent_id = 1
-- LIMIT 5;


-- SELECT CASE WHEN fn_CountSalesInRange(1, '2024-01-01', '2024-12-31') = 0 
-- 	THEN 'No sales' ELSE 'Has sales' END AS n1_sales_status;

-- SELECT IFNULL(fn_HighestSaleInNeighborhood(2), 0) AS top_sale_n2;


-- SELECT ROUND(fn_TotalSalesAgent(1) / NULLIF((SELECT SUM(sale_price) FROM Sales),0) * 100,2) AS market_share_agent1;

-- CALL sp_UpdateAgentCommissionRate(3, @dummy_rate := 2.50, @old_rate_tmp);
-- SELECT @old_rate_tmp AS old_rate_before_change;

-- CALL sp_CalcAgentCommission(1);
-- CALL sp_CalcAgentCommission(2);
-- CALL sp_CalcAgentCommission(3);
-- CALL sp_CalcAgentCommission(4);
-- CALL sp_CalcAgentCommission(5);

-- SELECT n.neighborhood_id, fn_CountSalesInRange(n.neighborhood_id, '2024-01-01', '2024-12-31') AS sales_2024
-- FROM Neighborhoods n;


-- SELECT fn_EstCommissionForProperty(10) AS est_comm_prop10;


-- SELECT n.neighborhood_name FROM Neighborhoods n WHERE fn_AvgSalePrice(n.neighborhood_id) > 400000;

-- CALL sp_AgentCommission_Out(4, @ts4, @tc4);
-- SELECT @ts4 AS debug_total_sales_4, @tc4 AS debug_total_comm_4;


