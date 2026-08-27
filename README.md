# Telecom-Customers-Churn-Analysis-

Customer churn is a major challenge in the telecommunications industry. Losing existing customers can lead to significant revenue loss and increased costs associated with acquiring new customers.
This project performs an end-to-end analysis of telecom customer data to understand customer churn patterns and build machine learning models that predict whether a customer is likely to leave the company.
The project analyzes customer demographics, account information, subscribed services, contract types, billing behavior, and charges to identify the key drivers of churn. Multiple classification models are trained and evaluated to select an effective model for churn prediction.

Project Objectives:

1. Analyze customer churn patterns.
2. Identify important factors contributing to churn.
3. Perform Exploratory Data Analysis (EDA).
4. Clean and preprocess customer data.
5. Build and compare multiple machine learning classification models.
6. Handle categorical and numerical features using preprocessing pipelines.
7. Evaluate models using appropriate classification metrics.
8. Identify customers with a high probability of churn.
9. Provide actionable business recommendations.
10. Deploy the prediction model using Streamlit.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

:// Project Workflow:

Data Collection
       ↓
Data Cleaning
       ↓
Exploratory Data Analysis
       ↓
Feature Preprocessing
       ↓
Train-Test Split
       ↓
Model Training
       ↓
Hyperparameter Tuning
       ↓
Model Evaluation
       ↓
Feature Importance
       ↓
Churn Prediction
       ↓
Streamlit Deployment

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

:// Data Preprocessing:

1. Checked missing values.
2. Removed unnecessary columns.
3. Converted [TotalCharges] to numerical format.
4. Handled missing values.
5. Separated numerical and categorical features.
6. Applied scaling to numerical variables using StandardScalar().
7. Applied One-Hot Encoding to categorical variables.
8. Used Scikit-learn pipelines to ensure consistent preprocessing during training and prediction.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

:// EDA:
The analysis explored relationships between customer characteristics and churn.

Key areas analyzed include:

1. Churn distribution.
2. Churn by contract type.
3. Churn by tenure.
4. Churn by internet service.
5. Churn by payment method.
6. Churn by monthly charges.
7.Churn by senior citizen status.
8. Correlation between numerical features(Heatmap).

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

:// Machine Learning Models:

The following classification models were trained and evaluated:

1. Logistic Regression
2. Decision Tree Classifier
3. Random Forest Classifier
4. Extra Trees Classifier
5. Gradient Boosting Classifier
6. Gaussian Naive Bayes

:// Model Evaluation Metrics //:

Since accuracy alone may not fully describe churn prediction performance, the models were evaluated using:

Accuracy
Precision
Recall
F1-Score
ROC-AUC
PR-AUC

In churn prediction, a false negative occurs when the model predicts that a customer will stay, but the customer actually churns.

Improving recall helps identify a larger proportion of customers who are at risk of leaving, allowing the business to target them with retention strategies.

	Model	Accuracy	Recall	Precision	F1 Score	PR_AUC	ROC_AUC

1	Logistic Regression	0.797842	0.550321	0.637717	0.590805	0.635282	0.844081

2	Random Forest Classifier	0.795003	0.501071	0.646409	0.564536	0.650722	0.840096

3	Extra Trees Model	0.793299	0.498929	0.641873	0.561446	0.639936	0.836416

4	Gradient Boost Classifier	0.800114	0.498929	0.663818	0.569682	0.660917	0.846759

5	Gaussian Naive Beyes	0.706985	0.828694	0.470231	0.600000	0.594754	0.816082


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

:// Key Churn Drivers //:

The analysis identified several factors associated with customer churn:

1. Tenure: Newer customers were more likely to churn.
2. Contract Type: Month-to-month customers showed higher churn risk.
3. Monthly Charges: Customers with higher monthly charges showed increased churn.
4. Payment Method: Some payment methods were associated with higher churn.
5. Senior Citizen: Senior customers had a higher observed churn rate.
6. Customer Support and Additional Services: Service-related features such as online security and technical support were analyzed for their relationship with churn.


:// Business Recommendations //:

Based on the analysis, the following strategies could help reduce churn:

1. Focus on New Customers

Customers with lower tenure should receive stronger onboarding, early support, and engagement initiatives.

2. Encourage Long-Term Contracts

Provide incentives for customers to move from month-to-month contracts to one-year or two-year contracts.

3. Monitor High-Charge Customers

Identify customers with high monthly charges and a high predicted churn probability for targeted retention offers.

4. Use Proactive Retention Campaigns

Use the machine learning model to identify high-risk customers before they churn and offer personalized incentives.

5. Improve Customer Support

Analyze service and support-related factors to identify opportunities for improving the overall customer experience.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

://Streamlit Application

The project includes a Streamlit application that allows users to input customer information and receive a churn prediction.

The application provides:

Customer input interface.
Churn prediction.
Predicted churn probability.
Customer risk assessment.


