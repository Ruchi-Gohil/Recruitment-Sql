--
-- File generated with SQLiteStudio v3.2.1 on Fri Apr 3 17:09:31 2020
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Application
DROP TABLE IF EXISTS Application;

CREATE TABLE Application (
    A_Id   NVARCHAR (10) PRIMARY KEY
                         NOT NULL,
    JB_Id  NVARCHAR (10) NOT NULL,
    CI_Id  NVARCHAR (10) NOT NULL,
    CS_Id  NVARCHAR (10) NOT NULL,
    CPQ_Id NVARCHAR (10) NOT NULL,
    FOREIGN KEY (
        JB_Id
    )
    REFERENCES Job_Builder (JB_Id) ON DELETE NO ACTION
                                   ON UPDATE NO ACTION,
    FOREIGN KEY (
        CI_Id
    )
    REFERENCES Candidate_Info (CI_Id) ON DELETE NO ACTION
                                      ON UPDATE NO ACTION,
    FOREIGN KEY (
        CS_Id
    )
    REFERENCES Candidate_Skills (CS_Id) ON DELETE NO ACTION
                                        ON UPDATE NO ACTION,
    FOREIGN KEY (
        CPQ_Id
    )
    REFERENCES Candidate_PersonalityQuality (CPQ_Id) ON DELETE NO ACTION
                                                     ON UPDATE NO ACTION
);


-- Table: Candidate_Assessment
DROP TABLE IF EXISTS Candidate_Assessment;

CREATE TABLE Candidate_Assessment (
    CA_Id  NVARCHAR (10) PRIMARY KEY
                         NOT NULL,
    QB_Id  NVARCHAR (10) NOT NULL,
    Q1_Ans NVARCHAR (10) NOT NULL,
    Q2_Ans NVARCHAR (10) NOT NULL,
    Q3_Ans NVARCHAR (10) NOT NULL,
    Q4_Ans NVARCHAR (10) NOT NULL,
    Q5_Ans NVARCHAR (10) NOT NULL,
    FOREIGN KEY (
        QB_Id
    )
    REFERENCES Question_Bank_CA (QB_Id) ON DELETE NO ACTION
                                        ON UPDATE NO ACTION
);

INSERT INTO Candidate_Assessment (CA_Id, QB_Id, Q1_Ans, Q2_Ans, Q3_Ans, Q4_Ans, Q5_Ans) VALUES ('CA-1', 'QB-1', '4', '5', '2', '5', '2');
INSERT INTO Candidate_Assessment (CA_Id, QB_Id, Q1_Ans, Q2_Ans, Q3_Ans, Q4_Ans, Q5_Ans) VALUES ('CA-2', 'QB-2', '4', '3', '5', '5', '2');
INSERT INTO Candidate_Assessment (CA_Id, QB_Id, Q1_Ans, Q2_Ans, Q3_Ans, Q4_Ans, Q5_Ans) VALUES ('CA-3', 'QB-3', '5', '5', '3', '6', '4');
INSERT INTO Candidate_Assessment (CA_Id, QB_Id, Q1_Ans, Q2_Ans, Q3_Ans, Q4_Ans, Q5_Ans) VALUES ('CA-4', 'QB-4', '5', '5', '5', '5', '4');
INSERT INTO Candidate_Assessment (CA_Id, QB_Id, Q1_Ans, Q2_Ans, Q3_Ans, Q4_Ans, Q5_Ans) VALUES ('CA-5', 'QB-5', '3', '2', '5', '3', '3');

-- Table: Candidate_Info
DROP TABLE IF EXISTS Candidate_Info;

CREATE TABLE Candidate_Info (
    CI_Id          NVARCHAR (10)  PRIMARY KEY
                                  NOT NULL,
    First_Name     NVARCHAR (60)  NOT NULL,
    Last_Name      NVARCHAR (60)  NOT NULL,
    Phone_No       NVARCHAR (10)  NOT NULL,
    City           NVARCHAR (60)  NOT NULL,
    Relocation     NVARCHAR (3)   NOT NULL,
    Qualification  NVARCHAR (60)  NOT NULL,
    YoE            NUMERIC (3, 1),
    Current_Salary NVARCHAR (60)  NOT NULL,
    Notice_Period  NUMERIC (3),
    Current_EmpR   NVARCHAR (60)  NOT NULL,
    Current_Title  NVARCHAR (60)  NOT NULL
);

INSERT INTO Candidate_Info (CI_Id, First_Name, Last_Name, Phone_No, City, Relocation, Qualification, YoE, Current_Salary, Notice_Period, Current_EmpR, Current_Title) VALUES ('CI-1', 'Ishita', 'Pasad', '985631470', 'Mumbai', 'Yes', 'BCom', '2 years', '3 lakhs', 2, 'Reuters', 'Analyst');
INSERT INTO Candidate_Info (CI_Id, First_Name, Last_Name, Phone_No, City, Relocation, Qualification, YoE, Current_Salary, Notice_Period, Current_EmpR, Current_Title) VALUES ('CI-2', 'Hiral', 'Oza', '1236547890', 'Bangalore', 'No', 'BE', 'Fresher', 'NIL', 0, 'NIL', 'NIL');
INSERT INTO Candidate_Info (CI_Id, First_Name, Last_Name, Phone_No, City, Relocation, Qualification, YoE, Current_Salary, Notice_Period, Current_EmpR, Current_Title) VALUES ('CI-3', 'Jay', 'Bhuta', '856314790', 'Mumbai', 'Yes', 'BMS', '1 year', '10 lakhs', 3, 'Deloitte USI', 'R&D Analyst');
INSERT INTO Candidate_Info (CI_Id, First_Name, Last_Name, Phone_No, City, Relocation, Qualification, YoE, Current_Salary, Notice_Period, Current_EmpR, Current_Title) VALUES ('CI-4', 'Dipen', 'Joshi', '8563149704', 'Pune', 'Yes', 'BTech', '1 year', '8 lakhs', 2, 'JP Morgan', 'Developer');
INSERT INTO Candidate_Info (CI_Id, First_Name, Last_Name, Phone_No, City, Relocation, Qualification, YoE, Current_Salary, Notice_Period, Current_EmpR, Current_Title) VALUES ('CI-5', 'Hemil', 'Desai', '8965471234', 'Mumbai', 'No', 'BE', '1-2 years', '7 lakhs', 1, 'Capgemini', 'Front-end Engineer');

-- Table: Candidate_Management_Platform
DROP TABLE IF EXISTS Candidate_Management_Platform;

CREATE TABLE Candidate_Management_Platform (
    CMP_Id         NVARCHAR (10)  PRIMARY KEY
                                  NOT NULL,
    A_Id           NVARCHAR (10)  NOT NULL,
    CI_Id          NVARCHAR (10)  NOT NULL,
    First_Name     NVARCHAR (10)  NOT NULL,
    Last_Name      NVARCHAR (10)  NOT NULL,
    Ratings        NUMERIC (2, 1),
    Job_Role       NVARCHAR (60)  NOT NULL,
    Company        NVARCHAR (60)  NOT NULL,
    Location       NVARCHAR (60)  NOT NULL,
    WExp           NVARCHAR (10)  NOT NULL,
    Current_Salary NVARCHAR (20)  NOT NULL,
    Notice_Period  NUMERIC,
    FOREIGN KEY (
        CI_Id
    )
    REFERENCES Candidate_Info (CI_Id) ON DELETE NO ACTION
                                      ON UPDATE NO ACTION,
    FOREIGN KEY (
        A_Id
    )
    REFERENCES Score (A_Id) ON DELETE NO ACTION
                            ON UPDATE NO ACTION
);


-- Table: Candidate_PersonalityQuality
DROP TABLE IF EXISTS Candidate_PersonalityQuality;

CREATE TABLE Candidate_PersonalityQuality (
    CPQ_Id  NVARCHAR (10) PRIMARY KEY
                          NOT NULL,
    JB_Id   NVARCHAR (10) NOT NULL,
    QBPQ_Id NVARCHAR (10) NOT NULL,
    Q1      NVARCHAR (60) NOT NULL,
    Q2      NVARCHAR (60) NOT NULL,
    Q3      NVARCHAR (60) NOT NULL,
    Q4      NVARCHAR (60) NOT NULL,
    Q5      NVARCHAR (60) NOT NULL,
    FOREIGN KEY (
        JB_Id
    )
    REFERENCES Job_Builder (JB_Id) ON DELETE NO ACTION
                                   ON UPDATE NO ACTION,
    FOREIGN KEY (
        JB_Id
    )
    REFERENCES Question_Bank_PQ (QBPQ_Id) ON DELETE NO ACTION
                                          ON UPDATE NO ACTION
);


-- Table: Candidate_Skills
DROP TABLE IF EXISTS Candidate_Skills;

CREATE TABLE Candidate_Skills (
    CS_Id NVARCHAR (10) PRIMARY KEY
                        NOT NULL,
    JB_Id NVARCHAR (10) NOT NULL,
    CA_Id NVARCHAR (10) NOT NULL,
    Voice BLOB,
    FOREIGN KEY (
        JB_Id
    )
    REFERENCES Job_Builder (JB_Id) ON DELETE NO ACTION
                                   ON UPDATE NO ACTION,
    FOREIGN KEY (
        CA_Id
    )
    REFERENCES Candidate_Assessment (CA_Id) ON DELETE NO ACTION
                                            ON UPDATE NO ACTION
);

INSERT INTO Candidate_Skills (CS_Id, JB_Id, CA_Id, Voice) VALUES ('CS-1', 'JB-1', 'CA-1', NULL);
INSERT INTO Candidate_Skills (CS_Id, JB_Id, CA_Id, Voice) VALUES ('CS-2', 'JB-2', 'CA-2', NULL);
INSERT INTO Candidate_Skills (CS_Id, JB_Id, CA_Id, Voice) VALUES ('CS-3', 'JB-3', 'CA-3', NULL);

-- Table: Candidates_Invoice
DROP TABLE IF EXISTS Candidates_Invoice;

CREATE TABLE Candidates_Invoice (
    CIn_Id          NVARCHAR (10)   PRIMARY KEY
                                    NOT NULL,
    CI_Id           NVARCHAR (10)   NOT NULL,
    InvoiceDate     DATE            NOT NULL,
    Billing_Address NVARCHAR (60),
    Postal_Code     NUMERIC (6),
    Total           NUMERIC (10, 2) NOT NULL,
    FOREIGN KEY (
        CI_Id
    )
    REFERENCES Candidate_Info (CI_Id) ON DELETE NO ACTION
                                      ON UPDATE NO ACTION
);

INSERT INTO Candidates_Invoice (CIn_Id, CI_Id, InvoiceDate, Billing_Address, Postal_Code, Total) VALUES ('CIN-1', 'CI-1', '2020-01-21', 'Mumbai', 400066, 89652.3);
INSERT INTO Candidates_Invoice (CIn_Id, CI_Id, InvoiceDate, Billing_Address, Postal_Code, Total) VALUES ('CIN-2', 'CI-3', '2019-06-26', 'Bangalore', 400092, 89652.3);
INSERT INTO Candidates_Invoice (CIn_Id, CI_Id, InvoiceDate, Billing_Address, Postal_Code, Total) VALUES ('CIN-3', 'CI-5', '2020-02-29', 'Mumbai', 400001, 156398.56);

-- Table: Employee
DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
    Emp_Id     NVARCHAR (10) PRIMARY KEY
                             NOT NULL,
    CMP_Id     NVARCHAR (10) NOT NULL,
    EmpRIn_Id  NVARCHAR (10) NOT NULL,
    JB_Id      NVARCHAR (10) NOT NULL,
    First_Name NVARCHAR (60),
    Last_Name  NVARCHAR (60),
    Phone_No   NUMERIC (10),
    FOREIGN KEY (
        CMP_Id
    )
    REFERENCES Candidate_Management_Platform (CMP_Id) ON DELETE NO ACTION
                                                      ON UPDATE NO ACTION,
    FOREIGN KEY (
        EmpRIn_Id
    )
    REFERENCES Employer (EmpRIn_Id) ON DELETE NO ACTION
                                    ON UPDATE NO ACTION,
    FOREIGN KEY (
        JB_Id
    )
    REFERENCES Job_Builder (JB_Id) ON DELETE NO ACTION
                                   ON UPDATE NO ACTION
);


-- Table: Employer
DROP TABLE IF EXISTS Employer;

CREATE TABLE Employer (
    EmpR_Id    NVARCHAR (10) PRIMARY KEY
                             NOT NULL,
    Company    NVARCHAR (10) NOT NULL,
    First_Name NVARCHAR (10) NOT NULL,
    Last_Name  NVARCHAR (10) NOT NULL,
    Phone_No   NUMERIC (10)  NOT NULL,
    Email      NVARCHAR (20) NOT NULL
);

INSERT INTO Employer (EmpR_Id, Company, First_Name, Last_Name, Phone_No, Email) VALUES ('ER-1', 'ZEE5', 'Prashant', 'Mishra', 9856743210, 'pm@gmail.com');
INSERT INTO Employer (EmpR_Id, Company, First_Name, Last_Name, Phone_No, Email) VALUES ('ER-2', 'Ashoka University', 'Janak', 'Gohil', 6597841230, 'jk@gmail,com');
INSERT INTO Employer (EmpR_Id, Company, First_Name, Last_Name, Phone_No, Email) VALUES ('ER-3', 'CO-Venture LLP', 'Sneha', 'Rathod', 6985743201, 'sr@gmail.com');
INSERT INTO Employer (EmpR_Id, Company, First_Name, Last_Name, Phone_No, Email) VALUES ('ER-4', 'Kheyti', 'Ruchi', 'Merchant', 8965471203, 'rm@gmail.com');
INSERT INTO Employer (EmpR_Id, Company, First_Name, Last_Name, Phone_No, Email) VALUES ('ER-5', 'Ashika Group', 'Preeti', 'Gandhi', 5698741230, 'pg@gmail.com');

-- Table: Invoice
DROP TABLE IF EXISTS Invoice;

CREATE TABLE Invoice (
    EmpRIn_Id       NVARCHAR (10)   PRIMARY KEY
                                    NOT NULL,
    EmpR_Id         NVARCHAR (10)   NOT NULL,
    InvoiceDate     DATE            NOT NULL,
    Billing_Address NVARCHAR (60),
    Postal_Code     NUMERIC (6),
    Total           NUMERIC (10, 2) NOT NULL,
    FOREIGN KEY (
        EmpR_Id
    )
    REFERENCES Employer (EmpR_Id) ON DELETE NO ACTION
                                  ON UPDATE NO ACTION
);

INSERT INTO Invoice (EmpRIn_Id, EmpR_Id, InvoiceDate, Billing_Address, Postal_Code, Total) VALUES ('ERI-1', 'ER-1', '2020-02-26', 'A-2001, 7 BUNGALOWS Mumbai', 400061, 25698.23);
INSERT INTO Invoice (EmpRIn_Id, EmpR_Id, InvoiceDate, Billing_Address, Postal_Code, Total) VALUES ('ERI-2', 'ER-2', '2020-02-16', 'B-2002 7 BUNGALOWS Mumbai', 400061, 25298.23);
INSERT INTO Invoice (EmpRIn_Id, EmpR_Id, InvoiceDate, Billing_Address, Postal_Code, Total) VALUES ('ERI-3', 'ER-3', '2020-03-23', 'C-2003 7 BUNGALOWS Mumbai', 400061, 25638.23);
INSERT INTO Invoice (EmpRIn_Id, EmpR_Id, InvoiceDate, Billing_Address, Postal_Code, Total) VALUES ('ERI-4', 'ER-4', '2019-04-26', 'D-2004 7 BUNGALOWS Mumbai', 400061, 44698.23);
INSERT INTO Invoice (EmpRIn_Id, EmpR_Id, InvoiceDate, Billing_Address, Postal_Code, Total) VALUES ('ERI-5', 'ER-5', '2019-05-26', 'E-2005 7 BUNGALOWS Mumbai', 400061, 55698.23);

-- Table: Job_Builder
DROP TABLE IF EXISTS Job_Builder;

CREATE TABLE Job_Builder (
    JB_Id              NVARCHAR (60)  PRIMARY KEY
                                      NOT NULL,
    Company            NVARCHAR (60)  NOT NULL,
    JB_Role            NVARCHAR (60)  NOT NULL,
    JB_YoE             NVARCHAR (60),
    JB_Location        NVARCHAR (60)  NOT NULL,
    JB_Offering_Salary NVARCHAR (60),
    About_Role         NVARCHAR (120) NOT NULL,
    About_Company      NVARCHAR (120) NOT NULL
);

INSERT INTO Job_Builder (JB_Id, Company, JB_Role, JB_YoE, JB_Location, JB_Offering_Salary, About_Role, About_Company) VALUES ('JB-1', 'Kheyti', 'MIS and Analytics Executive', '4/5 years', 'Hyderabad', '6/10 lakhs', 'The chosen candidate will lead in transforming the way strategic decisions are taken at Kheyti into being rigorously data driven', 'Kheyti helps smallholder farmers in India gain a steady, dependable income through its "Greenhouse-in-a-Box", a simple, low-cost, modular greenhouse kit bundled with financing, inputs, training, advisory (extension) and market linkage services.');
INSERT INTO Job_Builder (JB_Id, Company, JB_Role, JB_YoE, JB_Location, JB_Offering_Salary, About_Role, About_Company) VALUES ('JB-2', ' Ashoka University', 'Senior Research Manager', '7-9 years', 'PAN India', '16-20 LPA', 'The Centre’s research will be focused on critical topics in the space of social impact, in strategic philanthropy in particular, with emphasis on applied research', 'Ashoka University is a private, non-profit university. An unprecedented example of collective public philanthropy in India, it is a pioneer in its focus on the Liberal Arts.');
INSERT INTO Job_Builder (JB_Id, Company, JB_Role, JB_YoE, JB_Location, JB_Offering_Salary, About_Role, About_Company) VALUES ('JB-3', 'Co Venture LLP', 'Business Analyst', '4+ years', 'Mumbai', '20 LPA', 'Co Venture is looking for an experienced Business Analyst who can act as a connecting link between multiple diverse companies and the management.', 'Co Ventures is a strategic investment group, which incubates disruptive young brands in the fields of design, technology and retail.');
INSERT INTO Job_Builder (JB_Id, Company, JB_Role, JB_YoE, JB_Location, JB_Offering_Salary, About_Role, About_Company) VALUES ('JB-4', 'Ashika Group', 'Analyst - Investment Banking', '3-5 years', 'Mumbai', '11 lakhs', 'Looking to get an energetic, numbers driven, original thinker to join the team.', 'Ashika group is one of the fastest growing capital market companies from eastern India, with more than 25 years of experience!');
INSERT INTO Job_Builder (JB_Id, Company, JB_Role, JB_YoE, JB_Location, JB_Offering_Salary, About_Role, About_Company) VALUES ('JB-5', 'ZEE5', 'Frontend Engineer', '0-6 months', 'Mumbai', 'Upto 7.2 lakhs', 'The Frontend Engineer will be responsible for designing, coding and developing technology products in the digital domain. ', 'ZEE5 is the digital entertainment destination launched by Zee Entertainment Enterprises Limited (ZEEL), a global Media and Entertainment powerhouse.');

-- Table: Login
DROP TABLE IF EXISTS Login;

CREATE TABLE Login (
    Login_Id  INTEGER       PRIMARY KEY AUTOINCREMENT
                            NOT NULL,
    FirstName NVARCHAR (60) NOT NULL,
    LastName  NVARCHAR (60) NOT NULL,
    Email     TEXT          NOT NULL,
    Password  TEXT          NOT NULL
);

INSERT INTO Login (Login_Id, FirstName, LastName, Email, Password) VALUES (1, 'Ruchi', 'Gohil', 'rg@gmail.com', 'rg@123');
INSERT INTO Login (Login_Id, FirstName, LastName, Email, Password) VALUES (2, 'Zoya', 'Merchant', 'zm@gmail.com', 'zm@123');
INSERT INTO Login (Login_Id, FirstName, LastName, Email, Password) VALUES (3, 'Pooja', 'Nair', 'pm@gmail.com', 'pm@123');
INSERT INTO Login (Login_Id, FirstName, LastName, Email, Password) VALUES (4, 'Priya', 'Nair', 'prn@gmail.com', 'prn@123');
INSERT INTO Login (Login_Id, FirstName, LastName, Email, Password) VALUES (5, 'Prachi', 'Pattnaik', 'pp@gmail.com', 'pp@123');

-- Table: Question_Bank_CA
DROP TABLE IF EXISTS Question_Bank_CA;

CREATE TABLE Question_Bank_CA (
    QB_Id NVARCHAR (10) PRIMARY KEY
                        NOT NULL,
    Q1    NVARCHAR (60) NOT NULL,
    Q2    NVARCHAR (60) NOT NULL,
    Q3    NVARCHAR (60) NOT NULL,
    Q4    NVARCHAR (60) NOT NULL,
    Q5    NVARCHAR (60) NOT NULL
);

INSERT INTO Question_Bank_CA (QB_Id, Q1, Q2, Q3, Q4, Q5) VALUES ('QB-1', 'What is the difference between Data Mining and Data Analysis', 'What is the process of Data Analysis?', 'What is the difference between Data Mining and Data Profiling?', 'What are the important steps in the data validation process?', 'What do you think are the criteria to say whether a developed data model is good or not?');
INSERT INTO Question_Bank_CA (QB_Id, Q1, Q2, Q3, Q4, Q5) VALUES ('QB-2', 'what experience have you got of upselling services?', 'Share an experience in which your understanding of a current or upcoming problem helped your company to respond to the problem.', 'Tell me how you organize, plan, and prioritize your work.', 'Would you consider analyzing data or information a strength? How so?', 'Share an experience you had in dealing with a difficult person and how you handled the situation.');
INSERT INTO Question_Bank_CA (QB_Id, Q1, Q2, Q3, Q4, Q5) VALUES ('QB-3', 'What is the difference between a Data Analyst and a Business Analyst?', 'List the core competencies of a Business Analyst.', 'What is a feasibility study?', 'What are the different tools used in Business Analytics?', 'Explain the business analysis process flow.');
INSERT INTO Question_Bank_CA (QB_Id, Q1, Q2, Q3, Q4, Q5) VALUES ('QB-4', 'What are key factors financial analysts should consider when evaluating prospective investments?', 'Can you explain why financial reports do not list dividends on the income statement?', 'What is the best metric to use to analyze a companys stock?', 'Which statements (income, balance, cash flow) would you reference to assess the companys liabilities and assets and why?', 'What does your financial analysis reporting process involve?');
INSERT INTO Question_Bank_CA (QB_Id, Q1, Q2, Q3, Q4, Q5) VALUES ('QB-5', 'What is Coercion in JavaScript?', 'Explain meta tags in HTML', 'What is Scope in JavaScript?', 'What is Node.js?', 'What is npm?');

-- Table: Question_Bank_PQ
DROP TABLE IF EXISTS Question_Bank_PQ;

CREATE TABLE Question_Bank_PQ (
    QBPQ_Id NVARCHAR (10) PRIMARY KEY
                          NOT NULL,
    Q1      NVARCHAR (60) NOT NULL,
    Q2      NVARCHAR (60) NOT NULL,
    Q3      NVARCHAR (60) NOT NULL,
    Q4      NVARCHAR (60) NOT NULL,
    Q5      NVARCHAR (60) NOT NULL
);


-- Table: Score
DROP TABLE IF EXISTS Score;

CREATE TABLE Score (
    A_Id    NVARCHAR (10)  NOT NULL,
    Ratings NUMERIC (2, 1),
    FOREIGN KEY (
        A_Id
    )
    REFERENCES Application (A_Id) ON DELETE NO ACTION
                                  ON UPDATE NO ACTION
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
