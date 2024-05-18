# Cash Flow Forecasts - Purchase and Redemption Predictions

<p align="center">
  <img src="https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/e673825d-01df-483e-bab2-639e1576e564" alt="Image" width="700" height="400">
</p>



## Background
Yu'eBao is an online wealth management platform in China, offered through Alipay, one of the world's largest mobile and online payment platforms. It allows users to invest their idle money into money market funds directly through the Alipay app. Yu'eBao is known for its ease of use, offering users the flexibility to earn interest on funds that can be withdrawn at any time, making it a popular choice for everyday investment and savings management. This platform provides an accessible way for individuals to manage their funds actively while benefiting from relatively stable returns compared to traditional savings accounts.

Yu'eBao primarily allocates its funds into short-term, low-risk money market funds. These investments are typically safe options like government bonds, central bank bills, and bank deposits, making them a good fit for users with conservative investment preferences and short-term financial management needs, due to their lower risk profile.

The principal income for Yu'eBao is derived from the returns of the money market funds it invests in. Investors have the convenience of monitoring their daily profits via the Alipay app and can transfer funds to their Alipay account anytime for immediate use. However, it is important to recognize that returns from money market funds can fluctuate due to varying market interest rates and economic conditions, introducing some level of investment risk. Investors using Yu'ebao should thoroughly understand the risk and return profile of the product, and make investment choices that align with their personal risk appetite and financial goals. Additionally, the earnings from Yu'ebao are influenced by regulatory policies and product rules, necessitating that investors stay informed about pertinent policy and regulatory changes.

### Project Overview

The YueBao oversees the cash transactions of millions of users. It's crucial for them to predict future cash flows accurately using historical transaction data. This project is dedicated to utilizing machine learning methods to project future cash flows by examining past data on user purchases and redemptions. The insights derived from this analysis will enable YueBao to improve its fund management practices, thereby optimizing cash flow management.

### Project Objectives

1. **In-depth Data Insights:** Conduct comprehensive exploratory data analysis (EDA) to uncover patterns and trends in cash flow activities. This foundational work will provide YueBao with detailed insights that are critical for understanding current dynamics and anticipating future shifts in user behavior.
2. **Cash Flow Forecasting:** Following the initial data analysis, develop sophisticated machine learning models that predict future cash inflows (purchases) and outflows (redemptions). These models will leverage historical user transaction data to forecast future trends, supporting more informed decision-making.
3. **Strategic Business Alignment:** Use the insights gained from both the EDA and predictive modeling to align YueBao’s operational strategies more closely with actual user behavior. This alignment will enhance business efficiency and adaptability, ensuring that YueBao can effectively respond to evolving market conditions.

### Impact & Expected Results

#### Potential benefits

If we can accurately predict the daily inflows and outflows of currency funds, it can bring the following potential benefits:

1. **Optimization of investment decisions:** Reliable forecasts of fund inflows and outflows enable investors to gauge market demand and redemption conditions more accurately, facilitating better capital allocation and investment choices. For instance, anticipated large inflows may prompt investors to increase their invested amounts promptly; conversely, expected large outflows might lead investors to modify their redemption strategies to mitigate potential market risks.
2. **Improve capital operation efficiency:** Reliable predictions of fund movements aid fund managers in planning and optimizing fund management, thus enhancing capital operation efficiency. For example, with accurate forecasting, fund managers can devise investment plans that prevent funds from being idle or insufficient, maximizing both fund returns and utilization.
3. **Risk Reduction:** Stable fund management depends on the predictable movement of money. Accurate forecasts help mitigate risks associated with fluctuating fund flows, such as redemption pressures or liquidity shortages. This foresight also assists investors in navigating market fluctuations more effectively, supporting more informed and cautious investment decisions.
4. **Enhance competitive advantages:** By accurately predicting fund flows, financial institutions can better understand market demands and investor behaviors, which in turn aids in refining product offerings and service strategies, thus bolstering competitive edges. For instance, financial institutions might adjust subscription and redemption rules based on these forecasts to attract more investors, thereby increasing the fund's size and management fee revenue.

#### Project Outcomes

| Attribute   | Type   | Description                     | Example  |
| ----------- | ------ | ------------------------------- | -------- |
| report_date | bigint | Date                            | 20140901 |
| purchase    | bigint | Predicted Amount of Purchase   | 30020002 |
| redeem      | bigint | Predicted Amount of Redemption | 30202020 |

### Description & Data inspection

#### 1. User profile table

A total of about 30,000 users were randomly sampled, some of whom appeared for the first time in September 2014 and only appear in the test data. Therefore, the user information table is about 28,000 users' basic data, which mainly includes users' gender, city, and zodiac after processing the original data. 

**Table 1: User profile table: user_profile_table**

| Attribute     | Type   | Description                  
| ------------- | ------ | ---------------------------- 
| user_id       | bigint | User ID                     
| Sex           | bigint | Gender (1: male, 0: female)  
| City          | bigint | Which city the user lives in 
| Constellation | string | Constellation                

#### 2. Purchase and redemption sheet

It contains transaction information from July 1, 2013, to August 31, 2014, along with all sub-category information, and the data has been desensitized. The desensitized data largely remains the original data trend. Data mainly includes user operation time and records, where the records include subscription and redemption parts. The unit of amount is cents, i.e., 0.01 Chinese RMB. If the user's total consumption for the day is 0, i.e., consume_amt=0, then the four subcategories are empty. 

**Table 2: Purchase andredemption sheet: user_balance_table**

| Attribute           | Type   | Description                                                  
| ------------------- | ------ | ------------------------------------------------------------ 
| user_id             | bigint | User ID                                                     
| report_date         | string | Date                                                         
| tBalance            | bigint | Today' s closing balance                                     
| yBalance            | bigint | Yesterday's closing balance                                  
| total_purchase_amt  | bigint | Today total purchase = direct purchase + revenue             
| direct_purchase_amt | bigint | Today's direct purchase                                     
| purchase_bal_amt    | bigint | Today's purchase from Alipay balance                       
| purchase_bank_amt   | bigint | Today's purchase from bank cards                            
| total_redeem_amt    | bigint | Today's total redemption amount = consumption + transfer amount 
| consume_amt         | bigint | Today's total consumption                                    
| transfer_amt        | bigint | Toda y ' s total transfer amount                             
| tftobal_amt         | bigint | Today's total transfer amount to Alipay balance              
| tftocard_amt        | bigint | Today's total transfer amount into bank cards               
| share_amt           | bigint | Today's revenue                                              
| category1           | bigint | Today's consumption for category 1                           
| category2           | bigint | Today's consumption for category 2                          
| category3           | bigint | Today's consumption for category 3                           
| category4           | bigint | Today's consumption for category 4                           

Note1: The above data has been desensitized. Revenue has been recalculated through as implified calculation approach. We describe it in Section 4.

Note2: The desensitized data ensures that: today's closing balance = yesterday's closing balance + today's total purchase - today's total redemption. There is no negative value.

#### 3. Yields ratetable

Yields rate table includes rate of revenue of Yu 'E Bao within 14 months. Detailed descriptions are shown in table 3:

**Table 3: yield_rates**

| Attribute        | Type   | Description               | Example  |
| ---------------- | ------ | ------------------------- | -------- |
| mfd_date         | string | Date                      | 20140102 |
| mfd_daily_yield  | double | Revenue per 1000,000 fen  | 1.5787   |
| mfd_7daily_yield | double | 7-Day Annualized Yield(%) | 6.307    |

#### 4.  Interbank Offered Rate Table

Interbank offered rate table includes 14-month lending rates per day among banks (all are annualized rates). Detailed descriptions are shown in table 4:

**Table 4 : mdf_bank_shilbor**

| Attribute      | Type   | Description          | Example  |
| -------------- | ------ | -------------------- | -------- |
| mfd_date       | string | Date                 | 20140102 |
| Interest _ O_N | double | Overnight SHIBOR (%) | 2.8      |
| Interest _ 1_W | double | 1-week SHIBOR (%)    | 4.25     |
| Interest _ 2_W | double | 2-week SHIBOR (%)    | 4.9      |
| Interest _ 1_M | double | 1-monthSHIBOR (%)    | 5.04     |
| Interest _ 3_M | double | 3-monthSHIBOR (%)    | 4.91     |
| Interest _ 6_M | double | 6-monthSHIBOR (%)    | 4.79     |
| Interest _ 9_M | double | 9-monthSHIBOR (%)    | 4.76     |
| Interest _ 1_Y | double | 1-YearSHIBOR (%)     | 4.78     |

### Predictions Evaluation 

In this project, we employ the Mean Absolute Percentage Error (MAPE) to assess the accuracy of our predictive models for forecasting daily cash inflows (purchases) and outflows (redemptions). MAPE quantifies the precision of predictions by calculating the average of absolute errors as a percentage of the actual values. This metric is particularly advantageous as it normalizes the errors, providing a clear and interpretable measure of model performance across different scales of data. By focusing on percentage errors, MAPE allows us to effectively compare the predictive accuracy across all days in the evaluation period, making it a robust indicator of the model’s real-world applicability and effectiveness. This approach ensures that our models are refined to prioritize accuracy in daily forecasting, aligning with our goal of enhancing operational decision-making in financial management.

The formula for Mean Absolute Percentage Error (MAPE) is given by:

$$
\text{MAPE} = \left(\frac{1}{n} \sum_{i=1}^{n} \left|\frac{y_i - \hat{y}_i}{y_i}\right|\right) \times 100\%
$$


where:
- ( n ) is the number of observations,
- $( y_i )$ is the actual value of the data point
- $(\hat{y}_i)$ is the predicted value. 



## Project Phases

### 1. Data Processing & EDA

- Time Series Analysis and Visualization

![image](https://github.com/datoujinggzj/DS_Project_Portfolio/assets/99417740/bd3aaba0-135c-475a-ba3b-c0681e29400f)


- Difference in Purchase and Redemption Total Amounts from Monday to Sunday

![image](https://github.com/datoujinggzj/DS_Project_Portfolio/assets/99417740/a66e9deb-b701-44c5-a5a7-fbd51769e5fb)


- Month Feature Analysis

![image](https://github.com/datoujinggzj/DS_Project_Portfolio/assets/99417740/d991c6ba-78e7-4f0e-abfc-6d296969d241)


- Date Feature Analysis

![image](https://github.com/datoujinggzj/DS_Project_Portfolio/assets/99417740/31d287e2-0b14-4e17-8114-98201596aa96)


- Holiday Analysis

![image](https://github.com/datoujinggzj/DS_Project_Portfolio/assets/99417740/2d5e37a9-8404-4afd-92f4-469ceb44dbe1)


- Analysis of Large Anomalous Transactions

![image](https://github.com/datoujinggzj/DS_Project_Portfolio/assets/99417740/a25f4db3-8f24-418b-b38e-bd642786573a)


- Correlation Analysis

![image](https://github.com/datoujinggzj/DS_Project_Portfolio/assets/99417740/f9fba23b-b652-4a7e-97d2-8359b32cdfee)


- Analysis of Bank and Alipay Interest Rates

![image](https://github.com/datoujinggzj/DS_Project_Portfolio/assets/99417740/511e17d5-c143-439d-818d-4b7fcd883324)


![image](https://github.com/datoujinggzj/DS_Project_Portfolio/assets/99417740/5f89cb95-74c6-4425-b352-328eae65851b)


### 2. Model Baseline

Considering the pronounced cyclical patterns observed in the time series data of Yu'ebao, this project adopts a cyclical factor model for analysis.

**Calculation of Cyclical Factors (factors):** Involves the computation of cyclical factors that capture the periodic behavior present within the data.

**Calculation of Base (base):** Involves the determination of a baseline value (base) that represents the underlying trend of the data, independent of the cyclicality.

**Forecasting Process:** The forecasting of future values is achieved by multiplying the calculated base value with the corresponding cyclical factor (**forecast = base * factors**).

---

**Cycle Factor Model Baseline**

In view of the prominent cyclical patterns exhibited by the time series data of large anomalous transactions, this project adopts a cycle factor model for analysis.

**Calculating Cycle Factors (factors):** The first step involves computing cyclical factors to capture the inherent cyclic behavior within the data.

**Calculating Base (base):** The base value (base) representing the underlying trend of the data, irrespective of cyclic effects, is determined.

**Forecasting Process:** Predictions for future values are derived by multiplying the calculated base value with the corresponding cyclical factor (forecast = base * factors).

**Example Scenario:** Suppose we have the following data to predict the daily footfall for the fourth week:

| Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday | Weekly Average |
| ------ | ------- | --------- | -------- | ------ | -------- | ------ | -------------- |
| Week 1 | 20      | 10        | 70       | 50     | 250      | 200    | 100            |
| Week 2 | 26      | 18        | 66       | 50     | 180      | 140    | 80             |
| Week 3 | 15      | 8         | 67       | 60     | 270      | 160    | 120            |

**Steps:**

1. **Calculating Proportional Factors:** Divide each day's count by the weekly average to obtain proportions.
2. **Calculating Median:** Calculate the median for each day across weeks.
3. **Final Cyclical Factors:** The resulting median values serve as a robust set of cyclical factors.

**Forecasting:** To make predictions, simply multiply the cyclical factors with a base value. For instance, if the average footfall for the last week is 100, predictions for the next week can be calculated:

| Monday                 | Tuesday | Wednesday | Thursday | Friday | Saturday |
| ---------------------- | ------- | --------- | -------- | ------ | -------- |
| Median                 | 20      | 10        | 70       | 60     | 250      |
| Predictions (base=100) | 20      | 10        | 70       | 60     | 250      |

**Optimization:** While the median provides robust cyclical factors, other factors can be considered for optimization. One approach is to compute both the mean and median, and then blend them with proportions determined by test performance. Base optimization can involve considering a subset of recent days' averages (excluding cyclic effects) for better accuracy.

**Core Codes:**

```python
# Import necessary libraries
import pandas as pd  # Import pandas library for data processing
import numpy as np   # Import numpy library for numerical calculations
import datetime      # Import datetime library for date and time operations

# Define the method to generate base for time series forecast
def generate_base(df: pd.DataFrame, month_index: int) -> pd.DataFrame:
    # Select data for a fixed time period
    total_balance = df.copy()  # Copy the input DataFrame to avoid modifying the original data
    total_balance = total_balance[['date', 'total_purchase_amt', 'total_redeem_amt']]  # Select specific columns
    total_balance = total_balance[(total_balance['date'] >= pd.to_datetime('2014/3/1')) & (total_balance['date'] < pd.to_datetime('2014/{}/1'.format(month_index)))]  # Filter data for the specific time period
    
    # Add timestamp information
    total_balance['weekday'] = total_balance['date'].dt.weekday  # Add weekday information
    total_balance['day'] = total_balance['date'].dt.day          # Add day information
    total_balance['week'] = total_balance['date'].dt.week        # Add week information
    total_balance['month'] = total_balance['date'].dt.month      # Add month information
    
    # Calculate next-day factors
    mean_of_each_weekday = total_balance[['weekday'] + ['total_purchase_amt', 'total_redeem_amt']].groupby('weekday', as_index=False).mean()  # Calculate mean purchase and redeem amounts for each weekday
    for name in ['total_purchase_amt', 'total_redeem_amt']:
        mean_of_each_weekday = mean_of_each_weekday.rename(columns={name: name+'_weekdaymean'})  # Add suffix to differentiate next-day factors
    mean_of_each_weekday['total_purchase_amt_weekdaymean'] /= np.mean(total_balance['total_purchase_amt'])  # Calculate next-day factor for purchase amount
    mean_of_each_weekday['total_redeem_amt_weekdaymean'] /= np.mean(total_balance['total_redeem_amt'])    # Calculate next-day factor for redeem amount
    
    # Merge next-day factors into the original dataset
    total_balance = pd.merge(total_balance, mean_of_each_weekday, on='weekday', how='left')  # Merge next-day factors into the original dataset
    
    # Calculate frequency of next-days appearing on (1~31) days
    weekday_count = total_balance[['day', 'weekday', 'date']].groupby(['day', 'weekday'], as_index=False).count()  # Count occurrences of each day on different weekdays
    weekday_count = pd.merge(weekday_count, mean_of_each_weekday, on='weekday')  # Merge the results with next-day factors
    
    # Weight next-day factors based on frequency to obtain day factors
    weekday_count['total_purchase_amt_weekdaymean'] *= weekday_count['date'] / len(np.unique(total_balance['month']))  # Calculate weighted day factors for purchase amount
    weekday_count['total_redeem_amt_weekdaymean'] *= weekday_count['date'] / len(np.unique(total_balance['month']))    # Calculate weighted day factors for redeem amount
    day_rate = weekday_count.drop(['weekday', 'date'], axis=1).groupby('day', as_index=False).sum()  # Calculate the sum of weighted factors for each day
    
    # Obtain base by subtracting the date residuals from the mean of all dates in the training set
    day_mean = total_balance[['day'] + ['total_purchase_amt', 'total_redeem_amt']].groupby('day', as_index=False).mean()  # Calculate mean purchase and redeem amounts for each day
    day_pre = pd.merge(day_mean, day_rate, on='day', how='left')  # Merge the weighted factors with the mean for each day
    day_pre['total_purchase_amt'] /= day_pre['total_purchase_amt_weekdaymean']  # Adjust purchase amount by purchase next-day factor
    day_pre['total_redeem_amt'] /= day_pre['total_redeem_amt_weekdaymean']        # Adjust redeem amount by redeem next-day factor
    
    # Generate test set data
    for index, row in day_pre.iterrows():
        if month_index in (2, 4, 6, 9) and row['day'] == 31:
            break
        day_pre.loc[index, 'date'] = datetime.datetime(2014, month_index, int(row['day']), 0, 0, 0)  # Generate test set date based on month and day
    
    # Generate final forecast by multiplying base with next-day factors
    day_pre['weekday'] = day_pre['date'].dt.weekday  # Add weekday information
    day_pre = day_pre[['date', 'weekday'] + ['total_purchase_amt', 'total_redeem_amt']]  # Select necessary columns
    day_pre = pd.merge(day_pre, mean_of_each_weekday, on='weekday')  # Merge next-day factors
    day_pre['total_purchase_amt'] *= day_pre['total_purchase_amt_weekdaymean']  # Adjust purchase amount based on purchase next-day factor
    day_pre['total_redeem_amt'] *= day_pre['total_redeem_amt_weekdaymean']        # Adjust redeem amount based on redeem next-day factor
    
    day_pre = day_pre.sort_values('date')[['date'] + ['total_purchase_amt', 'total_redeem_amt']]  # Sort by date and select necessary columns
    return day_pre  # Return the generated time series forecast results DataFrame
```

### 3. Feature Engineering

**Static Feature Extraction Based on Date**

These "is" features capture different characteristics and conditions related to the dates, weekdays, and months in the dataset. 

The key "is" features extracted include:

- `is_weekend`: Indicates whether the day falls on a weekend (Saturday or Sunday).
- `is_holiday`: Indicates whether the day is a holiday.
- `is_firstday_of_holiday`: Indicates whether the day is the first day of a holiday period.
- `is_lastday_of_holiday`: Indicates whether the day is the last day of a holiday period.
- `is_firstday_of_work`: Indicates whether the day is the first workday after a holiday period.
- `is_work`: Indicates whether it's a workday (neither a holiday nor a weekend).
- `is_gonna_work_tomorrow`: Indicates whether the next day is a workday.
- `is_worked_yestday`: Indicates whether the previous day was a workday.
- `is_lastday_of_workday`: Indicates whether the day is the last workday before a holiday.
- `is_work_on_sunday`: Indicates whether it's a Sunday that requires working.
- `is_firstday_of_month`: Indicates whether the day is the first day of a month.
- `is_secday_of_month`: Indicates whether the day is the second day of a month.
- `is_premonth`, `is_midmonth`, `is_tailmonth`: Indicate whether the day belongs to the early, mid, or late period of a month, respectively.
- `is_first_week`, `is_second_week`, `is_third_week`, `is_fourth_week`: Indicate whether the week belongs to the first, second, third, or fourth week of the month, respectively.

<img src="https://ice.frostsky.com/2023/08/19/5b8b7f979b2bae65fd5c44c1f10016cd.png" alt="5b8b7f979b2bae65fd5c44c1f10016cd.png" border="0">

<img src="https://ice.frostsky.com/2023/08/19/8d90bcea2e91e43a4f45bc0ef8dfc28b.png" alt="8d90bcea2e91e43a4f45bc0ef8dfc28b.png" border="0">

**Distance-based Features Extraction**

These features capture various temporal distances between data points and certain reference points. 

- `dis_to_nowork` and `dis_from_nowork`: Calculate the distance to the next non-working day and the distance from the last non-working day for each data point.
- `dis_to_work` and `dis_from_work`: Calculate the distance to the next working day and the distance from the last working day for each data point.
- `dis_to_holiday` and `dis_from_holiday`: Calculate the distance to the next holiday and the distance from the last holiday for each data point.
- `dis_to_holiendday` and `dis_from_holiendday`: Calculate the distance to the next last day of holiday and the distance from the last last day of holiday for each data point.
- `dis_from_startofmonth`: Calculate the distance from the start of the month for each data point.
- `dis_from_middleofmonth`: Calculate the distance from the middle of the month (15th day) for each data point.
- `dis_from_middleofweek`: Calculate the distance from the middle of the week (Wednesday, represented by 3) for each data point.
- `dis_from_endofweek`: Calculate the distance from the end of the week (Sunday, represented by 6) for each data point.

we aim to enhance the dataset with features that capture temporal distances to various reference points, providing additional context and potentially useful insights for analysis and modeling.

<img src="https://ice.frostsky.com/2023/08/19/4a020d277668d41eb1392e3b1632390b.png" alt="4a020d277668d41eb1392e3b1632390b.png" border="0">

<img src="https://ice.frostsky.com/2023/08/19/017de87ec8dd269f5913c38143e0f7f4.png" alt="017de87ec8dd269f5913c38143e0f7f4.png" border="0">

**Peak-related Features Extraction**

<img src="https://ice.frostsky.com/2023/08/19/b610645440d57e55ffe92da6aae6a9bf.png" alt="b610645440d57e55ffe92da6aae6a9bf.png" border="0">

**Cycle-related Features Extraction**

We calculate purchase and redemption rates for different time intervals (weekdays and days of the month) within a given month. Also, we calculate average rates for each weekday and then calculate weighted rates based on the occurrence count of each weekday for each day of the month. This process helps uncover patterns in user purchase and redemption behaviors over specific time intervals within a month.

**Dynamic Behavior Features Extraction**

We aim to extract dynamic features related to purchase behavior over different time intervals within a month. It calculates various statistical measures (median, mean, min, max, standard deviation, skewness) of purchase amounts for each weekday leading up to a specific date in the dataset. These statistics are computed from the data starting on March 31, 2014. 

**Feature Selection**

We remove features that are not effective in splitting the dataset.

<img src="https://ice.frostsky.com/2023/08/19/5d82c469e0cbf7c618e62377df748ada.png" alt="5d82c469e0cbf7c618e62377df748ada.png" border="0">

We eliminated features that are highly correlated with each other. In other words, we remove multicollinear features by combining them and then checking the correlation between the combined feature and the original features. 

**Winning Features Selection**

![image](https://github.com/datoujinggzj/DS_Project_Portfolio/assets/99417740/c351acc8-1f84-4b97-97a4-953c1791455d)


<p align="center">
  <img src="https://github.com/datoujinggzj/DS_Project_Portfolio/assets/99417740/f0af7498-151d-4e32-8e2b-64afc4b6afdf" alt="Image" width="400" height="200">
</p>


### 4. Model Development & Comparison

Developed a diverse set of over 10 systematic forecasting models, including univariate and multivariate approaches, that delivered unparalleled predictive insights into future cash flows.

Utilized innovative techniques, such as weighted averaging of purchase and redemption errors, leading to the identification of the best-performing model—LSTM—exhibiting an impressive uplift in predictive accuracy.

![image](https://github.com/datoujinggzj/DS_Project_Portfolio/assets/99417740/bdaebde3-8af0-4c43-a9b1-05ee6a01887d)


<p align="center">
  <img src="https://ice.frostsky.com/2023/08/19/ebc04d85bdb7e8fb8da494e39a6c9b9d.png" alt="Image" width="600" height="310">
</p>


<p align="center">
  <img src="https://github.com/datoujinggzj/DS_Project_Portfolio/assets/99417740/ff60b0cf-40bf-46bb-a821-f570545e002d" alt="Image" width="600" height="310">
</p>

