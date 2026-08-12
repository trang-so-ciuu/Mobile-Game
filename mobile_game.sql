SELECT top 10 *
FROM [mobile_game].[dbo].[mobile_game_data]

--1.Total user
SELECT COUNT(DISTINCT UserID) AS total_users
FROM [dbo].[mobile_game_data];

--2.Total IAP Revenue
SELECT SUM(InAppPurchaseAmount) AS total_revenue
FROM [dbo].[mobile_game_data];

--3.ARPPU
SELECT SUM(InAppPurchaseAmount) / COUNT(DISTINCT UserID) AS ARPPU
FROM [dbo].[mobile_game_data];

--4.Revenue Contribution của Whale
SELECT
    SUM(
        CASE
            WHEN SpendingSegment = 'Whale'
            THEN InAppPurchaseAmount
            ELSE 0
        END
    )/ SUM(InAppPurchaseAmount) AS whale_revenue_share
FROM [dbo].[mobile_game_data];

--5.Monetization theo Spending Segment
SELECT
    SpendingSegment,
    COUNT(DISTINCT UserID) AS users,
    SUM(InAppPurchaseAmount) AS revenue,
    SUM(InAppPurchaseAmount)/ COUNT(DISTINCT UserID) AS ARPU,
    COUNT(DISTINCT UserID) * 100.0 / SUM(COUNT(DISTINCT UserID)) OVER() AS user_share_pct,
    SUM(InAppPurchaseAmount) * 100.0/ SUM(SUM(InAppPurchaseAmount)) OVER() AS revenue_share_pct
FROM [dbo].[mobile_game_data]
GROUP BY SpendingSegment
ORDER BY revenue DESC;


--6.Genre × Device ARPU
SELECT
    Device,
    GameGenre,
    COUNT(DISTINCT UserID) AS users,
    SUM(InAppPurchaseAmount) AS revenue,
    SUM(InAppPurchaseAmount)/ COUNT(DISTINCT UserID) AS ARPU
FROM [dbo].[mobile_game_data]
WHERE Device <> 'Unknown'
        AND GameGenre <> 'Unknown'
GROUP BY Device, GameGenre
ORDER BY ARPU DESC;

--7.Engagement vs IAP Spending
SELECT
    UserID,
    SpendingSegment,
    SessionCount,
    AverageSessionLength,
    SessionCount * AverageSessionLength AS total_engagement_minutes,
    InAppPurchaseAmount AS iap_spending
FROM [dbo].[mobile_game_data]
WHERE InAppPurchaseAmount > 0;

--8.Does first-purchase timing associate with player value?
WITH purchase_window_table AS (
    SELECT
        UserID,
        InAppPurchaseAmount,
        FirstPurchaseDaysAfterInstall,
        CASE
            WHEN FirstPurchaseDaysAfterInstall BETWEEN 0 AND 1
                THEN 'Day 0-1'
            WHEN FirstPurchaseDaysAfterInstall BETWEEN 2 AND 3
                THEN 'Day 2-3'
            WHEN FirstPurchaseDaysAfterInstall BETWEEN 4 AND 7
                THEN 'Day 4-7'
            WHEN FirstPurchaseDaysAfterInstall BETWEEN 8 AND 14
                THEN 'Day 8-14'
            ELSE 'Day 15-30'
        END AS purchase_window
    FROM [dbo].[mobile_game_data]
)

SELECT
    purchase_window,
    COUNT(DISTINCT UserID) AS users,
    COUNT(DISTINCT UserID) * 100.0/ SUM(COUNT(DISTINCT UserID)) OVER() AS user_share_pct,
    SUM(InAppPurchaseAmount) AS revenue,
    SUM(InAppPurchaseAmount) * 1.0 / NULLIF(COUNT(DISTINCT UserID), 0) AS ARPU,
    SUM(InAppPurchaseAmount) * 1.0
        / NULLIF(
            COUNT(DISTINCT CASE
                WHEN InAppPurchaseAmount > 0
                THEN UserID
            END),
            0
        )
        AS ARPPU
FROM purchase_window_table
GROUP BY purchase_window
ORDER BY
    CASE purchase_window
        WHEN 'Day 0-1' THEN 1
        WHEN 'Day 2-3' THEN 2
        WHEN 'Day 4-7' THEN 3
        WHEN 'Day 8-14' THEN 4
        WHEN 'Day 15-30' THEN 5
    END;

--9
SELECT SpendingSegment,
        PaymentMethod,
    COUNT(DISTINCT UserID) AS users,
    COUNT(DISTINCT UserID) * 100.0
        / SUM(COUNT(DISTINCT UserID)) OVER (
            PARTITION BY SpendingSegment
        ) AS payment_share_pct
FROM [dbo].[mobile_game_data]
GROUP BY SpendingSegment, PaymentMethod;

--10
SELECT
    SpendingSegment,
    PaymentMethod,
    COUNT(DISTINCT UserID) AS users,
    COUNT(DISTINCT UserID) * 100.0
        / SUM(COUNT(DISTINCT UserID)) OVER (
            PARTITION BY SpendingSegment
        ) AS payment_share_pct
FROM [dbo].[mobile_game_data]
GROUP BY SpendingSegment, PaymentMethod;

--11
SELECT
    Country,
    COUNT(DISTINCT UserID) AS total_users,
    SUM(InAppPurchaseAmount) AS total_revenue,
    SUM(InAppPurchaseAmount)/ COUNT(DISTINCT UserID) AS ARPU,
    AVG(SessionCount * AverageSessionLength) AS avg_engagement_minutes
FROM [dbo].[mobile_game_data]
GROUP BY Country
ORDER BY total_revenue DESC;

--12.Whale có engagement cao hơn không? Whale purchase sớm hơn không? Dolphin có engagement tốt nhưng monetization thấp không?
SELECT
    SpendingSegment,
    COUNT(*) AS users,
    AVG(SessionCount) AS avg_sessions,
    AVG(AverageSessionLength) AS avg_session_length,
    AVG(SessionCount * AverageSessionLength ) AS avg_engagement_minutes,
    AVG(FirstPurchaseDaysAfterInstall) AS avg_days_to_first_purchase,
    AVG(InAppPurchaseAmount) AS ARPU,
    SUM(InAppPurchaseAmount) AS total_revenue
FROM [dbo].[mobile_game_data]
GROUP BY SpendingSegment
ORDER BY total_revenue DESC;