# Aerofit Buyer Profile

## Overview

This project was part of a recruitment assignment for data science positions at AeroFit. It focuses on analyzing customer data to create distinct profiles for buyers of different treadmill models offered by AeroFit. The aim is to aid the market research team in identifying target audiences and enhancing product recommendations.

## Objective
- Primary Goal: Develop customer profiles for each treadmill product (KP281, KP481, KP781) based on various customer characteristics.
- Analytical Approach: Utilize descriptive analytics to analyze customer data, constructing two-way contingency tables and computing conditional and marginal probabilities.
Business Impact: Provide insights into customer preferences and behaviors, supporting strategic marketing and sales decisions.

## AeroFit's Product Portfolio
- KP281: Entry-level treadmill, priced at $1,500.
- KP481: Mid-level treadmill for regular runners, priced at $1,750.
- KP781: Advanced features treadmill, priced at $2,500.

## Data Description
Dataset: aerofit_treadmill_data.csv representing data from recent purchases at AeroFit stores.
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

You can see my code here. (TBD)
