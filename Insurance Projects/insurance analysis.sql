SELECT * FROM insurance_claims;
/*Total Claims by State*/
SELECT policy_state, COUNT(*) AS total_claims
FROM insurance_claims
GROUP BY policy_state
ORDER BY total_claims DESC;

/*Average Claim Amount by Incident Severity*/
SELECT incident_severity,
       ROUND(AVG(total_claim_amount), 2) AS avg_claim
FROM insurance_claims
GROUP BY incident_severity
ORDER BY avg_claim DESC;

/*Fraudulent vs Non-Fraudulent Claims*/
SELECT fraud_reported,
       COUNT(*) AS total_claims,
       ROUND(AVG(total_claim_amount), 2) AS avg_claim
FROM insurance_claims
GROUP BY fraud_reported;

/*Claims by Gender*/
SELECT insured_sex,
       COUNT(*) AS total_claims,
       SUM(total_claim_amount) AS total_claim_value
FROM insurance_claims
GROUP BY insured_sex;

/*Most Common Incident Types*/
SELECT incident_type,
       COUNT(*) AS num_incidents
FROM insurance_claims
GROUP BY incident_type
ORDER BY num_incidents DESC;

/*Collision Type vs Average Claim*/
SELECT collision_type,
       ROUND(AVG(total_claim_amount), 2) AS avg_claim
FROM insurance_claims
GROUP BY collision_type
ORDER BY avg_claim DESC;

/*Claim Amount by Age Group*/
SELECT 
    CASE 
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 40 THEN '25-40'
        WHEN age BETWEEN 41 AND 60 THEN '41-60'
        ELSE '60+'
    END AS age_group,
    ROUND(AVG(total_claim_amount), 2) AS avg_claim
FROM insurance_claims
GROUP BY age_group
ORDER BY avg_claim DESC;

/*Top 5 Policy States with Fraudulent Claims*/
SELECT policy_state,
       COUNT(*) AS fraud_cases
FROM insurance_claims
WHERE fraud_reported = 'Y'
GROUP BY policy_state
ORDER BY fraud_cases DESC
LIMIT 5;

/*Customers with Highest Total Claims*/
SELECT policy_number,
       SUM(total_claim_amount) AS total_claims
FROM insurance_claims
GROUP BY policy_number
ORDER BY total_claims DESC
LIMIT 10;


/*Average Claim Amount for Fraud vs Non-Fraud by State*/
SELECT policy_state,
       fraud_reported,
       ROUND(AVG(total_claim_amount)::numeric, 2) AS avg_claim
FROM insurance_claims
GROUP BY policy_state, fraud_reported
ORDER BY policy_state, avg_claim DESC;

/*Policy Holder’s Marital Status and Fraud Cases*/
SELECT insured_education_level,
       insured_sex,
       insured_relationship,
       COUNT(*) FILTER (WHERE fraud_reported = 'Y') AS fraud_cases,
       COUNT(*) FILTER (WHERE fraud_reported = 'N') AS non_fraud_cases
FROM insurance_claims
GROUP BY insured_education_level, insured_sex, insured_relationship
ORDER BY fraud_cases DESC;

/*Property vs Injury Claim Comparison*/
SELECT 
    ROUND(AVG(property_claim)::numeric, 2) AS avg_property_claim,
    ROUND(AVG(injury_claim)::numeric, 2) AS avg_injury_claim,
    ROUND(AVG(vehicle_claim)::numeric, 2) AS avg_vehicle_claim
FROM insurance_claims;

/*Top 5 Incident Locations with Fraud*/
SELECT incident_city,
       COUNT(*) AS fraud_cases
FROM insurance_claims
WHERE fraud_reported = 'Y'
GROUP BY incident_city
ORDER BY fraud_cases DESC
LIMIT 5;

/*Average Claim by Vehicle Age*/
SELECT auto_year,
       ROUND(AVG(total_claim_amount)::numeric, 2) AS avg_claim
FROM insurance_claims
GROUP BY auto_year
ORDER BY auto_year DESC;

/*Claims by collision Type*/
SELECT collision_type,
       COUNT(*) AS total_claims,
       ROUND(AVG(total_claim_amount)::numeric, 2) AS avg_claim
FROM insurance_claims
GROUP BY collision_type
ORDER BY total_claims DESC;




