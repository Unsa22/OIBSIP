alter user hr IDENTIFIED by hr;

SELECT column_name 
FROM all_tab_columns 
WHERE table_name = 'RETAIL_SALES';



SELECT * FROM retail_sales WHERE ROWNUM <= 10;

DELETE FROM retail_sales WHERE "sales" IS NULL;




SELECT 
    AVG("sales") AS mean_sales,
    MEDIAN("sales") AS median_sales,
    STDDEV("sales") AS stddev_sales
FROM 
    retail_sales;
   
   SELECT "sales" AS mode_sales
FROM (
    SELECT "sales", COUNT(*) AS frequency
    FROM retail_sales
    GROUP BY "sales"
    ORDER BY frequency DESC
)
WHERE ROWNUM = 1;




SELECT 
    TO_CHAR("Date", 'YYYY-MM') AS month,
    SUM("sales") AS total_sales
FROM 
    retail_sales
GROUP BY 
    TO_CHAR("Date", 'YYYY-MM')
ORDER BY 
    month;
    
    
    
    
    
SELECT 
    customer_id,
    COUNT(order_id) AS num_orders,
    SUM(sales) AS total_spent
FROM 
    retail_sales
GROUP BY 
    customer_id;
    
SELECT 
    product_id,
    COUNT(order_id) AS num_sales,
    SUM(sales) AS total_sales
FROM 
    retail_sales
GROUP BY 
    product_id;
