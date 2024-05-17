# Unveiling Business Insights - A Comprehensive Data Analysis of Yelp Dataset

<div STYLE="page-break-after: always;"></div>

##  What is Yelp?

![image](https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/67d38847-34f4-485e-b79f-ad6d0e6a9575)

> Yelp is an online platform that provides users with the ability to search and explore information about businesses such as their address, contact details, and operating hours. Users can also access reviews and ratings left by others, and contribute their own feedback and comments. Leveraging social networking, Yelp encourages its users to share their experiences, thereby assisting others in discovering quality businesses. Founded in 2004 in the United States, Yelp has since broadened its reach to include several other countries, such as Canada, the United Kingdom, Australia, France, Germany, Italy, and Switzerland.



## Background

The Yelp dataset comprises a rich collection of information pertaining to businesses, reviews, users, and various interactions within the Yelp platform. It encompasses data from multiple cities across the United States, spanning various business categories and user demographics.

This dataset serves as a tool for researchers, data analysts, and data scientists to study and understand the intricacies of the Yelp platform, offering insights into user behavior, business performance, and evolving market trends. As online review platforms like Yelp grow in popularity, this dataset becomes an essential resource for examining the elements that affect customer satisfaction, business success, and the expansion of the platform.

Furthermore, the Yelp dataset is extensively utilized as a benchmark for assessing the effectiveness of machine learning algorithms, especially in fields like natural language processing, sentiment analysis, and recommendation systems. It provides a substantial and varied dataset that mirrors real-world interactions, enabling researchers to develop, refine, and validate new algorithms and models applicable across different online platforms and sectors.

In summary, the Yelp dataset is an valuable asset for those keen on delving into the workings of online review platforms and discerning the factors that drive user behavior, business performance, and platform development.

## About Dataset

Data Link: [https://drive.google.com/drive/folders/11e0E5QHFZrUKffQwoBoEMwyouB1ZnpCy](https://drive.google.com/drive/u/0/folders/11e0E5QHFZrUKffQwoBoEMwyouB1ZnpCy)



This dataset is a subset of Yelp's businesses, reviews, and user data. It was originally put together for the Yelp Dataset Challenge which is a chance for students to conduct research or analysis on Yelp's data and share their discoveries. In the most recent dataset you'll find information about businesses across 8 metropolitan areas in the USA and Canada.



1. `yelp_business.csv`: This file contains information about businesses on the Yelp platform, including their ID, name, address, latitude and longitude, star rating, categories, and city.
2. `yelp_business_attributes.csv`: This file contains attributes of businesses, such as whether they offer Wi-Fi or have a parking lot.
3. `yelp_business_hours.csv`: This file contains information about the hours of operation of businesses, including the opening and closing times for each day of the week.
4. `yelp_checkin.csv`: This file contains check-in information for businesses, such as the time and date when users check in.
5. `yelp_review.csv`: This file contains reviews of businesses, including the user ID, business ID, rating, review text, and date of the review.
6. `yelp_tip.csv`: This file contains tips and suggestions from users about businesses, such as recommended dishes or things to watch out for.
7. `yelp_user.csv`: This file contains information about Yelp users, including their ID, name, registration time, and average rating.

---

When we use the Yelp dataset for data analysis, we can analyze the data from the perspectives of the platform, users, and merchants, and obtain the following benefits:

### Platform perspective

From the perspective of the platform, the Yelp dataset allows for the analysis of user behavior and merchant activities, which can inform the management of platform operations and the development of marketing strategies. For instance,by examining popular merchants and user preferences on Yelp, the platform can offer more precise targeting services to both merchants and advertising partners. Additionally, the data can be used to analyze urban development, unveiling new business opportunities and market trends. For example, by assessing the number and ratings of merchants in various cities, we can identify which cities face stiffer market competition and which are ripe with promising business prospects.

### User perspective

From the user's perspective, the Yelp dataset can be utilized to delve into user behaviors, taste preferences, and feedback, ultimately enhancing the services and experiences offered to merchants. For instance, by examining user check-ins and reviews on Yelp, insights into the types of merchants and the quality of service users favor can be gained. Moreover, the data can be used to analyze user suggestions and opinions, facilitating the provision of improved products and services to merchants. For example, analyzing feedback for different merchants on Yelp can guide merchants in refining their offerings.


### Business perspective

From the perspective of restaurants, the Yelp dataset can be utilized to scrutinize merchant reviews, check-ins, and business hours to enhance service quality and refine business models. For instance, by analyzing the ratings and reviews on the Yelp platform, restaurants can make informed improvements to their products and services. Additionally, the data can be employed to optimize merchant strategies and boost customer traffic by examining check-ins and business hours. For example, analyzing customer flow during different times and on various days can assist merchants in scheduling more effective working hours and allocating manpower resources.

In summary, leveraging the Yelp dataset for data analysis offers valuable insights into the functioning of the Yelp platform and user behavior from various angles, ultimately improving services for the platform and enhancing operational strategies for merchants.

## Analysis

### Distribution of Businesses


<p align="center">
  <img src="https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/8e3c9f08-b18f-47ef-ae84-6f212ea2b854" alt="Image" width="400" height="400">
</p>

<p align="center">
  <img src="https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/e8d7cfd8-2752-4846-9f31-1acca56de1e0" alt="Image">
</p>


<p align="center">
  <img src="https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/b31efaa5-df41-4ccf-a499-e6c9f936626b" alt="Image">
</p>


We can analyze the number and distribution of businesses in different cities or regions, and understand which types of businesses are most popular and which areas have more businesses. This can help the platform and businesses understand market demand and competition. For example, by evaluating the business category and location data in the Yelp Business dataset, we can pinpoint the most favored types of businesses and the busiest business districts within a particular city or region.

### User Reviews

<img width="1118" alt="image" src="https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/102f1ab3-2241-4b81-8e49-f95181d6d416"><br><br>


<img width="1113" alt="image" src="https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/90923b61-4bc3-40bb-8c6e-6a7ccbccbe52"><br><br>


<img width="1124" alt="image" src="https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/e92f6a81-93c0-4dc8-b91c-900a6536f1bb"><br><br>


We can analyze user ratings and reviews of businesses on the Yelp platform, and understand information such as user preferences for business types, service quality, and food taste, which can help businesses better optimize their products and services. For example, we can analyze a business's food taste, service quality, and user feedback through the user reviews and ratings data in the Yelp Review dataset, and help businesses improve or optimize their products and services.


### User Activity in Regions

By using Folium library, the interactive map can visualize the distribution user activities various regions. By organizing data by star ratings, the heatmap effectively displays the geographical spread and density of businesses, revealing patterns and trends in consumer feedback. The interactive elements of the map allow users to explore these distributions in real-time, providing valuable insights into market dynamics across different areas. This tool is instrumental for businesses and analysts alike, aiding in the identification of key consumer preferences and potential growth opportunities.

<p align="center">Las Vegas </p>

<img width="1149" alt="image" src="https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/27f7aee6-8f31-424e-bdba-557ce45d4478"><br><br>


<p align="center">Phoenix</p>

<img width="1144" alt="image" src="https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/0dbc4bda-b3b1-4fac-bbf4-a28964cbfe47"><br><br>


<p align="center">Edinburgh</p>
<img width="1151" alt="image" src="https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/fb10e144-65ae-4ed7-bb30-d426b95ce50c"><br><br>

<p align="center">Stuttgart</p>

<img width="1147" alt="image" src="https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/cc434690-c983-43fd-89d1-3eb23530fe37"><br><br>



### Business Operations and Revenue

We can evaluate a business's operational conditions and financial performance by examining details such as business hours, customer traffic, revenue, and expenses. This analysis can aid businesses in developing more effective operational strategies and boosting their revenue. For instance, by analyzing data on customer traffic and business hours from the Yelp Checkin and Business datasets, we can assist businesses in optimizing their work schedules and human resource allocation. This helps in aligning their operations more closely with market demands and customer patterns.

### User Behaviors and Trends

We can examine user behavior and trends on the platform, such as reviews, check-ins, favorites, and likes, to help businesses gain a deeper understanding of user needs and habits. For example, by analyzing the data on user comments and likes from the Yelp Tip and Review datasets, we can assist businesses in refining or enhancing their products and services based on user suggestions and preferences. This approach enables businesses to better cater to their customers' expectations and improve overall satisfaction.

### Market Competition and Trends

We can assess market competition and trends by analyzing data such as the number of businesses, reviews, market share, and local trends across different cities. This analysis can aid businesses and the platform in comprehending market development trends and identifying opportunities. For instance, by examining the number of businesses and their review profiles in a specific city or region using the Yelp Business and Review datasets, we can gauge the intensity of market competition and identify emerging trends. This information helps businesses and the platform to devise more informed development strategies.

### Sentiment Analysis

<img width="1119" alt="image" src="https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/ef789b2f-f6b2-44fb-afed-4b7afb6e9866">

This involves utilizing natural language processing techniques to scrutinize the opinions and emotions contained in user reviews and ratings. Through this analysis, we can detect patterns and trends in how users feel about various businesses and their offerings, aiding these businesses in enhancing their products or services to align with customer expectations.

For instance, sentiment analysis can reveal recurring issues or complaints highlighted in user reviews, such as prolonged waiting times, subpar customer service, or inferior food quality. Businesses can then leverage this information to rectify these problems and boost overall customer satisfaction. Additionally, the platform can gain from sentiment analysis by spotting trends in user satisfaction and dissatisfaction across different business sectors, and then use this data to refine its features and services.

Moreover, sentiment analysis can predict future user behaviors and preferences, enabling businesses and the platform to anticipate market trends and proactively adapt to evolving customer needs.


### Network & Community Detection

<p align="center">
  <img src="https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/8d96887f-37ff-4688-8e32-6429c9cac57d" alt="Image"><br><br>
</p>

<p align="center">
  <img src="https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/f0036373-b18e-4fab-beec-b9cc0e7f3cb9" alt="Image"><br><br>
</p>

<p align="center">
  <img src="https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/c50790ce-832b-42af-b6b6-5f6eb2508803" alt="Image"><br><br>
</p>

<p align="center">
  <img src="https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/c50790ce-832b-42af-b6b6-5f6eb2508803" alt="Image"><br><br>
</p>


<p align="center">
  <img src="https://github.com/Mark-YuS/DA_Portfolio/assets/151570035/4533edb5-5185-499e-8d2d-0a2a9368311e" alt="Image"><br><br>
</p>


This approach utilizes network analysis techniques to segement groups of businesses or users that are interconnected based on their interactions on the platform. By identifying these communities, we can uncover groups of businesses or users with similar interests, preferences, or behaviors, which helps in understanding the dynamics of the Yelp platform more deeply.

For example, by employing community detection, we can pinpoint clusters of businesses that compete within the same market segment or geographical area. By studying the interactions and relationships among these businesses, we gain insights into their competitive environment, aiding them in crafting more effective marketing strategies.

Similarly, community detection can be used to identify groups of users who interact frequently on the platform, such as those who often review or recommend similar types of businesses. Analyzing these communities helps us better understand user preferences and behaviors, enhancing the platform’s recommendation algorithms and personalized offerings.

Overall, community detection serves as a valuable tool in mapping the intricate network of relationships between businesses and users on the Yelp platform, enabling both businesses and the platform to better comprehend their customers and refine their services.

## Challenges

### Data volume and complexity

The Yelp dataset includes millions of data entries, presenting challenges in extracting meaningful insights and discernible patterns due to its vast size. One strategy to address this challenge is through the use of sampling techniques, which help to manage the dataset's size while aiming to preserve the validity of the analysis. For instance, a data analyst might opt to concentrate on a specific subset of businesses or reviews that are directly pertinent to the research question being investigated. Nevertheless, this approach has its limitations, as it can potentially miss significant patterns and trends that are only observable when analyzing the entire dataset.

### Data quality

The Yelp dataset user generated, resulting in varying data quality. To address this, data cleaning and preprocessing techniques are employed to enhance the data's accuracy and reliability. For instance, a data analyst might eliminate duplicate entries, rectify spelling errors, and standardize data formats to ensure uniformity across the dataset. However, this process has its disadvantages; it can be labor-intensive and might necessitate manual efforts to resolve errors that are not readily amendable through automation.


### Interpretation and communication

Before diving into data analysis, a thorough understanding of Yelp's platform and the restaurant industry is essential to properly interpret the data and formulate effective analysis strategies. For example, it's crucial to grasp both user and merchant behaviors on Yelp, along with the distinct characteristics and business models of various restaurant types, to carry out meaningful analysis.

Data analysis becomes truly valuable when its results are accurately interpreted and effectively communicated to stakeholders. To address this, employing data visualization and storytelling techniques can be particularly effective in presenting key insights in a clear and engaging manner. For instance, a data analyst might utilize interactive charts and graphs to underscore major trends, or apply narrative methods to clarify the results' implications in simple terms. However, this approach may require specific competencies in data visualization and communication, skills that not all data analysts may possess.


