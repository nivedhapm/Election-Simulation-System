# 🗳️ Tamil Nadu Election Simulation System

This project simulates the electoral process in the Indian state of Tamil Nadu using a MySQL relational database.

## 📌 Overview

The database models a comprehensive election system that includes:
- 234 constituencies
- Multiple political parties and candidates
- 10 wards per constituency
- Registered voters with demographic distribution
- Polling stations
- Automated vote casting and result calculation

## 🧱 Database Structure

### Tables
- `political_parties` – Stores party information
- `constituencies` – Represents each assembly constituency
- `wards` – Subdivisions of constituencies (10 per constituency)
- `candidates` – Party members contesting elections
- `polling_stations` – Polling units within each ward
- `voters` – Simulated voters with demographic data
- `election_results` – Stores constituency-level results
- `ward_results` – Stores ward-level results
- `election_summary` – Aggregates total results

### Views
- `constituency_winners` – Shows winners by constituency
- `ruling_party` – Displays the ruling party and CM candidate
- `voter_demographics` – Demographic breakdown by constituency

### Stored Procedures
- `populate_constituencies()` – Populates all TN constituencies
- `create_wards()` – Creates 10 wards per constituency
- `generate_candidates()` – Creates party candidates
- `create_polling_stations()` – Creates polling stations in each ward
- `generate_voters()` – Generates 100,000 voters
- `simulate_election()` – Randomly simulates voting and calculates results
- `calculate_election_results()` – Determines winners and vote shares
- `reset_simulation()` – Resets data for fresh simulation

### Triggers
- `after_voter_votes` – Automatically updates results when a vote is cast

## 🚀 Usage Examples

```sql
-- Run election simulation
CALL simulate_election();

-- View ruling party
SELECT * FROM ruling_party;

-- View winners
SELECT * FROM constituency_winners;

-- Analyze vote share
SELECT * FROM election_summary ORDER BY seats_won DESC;
```

## 📂 Getting Started

1. Import the SQL script `Election Simulation System.sql` into a MySQL server.
2. Run the procedures in order:
```sql
-- 1. Create the database
DROP DATABASE IF EXISTS tamil_nadu_election;
CREATE DATABASE tamil_nadu_election;

-- 2. Use the database
USE tamil_nadu_election;

-- 3. Create all tables, procedures, triggers, and views
-- (Run the entire SQL script: 'Election Simulation System.sql')

-- 4. Populate constituencies
CALL populate_constituencies();

-- 5. Create 10 wards per constituency
CALL create_wards();

-- 6. Create polling stations within wards
CALL create_polling_stations();

-- 7. Generate voters across all wards and polling stations
CALL generate_voters();

-- 8. Generate candidates for each constituency and party
CALL generate_candidates();

-- 9. Simulate an election (random voting + result calculation)
CALL simulate_election();

-- 10. Analyze results
SELECT * FROM ruling_party;
SELECT * FROM constituency_winners;
```
3. Analyze results using the provided views or your own queries.

## 🛡️ Data Integrity and Performance

- Foreign key constraints enforce relational consistency.
- Indexes improve performance for large datasets.
- ENUM fields standardize category values.
- Triggers automate vote count updates.

## 📄 Documentation

Refer to `Tamil_Nadu_Election_Database_Documentation.docx` for a complete breakdown of the schema.

## 📘 License

This project is intended for academic and simulation purposes.
