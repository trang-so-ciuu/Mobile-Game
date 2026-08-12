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
Key Insights
- Revenue Concentration: Whales represent a small share of users but contribute ~59% of IAP revenue.
- Engagement vs. Value: High engagement does not necessarily translate into high IAP value.
- First Purchase: Day 15–30 accounts for the largest share of first purchases, with player value varying across windows.
- Device × Genre: Player value differs substantially across platform and game genre combinations.
- Market Opportunity: Countries show different levels of user scale and ARPU, revealing distinct monetization opportunities.

---
# 🚀 Actionable Recommendations

- Protect high-value revenue: Prioritize Whale retention and value expansion through personalized offers, premium content and high-value player monitoring.
- Monetize high-engagement, low-value players: Identify highly engaged players with low IAP value and test starter packs, bundles and personalized offers.
- Optimize the first-purchase journey: Investigate player progression, offer exposure and purchase behavior around Day 8–14 and Day 15–30, then validate optimization opportunities through A/B testing.
- Personalize monetization by Device × Genre: Use Device × Genre performance to test differentiated IAP offers, bundles and pricing strategies rather than applying a one-size-fits-all approach.
- Validate high-value markets before scaling UA: Prioritize high-ARPU markets for deeper analysis of LTV, retention, CPI and ROAS before increasing acquisition investment.
