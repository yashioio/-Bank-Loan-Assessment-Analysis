



--1.	Total Loan Application
SELECT count(id) AS total_Loan_applications FROM bank_loan_data
--2.	Month to Date (MTD) Loan Application
SELECT count(id) AS MTD_Month_to_Date FROM bank_loan_data 
where MONTH(issue_date)=12 and YEAR(issue_date)=2021
--3.	Previous Month to Date (PMTD) Loan Application
SELECT COUNT(id) AS Previous_MTD_Loan_Applications FROM bank_loan_data
WHERE MONTH(issue_date)=11 and YEAR(issue_date)=2021
--4.	Total Funded Amount 
SELECT SUM(loan_amount) AS Total_funded_amount FROM bank_loan_data
--5.	MTD of Total Funded Amount 
SELECT SUM(loan_amount) AS MTD_Total_funded_amount FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date)= 2021
--6.	Previous MTD of Total Funded Amount 
SELECT SUM(loan_amount) AS PMTD_Total_funded_amount FROM bank_loan_data
WHERE MONTH(issue_date)=11 AND Year(issue_date)=2021

--8.	MTD of Total Amount Received 
SELECT SUM(total_payment) AS MTD_Total_amount_recieved FROM bank_loan_data
WHERE MONTH(issue_date)=12 and YEAR(issue_date)=2021

--9.	Previous MTD of total amount received
SELECT SUM(total_payment) AS PMTD_Total_amount_recieved FROM bank_loan_data
WHERE MONTH(issue_date)=11 and YEAR(issue_date)=2021
--10.	Avrage Intrest Rate
SELECT ROUND(AVG(int_rate)*100,2) AS Average_Interest_Rate From bank_loan_data

--11.	MTD of Avg Intrest Rate 
SELECT ROUND(AVG(int_rate)*100,2) AS MTD_Average_Interest_Rate From bank_loan_data
WHERE MONTH(issue_date)=12 and Year(issue_date)=2021

--12.	PMTD of Avg Intrest Rate
SELECT ROUND(AVG(int_rate)*100,2) AS PMTD_Average_Interest_Rate From bank_loan_data
WHERE MONTH(issue_date)=11 and Year(issue_date)=2021

--13.	Average DTI (Debt to income ratio)
SELECT Round(AVG(dti)*100,2) AS Avg_DTI_Score From bank_loan_data

--14.	MTD of Avg DTI
SELECT Round(AVG(dti)*100,2) AS MTD_Avg_DTI_Score From bank_loan_data
WHERE MONTH(issue_date)=12 and YEAR(issue_date)=2021

--15.	PMTD of Avg DTI
SELECT Round(AVG(dti)*100,2) AS PMTD_Avg_DTI_Score From bank_loan_data
WHERE MONTH(issue_date)=11 and YEAR(issue_date)=2021
--GOOD LOAN AND BAD LOAN KPI

--16.	Good Loan application percentage
SELECT
	Round((COUNT(CASE 
		WHEN loan_status IN('Fully Paid','Current')
		THEN id END)*100)
	/
	COUNT(id),2) AS Good_loan_percentage
FROM bank_loan_data

--17.	No of Good Loan Apllication
SELECT COUNT(id) AS Good_Loan_application FROM bank_loan_data
WHERE loan_status IN ('Fully Paid','Current')

--18.	Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Funnded_Amount FROM bank_loan_data
WHERE loan_status IN ('Fully Paid','Current')

--19.	Good Loan Amount Received
SELECT SUM(total_payment) AS Good_Loan_Funnded_Amount FROM bank_loan_data
WHERE loan_status IN ('Fully Paid','Current')


--20.	Bad Loan Application Percentage
SELECT
	((COUNT(CASE WHEN 
		loan_status ='Charged Off'
	THEN id END)*100)
	/
	COUNT(id)) AS Bad_loan_Percentage
From bank_loan_data

--21.	Bad Loan Application
SELECT COUNT(id) As Bad_Loan_application from bank_loan_data Where loan_status='Charged Off'


--22.	Bad Loan  Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funnded_Amount FROM bank_loan_data
WHERE loan_status ='Charged Off' 

--23.	Bad Loan Amount Recieved
SELECT SUM(total_payment) AS Bad_Loan_Amount_Recieved FROM bank_loan_data
WHERE loan_status ='Charged Off'

--24.	Loan Grid Status
SELECT loan_status,
COUNT(id) AS Total_loan_application,
SUM(loan_amount) AS Total_Funded_amount,
SUM(total_payment) AS Total_amount_Recieved,
Avg(int_rate)*100 AS Avg_intrest_Rate,
AVG (dti) As DTI

FROM bank_loan_data
GROUP BY loan_status

--25.	Loan Grid MTD & PMTD Status  group by loan status 
SELECT loan_status,
Sum(loan_amount) As MTD_Funded_amount,
Sum(total_payment) As PMTD_Funded_amount
From bank_loan_data
Where MONTH(issue_date)=12 And Year(issue_date)=2021
Group By loan_status

--1.	Monthly trend by issue dates
SELECT
Month(issue_date)As Month_Num,
DATENAME(Month,issue_date) As Month,
count(id) as Total_loan_application,
Sum(loan_amount) as Total_funded_amount,
sum(total_payment) as Total_amount_recieved
from bank_loan_data
Group By Month(issue_date),DATENAME(Month,issue_date)
Order by Month(issue_date)

--2.	Regional Analysis by State
SELECT 
address_state,
count(id) as Total_loan_application,
Sum(loan_amount) AS Total_funded_amount,
Sum(total_payment) As Total_amount_recieved
from bank_loan_data
Group By address_state
order by Sum(loan_amount) desc


--3.Loan Term Analysis
SELECT
term,
count(id) as Total_loan_application,
Sum(loan_amount) AS Total_funded_amount,
Sum(total_payment) As Total_amount_recieved
from bank_loan_data
group by term
order by term

--4.	Employee Length Analysis
SELECT
emp_length,
count(id) as Total_loan_application,
Sum(loan_amount) AS Total_funded_amount,
Sum(total_payment) As Total_amount_recieved
from bank_loan_data
group by emp_length 
order by emp_length



--5.	Loan Purpose Breakdown
SELECT
purpose,
count(id) as Total_loan_application,
Sum(loan_amount) AS Total_funded_amount,
Sum(total_payment) As Total_amount_recieved
from bank_loan_data
group by purpose 
order by Sum(loan_amount) desc  

--6.	Home Ownership Analysis
SELECT
home_ownership,
count(id) as Total_loan_application,
Sum(loan_amount) AS Total_funded_amount,
Sum(total_payment) As Total_amount_recieved
from bank_loan_data
group by home_ownership 
order by Sum(loan_amount) desc


















