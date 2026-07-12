# Transaction Management System

## Overview

This project is a simple transaction management system built with Ruby on Rails.

The application allows users to:

- View existing transactions.
- Add new transactions through a web interface.
- Retrieve and create transactions through API endpoints.

Transaction data is stored in a CSV file instead of a database.

Each transaction contains:

- Transaction Date
- Account Number
- Account Holder Name
- Amount
- Status

When a new transaction is added, the system automatically assigns a random status:

- Pending
- Settled
- Failed

---

# Built With

## Backend

- Ruby 3.3.7
- Ruby on Rails 7.2.3

## Frontend

- Rails ERB Views
- Bootstrap 5 (loaded using CDN)

## Storage

- CSV file (`storage/transactions.csv`)

---

# Prerequisites

Before running the application, install the following:

- Ruby 3.3.7
- Rails 7.2.3
- Bundler
- Git

This application was developed and tested using Ubuntu (WSL) on Windows.

To check if they are installed, open a terminal and run:

```bash
ruby -v
rails -v
bundle -v
git --version
```

---

# Installation

Follow these steps to run the application locally.

## 1. Download the Project

Clone the repository:

```bash
git clone https://github.com/github-russ/transaction_management_system.git
```

Move into the project folder:

```bash
cd transaction_management_system
```

---

## 2. Install Required Packages

The application uses Ruby packages called gems.

Install them by running:

```bash
bundle install
```

Wait until the installation finishes.

---

# Configuration

No additional configuration is required.

The application uses the CSV file below to store transaction data:

```
storage/transactions.csv
```

The CSV file is included in the repository and already contains sample transaction records.

The CSV format is:

```
Transaction Date,Account Number,Account Holder Name,Amount,Status
```

---

# Running the Application

## 1. Start the Server

Run:

```bash
bin/rails server
```

The application will start running locally.

---

## 2. Open the Website

Open your browser and go to:

```
http://localhost:3000
```

You should see the transaction table.

---

## 3. Stop the Server

To stop the application:

- Go back to the terminal.
- Press:

```
Ctrl + C
```

---

# Using the Application

## Viewing Transactions

The homepage displays all transactions stored in the CSV file.

The table shows:

- Transaction Date
- Account Number
- Account Holder Name
- Amount
- Status

Each transaction status has a different color for easier identification:

- 🟡 Pending
- 🟢 Settled
- 🔴 Failed

---

## Adding a Transaction

To add a transaction:

1. Click the **Add Transaction** button.
2. Fill in the following fields:

   - Transaction Date
   - Account Number
   - Account Holder Name
   - Amount

3. Submit the form.

After submission:

- The transaction is saved to the CSV file.
- A random status is assigned.
- The new transaction appears in the table.
- A success message is displayed.

---

# API Documentation

The application also provides API endpoints for transaction data.

API endpoints can be tested using tools such as Postman.

---

## GET /api/transactions

Returns all transactions.

### Request

```
GET http://localhost:3000/api/transactions
```

### Response

Status:

```
200 OK
```

Example:

```json
[
  {
    "transaction_date": "2025-03-01",
    "account_number": "7289-3445-1121",
    "account_holder_name": "Maria Johnson",
    "amount": "150.00",
    "status": "Settled"
  }
]
```

---

## POST /api/transactions

Creates a new transaction.

### Request

```
POST http://localhost:3000/api/transactions
```

Request body:

```json
{
  "transaction": {
    "transaction_date": "2026-07-12",
    "account_number": "1234-5678",
    "account_holder_name": "Test User",
    "amount": "100.00"
  }
}
```

### Response

Status:

```
201 Created
```

Example:

```json
{
  "transaction_date": "2026-07-12",
  "account_number": "1234-5678",
  "account_holder_name": "Test User",
  "amount": "100.00",
  "status": "Pending"
}
```

---

# Testing

The application can be tested manually.

## Testing the Website

### Check Transaction Display

1. Start the Rails server.
2. Open:

```
http://localhost:3000
```

3. Confirm that:
   - Transactions are displayed.
   - All table columns are visible.
   - Status colors are correct.

---

### Check Adding Transactions

1. Click **Add Transaction**.
2. Enter valid transaction details.
3. Submit the form.

Confirm that:

- A success message appears.
- The new transaction appears in the table.
- The CSV file contains the new transaction.
- The status is randomly assigned.

---

## Testing the API

Using Postman:

### Test GET

Send:

```
GET http://localhost:3000/api/transactions
```

Expected result:

```
200 OK
```

---

### Test POST

Send:

```
POST http://localhost:3000/api/transactions
```

Expected result:

```
201 Created
```

Confirm that:

- The response contains the new transaction.
- The CSV file is updated.

---

## Testing Error Handling

Try submitting the transaction form with missing information.

Expected result:

- The user receives an error message.
- The incomplete transaction is not saved.

For API requests with missing required fields:

Expected response:

```
422 Unprocessable Entity
```

---

# AI Usage Summary

AI tools were used as a development assistant during this project.

The application was built by following the project requirements and understanding how each part of the system works. 

AI was used as a support tool when I encountered blockers or needed another perspective, mainly for:
- Exploring possible approaches when I was unsure about an implementation.
- Reviewing Rails concepts and application structure.
- Helping debug issues encountered during development.
- Improving documentation clarity and organization.

I reviewed and tested the suggestions before applying them to the project to ensure they matched the requirements and the intended application behavior.

The final implementation was adjusted, tested, and verified during development to ensure I understood how the application works.