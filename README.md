# Active Directory Bulk User Automation

## 📌 Project Overview
This repository contains a PowerShell automation script designed to streamline Tier 1 Helpdesk operations by automating the employee onboarding process. 

Instead of manually creating Active Directory accounts one by one through the graphical interface (Active Directory Users and Computers), this script parses a standardized CSV file provided by Human Resources and automatically provisions the new user accounts, sets temporary passwords, and forces a password reset upon first login.

## 🛠️ Technologies Used
* **Scripting Language:** PowerShell
* **Environment:** Windows Server 2022
* **Directory Services:** Microsoft Active Directory Domain Services (AD DS)
* **Data Parsing:** CSV (Comma Separated Values)

## 📂 Key Capabilities Demonstrated
* **Helpdesk Efficiency:** Reduces a 30-minute manual onboarding ticket to a 5-second automated task.
* **Security Compliance:** Enforces the `ChangePasswordAtLogon` flag to ensure new hires create a secure, private password immediately.
* **Error Reduction:** Eliminates human typos in usernames and naming conventions by relying on standardized HR data feeds.
