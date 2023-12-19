# Aerofit Customer Profile

## Overview

This project demonstrated Python's analytical capabilities in a hypothetical scenario for a treadmill company, Aerofit. I analyzed customer and sales data related to Aerofit's product line to assist the market research team. The goal was to identify target audiences and enhance product recommendations. To achieve this, I created distinct profiles for buyers of different treadmill models. This involved using descriptive analytics, constructing two-way contingency tables, and calculating both conditional and marginal probabilities. These methods helped in effectively segmenting the customer base and tailoring product suggestions accordingly. 

## Objective
Develop customer profiles for each treadmill product (KP281, KP481, KP781) based on various customer characteristics.

## AeroFit's Product Portfolio
- **KP281**: Entry-level treadmill, priced at $1,500.
- **KP481**: Mid-level treadmill for regular runners, priced at $1,750.
- **KP781**: Advanced features treadmill, priced at $2,500.

## Project files
```aerofit_treadmill_data.csv```: contains data from recent purchases at AeroFit stores.

Features: Product, Age, Gender, Education, Marital Status, Usage, Fitness, Income, Miles.

The raw dataset can be found [here](https://github.com/Mvanhuffel/Data-Analysis-Projects/blob/63176dbc18aeb20b3ee1755208c4707dab06e738/Aerofit%20Buyer%20Profile/aerofit_treadmill_data.csv).

## Methodology

Python Libraries: Numpy, Pandas, Matplotlib and Seaborn for data visualization, Scipy.stats for statistical functions, Warnings to manage warning messages.

Data Exploration and Processing:
- Initial Examination: Utilized pandas to load and inspect the dataset, focusing on its structure, types of variables, and initial data quality.
- Data Cleaning: Performed necessary cleaning steps, such as handling missing values and standardizing data formats.

Statistical Summary:
- Generated descriptive statistics to understand the central tendency, dispersion, and shape of the dataset's distributions.

Non-Graphical Analysis:
- Included value counts and identification of unique attributes to understand data distribution and variability.

Graphical Analysis:
- Univariate Analysis: Used matplotlib and seaborn for visualizing distributions of numerical and categorical variables separately.
- Bivariate Analysis: Examined relationships between pairs of variables.
- Multivariate Analysis: Explored interactions among multiple variables.

Correlation Analysis:
- Employed statistical methods (using scipy and seaborn) to identify and visualize correlations between different variables.

Probability Analysis:
- Computed marginal and conditional probabilities to understand the likelihood of different customer characteristics and behaviors.

Outlier Detection:
- Applied statistical techniques to detect and handle outliers in the dataset, ensuring the robustness of the analysis.

You can find my code [here](https://github.com/Mvanhuffel/Data-Analysis-Projects/blob/98dc59dee95f1907cae35019a3f6e83418c94ca3/Aerofit%20Customer%20Profile/aerofit_treadmill_customer_profile_analysis.ipynb).

## Conclusion

- Model KP281 is the best-selling product. 44.0% of all treadmill sales go to model KP281.
- The majority of treadmill customers fall within the $ 45,000 - $ 80,000 income bracket.
- 83% of treadmills are bought by individuals with incomes between $ 35,000 and $ 85,000
- There are only 8% of customers with incomes below $ 35000 who buy treadmills.
- 88% of treadmills are purchased by customers aged 20 to 40.
- Miles and Fitness & Miles and Usage are highly correlated, which means if a customer's fitness level is high they use more treadmills.
- KP781 is the only model purchased by a customer who has more than 20 years of education and an income of over $ 85,000.
- With Fitness level 4 and 5, the customers tend to use high-end treadmills and the average number of miles is above 150 per week.
