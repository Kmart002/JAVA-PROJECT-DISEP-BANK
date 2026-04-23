# 🏦 DISEP Bank – Java Web Banking Application

A full-featured web-based banking application built with **Java**, **Spring MVC**, **Jakarta Servlets**, and **MySQL**. DISEP Bank simulates core banking operations including user registration, authentication, fund transfers, and admin management — all backed by a relational database with transaction support.

---

## 🚀 Features

### 👤 User Features
- **Account Registration** – New users can register with personal details (name, phone, gender, account type). A unique account number is auto-generated on signup.
- **Login & Logout** – Secure session-based authentication. Only verified accounts can log in.
- **Send Money** – Transfer funds to another account by account number. Includes balance validation and dual-entry transaction logging (debit + credit).
- **Transaction History** – View a full history of sent and received transactions.
- **Profile Settings** – Update personal details (name, phone, gender, password) from the user dashboard.

### 🔐 Admin Features
- **Fund Account** – Admins can credit any account directly.
- **Verify Users** – View all inactive/unverified accounts and approve them for login access.
- **Dashboard Stats** – Access total user count and transaction volume metrics.

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Language | Java |
| Web Framework | Spring MVC + Jakarta Servlet API |
| Database | MySQL (via JDBC) |
| View Layer | JSP (JavaServer Pages) |
| Build Tool | Maven |
| Server | Apache Tomcat (Jakarta EE) |

---

## 📁 Project Structure

```
src/
├── controller/
│   └── AdminController.java         # Spring MVC controller for admin actions
├── service/
│   ├── AdminService.java            # Admin service interface
│   ├── LoginServlet.java            # Handles user authentication
│   ├── LogoutServlet.java           # Clears session on logout
│   ├── RegistrationServlet.java     # New user account creation
│   ├── SendMoneyServlet.java        # Fund transfer logic with rollback support
│   ├── updateServlet.java           # User profile/settings update
│   ├── UserTransactionsServlet.java # Fetches transaction history
│   ├── InactiveUsersServlet.java    # Lists unverified users for admin
│   └── VerifyUserServlet.java       # Admin user verification
├── model/
│   ├── User.java                    # User entity (Builder pattern)
│   └── Transaction.java             # Transaction entity (Builder pattern)
├── db/
│   └── DBConnection.java            # Database connection utility
└── webapp/
    └── f/
        ├── login.jsp
        ├── userdashboard.jsp
        ├── admindashboard.jsp
        ├── verifyusers.jsp
        └── transactionhistory.jsp
```

---

## 🗄️ Database Schema

The application uses a MySQL database with two core tables:

### `accounts`
| Column | Type | Description |
|---|---|---|
| `email` | VARCHAR | Primary identifier / username |
| `firstname` | VARCHAR | First name |
| `lastname` | VARCHAR | Last name |
| `phone_no` | VARCHAR | Phone number |
| `account_no` | VARCHAR | Auto-generated 11-digit account number |
| `account_type` | VARCHAR | Type of account (e.g., Savings, Current) |
| `gender` | VARCHAR | Gender |
| `password` | VARCHAR | Account password |
| `balance` | DOUBLE | Account balance |
| `status` | BOOLEAN | `0` = inactive/unverified, `1` = active |
| `role` | VARCHAR | `USER` or `ADMIN` |

### `transactions`
| Column | Type | Description |
|---|---|---|
| `transactionID` | INT | Auto-increment primary key |
| `transType` | VARCHAR | `Debit` or `Credit` |
| `accountNo` | VARCHAR | Account that initiated the transaction |
| `amount` | DOUBLE | Transaction amount |
| `senderID` | VARCHAR | Account number of sender |
| `receiverID` | VARCHAR | Account number of receiver |
| `status` | VARCHAR | Transaction status (e.g., `Successful`) |
| `dateCreated` | DATE | Transaction date |

---

## ⚙️ Setup & Installation

### Prerequisites
- Java 17+
- Apache Tomcat 10+
- MySQL 8+
- Maven

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/Kmart002/JAVA-PROJECT-DISEP-BANK.git
   cd JAVA-PROJECT-DISEP-BANK
   ```

2. **Set up the database**
   - Create a MySQL database (e.g., `disepbank`)
   - Run the SQL schema to create the `accounts` and `transactions` tables
   - Insert an admin user manually with `role = 'ADMIN'` and `status = 1`

3. **Configure the database connection**
   - Update `DBConnection.java` with your MySQL credentials:
     ```java
     String url = "jdbc:mysql://localhost:3306/disepbank";
     String user = "your_mysql_username";
     String password = "your_mysql_password";
     ```

4. **Build the project**
   ```bash
   mvn clean install
   ```

5. **Deploy to Tomcat**
   - Copy the generated `.war` file to your Tomcat `webapps/` directory
   - Start Tomcat and navigate to `http://localhost:8080/disepbank`

---

## 🔄 Key Technical Highlights

- **Session Management** – User state is maintained across requests using `HttpSession`, storing the authenticated `User` object.
- **Transaction Safety** – `SendMoneyServlet` disables auto-commit and uses `connection.rollback()` on failure, ensuring funds are never lost mid-transfer.
- **Builder Pattern** – `User` and `Transaction` models use the Builder pattern for clean object construction.
- **Role-Based Routing** – On login, users are redirected to either the admin dashboard or user dashboard based on their `role` field.
- **PreparedStatements** – Registration, fund transfer, and settings updates use `PreparedStatement` to prevent SQL injection.

---

## ⚠️ Known Limitations & Future Improvements

- Passwords are currently stored in plain text — a production version would use BCrypt hashing
- Some servlets use raw `Statement` instead of `PreparedStatement` (e.g., `VerifyUserServlet`) — these are candidates for refactoring
- No front-end framework; UI is JSP-based
- Error handling can be centralised using a Spring `@ExceptionHandler` or servlet filter

---

## 👩‍💻 Author

**Karimat Odewale-Abolarinwa**  
AI/ML Engineer | Full-Stack Developer  
🔗 [GitHub](https://github.com/Kmart002) · [Portfolio](https://karimat-portfolio.netlify.app) · [LinkedIn](https://linkedin.com/in/karimat-odewale-abolarinwa)
