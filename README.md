# Drug Y Prescription: Pattern Discovery & Statistical Audit

## Project Overview
While exploring patient data, I observed a potential pattern: **Drug Y** appeared to be prescribed exclusively when the **Na_to_K (Sodium-to-Potassium) ratio** exceeded a specific threshold (15.0). This project was built to validate this hypothesis through a structured data pipeline.

## Phase 1: SQL Hypothesis Validation
I engineered a validation layer to test if the "15.0 Threshold" holds true across the entire dataset. 
*   **Data Cleaning:** Conducted a null-value audit to ensure data integrity.
*   **Rule Engine:** Used **SQL CASE statements and CROSS JOINs** to flag patients against a hypothesized threshold table.
*   **Audit Logic:** The SQL script follows a 3-step pipeline (Clean, Transform, Audit). Step 3 serves as a final "quality gate" that confirmed zero discrepancies between the rule and actual prescriptions.

## Phase 2: Statistical Significance (Python)
I used Python to prove that this discovery wasn't just a coincidence and to rule out other "noise" (Age, Sex, BP, etc.).
*   **Methodology:** Independent **T-Tests** (Numeric) and **Chi-Square Tests** (Categorical).
*   **Result:** Proved **Na_to_K** is the only significant factor (**p < 0.05**), while other factors showed no statistical significance.
*   **Visualization:** Created Box Plots, KDE plots, and Impact Heatmaps to demonstrate the strict separation at the 15.0 mark.

## 📊Visualization Highlights
### Boxplot
<img width="841" height="547" alt="Boxplot" src="https://github.com/user-attachments/assets/acaec8b5-ca3d-46f6-bf72-c08187ad2b65" />
### KDEplot
<img width="855" height="547" alt="KDEplot" src="https://github.com/user-attachments/assets/d17a5703-28c4-446a-9e2c-cccca6ea1c39" />
### Heatmap
<img width="882" height="336" alt="Heatmap" src="https://github.com/user-attachments/assets/6b6faf90-6588-48d8-bb4b-da1e446be06d" />

## Repository Structure
- `drug200.csv`: Original raw patient dataset from Kaggle.
- `hypothesis_threshold.csv`: Reference table containing the hypothesized 15.0 Na_to_K threshold.
- `hypothesis_validation.sql`: SQL script used to audit the raw data and generate the `drug_final.csv`(Generated from Step 2 of SQL validation file).
- `drug_analysis.ipynb`: Python notebook containing the statistical proof and charts.

## Conclusion
This audit successfully identified and mathematically proved the strict prescription criteria for Drug Y. 

