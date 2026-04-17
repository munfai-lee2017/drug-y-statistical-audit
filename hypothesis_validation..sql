-- DATABASE SETUP
USE drug_classification;

-- STEP 1: DATA INTEGRITY AUDIT
-- Checking for missing values to ensure the dataset is reliable for testing.
SELECT *
FROM drug200
WHERE Age IS NULL 
   OR Sex IS NULL 
   OR BP IS NULL 
   OR Cholesterol IS NULL 
   OR Na_to_K IS NULL 
   OR Drug IS NULL;

-- STEP 2: HYPOTHESIS VALIDATION
-- I observed that Drug Y appears only when Na_to_K >= 15.
-- This JOIN tests that discovery by flagging every row against my 'hypothesis_threshold' table.
SELECT 
	d.*,
	CASE 
		WHEN d.Na_to_K >=h.threshold_value THEN h.status
        ELSE 'Ineligible'
	END AS Eligibility_status
FROM drug200 AS d
CROSS JOIN hypothesis_threshold AS h;

-- STEP 3: FAIL-SAFE VALIDATION
-- This query hunts for "logical contradictions." 
-- If this returns zero rows, the Na_to_K >= 15 rule is 100% consistent.
SELECT * 
FROM (
    SELECT 
        d.*,
        CASE 
            WHEN d.Na_to_K >= h.threshold_value THEN h.status
            ELSE 'Ineligible'
        END AS Eligibility_status
    FROM drug200 AS d
    CROSS JOIN hypothesis_threshold AS h
) AS validation_check
WHERE (Drug = 'DrugY' AND Eligibility_status = 'Ineligible')
   OR (Drug != 'DrugY' AND Eligibility_status = 'Drug_Y_Eligibility'); 