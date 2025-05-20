-- Tamil Nadu Election Simulation System
-- This script creates a comprehensive election database for Tamil Nadu state
-- with 234 constituencies, 10 wards per constituency, and realistic voting data

-- Drop database if exists and create new one
DROP DATABASE IF EXISTS tamil_nadu_election;
CREATE DATABASE tamil_nadu_election;
USE tamil_nadu_election;

-- Political Parties Table
-- Stores information about political parties contesting the election
CREATE TABLE political_parties (
    party_id INT AUTO_INCREMENT PRIMARY KEY,
    party_name VARCHAR(100) UNIQUE NOT NULL,
    symbol VARCHAR(50) NOT NULL,
    cm_candidate VARCHAR(100) NOT NULL
);

-- Insert real political parties of Tamil Nadu
INSERT INTO political_parties (party_name, symbol, cm_candidate) VALUES 
('DMK', 'Rising Sun', 'M.K. Stalin'),
('AIADMK', 'Two Leaves', 'Edappadi K. Palaniswami'),
('BJP', 'Lotus', 'Annamalai K'),
('Congress', 'Hand', 'K.S. Alagiri'),
('PMK', 'Mango', 'Anbumani Ramadoss'),
('DMDK', 'Drum', 'Vijayakanth'),
('VCK', 'Star', 'Thol. Thirumavalavan'),
('NTK', 'Tiger', 'Seeman'),
('MNM', 'Torch', 'Kamal Haasan'),
('AMMK', 'Pressure Cooker', 'TTV Dhinakaran'),
('TVK', 'Two Elephants', 'Vijay');

INSERT INTO political_parties (party_name, symbol, cm_candidate) VALUES 
('NOTA','none','none');

SELECT * FROM political_parties;

-- Constituencies Table
-- Represents the 234 assembly constituencies in Tamil Nadu
CREATE TABLE constituencies (
    constituency_id INT AUTO_INCREMENT PRIMARY KEY,
    constituency_name VARCHAR(100) UNIQUE NOT NULL,
    district VARCHAR(50) NOT NULL,
    reserved_category ENUM('GENERAL', 'SC', 'ST') DEFAULT 'GENERAL',
    registered_voters INT DEFAULT 0,
    total_polling_stations INT DEFAULT 0
);

SELECT * FROM constituencies ;

-- Insert all 234 Tamil Nadu constituencies
-- This will populate the constituencies table with actual Tamil Nadu assembly constituencies
-- Organized by district for better readability

-- Procedure to insert all constituencies
DELIMITER $$
CREATE PROCEDURE populate_constituencies()
BEGIN
    -- Chennai District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Thiruvottiyur', 'Chennai', 'GENERAL'),
    ('Dr. Radhakrishnan Nagar', 'Chennai', 'GENERAL'),
    ('Perambur', 'Chennai', 'GENERAL'),
    ('Kolathur', 'Chennai', 'GENERAL'),
    ('Villivakkam', 'Chennai', 'GENERAL'),
    ('Thiru Vi Ka Nagar', 'Chennai', 'SC'),
    ('Egmore', 'Chennai', 'SC'),
    ('Royapuram', 'Chennai', 'GENERAL'),
    ('Harbour', 'Chennai', 'GENERAL'),
    ('Chepauk-Thiruvallikeni', 'Chennai', 'GENERAL'),
    ('Thousand Lights', 'Chennai', 'GENERAL'),
    ('Anna Nagar', 'Chennai', 'GENERAL'),
    ('Virugampakkam', 'Chennai', 'GENERAL'),
    ('Saidapet', 'Chennai', 'GENERAL'),
    ('Thiruvanmiyur', 'Chennai', 'GENERAL'),
    ('Velachery', 'Chennai', 'GENERAL');

    -- Kancheepuram District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Chengalpattu', 'Kancheepuram', 'GENERAL'),
    ('Thiruporur', 'Kancheepuram', 'GENERAL'),
    ('Cheyyur', 'Kancheepuram', 'SC'),
    ('Madurantakam', 'Kancheepuram', 'SC'),
    ('Uthiramerur', 'Kancheepuram', 'GENERAL'),
    ('Kancheepuram', 'Kancheepuram', 'GENERAL');

    -- Tiruvallur District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Gummidipoondi', 'Tiruvallur', 'GENERAL'),
    ('Ponneri', 'Tiruvallur', 'SC'),
    ('Tiruttani', 'Tiruvallur', 'GENERAL'),
    ('Poonamallee', 'Tiruvallur', 'SC'),
    ('Avadi', 'Tiruvallur', 'GENERAL'),
    ('Maduravoyal', 'Tiruvallur', 'GENERAL'),
    ('Ambattur', 'Tiruvallur', 'GENERAL'),
    ('Madavaram', 'Tiruvallur', 'GENERAL'),
    ('Tiruvallur', 'Tiruvallur', 'GENERAL');
    
    -- Vellore District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Arakkonam', 'Vellore', 'GENERAL'),
    ('Sholingur', 'Vellore', 'GENERAL'),
    ('Katpadi', 'Vellore', 'GENERAL'),
    ('Vellore', 'Vellore', 'GENERAL'),
    ('Anaikattu', 'Vellore', 'GENERAL'),
    ('Kilvaithinankuppam', 'Vellore', 'SC'),
    ('Gudiyatham', 'Vellore', 'SC');
    
    -- Tiruvannamalai District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Vandavasi', 'Tiruvannamalai', 'SC'),
    ('Polur', 'Tiruvannamalai', 'GENERAL'),
    ('Arani', 'Tiruvannamalai', 'GENERAL'),
    ('Cheyyar', 'Tiruvannamalai', 'GENERAL'),
    ('Tiruvannamalai', 'Tiruvannamalai', 'GENERAL'),
    ('Kilpennathur', 'Tiruvannamalai', 'GENERAL');
    
    -- Villupuram District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Gingee', 'Villupuram', 'GENERAL'),
    ('Mailam', 'Villupuram', 'GENERAL'),
    ('Tindivanam', 'Villupuram', 'SC'),
    ('Vanur', 'Villupuram', 'SC'),
    ('Villupuram', 'Villupuram', 'GENERAL'),
    ('Vikravandi', 'Villupuram', 'GENERAL');
    
    -- Salem District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Gangavalli', 'Salem', 'SC'),
    ('Attur', 'Salem', 'GENERAL'),
    ('Yercaud', 'Salem', 'ST'),
    ('Omalur', 'Salem', 'GENERAL'),
    ('Mettur', 'Salem', 'GENERAL'),
    ('Edappadi', 'Salem', 'GENERAL'),
    ('Salem West', 'Salem', 'GENERAL'),
    ('Salem North', 'Salem', 'GENERAL'),
    ('Salem South', 'Salem', 'GENERAL'),
    ('Veerapandi', 'Salem', 'GENERAL');
    
    -- Namakkal District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Rasipuram', 'Namakkal', 'SC'),
    ('Senthamangalam', 'Namakkal', 'ST'),
    ('Namakkal', 'Namakkal', 'GENERAL'),
    ('Paramathi-Velur', 'Namakkal', 'GENERAL'),
    ('Tiruchengodu', 'Namakkal', 'GENERAL'),
    ('Kumarapalayam', 'Namakkal', 'GENERAL');
    
    -- Erode District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Erode East', 'Erode', 'GENERAL'),
    ('Erode West', 'Erode', 'GENERAL'),
    ('Modakkurichi', 'Erode', 'GENERAL'),
    ('Dharapuram', 'Erode', 'SC'),
    ('Kangayam', 'Erode', 'GENERAL'),
    ('Perundurai', 'Erode', 'GENERAL'),
    ('Bhavani', 'Erode', 'GENERAL'),
    ('Anthiyur', 'Erode', 'GENERAL');
    
    -- Nilgiris District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Udhagamandalam', 'Nilgiris', 'GENERAL'),
    ('Gudalur', 'Nilgiris', 'SC'),
    ('Coonoor', 'Nilgiris', 'GENERAL');
    
    -- Coimbatore District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Mettupalayam', 'Coimbatore', 'GENERAL'),
    ('Sulur', 'Coimbatore', 'GENERAL'),
    ('Kavundampalayam', 'Coimbatore', 'GENERAL'),
    ('Coimbatore North', 'Coimbatore', 'GENERAL'),
    ('Coimbatore South', 'Coimbatore', 'GENERAL'),
    ('Singanallur', 'Coimbatore', 'GENERAL'),
    ('Kinathukadavu', 'Coimbatore', 'GENERAL'),
    ('Pollachi', 'Coimbatore', 'GENERAL'),
    ('Valparai', 'Coimbatore', 'SC');
    
    -- Tiruppur District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Avinashi', 'Tiruppur', 'SC'),
    ('Tiruppur North', 'Tiruppur', 'GENERAL'),
    ('Tiruppur South', 'Tiruppur', 'GENERAL'),
    ('Palladam', 'Tiruppur', 'GENERAL'),
    ('Udumalaipettai', 'Tiruppur', 'GENERAL'),
    ('Madathukulam', 'Tiruppur', 'GENERAL');
    
    -- Dindigul District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Palani', 'Dindigul', 'GENERAL'),
    ('Oddanchatram', 'Dindigul', 'GENERAL'),
    ('Athoor', 'Dindigul', 'GENERAL'),
    ('Nilakkottai', 'Dindigul', 'SC'),
    ('Natham', 'Dindigul', 'GENERAL'),
    ('Dindigul', 'Dindigul', 'GENERAL'),
    ('Vedasandur', 'Dindigul', 'GENERAL');
    
    -- Karur District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Aravakurichi', 'Karur', 'GENERAL'),
    ('Karur', 'Karur', 'GENERAL'),
    ('Krishnarayapuram', 'Karur', 'SC'),
    ('Kulithalai', 'Karur', 'GENERAL');
    
    -- Tiruchirappalli District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Manapparai', 'Tiruchirappalli', 'GENERAL'),
    ('Srirangam', 'Tiruchirappalli', 'GENERAL'),
    ('Tiruchirappalli West', 'Tiruchirappalli', 'GENERAL'),
    ('Tiruchirappalli East', 'Tiruchirappalli', 'GENERAL'),
    ('Thiruverumbur', 'Tiruchirappalli', 'GENERAL'),
    ('Lalgudi', 'Tiruchirappalli', 'GENERAL'),
    ('Manachanallur', 'Tiruchirappalli', 'SC'),
    ('Musiri', 'Tiruchirappalli', 'GENERAL'),
    ('Thuraiyur', 'Tiruchirappalli', 'SC');
    
    -- Perambalur District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Perambalur', 'Perambalur', 'GENERAL'),
    ('Kunnam', 'Perambalur', 'GENERAL');
    
    -- Ariyalur District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Ariyalur', 'Ariyalur', 'GENERAL'),
    ('Jayankondam', 'Ariyalur', 'GENERAL');
    
    -- Cuddalore District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Tittakudi', 'Cuddalore', 'SC'),
    ('Vridhachalam', 'Cuddalore', 'GENERAL'),
    ('Neyveli', 'Cuddalore', 'GENERAL'),
    ('Panruti', 'Cuddalore', 'GENERAL'),
    ('Cuddalore', 'Cuddalore', 'GENERAL'),
    ('Kurinjipadi', 'Cuddalore', 'GENERAL'),
    ('Bhuvanagiri', 'Cuddalore', 'GENERAL'),
    ('Chidambaram', 'Cuddalore', 'GENERAL'),
    ('Kattumannarkoil', 'Cuddalore', 'SC');
    
    -- Thanjavur District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Papanasam', 'Thanjavur', 'GENERAL'),
    ('Thiruvaiyaru', 'Thanjavur', 'GENERAL'),
    ('Thanjavur', 'Thanjavur', 'GENERAL'),
    ('Orathanadu', 'Thanjavur', 'GENERAL'),
    ('Pattukkottai', 'Thanjavur', 'GENERAL'),
    ('Peravurani', 'Thanjavur', 'GENERAL');
    
    -- Thiruvarur District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Mannargudi', 'Thiruvarur', 'GENERAL'),
    ('Thiruvarur', 'Thiruvarur', 'GENERAL'),
    ('Nannilam', 'Thiruvarur', 'GENERAL'),
    ('Thiruvidaimarudur', 'Thiruvarur', 'SC');
    
    -- Nagapattinam District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Kilvelur', 'Nagapattinam', 'SC'),
    ('Nagapattinam', 'Nagapattinam', 'GENERAL'),
    ('Vedaranyam', 'Nagapattinam', 'GENERAL'),
    ('Thiruthuraipoondi', 'Nagapattinam', 'SC'),
    ('Mayiladuthurai', 'Nagapattinam', 'GENERAL'),
    ('Sirkazhi', 'Nagapattinam', 'SC');
    
    -- Pudukkottai District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Gandarvakottai', 'Pudukkottai', 'SC'),
    ('Viralimalai', 'Pudukkottai', 'GENERAL'),
    ('Pudukkottai', 'Pudukkottai', 'GENERAL'),
    ('Thirumayam', 'Pudukkottai', 'GENERAL'),
    ('Alangudi', 'Pudukkottai', 'GENERAL'),
    ('Aranthangi', 'Pudukkottai', 'GENERAL');
    
    -- Sivaganga District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Karaikudi', 'Sivaganga', 'GENERAL'),
    ('Tiruppattur', 'Sivaganga', 'GENERAL'),
    ('Sivaganga', 'Sivaganga', 'GENERAL'),
    ('Manamadurai', 'Sivaganga', 'SC');
    
    -- Madurai District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Melur', 'Madurai', 'GENERAL'),
    ('Madurai East', 'Madurai', 'GENERAL'),
    ('Madurai North', 'Madurai', 'GENERAL'),
    ('Madurai South', 'Madurai', 'GENERAL'),
    ('Madurai Central', 'Madurai', 'GENERAL'),
    ('Madurai West', 'Madurai', 'GENERAL'),
    ('Thiruparankundram', 'Madurai', 'GENERAL'),
    ('Tirumangalam', 'Madurai', 'GENERAL'),
    ('Usilampatti', 'Madurai', 'GENERAL'),
    ('Sholavandan', 'Madurai', 'GENERAL');
    
    -- Theni District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Andipatti', 'Theni', 'GENERAL'),
    ('Periyakulam', 'Theni', 'SC'),
    ('Bodinayakanur', 'Theni', 'GENERAL'),
    ('Cumbum', 'Theni', 'GENERAL');
    
    -- Virudhunagar District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Rajapalayam', 'Virudhunagar', 'GENERAL'),
    ('Srivilliputhur', 'Virudhunagar', 'SC'),
    ('Sattur', 'Virudhunagar', 'GENERAL'),
    ('Sivakasi', 'Virudhunagar', 'GENERAL'),
    ('Virudhunagar', 'Virudhunagar', 'GENERAL'),
    ('Aruppukkottai', 'Virudhunagar', 'GENERAL'),
    ('Tiruchuli', 'Virudhunagar', 'GENERAL');
    
    -- Ramanathapuram District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Paramakudi', 'Ramanathapuram', 'SC'),
    ('Tiruvadanai', 'Ramanathapuram', 'GENERAL'),
    ('Ramanathapuram', 'Ramanathapuram', 'GENERAL'),
    ('Mudhukulathur', 'Ramanathapuram', 'GENERAL');
    
    -- Thoothukudi District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Vilathikulam', 'Thoothukudi', 'GENERAL'),
    ('Thoothukudi', 'Thoothukudi', 'GENERAL'),
    ('Tiruchendur', 'Thoothukudi', 'GENERAL'),
    ('Srivaikuntam', 'Thoothukudi', 'GENERAL'),
    ('Ottapidaram', 'Thoothukudi', 'SC'),
    ('Kovilpatti', 'Thoothukudi', 'GENERAL');
    
    -- Tirunelveli District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Vasudevanallur', 'Tirunelveli', 'SC'),
    ('Nanguneri', 'Tirunelveli', 'GENERAL'),
    ('Radhapuram', 'Tirunelveli', 'GENERAL'),
    ('Tirunelveli', 'Tirunelveli', 'GENERAL'),
    ('Ambasamudram', 'Tirunelveli', 'GENERAL'),
    ('Palayamkottai', 'Tirunelveli', 'GENERAL'),
    ('Tenkasi', 'Tirunelveli', 'GENERAL'),
    ('Alangulam', 'Tirunelveli', 'GENERAL');
    
    -- Kanniyakumari District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Kanniyakumari', 'Kanniyakumari', 'GENERAL'),
    ('Nagercoil', 'Kanniyakumari', 'GENERAL'),
    ('Colachel', 'Kanniyakumari', 'GENERAL'),
    ('Padmanabhapuram', 'Kanniyakumari', 'GENERAL'),
    ('Vilavancode', 'Kanniyakumari', 'GENERAL'),
    ('Killiyoor', 'Kanniyakumari', 'GENERAL');
    
    -- Dharmapuri District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Palacode', 'Dharmapuri', 'GENERAL'),
    ('Pennagaram', 'Dharmapuri', 'GENERAL'),
    ('Dharmapuri', 'Dharmapuri', 'GENERAL'),
    ('Pappireddippatti', 'Dharmapuri', 'GENERAL'),
    ('Harur', 'Dharmapuri', 'SC');
    
    -- Krishnagiri District
    INSERT INTO constituencies (constituency_name, district, reserved_category) VALUES
    ('Uthangarai', 'Krishnagiri', 'SC'),
    ('Bargur', 'Krishnagiri', 'GENERAL'),
    ('Krishnagiri', 'Krishnagiri', 'GENERAL'),
    ('Veppanahalli', 'Krishnagiri', 'GENERAL'),
    ('Hosur', 'Krishnagiri', 'GENERAL'),
    ('Thalli', 'Krishnagiri', 'GENERAL');
    
    -- We'll update statistics for each constituency
    
    -- Update constituency statistics
    UPDATE constituencies 
    SET registered_voters = FLOOR(50000 + RAND() * 30000),
        total_polling_stations = FLOOR(100 + RAND() * 100);
END $$
DELIMITER ;

SET SQL_SAFE_UPDATES = 0;

DROP TABLE IF EXISTS constituencies; 
-- Call the procedure to populate constituencies
CALL populate_constituencies();


-- Wards Table
-- Each constituency has 10 wards
CREATE TABLE wards (
    ward_id INT AUTO_INCREMENT PRIMARY KEY,
    ward_number INT NOT NULL,
    ward_name VARCHAR(100) NOT NULL,
    constituency_id INT NOT NULL,
    registered_voters INT DEFAULT 0,
    FOREIGN KEY (constituency_id) REFERENCES constituencies(constituency_id),
    UNIQUE KEY (constituency_id, ward_number)
);

SELECT * FROM wards;

-- Create wards for all constituencies
DELIMITER $$
CREATE PROCEDURE create_wards()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE curr_constituency_id INT;
    DECLARE curr_constituency_name VARCHAR(100);
    DECLARE ward_count INT;
    DECLARE registered_voters_total INT;
    DECLARE ward_voters INT;
    
    -- Cursor to iterate through all constituencies
    DECLARE constituency_cursor CURSOR FOR 
        SELECT constituency_id, constituency_name, registered_voters 
        FROM constituencies;
    
    -- Continue handler for cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN constituency_cursor;
    
    constituency_loop: LOOP
        FETCH constituency_cursor INTO curr_constituency_id, curr_constituency_name, registered_voters_total;
        
        IF done THEN
            LEAVE constituency_loop;
        END IF;
        
        -- Create 10 wards for each constituency
        SET ward_count = 1;
        WHILE ward_count <= 10 DO
            -- Calculate registered voters for this ward (roughly equal distribution)
            SET ward_voters = FLOOR(registered_voters_total / 10 * (0.9 + RAND() * 0.2));
            
            -- Insert ward
            INSERT INTO wards (ward_number, ward_name, constituency_id, registered_voters)
            VALUES (
                ward_count, 
                CONCAT(curr_constituency_name, ' Ward ', ward_count),
                curr_constituency_id,
                ward_voters
            );
            
            SET ward_count = ward_count + 1;
        END WHILE;
    END LOOP;
    
    CLOSE constituency_cursor;
END $$
DELIMITER ;

-- Create wards for all constituencies
CALL create_wards();

-- Candidates Table
-- Stores information about candidates contesting in each constituency
CREATE TABLE candidates (
    candidate_id INT AUTO_INCREMENT PRIMARY KEY,
    candidate_name VARCHAR(100) NOT NULL,
    party_name VARCHAR(100) NOT NULL,
    constituency_id INT NOT NULL,
    age INT,
    gender ENUM('Male', 'Female', 'Other'),
    education VARCHAR(100),
    assets DECIMAL(12,2),
    criminal_cases INT DEFAULT 0,
    is_cm_candidate BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (constituency_id) REFERENCES constituencies(constituency_id),
    FOREIGN KEY (party_name) REFERENCES political_parties(party_name),
    UNIQUE KEY (party_name, constituency_id)
);

SELECT * FROM candidates;

-- Generate candidates for all constituencies and parties
DELIMITER $$

CREATE PROCEDURE generate_candidates()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE curr_party VARCHAR(100);
    DECLARE curr_cm VARCHAR(100);
    DECLARE curr_party_id INT;
    DECLARE total_constituencies INT;
    DECLARE cm_index INT;
    DECLARE idx INT DEFAULT 0;
    DECLARE curr_constituency_id INT;

    -- Cursor for political parties
    DECLARE party_cursor CURSOR FOR 
        SELECT party_id, party_name, cm_candidate FROM political_parties;

    -- Handler for cursor end
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Get total number of constituencies
    SELECT COUNT(*) INTO total_constituencies FROM constituencies;

    -- Open cursor
    OPEN party_cursor;

    party_loop: LOOP
        FETCH party_cursor INTO curr_party_id, curr_party, curr_cm;

        IF done THEN
            LEAVE party_loop;
        END IF;

        SET idx = 0;
        SET cm_index = FLOOR(RAND() * total_constituencies); -- Random CM position

        WHILE idx < total_constituencies DO

            -- Get constituency_id based on index
            SELECT constituency_id INTO curr_constituency_id
            FROM constituencies
            ORDER BY constituency_id
            LIMIT 1 OFFSET idx;

            IF idx = cm_index THEN
                -- Insert CM Candidate
                INSERT INTO candidates (
                    candidate_name, party_name, constituency_id, age, gender,
                    education, assets, criminal_cases, is_cm_candidate
                ) VALUES (
                    curr_cm,
                    curr_party,
                    curr_constituency_id,
                    FLOOR(45 + RAND() * 15),
                    ELT(FLOOR(1 + RAND() * 3), 'Male', 'Female', 'Other'),
                    ELT(FLOOR(1 + RAND() * 5), 'High School', 'Undergraduate', 'Graduate', 'Post Graduate', 'Doctorate'),
                    ROUND(1000000 + RAND() * 9000000, 2),
                    FLOOR(RAND() * 3),
                    TRUE
                );
            ELSE
                -- Insert Regular Candidate
                INSERT INTO candidates (
                    candidate_name, party_name, constituency_id, age, gender,
                    education, assets, criminal_cases, is_cm_candidate
                ) VALUES (
                    CONCAT(curr_party, '_Candidate_', curr_constituency_id),
                    curr_party,
                    curr_constituency_id,
                    FLOOR(30 + RAND() * 35),
                    ELT(FLOOR(1 + RAND() * 3), 'Male', 'Female', 'Other'),
                    ELT(FLOOR(1 + RAND() * 5), 'High School', 'Undergraduate', 'Graduate', 'Post Graduate', 'Doctorate'),
                    ROUND(50000 + RAND() * 5000000, 2),
                    FLOOR(RAND() * 2),
                    FALSE
                );
            END IF;

            SET idx = idx + 1;
        END WHILE;
    END LOOP;

    CLOSE party_cursor;
END $$

DELIMITER ;

-- Generate candidates for all constituencies
CALL generate_candidates();

-- Polls Table
-- Stores information about polling stations
CREATE TABLE polling_stations (
    polling_station_id INT AUTO_INCREMENT PRIMARY KEY,
    polling_station_name VARCHAR(100) NOT NULL,
    ward_id INT NOT NULL,
    location VARCHAR(100),
    registered_voters INT DEFAULT 0,
    FOREIGN KEY (ward_id) REFERENCES wards(ward_id)
);

SELECT * FROM polling_stations;
-- Create polling stations for each ward
DELIMITER $

-- Procedure to create polling stations for each ward
CREATE PROCEDURE create_polling_stations()
BEGIN
    -- Declare variables to hold data for each ward
    DECLARE done INT DEFAULT FALSE;
    DECLARE curr_ward_id INT;
    DECLARE curr_ward_name VARCHAR(100);
    DECLARE curr_ward_voters INT;
    DECLARE station_count INT;
    DECLARE voters_per_station INT;
    DECLARE i INT;

    -- Declare a cursor to iterate through each ward
    DECLARE ward_cursor CURSOR FOR 
        SELECT ward_id, ward_name, registered_voters 
        FROM wards;

    -- Define a handler to set 'done' to TRUE when the cursor reaches the end
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Open the ward cursor
    OPEN ward_cursor;

    -- Loop through each ward
    ward_loop: LOOP
        -- Fetch ward data into variables
        FETCH ward_cursor INTO curr_ward_id, curr_ward_name, curr_ward_voters;

        -- If all records are processed, exit the loop
        IF done THEN
            LEAVE ward_loop;
        END IF;

        -- Randomly decide the number of polling stations (between 3 to 7)
        SET station_count = 3 + FLOOR(RAND() * 5);

        -- Calculate average voters per station
        SET voters_per_station = FLOOR(curr_ward_voters / station_count);

        -- Initialize counter
        SET i = 1;

        -- Loop to insert polling stations for the current ward
        station_loop: WHILE i <= station_count DO
            INSERT INTO polling_stations (
                polling_station_name,     -- Name of the station
                ward_id,                  -- Associated ward
                location,                 -- Dummy location (e.g., "Location 1")
                registered_voters         -- Slightly varied voter count per station
            ) VALUES (
                CONCAT(curr_ward_name, ' Station ', i),
                curr_ward_id,
                CONCAT('Location ', i),
                FLOOR(voters_per_station * (0.9 + RAND() * 0.2)) -- Randomized 90–110% range
            );
            SET i = i + 1; -- Move to next station
        END WHILE;
    END LOOP;

    -- Close the ward cursor
    CLOSE ward_cursor;
END $
DELIMITER ;


-- Create polling stations
CALL create_polling_stations();

-- Voters Table
-- Stores information about registered voters
CREATE TABLE voters (
    voter_id VARCHAR(20) PRIMARY KEY,
    voter_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    address VARCHAR(200),
    constituency_id INT NOT NULL,
    ward_id INT NOT NULL,
    polling_station_id INT NOT NULL,
    has_voted BOOLEAN DEFAULT FALSE,
    voted_party VARCHAR(100) DEFAULT NULL,
    voted_timestamp DATETIME DEFAULT NULL,
    FOREIGN KEY (constituency_id) REFERENCES constituencies(constituency_id),
    FOREIGN KEY (ward_id) REFERENCES wards(ward_id),
    FOREIGN KEY (polling_station_id) REFERENCES polling_stations(polling_station_id)
);

-- Create index on voters table for faster lookup
CREATE INDEX idx_voter_constituency ON voters(constituency_id);
CREATE INDEX idx_voter_ward ON voters(ward_id);
CREATE INDEX idx_voter_polling_station ON voters(polling_station_id);
CREATE INDEX idx_voter_voted ON voters(has_voted);

-- Generate voters - we'll generate 1,00,000 voters in a batches of 10,000
DELIMITER $$

CREATE PROCEDURE generate_voters_batch(IN batch_size INT, IN start_index INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE curr_index INT;
    DECLARE curr_constituency_id INT;
    DECLARE curr_ward_id INT;
    DECLARE curr_polling_id INT;
    DECLARE total_constituencies INT;
    DECLARE total_wards_in_constituency INT;
    DECLARE total_stations_in_ward INT;
    DECLARE first_names VARCHAR(1000) DEFAULT 'Arun,Vijay,Surya,Karthik,Suresh,Kumar,Raja,Ravi,Prakash,Senthil,Anbu,Muthu,Kannan,Ramesh,Saravanan,Priya,Divya,Lakshmi,Meena,Saranya,Deepa,Kavitha,Sunitha,Anitha,Sangeetha,Uma,Radha,Geetha,Kala,Shanthi';
    DECLARE last_names VARCHAR(1000) DEFAULT 'Kumar,Murugan,Rajan,Nathan,Krishnan,Subramanian,Sundaram,Gopal,Sharma,Singh,Pillai,Naidu,Reddy,Iyer,Iyengar,Narayanan,Chandran,Patel,Nair,Devi,Dasan,Menon,Chettiar,Khatri,Pandian,Thangavel,Mani,Arumugam,Bose,Subramaniam';
    DECLARE random_first_name VARCHAR(50);
    DECLARE random_last_name VARCHAR(50);
    DECLARE voter_name VARCHAR(100);
    DECLARE has_voted_val BOOLEAN;
    DECLARE voted_party_val VARCHAR(100);
    DECLARE voted_timestamp_val DATETIME;
    DECLARE voted_percentage DECIMAL(5,2) DEFAULT 0.85;
    DECLARE election_date DATE DEFAULT '2025-04-06';

    -- Get total constituencies
    SELECT COUNT(*) INTO total_constituencies FROM constituencies;

    -- Start from the provided start_index
    WHILE i < batch_size DO
        SET curr_index = start_index + i + 1;

        -- Random constituency
        SET curr_constituency_id = FLOOR(1 + RAND() * total_constituencies);

        -- Random ward in that constituency
        SELECT ward_id INTO curr_ward_id
        FROM wards
        WHERE constituency_id = curr_constituency_id
        ORDER BY RAND()
        LIMIT 1;

        -- Random polling station in that ward
        SELECT polling_station_id INTO curr_polling_id
        FROM polling_stations
        WHERE ward_id = curr_ward_id
        ORDER BY RAND()
        LIMIT 1;

        -- Random names
        SET random_first_name = SUBSTRING_INDEX(SUBSTRING_INDEX(first_names, ',', FLOOR(1 + RAND() * 30)), ',', -1);
        SET random_last_name = SUBSTRING_INDEX(SUBSTRING_INDEX(last_names, ',', FLOOR(1 + RAND() * 30)), ',', -1);
        SET voter_name = CONCAT(random_first_name, ' ', random_last_name);

        -- Voted?
        SET has_voted_val = RAND() < voted_percentage;

        IF has_voted_val THEN
            SELECT party_name INTO voted_party_val
            FROM political_parties
            ORDER BY RAND()
            LIMIT 1;

            SET voted_timestamp_val = 
                TIMESTAMP(election_date) + 
                INTERVAL 7 HOUR + 
                INTERVAL FLOOR(RAND() * 11) HOUR + 
                INTERVAL FLOOR(RAND() * 60) MINUTE;
        ELSE
            SET voted_party_val = NULL;
            SET voted_timestamp_val = NULL;
        END IF;

        -- Insert voter
        INSERT INTO voters (
            voter_id,
            voter_name,
            age,
            gender,
            address,
            constituency_id,
            ward_id,
            polling_station_id,
            has_voted,
            voted_party,
            voted_timestamp
        ) VALUES (
            CONCAT('VOTER', LPAD(curr_index, 8, '0')),
            voter_name,
            FLOOR(18 + RAND() * 70),
            ELT(FLOOR(1 + RAND() * 3), 'Male', 'Female', 'Other'),
            CONCAT('Address ', curr_index),
            curr_constituency_id,
            curr_ward_id,
            curr_polling_id,
            has_voted_val,
            voted_party_val,
            voted_timestamp_val
        );

        SET i = i + 1;
    END WHILE;
END $$

DELIMITER ;


SELECT * FROM voters;
-- Generate 100,000 voters
CALL generate_voters_batch(10000, 0);     -- 1 to 10000
CALL generate_voters_batch(10000, 10000); -- 10001 to 20000
CALL generate_voters_batch(10000, 20000); -- and so on...
CALL generate_voters_batch(10000, 30000);   
CALL generate_voters_batch(10000, 40000); 
CALL generate_voters_batch(10000, 50000); 
CALL generate_voters_batch(10000, 60000); 
CALL generate_voters_batch(10000, 70000); 
CALL generate_voters_batch(10000, 80000); 
CALL generate_voters_batch(10000, 90000); -- 90001 to 100000


-- Election Results Table 
-- This will store summarized election results
-- First, let's reset everything to make sure we're starting fresh
SET SQL_SAFE_UPDATES = 0;

-- Reset simulation data
CALL reset_simulation();

-- Drop and recreate the election_results table with proper unique constraint
DROP TABLE IF EXISTS election_summary;
DROP TABLE IF EXISTS ward_results;
DROP TABLE IF EXISTS election_results;

-- Election Results Table 
CREATE TABLE election_results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    constituency_id INT NOT NULL,
    party_name VARCHAR(100) NOT NULL,
    votes_received INT DEFAULT 0,
    vote_percentage DECIMAL(5,2) DEFAULT 0.00,
    margin_of_victory INT DEFAULT 0,
    is_winner BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (constituency_id) REFERENCES constituencies(constituency_id),
    FOREIGN KEY (party_name) REFERENCES political_parties(party_name),
    UNIQUE KEY (constituency_id, party_name) -- Add unique constraint
);

SELECT * FROM election_results;

-- Ward-level Results Table
CREATE TABLE ward_results (
    ward_result_id INT AUTO_INCREMENT PRIMARY KEY,
    ward_id INT NOT NULL,
    party_name VARCHAR(100) NOT NULL,
    votes_received INT DEFAULT 0,
    vote_percentage DECIMAL(5,2) DEFAULT 0.00,
    FOREIGN KEY (ward_id) REFERENCES wards(ward_id),
    FOREIGN KEY (party_name) REFERENCES political_parties(party_name),
    UNIQUE KEY (ward_id, party_name) -- Add unique constraint
);

SELECT * FROM ward_results;

-- Final Election Summary Table
CREATE TABLE election_summary (
    party_name VARCHAR(100) PRIMARY KEY,
    total_votes INT DEFAULT 0,
    vote_percentage DECIMAL(5,2) DEFAULT 0.00,
    seats_won INT DEFAULT 0,
    seats_percentage DECIMAL(5,2) DEFAULT 0.00,
    FOREIGN KEY (party_name) REFERENCES political_parties(party_name)
);
SELECT * FROM election_summary;

-- Drop and recreate the trigger
DROP TRIGGER IF EXISTS after_voter_votes;

-- Create triggers to update election results automatically when votes are cast
-- Trigger to update vote counts when a voter votes
DELIMITER $$
CREATE TRIGGER after_voter_votes
AFTER UPDATE ON voters
FOR EACH ROW
BEGIN
    -- Only process if voter status changed from not voted to voted
    IF NEW.has_voted = TRUE AND (OLD.has_voted = FALSE OR OLD.has_voted IS NULL) THEN
        -- Update constituency-level results
        INSERT INTO election_results (constituency_id, party_name, votes_received)
        VALUES (NEW.constituency_id, NEW.voted_party, 1)
        ON DUPLICATE KEY UPDATE 
            votes_received = votes_received + 1;
            
        -- Update ward-level results
        INSERT INTO ward_results (ward_id, party_name, votes_received)
        VALUES (NEW.ward_id, NEW.voted_party, 1)
        ON DUPLICATE KEY UPDATE 
            votes_received = votes_received + 1;
            
        -- Update election summary
        INSERT INTO election_summary (party_name, total_votes, seats_won)
        VALUES (NEW.voted_party, 1, 0)
        ON DUPLICATE KEY UPDATE 
            total_votes = total_votes + 1;
    END IF;
END $$
DELIMITER ;

-- Drop and recreate the calculation procedure
DROP PROCEDURE IF EXISTS calculate_election_results;

-- Procedure to calculate percentages and winners
DELIMITER $$
CREATE PROCEDURE calculate_election_results()
BEGIN
    -- First reset all winners and seats
    UPDATE election_results SET is_winner = FALSE, margin_of_victory = 0;
    UPDATE election_summary SET seats_won = 0, seats_percentage = 0;
    
    -- Update vote percentages for constituency results
    UPDATE election_results er
    JOIN (
        SELECT 
            constituency_id, 
            SUM(votes_received) AS total_constituency_votes
        FROM election_results
        GROUP BY constituency_id
    ) AS totals ON er.constituency_id = totals.constituency_id
    SET er.vote_percentage = (er.votes_received / totals.total_constituency_votes) * 100
    WHERE totals.total_constituency_votes > 0;
    
    -- Update vote percentages for ward results
    UPDATE ward_results wr
    JOIN (
        SELECT 
            ward_id, 
            SUM(votes_received) AS total_ward_votes
        FROM ward_results
        GROUP BY ward_id
    ) AS totals ON wr.ward_id = totals.ward_id
    SET wr.vote_percentage = (wr.votes_received / totals.total_ward_votes) * 100
    WHERE totals.total_ward_votes > 0;
    
    -- Calculate total votes cast across all parties
    SET @total_votes = (SELECT SUM(total_votes) FROM election_summary);
    
    -- Update overall vote percentages
    UPDATE election_summary
    SET vote_percentage = (total_votes / @total_votes) * 100
    WHERE @total_votes > 0;
    
    -- Find and mark winners for each constituency
    UPDATE election_results er
    JOIN (
        SELECT constituency_id, MAX(votes_received) AS max_votes
        FROM election_results
        GROUP BY constituency_id
    ) AS winners ON er.constituency_id = winners.constituency_id AND er.votes_received = winners.max_votes
    SET er.is_winner = TRUE;
    
    -- Calculate margins of victory
    UPDATE election_results er1
    JOIN (
        SELECT er.constituency_id, er.party_name, er.votes_received,
               (SELECT MAX(votes_received) FROM election_results 
                WHERE constituency_id = er.constituency_id AND party_name != er.party_name) AS second_highest
        FROM election_results er
        WHERE er.is_winner = TRUE
    ) AS margins ON er1.constituency_id = margins.constituency_id AND er1.party_name = margins.party_name
    SET er1.margin_of_victory = er1.votes_received - IFNULL(margins.second_highest, 0);
    
    -- Update seats won in summary
    UPDATE election_summary es
    SET es.seats_won = (
        SELECT COUNT(*) 
        FROM election_results er 
        WHERE er.is_winner = TRUE AND er.party_name = es.party_name
    );
    
    -- Update seats percentage
    SET @total_constituencies = (SELECT COUNT(*) FROM constituencies);
    
    UPDATE election_summary
    SET seats_percentage = (seats_won / @total_constituencies) * 100
    WHERE @total_constituencies > 0;
END $$
DELIMITER ;

-- Drop and recreate the simulation procedure
DROP PROCEDURE IF EXISTS simulate_election;

-- Improved election simulation procedure
DELIMITER $$

CREATE PROCEDURE simulate_election()
BEGIN
    DECLARE vote_limit INT;
    DECLARE party_count INT;

    -- Reset result tables
    TRUNCATE TABLE election_results;
    TRUNCATE TABLE ward_results;
    TRUNCATE TABLE election_summary;

    -- Reset voters
    UPDATE voters
    SET has_voted = FALSE, 
        voted_party = NULL, 
        voted_timestamp = NULL;

    -- Count political parties
    SELECT COUNT(*) INTO party_count FROM political_parties;
    IF party_count = 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'No political parties found';
    END IF;

    -- Calculate vote limit (85% turnout)
    SET vote_limit = FLOOR(0.85 * (SELECT COUNT(*) FROM voters));

    -- Create temporary table with voter_id, random party offset, and timestamp
    DROP TEMPORARY TABLE IF EXISTS temp_voters;
    CREATE TEMPORARY TABLE temp_voters AS
    SELECT 
        voter_id,
        FLOOR(RAND() * party_count) AS party_offset,
        TIMESTAMP('2025-04-06 08:00:00') + INTERVAL FLOOR(RAND() * 36000) SECOND AS voted_timestamp
    FROM voters
    ORDER BY RAND()
    LIMIT vote_limit;

    -- Add column to hold party name
    ALTER TABLE temp_voters ADD voted_party VARCHAR(100);

    -- Initialize row number for mapping party offsets
    SET @rownum := 0;

    -- Update temp_voters with random party using offset
    UPDATE temp_voters tv
    JOIN (
        SELECT party_name, @rownum := @rownum + 1 AS rownum
        FROM political_parties
    ) AS parties
    ON tv.party_offset = parties.rownum - 1
    SET tv.voted_party = parties.party_name;

    -- Update main voters table
    UPDATE voters v
    JOIN temp_voters tv ON v.voter_id = tv.voter_id
    SET 
        v.has_voted = TRUE,
        v.voted_party = tv.voted_party,
        v.voted_timestamp = tv.voted_timestamp;

    -- Final calculation
    CALL calculate_election_results();

    SELECT 'Election simulation completed successfully' AS Status;
END$$

DELIMITER ;




-- Procedure to reset data for fresh simulation
DROP PROCEDURE IF EXISTS reset_simulation;

DELIMITER $$
CREATE PROCEDURE reset_simulation()
BEGIN
    -- Reset voter data
    UPDATE voters SET has_voted = FALSE, voted_party = NULL, voted_timestamp = NULL;
    
    -- Reset results
    TRUNCATE TABLE election_results;
    TRUNCATE TABLE ward_results;
    TRUNCATE TABLE election_summary;
    
    SELECT 'Simulation reset successfully' AS Status;
END $$
DELIMITER ;

CALL reset_simulation();

-- Run the simulation
CALL simulate_election();

-- Sample queries to analyze election results

-- 1. Find the winning party and CM
SELECT 
    party_name,
    seats_won AS constituencies_won,
    seats_percentage,
    total_votes,
    vote_percentage,
    CASE 
        WHEN seats_won > (SELECT COUNT(*) FROM constituencies)/2 THEN 'Majority'
        ELSE 'Minority'
    END AS government_type,
    (SELECT cm_candidate FROM political_parties WHERE party_name = es.party_name) AS chief_minister_candidate
FROM 
    election_summary es
ORDER BY 
    seats_won DESC, vote_percentage DESC
LIMIT 1;

-- 2. List all constituencies and their winners
SELECT 
    c.constituency_name,
    c.district,
    er.party_name,
    er.votes_received,
    er.vote_percentage,
    er.margin_of_victory,
    (SELECT candidate_name FROM candidates WHERE constituency_id = c.constituency_id AND party_name = er.party_name) AS winning_candidate,
    (SELECT is_cm_candidate FROM candidates WHERE constituency_id = c.constituency_id AND party_name = er.party_name) AS is_cm_candidate
FROM 
    election_results er
JOIN 
    constituencies c ON er.constituency_id = c.constituency_id
WHERE 
    er.is_winner = TRUE
ORDER BY 
    c.district, c.constituency_name;

-- 3. Party-wise vote share analysis
SELECT 
    party_name, 
    total_votes, 
    vote_percentage, 
    seats_won, 
    seats_percentage
FROM 
    election_summary
ORDER BY 
    seats_won DESC, vote_percentage DESC;

-- 4. District-wise party performance
SELECT 
    c.district,
    er.party_name,
    COUNT(*) AS seats_won,
    SUM(er.votes_received) AS total_votes
FROM 
    election_results er
JOIN 
    constituencies c ON er.constituency_id = c.constituency_id  
WHERE 
    er.is_winner = TRUE
GROUP BY 
    c.district, er.party_name
ORDER BY 
    c.district, seats_won DESC; 

-- 5. Close contests (margin less than 1000 votes)
SELECT 
    c.constituency_name,
    c.district,
    er.party_name AS winner,
    er.votes_received,
    er.margin_of_victory,
    (SELECT candidate_name FROM candidates WHERE constituency_id = c.constituency_id AND party_name = er.party_name) AS winning_candidate
FROM 
    election_results er
JOIN 
    constituencies c ON er.constituency_id = c.constituency_id
WHERE 
    er.is_winner = TRUE AND er.margin_of_victory < 1000
ORDER BY 
    er.margin_of_victory;

-- 6. Hourly voting pattern analysis
SELECT 
    HOUR(voted_timestamp) AS hour_of_day,
    COUNT(*) AS votes_cast
FROM 
    voters 
WHERE 
    has_voted = TRUE
GROUP BY 
    HOUR(voted_timestamp)
ORDER BY 
    hour_of_day;

-- 7. Gender-wise voting pattern
SELECT 
    v.gender,
    v.voted_party,
    COUNT(*) AS number_of_votes,
    ROUND(COUNT(*) * 100.0 / (
        SELECT COUNT(*) 
        FROM voters 
        WHERE gender = v.gender AND has_voted = TRUE
    ), 2) AS percentage
FROM 
    voters v
WHERE 
    v.has_voted = TRUE
GROUP BY 
    v.gender, v.voted_party
ORDER BY 
    v.gender, number_of_votes DESC;

-- 8. Age group voting preferences
SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 50 THEN '36-50'
        WHEN age BETWEEN 51 AND 65 THEN '51-65'
        ELSE 'Above 65'
    END AS age_group,
    voted_party,
    COUNT(*) AS votes
FROM 
    voters
WHERE 
    has_voted = TRUE
GROUP BY 
    age_group, voted_party
ORDER BY 
    age_group, votes DESC;
 
 
 -- Display all tables and views in the election simulation system

-- 1. Display election results table
SELECT * FROM election_results ORDER BY constituency_id, votes_received DESC;

-- 2. Display ward results table
SELECT * FROM ward_results ORDER BY ward_id, votes_received DESC;

-- 3. Display election summary table
SELECT * FROM election_summary ORDER BY seats_won DESC, vote_percentage DESC;

-- 4. Display constituencies table
SELECT * FROM constituencies ORDER BY district, constituency_name;

-- 5. Display wards table
SELECT * FROM wards ORDER BY constituency_id, ward_name;

-- 6. Display political parties table
SELECT * FROM political_parties ORDER BY party_name;

-- 7. Display candidates table
SELECT * FROM candidates ORDER BY constituency_id, party_name;

-- 8. Display voters table (limited to 10 rows for sample)
SELECT * FROM voters LIMIT 10;

-- 9. Display constituency winners view
SELECT * FROM constituency_winners ORDER BY district, constituency_name;

-- 10. Display ruling party view
SELECT * FROM ruling_party;

-- 11. Display voter demographics view
SELECT * FROM voter_demographics ORDER BY voter_turnout DESC;

-- 12. Count of votes by party
SELECT 
    party_name, 
    COUNT(*) AS number_of_votes,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM voters WHERE has_voted = TRUE), 2) AS vote_percentage
FROM voters
WHERE has_voted = TRUE
GROUP BY party_name
ORDER BY number_of_votes DESC;

-- 13. Constituency-wise voter turnout
SELECT
    c.constituency_name,
    c.district,
    COUNT(v.voter_id) AS registered_voters,
    SUM(CASE WHEN v.has_voted = TRUE THEN 1 ELSE 0 END) AS votes_cast,
    ROUND((SUM(CASE WHEN v.has_voted = TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(v.voter_id)), 2) AS turnout_percentage
FROM
    constituencies c
JOIN
    voters v ON c.constituency_id = v.constituency_id
GROUP BY
    c.constituency_id, c.constituency_name, c.district
ORDER BY
    turnout_percentage DESC;

-- 14. Party performances in close contests
SELECT
    c.constituency_name,
    c.district,
    er.party_name,
    er.votes_received,
    er.vote_percentage,
    er.is_winner,
    er.margin_of_victory
FROM
    election_results er
JOIN
    constituencies c ON er.constituency_id = c.constituency_id
JOIN (
    SELECT constituency_id
    FROM election_results
    WHERE is_winner = TRUE AND margin_of_victory < 2000
) close_races ON close_races.constituency_id = er.constituency_id
ORDER BY
    c.constituency_name, er.votes_received DESC;

-- 15. District-wise ruling party
SELECT
    c.district,
    pp.party_name,
    COUNT(*) AS constituencies_won,
    (SELECT COUNT(*) FROM constituencies WHERE district = c.district) AS total_constituencies,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM constituencies WHERE district = c.district), 2) AS win_percentage
FROM
    election_results er
JOIN
    constituencies c ON er.constituency_id = c.constituency_id
JOIN
    political_parties pp ON er.party_name = pp.party_name
WHERE
    er.is_winner = TRUE
GROUP BY
    c.district, pp.party_name
ORDER BY
    c.district, constituencies_won DESC;

-- 16. Chief Minister candidate performance
SELECT
    c.constituency_name,
    c.district,
    can.candidate_name,
    pp.party_name,
    pp.cm_candidate,
    er.votes_received,
    er.vote_percentage,
    er.is_winner
FROM
    candidates can
JOIN
    political_parties pp ON can.party_name = pp.party_name AND pp.cm_candidate = can.candidate_name
JOIN
    constituencies c ON can.constituency_id = c.constituency_id
JOIN
    election_results er ON er.constituency_id = c.constituency_id AND er.party_name = pp.party_name
ORDER BY
    er.votes_received DESC;

-- 17. Voting time patterns by district
SELECT
    c.district,
    HOUR(v.voted_timestamp) AS hour_of_day,
    COUNT(*) AS votes_cast
FROM
    voters v
JOIN
    constituencies c ON v.constituency_id = c.constituency_id
WHERE
    v.has_voted = TRUE
GROUP BY
    c.district, HOUR(v.voted_timestamp)
ORDER BY
    c.district, hour_of_day;

-- 18. Women voter participation by constituency
SELECT
    c.constituency_name,
    c.district,
    COUNT(CASE WHEN v.gender = 'Female' THEN 1 END) AS registered_women,
    SUM(CASE WHEN v.gender = 'Female' AND v.has_voted = TRUE THEN 1 ELSE 0 END) AS women_votes_cast,
    ROUND((SUM(CASE WHEN v.gender = 'Female' AND v.has_voted = TRUE THEN 1 ELSE 0 END) * 100.0 / 
           COUNT(CASE WHEN v.gender = 'Female' THEN 1 END)), 2) AS women_turnout_percentage
FROM
    constituencies c
JOIN
    voters v ON c.constituency_id = v.constituency_id
GROUP BY
    c.constituency_id, c.constituency_name, c.district
ORDER BY
    women_turnout_percentage DESC;

-- 19. Results from constituencies with high voter turnout
SELECT
    c.constituency_name,
    c.district,
    er.party_name,
    er.votes_received,
    er.vote_percentage,
    er.is_winner,
    vt.turnout_percentage
FROM
    election_results er
JOIN
    constituencies c ON er.constituency_id = c.constituency_id
JOIN (
    SELECT
        v.constituency_id,
        ROUND((SUM(CASE WHEN v.has_voted = TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(v.voter_id)), 2) AS turnout_percentage
    FROM
        voters v
    GROUP BY
        v.constituency_id
    HAVING
        turnout_percentage > 90
) vt ON vt.constituency_id = c.constituency_id
ORDER BY
    vt.turnout_percentage DESC, c.constituency_name, er.votes_received DESC;

-- 20. Summary of election results
SELECT
    (SELECT COUNT(*) FROM constituencies) AS total_constituencies,
    (SELECT COUNT(*) FROM voters) AS total_registered_voters,
    (SELECT COUNT(*) FROM voters WHERE has_voted = TRUE) AS total_votes_cast,
    ROUND((SELECT COUNT(*) FROM voters WHERE has_voted = TRUE) * 100.0 / (SELECT COUNT(*) FROM voters), 2) AS overall_turnout,
    (SELECT party_name FROM ruling_party) AS ruling_party,
    (SELECT chief_minister FROM ruling_party) AS chief_minister,
    (SELECT seats_won FROM ruling_party) AS seats_won,
    (SELECT 
        CASE WHEN seats_won > (SELECT COUNT(*) FROM constituencies)/2 THEN 'Majority' ELSE 'Minority' END 
     FROM ruling_party) AS government_type;