use testdb;



#Heaviest Product
SELECT 
    Product_ID,
    Product_Category_Name,
    Product_Weight_Gr
FROM product
ORDER BY Product_Weight_Gr DESC
LIMIT 10;

SELECT 
    c.Customer_Trx_ID,
    COUNT(DISTINCT o.Order_ID) AS total_orders
FROM customer_list c
JOIN orders o ON c.Customer_Trx_ID = o.Customer_Trx_ID
GROUP BY c.Customer_Trx_ID;

#Customer Distribution by Country
SELECT 
    Customer_Country,
    COUNT(*) AS total_customers
FROM customer_list
GROUP BY Customer_Country
ORDER BY total_customers DESC;

#New vs Returning Customers
SELECT 
    cl.Customer_Trx_ID,
    COUNT(o.Order_ID) AS total_orders,
    CASE 
        WHEN COUNT(o.Order_ID) = 1 THEN 'New'
        ELSE 'Returning'
    END AS customer_type
FROM customer_list cl
JOIN orders o ON cl.Customer_Trx_ID = o.Customer_Trx_ID
GROUP BY cl.Customer_Trx_ID;

#Average Delivery Time
SELECT 
    ROUND(AVG(DATEDIFF(Order_Delivered_Customer_Date, Order_Purchase_Timestamp)), 2) AS avg_delivery_days
FROM orders
WHERE Order_Delivered_Customer_Date IS NOT NULL;

#Late Deliveries
SELECT 
    Order_ID,
    Order_Estimated_Delivery_Date,
    Order_Delivered_Customer_Date,
    DATEDIFF(Order_Delivered_Customer_Date, Order_Estimated_Delivery_Date) AS delay_days
FROM orders
WHERE Order_Delivered_Customer_Date > Order_Estimated_Delivery_Date;

#Monthly Order Volume
SELECT 
    DATE_FORMAT(Order_Purchase_Timestamp, '%Y-%m') AS order_month,
    COUNT(Order_ID) AS order_count
FROM orders
GROUP BY order_month
ORDER BY order_month;

#Top Performing Sellers by Review Score
SELECT 
    s.Seller_ID,
    s.Seller_Name,
    ROUND(AVG(r.Review_Score), 2) AS avg_review_score,
    COUNT(DISTINCT oi.Order_ID) AS total_orders
FROM sellers_list s
JOIN order_items oi ON s.Seller_ID = oi.Seller_ID
JOIN order_reviews r ON oi.Order_ID = r.Order_ID
GROUP BY s.Seller_ID, s.Seller_Name
ORDER BY avg_review_score DESC
LIMIT 10;

#Seller Delivery Count
SELECT 
    s.Seller_ID,
    COUNT(oi.Order_ID) AS orders_delivered
FROM sellers_list s
JOIN order_items oi ON s.Seller_ID = oi.Seller_ID
GROUP BY s.Seller_ID
ORDER BY orders_delivered DESC;

 #Preferred Payment Methods
SELECT 
    Payment_Type,
    COUNT(*) AS total_transactions,
    ROUND(SUM(Payment_Value), 2) AS total_value
FROM order_payments
GROUP BY Payment_Type
ORDER BY total_value DESC;

#Installment Usage Trends
SELECT 
    Payment_Installments,
    COUNT(*) AS transaction_count
FROM order_payments
GROUP BY Payment_Installments
ORDER BY Payment_Installments;

# Score Distribution
SELECT 
    Review_Score,
    COUNT(*) AS review_count
FROM order_reviews
GROUP BY Review_Score
ORDER BY Review_Score DESC;

#Review Score vs Delivery Delay
SELECT 
    r.Review_Score,
    DATEDIFF(o.Order_Delivered_Customer_Date, o.Order_Estimated_Delivery_Date) AS delay_days
FROM order_reviews r
JOIN orders o ON r.Order_ID = o.Order_ID
WHERE o.Order_Delivered_Customer_Date > o.Order_Estimated_Delivery_Date;


 #Frequently Sold Together Products (by Order ID)
SELECT 
    oi1.Product_ID AS Product_1,
    oi2.Product_ID AS Product_2,
    COUNT(*) AS times_sold_together
FROM order_items oi1
JOIN order_items oi2 
    ON oi1.Order_ID = oi2.Order_ID 
    AND oi1.Product_ID < oi2.Product_ID
GROUP BY oi1.Product_ID, oi2.Product_ID
ORDER BY times_sold_together DESC
LIMIT 10;


#Customer Churn Rate Over Time (Monthly)
WITH monthly_orders AS (
    SELECT 
        Customer_Trx_ID,
        DATE_FORMAT(Order_Purchase_Timestamp, '%Y-%m') AS order_month
    FROM orders
    GROUP BY Customer_Trx_ID, order_month
),
customer_retention AS (
    SELECT 
        order_month,
        COUNT(DISTINCT Customer_Trx_ID) AS active_customers
    FROM monthly_orders
    GROUP BY order_month
)
SELECT 
    order_month,
    active_customers,
    LAG(active_customers) OVER (ORDER BY order_month) AS prev_month_customers,
    ROUND((1 - (active_customers / NULLIF(LAG(active_customers) OVER (ORDER BY order_month), 0))) * 100, 2) AS churn_rate_percent
FROM customer_retention;


#Cities with Frequent Delivery Delays
SELECT 
    cl.Customer_City,
    COUNT(*) AS delayed_orders
FROM orders o
JOIN customer_list cl ON o.Customer_Trx_ID = cl.Customer_Trx_ID
WHERE o.Order_Delivered_Customer_Date > o.Order_Estimated_Delivery_Date
GROUP BY cl.Customer_City
ORDER BY delayed_orders DESC
LIMIT 10;

ALTER TABLE sellers_list CHANGE `ï»¿Seller_ID` `Seller_ID` VARCHAR(255);


#Avg Actual vs Estimated Delivery Days by Seller
SELECT 
    s.Seller_ID,
    s.Seller_Name,
    ROUND(AVG(DATEDIFF(o.Order_Delivered_Customer_Date, o.Order_Purchase_Timestamp)), 2) AS actual_delivery_days,
    ROUND(AVG(DATEDIFF(o.Order_Estimated_Delivery_Date, o.Order_Purchase_Timestamp)), 2) AS estimated_delivery_days,
    ROUND(AVG(DATEDIFF(o.Order_Delivered_Customer_Date, o.Order_Estimated_Delivery_Date)), 2) AS delay_days
FROM orders o
JOIN order_items oi ON o.Order_ID = oi.Order_ID
JOIN sellers_list s ON oi.Seller_ID = s.Seller_ID
WHERE o.Order_Delivered_Customer_Date IS NOT NULL 
    AND o.Order_Estimated_Delivery_Date IS NOT NULL
GROUP BY s.Seller_ID, s.Seller_Name
ORDER BY delay_days DESC;

#Which months have the highest sales volume and revenue?
SELECT 
    DATE_FORMAT(o.Order_Purchase_Timestamp, '%Y-%m') AS order_month,
    COUNT(DISTINCT o.Order_ID) AS total_orders,
    SUM(oi.Price) AS total_revenue
FROM orders o
JOIN order_items oi ON o.Order_ID = oi.Order_ID
GROUP BY order_month
ORDER BY order_month;

#How long does it take on average to respond to customer reviews?
SELECT 
    ROUND(AVG(TIMESTAMPDIFF(HOUR, r.Review_Creation_Date, r.Review_Answer_Timestamp)), 2) AS avg_response_time_hours
FROM order_reviews r
WHERE r.Review_Creation_Date IS NOT NULL AND r.Review_Answer_Timestamp IS NOT NULL;


#Which sellers have the highest number of delayed deliveries?
SELECT 
    s.Seller_ID,
    s.Seller_Name,
    COUNT(*) AS delayed_orders
FROM orders o
JOIN order_items oi ON o.Order_ID = oi.Order_ID
JOIN sellers_list s ON oi.Seller_ID = s.Seller_ID
WHERE o.Order_Delivered_Customer_Date > o.Order_Estimated_Delivery_Date
GROUP BY s.Seller_ID, s.Seller_Name
ORDER BY delayed_orders DESC
LIMIT 10;

#What is the average time between order approval and delivery?
SELECT 
    ROUND(AVG(DATEDIFF(o.Order_Delivered_Customer_Date, o.Order_Approved_At)), 2) AS avg_approval_to_delivery_days
FROM orders o
WHERE o.Order_Approved_At IS NOT NULL AND o.Order_Delivered_Customer_Date IS NOT NULL;

#What is the average profit per order (price - freight)
SELECT 
    ROUND(AVG(oi.Price - oi.Freight_Value), 2) AS avg_profit_per_order
FROM order_items oi;


#Average Number of Items Per Order (Basket Size)
SELECT 
    ROUND(AVG(items_per_order), 2) AS avg_items_per_order
FROM (
    SELECT Order_ID, COUNT(*) AS items_per_order
    FROM order_items
    GROUP BY Order_ID
) AS order_summary;


#Time from Order to Actual Delivery
SELECT 
    ROUND(AVG(DATEDIFF(Order_Delivered_Customer_Date, Order_Purchase_Timestamp)), 2) AS avg_delivery_time_days
FROM orders
WHERE Order_Delivered_Customer_Date IS NOT NULL;

#Delayed Delivery Impact on Review Scores
SELECT 
    CASE 
        WHEN o.Order_Delivered_Customer_Date > o.Order_Estimated_Delivery_Date THEN 'Delayed'
        ELSE 'On Time'
    END AS delivery_status,
    ROUND(AVG(r.Review_Score), 2) AS avg_review_score
FROM orders o
JOIN order_reviews r ON o.Order_ID = r.Order_ID
WHERE o.Order_Delivered_Customer_Date IS NOT NULL
GROUP BY delivery_status;

#Repeat Purchase Rate (Customers with >1 order)
SELECT 
    COUNT(*) AS repeat_customers
FROM (
    SELECT Customer_Trx_ID
    FROM orders
    GROUP BY Customer_Trx_ID
    HAVING COUNT(DISTINCT Order_ID) > 1
) AS repeats;














