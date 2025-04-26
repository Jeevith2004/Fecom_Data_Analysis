# Fecom_Data_Analysis

<h2>A.Problem Statement</h2>

In the fast-paced world of e-commerce, timely delivery, accurate customer targeting, and seller performance directly impact brand trust and profitability.Fecom Inc. is a global e-commerce marketplace based in Berlin, operating across 28 countries with over 99,000 orders and 3,000 sellers between 2022 and 2024. The company faces challenges in managing delivery efficiency, customer satisfaction, and seller performance across diverse regions. This dataset enables analysis of order logistics, customer behavior, and product dynamics to drive smarter business decisions.

<h2>B.Data Structure & Initial checks</h2>

![Screenshot 2025-04-19 185716](https://github.com/user-attachments/assets/b9eb27a3-62bb-457d-98d7-f376e6f4422d)

<h2>C. Key Business Checks using SQL</h2>

This section covers critical business validations and performance insights derived through SQL analysis on the Fecom dataset. These checks were designed to reflect real-world use cases in e-commerce operations, focusing on improving customer experience, optimizing logistics, and tracking seller effectiveness.

Key areas analyzed include:

- Product Insights: Identified the heaviest product listings and evaluated installment usage trends across product types.

- Customer Segmentation & Behavior: Analyzed customer distribution by country, tracked the shift between new and returning customers, and monitored churn rate trends over time.

- Order & Delivery Analysis: Assessed average delivery times, monthly order volumes, and seller-wise delivery counts to uncover fulfillment patterns.

- Payment Behavior: Explored preferred payment methods and the adoption of installment options among buyers.

- Seller & Review Performance: Evaluated top-performing sellers based on review scores and analyzed rating score distribution for overall experience insights.

 <h4> SQL-based analysis was used to derive all core insights and is available for review in file uploaded above </h4>

<h2>D.Dashboard Walkthrough</h2>

<h3>Executive Summary</h3>

![Screenshot 2025-04-26 095308](https://github.com/user-attachments/assets/93ced24f-2fa8-4162-84de-b50eef83780c)

1.KPI Metrics:

- The dashboard presents a comprehensive overview of Fecom's marketplace performance between mid-2022 and late-2024. __On-Time Delivery stands at 92.09%, exceeding the set goal of 90%__, reflecting strong 
 operational efficiency in order fulfillment. __Total Revenue has reached 13.59M__, showcasing a consistent growth trajectory, although it falls slightly short of the ambitious goal of 15M. The __Complaint Rate 
 is notably low at 14.78%__, which is significantly better than the goal threshold of 500%, indicating a strong focus on customer satisfaction and quality control.

2.Line Chart:

- The trend charts reveal that __Total Orders steadily increased from July 2022 to early 2024, peaking around mid-2024 before experiencing a decline towards the end of the year__. Similarly, the __Monthly Revenue 
 Trend shows a sharp growth phase through 2023, with revenue peaks observed around mid-2024, followed by a noticeable drop toward late 2024__. These patterns suggest strong business expansion through most of the 
 analyzed period, but the recent decline could signal market saturation, operational challenges, or external factors affecting customer demand.

<h3>Customer Insights</h3>

![Screenshot 2025-04-26 095524](https://github.com/user-attachments/assets/007d0e86-ea5f-4099-a73d-b2b649436a16)

1. Average Order Value by Customer

- The average order value varies widely across customers, but __most transactions cluster between the mid-range values, suggesting a stable purchasing pattern__ among the majority of customers.
  This distribution is typical in e-commerce where a few __high-value customers place large orders, but the majority make purchases within an affordable price range__. It reflects both affordability and the broad 
  customer base Fecom has captured.

2. Demographic Trends Linked with Order Frequency

  - __Male and female customers contribute almost equally to the order volume, each recording around 113,000 orders__.This even split indicates that the product offerings and marketing strategies appeal equally 
    across genders, ensuring a balanced market reach __without strong bias towards a particular demographic__.

3. Top 10 Customer Cities

- __Brescia tops the customer base, followed by Vigo and L'Hospitalet de Llobregat, indicating geographic concentration of customers__.These cities may either have high marketing penetration, better delivery 
  networks, or a stronger local brand presence, making them key target areas for business expansion and retention efforts.

4. New Customers per Month

- __New customer acquisition showed a steady increase from late 2022, peaking around mid-2024, before sharply declining towards the end of 2024__.The growth phase suggests successful marketing or seasonal 
  campaigns, while the __decline could point to market saturation, increased competition, or reduced promotional activities__ in recent months that require attention.

<h3>Product Performance</h3>

![Screenshot 2025-04-26 095731](https://github.com/user-attachments/assets/ee314346-ae9d-4784-a35b-da81293265c7)

1. Revenue by Product Category

- __"Health and Beauty" products generate the highest revenue, followed by "Watches" and "Bed & Bath" categories.Health, fashion, and home essentials often have higher margins and frequent repeat purchases__, 
  which  naturally boost total revenue. Also, these categories target daily needs and lifestyle upgrades.

2. Average Freight per Category

-  Categories like "Garden Tools" and "Cool Stuff" have the highest average freight charges, while "Watches" and "Bed & Bath" have lower freight values.__Bulkier or heavier products (like garden tools) cost more 
   to ship. In contrast, lightweight items (like watches) have lower logistics costs__.

 3. Top 10 Products by Units Sold

- "Construction Tools" and "Tablets/Printing/Imaging" are the top-selling product categories by number of orders.__Construction and tech gadgets likely saw higher demand due to DIY trends, home upgrades, and 
   remote working needs, especially post-2022 when remote/home-based setups became normal__.

4. Do Heavier/Larger Products Affect Delivery Performance
   
-  Delivery duration does not increase dramatically even for higher product volumes; most deliveries are clustered with similar delivery times regardless of product size.
   __Likely because the logistics network is well-optimized — heavy items might be pre-stocked in closer warehouses or specialized couriers are handling bulky products efficiently__.

  <h3>Seller Analysis</h3>

   ![Screenshot 2025-04-26 095823](https://github.com/user-attachments/assets/9019653f-39b7-4954-be01-0de162ed2c75)

   1. Total Orders by Seller City

- Sellers from Berlin dominate total orders by a large margin. Other cities like Halle (Saale) and Vienna have much lower order volumes.__Berlin is likely a central hub with higher seller density, better 
  logistics networks, and closer proximity to customers, leading to more orders__.

2. Total Revenue by Seller Name

- "PrimeLogistics" generates the highest total revenue among sellers, followed by "CoreLogistics" and "FusionStratagems.__"These top sellers likely specialize in high-value goods or have better operational 
   scale, allowing them to capture a larger share of the market's total spend__.

3. Sum of Total Orders and Revenue by Seller Name (Line Chart)

- While some sellers have many orders but lower revenue (e.g., BorealBloom, AlphaLabs), others like CoreLogistics maintain a higher revenue per order pattern.__Some sellers sell low-cost, high-volume products, 
  while others focus on high-margin or premium products__ this creates differences between order count and revenue curves.

<h3> Order Fullfilment Efficiency </h3>
  
![Screenshot 2025-04-26 095931](https://github.com/user-attachments/assets/8f44afbb-cb85-47b4-be48-e9e320773fcd)

1. Top KPIs
     
- AVG Delivery Time: 12.54 days

- Late Deliveries: 320

- AVG Delay Days: 8.88 days

- Total Delayed Orders: 7,827 orders

Insight:
Even though there are many delayed orders (7,827), only 320 are considered "late deliveries" — suggesting different thresholds for "delayed" vs "late" (maybe late = extremely delayed).

2. Delayed Orders and Avg Delay Days by Month

- March had the highest delayed orders (~2000+), followed by February and November.Delay days were highest around February-March, __then improved toward the middle of the year.Likely due to seasonal pressures: 
  e.g., winter weather, year-start supply chain issues, or holiday backlogs from December spilling over__.Improvement after March suggests operational adjustments were made.

3. Average Delivery Time (Actual vs Estimated)

- From Oct 2022 to mid-2023, __the gap between actual and estimated delivery time reduced, showing better accuracy in delivery estimates__.However, from mid-2024, both times spiked again, indicating new 
  inefficiencies or external factors causing delivery issues.__Early efforts probably optimized logistics.The later spike could hint at market expansion, supplier issues, or economic disruptions__.

  <h3> Payment Analysis </h3>

![Screenshot 2025-04-26 114429](https://github.com/user-attachments/assets/056d7fe9-9e48-4fd2-873c-9d3f1d424a3a)

  1. Number of Orders by Payment Type
     
- This chart shows that credit cards are by far the most preferred method of payment among customers, with a count significantly higher than any other method (~76K orders). Debit cards come in second but still 
  lag far behind. Vouchers and prepaid cards are minimally used.__Customers prefer the flexibility and benefits (like rewards, cashbacks, or EMI options) associated with credit card purchases__.__Credit cards 
  often offer loyalty points, better fraud protection, and higher spending limits compared to debit cards or vouchers, making them more attractive for online shopping__.

2. Revenue by Payment Type

- Revenue analysis reveals that __credit card payments generate the highest total revenue__, contributing over 12 million in sales. Debit card payments follow but are much lower (~4M), and voucher and prepaid 
  card users contribute a very small fraction. __Credit card customers are not only larger in number but also higher in spending, directly driving most of the company’s revenue__.Since credit cards allow 
  deferred payments and higher credit limits, customers feel more comfortable making larger or more frequent purchases compared to using their direct bank funds or prepaid balance.

3. Average Payment Per Order (Tile KPI)
   
- The tile at the top shows that the overall average payment per order across all payment types is __approximately $161.00.On average, each order contributes around $161, helping benchmark future marketing or 
  sales strategies (e.g., target campaigns above $160)__. A healthy average order value like $161 signals that the platform is attracting quality, serious buyers rather than just low-ticket shoppers.

5. Avg. Order Value by Payment Type
   
- The average payment per order is highest for credit card transactions (~160+ per order), with debit cards and prepaid cards slightly lower (~140–150). Voucher users have the lowest average order value 
  (~100).Credit card users tend to make higher-value purchases, making them a more profitable segment to target. Voucher users are more likely to make small, cost-sensitive purchases.__Customers using credit 
  cards often have higher purchasing power and are less price-sensitive than voucher users, who are usually budget-conscious and might be using vouchers specifically for discounts__.

  <h2>Recomendation:</h2>

  - To sustain the strong performance seen among top-performing categories, it is recommended to further invest in targeted marketing campaigns for high-selling products. Simultaneously, explore opportunities to 
    diversify underperforming categories through bundled offers or seasonal promotions, ensuring a balanced portfolio.

  - Given the sharp fluctuations in monthly sales, it is advisable to implement predictive analytics to better forecast demand patterns. Enhancing inventory planning based on these forecasts can minimize 
    stockouts during peak months and reduce overstock during low-demand periods.

  - Since a few customer segments drive the majority of sales, introducing a loyalty program tailored for high-value customers could maximize retention and average spend. At the same time, a targeted campaign 
    should be designed to nurture the smaller segments showing growth potential.

  - Regional sales disparities suggest a need for localized marketing strategies. Allocating more resources towards high-performing regions while simultaneously running awareness campaigns in lower-performing 
    areas can drive more uniform sales growth.

  - The analysis shows critical products contributing heavily to revenue. To protect this revenue, it is recommended to ensure a reliable supply chain for these key products and consider upselling related items 
    through cross-selling initiatives.

  - Customer behavior trends indicate opportunities for personalization. By deploying customer segmentation models and delivering personalized product recommendations, the company can boost engagement rates and 
    drive higher conversion.   



  
































 
