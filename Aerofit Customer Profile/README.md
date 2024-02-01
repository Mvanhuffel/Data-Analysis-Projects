# Aerofit Customer Profile

This project was an exercise to illustrate Python's analytical capabilities. The objective was to hypothetically support the market research team by identifying distinct customer profiles for each treadmill model from the sales data, and refining product recommendations and targeting strategies.

## Objective
- **Customer Profile Development**: Create detailed profiles for buyers of each Aerofit treadmill model (KP281, KP481, KP781) based on a variety of customer attributes.

## AeroFit's Product Portfolio
- **KP281**: Entry-level treadmill, priced at $1,500.
- **KP481**: Mid-level treadmill for regular runners, priced at $1,750.
- **KP781**: Advanced features treadmill, priced at $2,500.

## Project files
[```aerofit_treadmill_data.csv```](https://github.com/Mvanhuffel/Data-Analysis-Projects/blob/63176dbc18aeb20b3ee1755208c4707dab06e738/Aerofit%20Buyer%20Profile/aerofit_treadmill_data.csv): Contains raw dataset from recent purchases at AeroFit stores.

[```aerofit_treadmill_customer_profile_analysis.ipynb```](https://github.com/Mvanhuffel/Data-Analysis-Projects/blob/98dc59dee95f1907cae35019a3f6e83418c94ca3/Aerofit%20Customer%20Profile/aerofit_treadmill_customer_profile_analysis.ipynb): Jupyter notebook containing data analysis of Aerofit treadmill customer profiles, utilizing Python for exploratory data analysis, feature engineering, and predictive modeling.

## Methodology
### 1. Data Exploration and Processing
- **Initial examination**: Employed pandas for dataset loading and initial inspection to assess data structure, variable types, and data quality.
- **Data cleaning**: Addressed data cleanliness by rectifying missing values and normalizing data formats.

### 2. Statical Summary
- Generated descriptive statistics to grasp the dataset's central tendencies, dispersion, and distribution shapes.

### 3. Analytical Techniques
- **Non-Graphical Analysis**: Performed counts and attribute uniqueness assessments to gauge data distribution and variability.
- **Graphical Analysis**: Conducted univariate, bivariate, and multivariate analyses using matplotlib and seaborn to visualize data distributions and relationships.
- **Correlation Analysis**: Utilized scipy and seaborn to pinpoint and depict variable correlations.
- **Probability Analysis**: Calculated marginal and conditional probabilities to elucidate customer characteristic and behavior likelihoods.
- **Outlier Detection**: Implemented statistical methods to identify and manage dataset outliers, enhancing analysis robustness.

## Conclusion

- Model KP281 is the best-selling product, accounting for 44.0% of total treadmill sales.
- The majority of treadmill customers fall within the $ 45,000 - $ 80,000 income bracket.
- Income brackets between $35,000 and $85,000 comprise 83% of the customer base, with only 8% earning below $35,000.
- The 20 to 40 age group represents 88% of treadmill buyers.
- A strong correlation was observed between miles run and both fitness levels and usage, indicating higher usage among fitter individuals.
- KP781 is the only model purchased by a customer who has more than 20 years of education and an income of over $ 85,000.
- Customers with fitness levels 4 and 5 prefer premium treadmills, averaging over 150 miles per week.

## Prerequisites
- Python
  - Libraries: Numpy, Pandas, Matplotlib, Seaborn, and Scipy.stats
