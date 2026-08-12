# 🎮 Mobile Game Monetization Analysis

> **Data Analytics Project | Game Monetization | SQL | Python | Power BI**

## 📌 Project Overview

This project analyzes player behavior and In-App Purchase (IAP) performance in a mobile game to identify:

- Which player segments drive the most revenue?
- How does player engagement relate to IAP value?
- When do players make their first purchase?
- Which Device × Game Genre combinations generate higher player value?
- Which markets combine high player scale with high ARPU?
- How can these insights be translated into actionable monetization opportunities?

The ultimate goal is to move from:

**Data → Insight → Monetization Opportunity → Experiment Hypothesis**

---

# 🎯 Business Objective

### Main Business Question

> **How can we optimize IAP monetization by identifying the player segments, behaviors and markets that drive revenue and player value?**

### Supporting Questions

1. Who contributes the most IAP revenue?
2. Does higher player engagement associate with higher IAP value?
3. Does first-purchase timing differ in player value?
4. Which Device × Game Genre combinations show higher player value?
5. Which countries have high player scale or high player value?
6. What monetization opportunities should be investigated further?

---

# 📊 Dataset

The dataset contains **2888 mobile game users** with player-level behavioral, demographic and monetization information.

### Main Variables

| Category | Variables |
|---|---|
| User | `UserID`, `Age`, `Gender`, `Country` |
| Platform | `Device` |
| Game | `GameGenre` |
| Engagement | `SessionCount`, `AverageSessionLength` |
| Monetization | `SpendingSegment`, `InAppPurchaseAmount` |
| Conversion | `FirstPurchaseDaysAfterInstall` |
| Payment | `PaymentMethod` |
| Recency | `LastPurchaseDate` |

### Spending Segments

| Segment | User Share | Description |
|---|---:|---|
| Minnow | ~85% | Low / no spending |
| Dolphin | ~13% | Medium spending |
| Whale | ~2% | High-value spending |

---

# 🛠️ Tools & Technologies

- **Python** — Data Cleaning, EDA, Statistical Analysis, Data Processing
- **SQL** — Data Querying & Aggregation
- **Power BI** — Interactive Dashboard & Data Visualization
- **DAX** — KPI & Business Metrics

---

# 📈 Dashboard Architecture & Key Visuals
![Dashboard 1](gaming.png)

**Key Insights**
1. Revenue is highly concentrated among Whale players
- Whale players represent a small share of the user base but contribute approximately 59% of total IAP revenue, indicating a highly concentrated monetization structure.
- Business implication: Revenue stability is highly dependent on high-value players.

2. Engagement alone does not explain player value
- The Engagement vs. IAP analysis shows substantial variation in IAP value across players with similar engagement levels. Highly engaged players can still generate relatively low IAP.
- Business implication: Increasing engagement alone may not be sufficient to improve monetization; player intent, offers, progression and segmentation should be investigated.

3. First-purchase timing shows different player-value patterns
- Players making their first purchase across different time windows exhibit different ARPU and median IAP levels, while Day 15–30 accounts for the largest share of first purchases.
- Business implication: The first-purchase journey is a potential monetization optimization area that should be investigated further.

4. Player value varies by Device × Game Genre
- IAP value differs substantially across Device × Game Genre combinations, suggesting that monetization performance is not uniform across platforms and genres.
- Business implication: IAP offers, pricing and acquisition strategies may benefit from platform- and genre-specific optimization.

5. Markets differ in scale and player value
- Countries show different combinations of user scale and ARPU, creating distinct scale markets, high-value niche markets and monetization opportunity markets.
- Business implication: Market-level monetization and acquisition strategies should be evaluated using both player value and market scale.
