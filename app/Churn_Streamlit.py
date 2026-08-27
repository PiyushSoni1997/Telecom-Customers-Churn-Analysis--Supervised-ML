import streamlit as st
import pandas as pd
import joblib

model = joblib.load("final_model.pkl")

st.set_page_config(page_title="Customer CHurn Prediction", page_icon=":shark:", layout = "wide")

st.title("Customer Churn Prediction", text_alignment="center")

st.divider()

st.header("Customer Churn prediction model")

st.markdown(
    "Predict whether a customer is likely to **churn** using the trained "
    "Gradient Boosting model."
)


threshold = st.sidebar.slider(
    "Thresholds", 
    min_value = 0.1, 
    max_value = 0.5, 
    step = 0.1
    )

st.sidebar.info(
        "Lower threshold → higher recall but more false positives.\n\n"
    "Higher threshold → higher precision but potentially more missed churners."
)


st.header("Customer Churn Information")

st.subheader("Personal Info")

col1 = st.columns(1)[0]

with col1:

    SeniorCitizen = st.selectbox("SeniorCitizen", [0,1])

st.subheader("Tenure Period")

col2 = st.columns(1)[0]

with col2:

    tenure = st.number_input("Tenure", min_value = 1, max_value = 72)

st.subheader("Digital Info")

col3 = st.columns(1)[0]

with col3:

    InternetService = st.selectbox(
        "Internet Service",
        ["DSL", "Fiber optic", "No"]
    )


    OnlineSecurity = st.selectbox(
        "Online Security", ["No","Yes"]
    )


    OnlineBackup = st.selectbox(
        "Online Backup", ["No", "Yes"]
    )


    DeviceProtection = st.selectbox(
        "Device Protection", ["No", "Yes"]
    )

    TechSupport = st.selectbox(
        "Tech Support", ["No", "Yes"]
    )

    Contract = st.selectbox(
        "Contract",
        ["Month-to-month", "One year", "Two year"]
    )



st.subheader("Billing Info")

col4 = st.columns(1)[0]

with col4:

    PaymentMethod = st.selectbox(
        "Payment Method",
        [
            "Electronic check",
            "Mailed check",
            "Bank transfer (automatic)",
            "Credit card (automatic)"
        ]
    )

    MonthlyCharges = st.number_input(
        "Monthly Charges",
        min_value=0.0,
        value=70.0,
        step=1.0
    )

    TotalCharges = st.number_input(
        "Total Charges",
        min_value = 0.0,
        max_value = 1000.0,
        step = 5.0
    )


input_data = pd.DataFrame({
    "SeniorCitizen": [SeniorCitizen],
    "tenure": [tenure],
    "InternetService": [InternetService],
    "OnlineSecurity": [OnlineSecurity],
    "OnlineBackup": [OnlineBackup],
    "DeviceProtection": [DeviceProtection],
    "TechSupport": [TechSupport],
    "Contract": [Contract],
    "PaymentMethod": [PaymentMethod],
    "MonthlyCharges": [MonthlyCharges],
    "TotalCharges": [TotalCharges]
})


if st.button("Predict Churners", use_container_width=True):

    Prediction = model.predict(input_data)[0]

    Probability = model.predict_proba(input_data)[0][1]

    if Prediction == 0:

        threshold_predicts = int(Probability>=threshold)
        st.metric("Threshold", f"{threshold}")
        st.metric(f"The Risk Probability", f"{Probability:0.2f}")

        if threshold_predicts == 1:
            st.error("⚠️ HIGH CHURN RISK")
        else:
            st.success("Low Risk Churn")

        st.progress(
        min(Probability, 1.0),
        text=f"Churn Probability: {Probability:.2%}"
        )   


    else:

        st.warning("This customer has been classified as likely to Churn."
            "Consider a retention offer, personalized support, or "
            "contract upgrade.")

st.divider()

st.caption(
    "Customer Churn Prediction • Gradient Boosting • "
    "Machine Learning Dashboard"
)