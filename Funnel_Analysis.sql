SELECT * FROM `project-c580fd78-0396-4dd8-866.sql_pracitce.Data_For_Funnel` LIMIT 1000

/*
Analiza lejku sprzedażowego dla ostatnich 30 dni od ostatniej zarejestrowanej instancji. 
Sales funnel analysis for the last 30 days since the last recorded instance. 
*/

WITH funnel_stages AS (

    SELECT
      COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS stage_1_views, 
      COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS stage_2_cart, 
      COUNT(DISTINCT CASE WHEN event_type = 'checkout_start' THEN user_id END) AS stage_3_checkout,
      COUNT(DISTINCT CASE WHEN event_type = 'payment_info' THEN user_id END) AS stage_4_payment,
      COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS stage_5_purchase

  FROM `project-c580fd78-0396-4dd8-866.sql_pracitce.Data_For_Funnel`

  WHERE event_date >= TIMESTAMP(DATE_SUB('2026-02-03', INTERVAL 30 DAY))
)

SELECT * FROM funnel_stages 

/*
Analiza wskaźników konwersji w lejku sprzedażowym: Obliczanie liczby użytkowników oraz procentowej konwersji między etapami procesu zakupowego. 
Sales funnel conversion rate analysis: Calculating user counts and step-by-step conversion rates through process. 
*/

WITH funnel_stages AS (

    SELECT
      COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS stage_1_views, 
      COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS stage_2_cart, 
      COUNT(DISTINCT CASE WHEN event_type = 'checkout_start' THEN user_id END) AS stage_3_checkout,
      COUNT(DISTINCT CASE WHEN event_type = 'payment_info' THEN user_id END) AS stage_4_payment,
      COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS stage_5_purchase

  FROM `project-c580fd78-0396-4dd8-866.sql_pracitce.Data_For_Funnel`

  WHERE event_date >= TIMESTAMP(DATE_SUB('2026-02-03', INTERVAL 30 DAY))
)

SELECT  

  stage_1_views,
  stage_2_cart,
  ROUND(stage_2_cart * 100 / stage_1_views) AS view_to_cart_rate,

  stage_3_checkout,
  ROUND(stage_3_checkout * 100 / stage_2_cart) AS cart_to_checkout_rate, 

  stage_4_payment,
  ROUND(stage_4_payment * 100 / stage_3_checkout) AS checkout_to_purchase_rate, 

  stage_5_purchase, 
  ROUND(stage_5_purchase * 100 /stage_4_payment) AS payment_to_purchase_rate, 

  ROUND(stage_5_purchase * 100 / stage_1_views) AS overall_conversion_rate

  FROM funnel_stages

/*
Analiza skuteczności kanałów ruchu: Porównanie efektywności lejka sprzedażwego w zależności od źródła pochodzenia użytkownika. 
Traffic source performance analysis: Comparing sales funnel efficiency depending on the user's source of origin. 
*/  

WITH source_funnel AS (
  SELECT 
  traffic_source, 
      COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS views, 
      COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS carts, 
      COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchases

  FROM `project-c580fd78-0396-4dd8-866.sql_pracitce.Data_For_Funnel`

  WHERE event_date >= TIMESTAMP(DATE_SUB('2026-02-03', INTERVAL 30 DAY))
  GROUP BY traffic_source
)

SELECT 
  traffic_source,
  views,
  carts,
  purchases,
  ROUND(carts * 100 / views) AS cart_conversion_rate,
  ROUND(purchases * 100 / views) AS purchase_conversion_rate, 
  ROUND(purchases * 100 / carts) AS cart_to_purchase_conversion_rate, 

FROM source_funnel
ORDER BY purchases DESC 

/* 
Prędkość lejka: Analiza czasu spędzonego przez użytkowników na wszystkich etapach lejka.
Funnel Velocity: Analysis of the time spent by users at all stages of the funnel. 
*/

WITH user_journey AS (
  SELECT 
  user_id, 
      MIN(CASE WHEN event_type = 'page_view' THEN event_date END) AS view_time, 
      MIN(CASE WHEN event_type = 'add_to_cart' THEN event_date END) AS cart_time, 
      MIN(CASE WHEN event_type = 'purchase' THEN event_date END) AS purchase_time

  FROM `project-c580fd78-0396-4dd8-866.sql_pracitce.Data_For_Funnel`

  WHERE event_date >= TIMESTAMP(DATE_SUB('2026-02-03', INTERVAL 30 DAY))
  GROUP BY user_id
  HAVING MIN(CASE WHEN event_type = 'purchase' THEN event_date END) IS NOT NULL
)

SELECT 
 COUNT (*) AS converted_users, 
 ROUND(AVG(timestamp_diff(cart_time, view_time, MINUTE)),2) AS avg_view_to_cart_minutes, 
 ROUND(AVG(timestamp_diff(purchase_time, cart_time, MINUTE)),2) AS avg_cart_to_purchase_minutes, 
 ROUND(AVG(timestamp_diff(purchase_time, view_time, MINUTE)),2) AS avg_total_journey_minutes 

FROM user_journey 

/*
Analiza przychodów w lejku sprzedażowym. 
Revenue funnel analysis. 
*/ 

WITH funnel_revenue AS (
  SELECT 
      COUNT(CASE WHEN event_type = 'page_view' THEN user_id END) AS total_visitors, 
      COUNT(CASE WHEN event_type = 'purchase' THEN user_id END) AS total_buyers,
      SUM(CASE WHEN event_type = 'purchase' THEN amount END) AS total_revenue, 
      COUNT(CASE WHEN event_type = 'purchase' THEN 1 END) AS total_orders,

  FROM `project-c580fd78-0396-4dd8-866.sql_pracitce.Data_For_Funnel`

  WHERE event_date >= TIMESTAMP(DATE_SUB('2026-02-03', INTERVAL 30 DAY))
)

SELECT 
  total_visitors,
  total_buyers,
  total_revenue,
  total_orders,
  ROUND (total_revenue / total_orders) AS avg_order_valu,
  ROUND (total_revenue / total_buyers) AS revenue_per_buyer, 
  ROUND (total_revenue / total_visitors) AS revenue_per_visitor

FROM funnel_revenue







