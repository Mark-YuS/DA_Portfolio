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

![image](https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/cb21fcce-77ee-470d-9d87-a697ada15f0a)





- Difference in Purchase and Redemption Total Amounts from Monday to Sunday

![image](https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/19d4b79d-399f-49d1-876f-1c1beab0d4f3)




- Month Feature Analysis

![image](https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/3ce95ddb-600e-41a7-80e5-f178c31f95a7)

![image](https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/e7e64305-c252-4467-8a4c-d6d5f1911f8f)




- Date Feature Analysis

![image](https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/39e6ea92-6b9e-4367-b917-2abb9bfffe53)



- Holiday Analysis

![image](https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/13afd35b-2d92-4f80-ad7a-9c30d94ea3c8)

![image](https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/ad7c6846-90c3-4bf1-bace-3dece16a8ef4)

![image](https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/fe97bd13-7512-4108-bb20-ae97c85e7911)

![image](https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/de288399-0169-4a8e-abad-471945aec907)

![image](https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/9ef62586-6e69-4b2b-b183-d311b30059f5)


- Correlation Analysis

![image](https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/c5246093-020b-4118-9846-e5aa155d4d39)



- Analysis of Bank and Alipay Interest Rates

![image](https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/42d0fef8-d6f9-4e0e-9da9-1116c7218fd0)


### 2. Model Baseline

Given the pronounced cyclical patterns observed in the time series data of Yu'ebao, this project adopts a cyclical factor model for analysis.

**Cyclical Factor Computation (factors):** This involves calculating factors that capture the periodic behaviors evident within the data.

**Baseline Determination (base):** This process establishes a baseline value (base) that represents the fundamental trend of the data, separate from its cyclicality.

**Forecasting Method:** The forecasting of future values is achieved by multiplying the determined base value with the appropriate cyclical factors (**forecast = base * factors**).


---

**Cycle Factor Model Baseline**

In view of the prominent cyclical patterns exhibited by the time series data of large anomalous transactions, this project adopts a cycle factor model for analysis.

**Calculating Cycle Factors (factors):** The first step involves computing cyclical factors to capture the inherent cyclic behavior within the data.

**Calculating Base (base):** The base value (base) representing the underlying trend of the data, irrespective of cyclic effects, is determined.

**Forecasting Process:** Predictions for future values are derived by multiplying the calculated base value with the corresponding cyclical factor (forecast = base * factors).

**Example Scenario:** Suppose we have the following data to predict the daily footfall for the fourth week:

|       | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday | Weekly Average |
| ----- | ------ | ------- | --------- | -------- | ------ | -------- | ------ | -------------- |
| Week 1 | 20     | 10      | 70        | 50       | 250    | 200      | 100    | 100            |
| Week 2 | 26     | 18      | 66        | 50       | 180    | 140      | 80     | 80             |
| Week 3 | 15     | 8       | 67        | 60       | 270    | 160      | 120    | 100            |


**Steps:**
1. **Calculating Proportional Factors:** Divide each day's count by the weekly average to obtain proportions.
2. **Calculating Median:** Calculate the median for each day across weeks.

|       | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday |
| ----- | ------ | ------- | --------- | -------- | ------ | -------- | ------ |
| Week 1 | 0.2    | 0.1     | 0.7       | 0.5      | 2.5    | 2        | 1      |
| Week 2 | 0.325  | 0.225   | 0.825     | 0.625    | 2.25   | 1.75     | 1      |
| Week 3 | 0.15   | 0.08    | 0.67      | 0.6      | 2.7    | 1.6      | 1.2    |
| Median | 0.2    | 0.1     | 0.7       | 0.6      | 2.5    | 1.75     | 1      |

3. **Final Cyclical Factors:** The resulting median values serve as a robust set of cyclical factors.

**Forecasting:** To make predictions, simply multiply the cyclical factors with a base value. For instance, if the average footfall for the last week is 100, predictions for the next week can be calculated:

|                 | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday |
| --------------- | ------ | ------- | --------- | -------- | ------ | -------- | ------ |
| Median          | 0.2    | 0.1     | 0.7       | 0.6      | 2.5    | 1.75     | 1      |
| Prediction (base=100) | 20     | 10      | 70        | 60       | 250    | 175      | 100    |

**Optimization:** While the median offers reliable cyclical factors, there is potential for further optimization by incorporating additional factors. An effective method could involve calculating both the mean and median, and then combining them in proportions that are optimized based on test results. For more precise base optimization, one might consider using an average from a select number of recent days (excluding cyclical effects).

**Core Codes:**

```python
def generate_base(df:pd.DataFrame, month_index:int) -> pd.DataFrame:
    # Chose the time range
    total_balance=df.copy()
    total_balance = total_balance[['date', 'total_purchase_amt', 'total_redeem_amt']]
    total_balance = total_balance[(total_balance['date'] >= pd.to_datetime('2014/3/1')) & (total_balance['date'] < pd.to_datetime('2014/{}/1'.format(month_index)))]
    
    # Add timestamp
    total_balance['weekday'] = total_balance['date'].dt.weekday  
    total_balance['day'] = total_balance['date'].dt.day          
    total_balance['week'] = total_balance['date'].dt.week        
    total_balance['month'] = total_balance['date'].dt.month 
    
    # Calculate the Next-Day Factor
    mean_of_each_weekday = total_balance[['weekday', 'total_purchase_amt', 'total_redeem_amt']].groupby('weekday', as_index=False).mean()
    for name in ['total_purchase_amt', 'total_redeem_amt']:
        mean_of_each_weekday = mean_of_each_weekday.rename(columns={name: name+'_next_day_factor'})
    mean_of_each_weekday['total_purchase_amt_next_day_factor'] /= np.mean(total_balance['total_purchase_amt'])
    mean_of_each_weekday['total_redeem_amt_next_day_factor'] /= np.mean(total_balance['total_redeem_amt'])
    
    # Merge 'mean_of_each_weekday' with 'total_balance'ArithmeticError
    total_balance = pd.merge(total_balance, mean_of_each_weekday, on='weekday', how='left')
    
    # Count the frequency of day occuring on dates from 1st to 31st
    weekday_count = total_balance[['day', 'weekday', 'date']].groupby(['day', 'weekday'], as_index=False).count()
    weekday_count = pd.merge(weekday_count, mean_of_each_weekday, on='weekday')
    
    # Weight the next-day factor based on frequency to obtain the Date factor
    weekday_count['total_purchase_amt_next_day_factor'] *= weekday_count['date'] / len(np.unique(total_balance['month']))  # Calculate the date factor for purchase amounts by weighting according to frequency
    weekday_count['total_redeem_amt_next_day_factor'] *= weekday_count['date'] / len(np.unique(total_balance['month']))    # Calculate the date factor for redemption amounts by weighting according to frequency
    day_rate = weekday_count.drop(['weekday', 'date'], axis=1).groupby('day', as_index=False).sum()  
    
    day_rate = day_rate.rename(columns={
    'total_purchase_amt_next_day_factor': 'total_purchase_amt_date_factor',
    'total_redeem_amt_next_day_factor': 'total_redeem_amt_date_factor'})
    
    
    # Subtract the date residuals from the average of all date to obtain the base
    day_mean = total_balance[['day'] + ['total_purchase_amt', 'total_redeem_amt']].groupby('day', as_index=False).mean() 
    day_base = pd.merge(day_mean, day_rate, on='day', how='left')
    day_base['total_purchase_amt'] /= day_base['total_purchase_amt_date_factor'] # Divide the purchase amount by the next-day purchase factor
    day_base['total_redeem_amt'] /= day_base['total_redeem_amt_date_factor'] 
    
    # Generate test set
    for index, row in day_base.iterrows():
        if month_index in (2, 4, 6, 9) and row['day'] == 31:
            break
        day_base.loc[index, 'date'] = datetime.datetime(2014, month_index, int(row['day']), 0, 0, 0)
        
    # Obtain the final forecast results based on the base and the date factors
    day_base['weekday'] = day_base['date'].dt.weekday 
    day_base = day_base[['date', 'weekday'] + ['total_purchase_amt', 'total_redeem_amt']]  
    day_base = pd.merge(day_base, mean_of_each_weekday, on='weekday') 
    day_base['total_purchase_amt'] *= day_base['total_purchase_amt_next_day_factor'] 
    day_base['total_redeem_amt'] *= day_base['total_redeem_amt_next_day_factor']      
    
    day_base = day_base.sort_values('date')[['date'] + ['total_purchase_amt', 'total_redeem_amt']]
    return day_base
```


### 3. Model Development & Comparison

**Time Series Decomposition**

Before delving into model construction, we initiated our analysis by decomposing the time series data. This crucial step allowed us to isolate and understand the underlying patterns, such as trend, seasonality, and residual components. By breaking down the time series, we could better prepare the data, enhancing the subsequent modeling process.

![image](https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/bf0cfd97-9466-48f5-bdcf-afefc705dff6)

![image](https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/1b9d60c5-552c-4297-b9c3-5950fefbb027)

**ARIMA Model**

After preparing our data through decomposition, we focused on developing the ARIMA (Autoregressive Integrated Moving Average) model. To optimize the performance of the ARIMA model, we employed a grid search technique. This approach systematically tested a range of parameters to identify the most effective combination, thereby ensuring the robustness and accuracy of the model in forecasting.

![image](https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/07245be0-81ee-4c40-955b-9d7fbc6d838e)

![image](https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/71fd4978-073f-44f1-b6ce-7bb68501de8f)


**Univariate Multi-step LSTM Model**

Parallel to the ARIMA model, we developed an LSTM (Long Short-Term Memory) model. LSTMs are well-suited for time series forecasting due to their ability to remember long-term dependencies. Similar to our approach with the ARIMA model, we applied grid search to fine-tune the parameters of the LSTM model. This optimization was key to enhancing the model's performance and achieving reliable predictive results.

![image](https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/da22fd3a-4b65-42d9-bef0-5d25f4feae1d)

![image](https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/d0bbcfc2-df32-49c8-86c4-c86fbf189f4c)


**Comparative Analysis**
Both the ARIMA and LSTM models were then compared to assess their effectiveness in forecasting. The comparison was based on several performance metrics derived from the predictions against actual data, allowing us to evaluate each model's strengths and weaknesses comprehensively. Through this analytical comparison, we could make informed decisions on which model best suits our needs for accurate and reliable forecasting.


### 4. Further Improvement for more accurate predictions

**Feature Engineering**
A pivotal area for future enhancement is advanced feature engineering. By further refining and expanding the selection of features used in our models, we can significantly improve the predictive accuracy. The goal will be to identify and incorporate those features that have the most substantial impact on the forecasts. This may involve more detailed analysis of existing data elements, or the integration of new data types that provide additional context or predictive value.

**Incorporating Multivariate LSTM Models**
Expanding our model architecture to include multivariate LSTM models marks a significant step forward in our forecasting capabilities. Unlike univariate LSTMs that process a single data sequence, multivariate LSTMs can handle multiple input features simultaneously. This capability allows for a more comprehensive analysis of the data, as the interactions between different variables are considered. For example, alongside historical transaction amounts, factors like seasonal trends, economic indicators, or user behavior metrics could be integrated, providing a richer, more complex dataset for the model to learn from.

**Continuous Model Optimization**
Continuous optimization of our models will be essential as new data becomes available and as market conditions evolve. This will involve regular retraining sessions, updating model parameters, and possibly incorporating newer algorithms or techniques that may emerge in the field. Keeping our models at the cutting edge will ensure that they remain effective and relevant in providing accurate forecasts.
