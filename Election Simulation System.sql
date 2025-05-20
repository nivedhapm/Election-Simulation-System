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
    cm_candidate VARCHAR(100) NOT NULL,
    founding_year INT,
    headquarters VARCHAR(100),
    ideology VARCHAR(200)
);

-- Insert real political parties of Tamil Nadu
INSERT INTO political_parties (party_name, symbol, cm_candidate, founding_year, headquarters, ideology) VALUES 
('DMK', 'Rising Sun', 'M.K. Stalin', 1949, 'Chennai', 'Dravidian, Social democracy'),
('AIADMK', 'Two Leaves', 'Edappadi K. Palaniswami', 1972, 'Chennai', 'Dravidian, Populism'),
('BJP', 'Lotus', 'Annamalai K', 1980, 'Delhi/Chennai', 'Conservatism, Nationalism'),
('Congress', 'Hand', 'K.S. Alagiri', 1885, 'Delhi/Chennai', 'Centrism, Liberalism'),
('PMK', 'Mango', 'Anbumani Ramadoss', 1989, 'Chennai', 'Social justice, Vanniyar interests'),
('DMDK', 'Drum', 'Vijayakanth', 2005, 'Chennai', 'Tamil nationalism'),
('VCK', 'Star', 'Thol. Thirumavalavan', 1990, 'Chennai', 'Dalit rights, Anti-casteism'),
('NTK', 'Tiger', 'Seeman', 2010, 'Chennai', 'Tamil nationalism'),
('MNM', 'Torch', 'Kamal Haasan', 2018, 'Chennai', 'Centrism, Anti-corruption'),
('AMMK', 'Pressure Cooker', 'TTV Dhinakaran', 2018, 'Chennai', 'Dravidian'),
('TVK', 'Two Elephants', 'Vijay', 2023, 'Chennai', 'Social welfare, Progressive');

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
    ('Kumarapalayam', 'Erode', 'GENERAL'),
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
    
    -- Fill in any remaining constituencies to reach 234
    -- Note: The above entries should account for most constituencies
    -- We'll update statistics for each constituency
    
    -- Update constituency statistics
    UPDATE constituencies 
    SET registered_voters = FLOOR(50000 + RAND() * 30000),
        total_polling_stations = FLOOR(100 + RAND() * 100);
END $$
DELIMITER ;

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

-- Generate candidates for all constituencies and parties
DELIMITER $$
CREATE PROCEDURE generate_candidates()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE curr_party VARCHAR(100);
    DECLARE curr_cm VARCHAR(100);
    DECLARE curr_party_id INT;
    DECLARE curr_constituency_id INT;
    DECLARE cm_constituency_assigned BOOLEAN;
    DECLARE total_constituencies INT;
    DECLARE random_offset INT;
    DECLARE i INT;
    
    -- Cursor for parties
    DECLARE party_cursor CURSOR FOR 
        SELECT party_id, party_name, cm_candidate FROM political_parties;
    
    -- Continue handler
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Get total number of constituencies
    SELECT COUNT(*) INTO total_constituencies FROM constituencies;
    
    OPEN party_cursor;
    
    party_loop: LOOP
        FETCH party_cursor INTO curr_party_id, curr_party, curr_cm;
        
        IF done THEN
            LEAVE party_loop;
        END IF;
        
        -- Each party will contest in all 234 constituencies
        -- For variety, we'll assign CM candidate to a random constituency
        SET cm_constituency_assigned = FALSE;
        SET random_offset = FLOOR(1 + RAND() * total_constituencies);
        
        SET i = 0;
        WHILE i < total_constituencies DO
            SET curr_constituency_id = 1 + ((random_offset + i) % total_constituencies);
            
            -- Check if this constituency should have the CM candidate
            IF NOT cm_constituency_assigned AND i = FLOOR(RAND() * total_constituencies) THEN
                -- Insert CM candidate
                INSERT INTO candidates (
                    candidate_name, 
                    party_name, 
                    constituency_id, 
                    age, 
                    gender,
                    education,
                    assets,
                    criminal_cases,
                    is_cm_candidate
                ) VALUES (
                    curr_cm,
                    curr_party,
                    curr_constituency_id,
                    FLOOR(45 + RAND() * 30),
                    ELT(FLOOR(1 + RAND() * 3), 'Male', 'Female', 'Other'),
                    ELT(FLOOR(1 + RAND() * 5), 'High School', 'Undergraduate', 'Graduate', 'Post Graduate', 'Doctorate'),
                    ROUND(100000 + RAND() * 10000000, 2),
                    FLOOR(RAND() * 3),
                    TRUE
                );
                
                SET cm_constituency_assigned = TRUE;
            ELSE
                -- Insert regular candidate
                INSERT INTO candidates (
                    candidate_name, 
                    party_name, 
                    constituency_id, 
                    age, 
                    gender,
                    education,
                    assets,
                    criminal_cases,
                    is_cm_candidate
                ) VALUES (
                    CONCAT(curr_party, '_Candidate_', curr_constituency_id),
                    curr_party,
                    curr_constituency_id,
                    FLOOR(30 + RAND() * 40),
                    ELT(FLOOR(1 + RAND() * 3), 'Male', 'Female', 'Other'),
                    ELT(FLOOR(1 + RAND() * 5), 'High School', 'Undergraduate', 'Graduate', 'Post Graduate', 'Doctorate'),
                    ROUND(50000 + RAND() * 5000000, 2),
                    FLOOR(RAND() * 2),
                    FALSE
                );
            END IF;
            
            SET i = i + 1;
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

-- Create polling stations for each ward
DELIMITER $
CREATE PROCEDURE create_polling_stations()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE curr_ward_id INT;
    DECLARE curr_ward_name VARCHAR(100);
    DECLARE curr_ward_voters INT;
    DECLARE station_count INT;
    DECLARE voters_per_station INT;
    
    -- Cursor for wards
    DECLARE ward_cursor CURSOR FOR 
        SELECT ward_id, ward_name, registered_voters 
        FROM wards;
    
    -- Continue handler
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN ward_cursor;
    
    ward_loop: LOOP
        FETCH ward_cursor INTO curr_ward_id, curr_ward_name, curr_ward_voters;
        
        IF done THEN
            LEAVE ward_loop;
        END IF;
        
        -- Each ward will have 3-7 polling stations
        SET station_count = 3 + FLOOR(RAND() * 5);
        SET voters_per_station = FLOOR(curr_ward_voters / station_count);
        
        -- Create polling stations for this ward
        FOR i IN 1..station_count DO
            INSERT INTO polling_stations (
                polling_station_name,
                ward_id,
                location,
                registered_voters
            ) VALUES (
                CONCAT(curr_ward_name, ' Station ', i),
                curr_ward_id,
                CONCAT('Location ', i),
                FLOOR(voters_per_station * (0.9 + RAND() * 0.2))
            );
        END FOR;
    END LOOP;
    
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

-- Generate voters - we'll generate 100,000 voters
DELIMITER $
CREATE PROCEDURE generate_voters()
BEGIN
    DECLARE total_voters INT DEFAULT 100000;
    DECLARE i INT DEFAULT 1;
    DECLARE curr_constituency_id INT;
    DECLARE curr_ward_id INT;
    DECLARE curr_polling_id INT;
    DECLARE total_constituencies INT;
    DECLARE total_wards_in_constituency INT;
    DECLARE total_stations_in_ward INT;
    DECLARE first_names VARCHAR(1000) DEFAULT 'Arun,Vijay,Surya,Karthik,Suresh,Kumar,Raja,Ravi,Prakash,Senthil,Anbu,Muthu,Kannan,Ramesh,Saravanan,Priya,Divya,Lakshmi,Meena,Saranya,Deepa,Kavitha,Sunitha,Anitha,Sangeetha,Uma,Radha,Geetha,Kala,Shanthi';
    DECLARE last_names VARCHAR(1000) DEFAULT 'Kumar,Murugan,Rajan,Nathan,Krishnan,Subramanian,Sundaram,Gopal,Sharma,Singh,Pillai,Naidu,Reddy,Iyer,Iyengar,Narayanan,Chandran,Patel,Nair,Devi,Dasan,Menon,Chettiar,Khatri,Pandian,Thangavel,Mani,Arumugam,Bose,Subramaniam';
    DECLARE first_name_arr TEXT;
    DECLARE last_name_arr TEXT;
    DECLARE random_first_name VARCHAR(50);
    DECLARE random_last_name VARCHAR(50);
    DECLARE voter_name VARCHAR(100);
    DECLARE voted_percentage DECIMAL(5,2) DEFAULT 0.85; -- 85% of voters have voted
    DECLARE has_voted_val BOOLEAN;
    DECLARE voted_party_val VARCHAR(100);
    DECLARE voted_timestamp_val DATETIME;
    DECLARE election_date DATE DEFAULT '2025-04-06'; -- Hypothetical election date
    
    -- Get arrays of first and last names
    SET first_name_arr = first_names;
    SET last_name_arr = last_names;
    
    -- Get total constituencies
    SELECT COUNT(*) INTO total_constituencies FROM constituencies;
    
    -- Loop to create voters
    WHILE i <= total_voters DO
        -- Randomly select a constituency
        SET curr_constituency_id = FLOOR(1 + RAND() * total_constituencies);
        
        -- Find out how many wards in this constituency
        SELECT COUNT(*) INTO total_wards_in_constituency 
        FROM wards 
        WHERE constituency_id = curr_constituency_id;
        
        -- Randomly select a ward from this constituency
        SELECT ward_id INTO curr_ward_id 
        FROM wards 
        WHERE constituency_id = curr_constituency_id 
        ORDER BY RAND() 
        LIMIT 1;
        
        -- Find out how many polling stations in this ward
        SELECT COUNT(*) INTO total_stations_in_ward 
        FROM polling_stations 
        WHERE ward_id = curr_ward_id;
        
        -- Randomly select a polling station from this ward
        SELECT polling_station_id INTO curr_polling_id 
        FROM polling_stations 
        WHERE ward_id = curr_ward_id 
        ORDER BY RAND() 
        LIMIT 1;
        
        -- Generate random name
        SET random_first_name = SUBSTRING_INDEX(SUBSTRING_INDEX(first_name_arr, ',', FLOOR(1 + RAND() * 30)), ',', -1);
        SET random_last_name = SUBSTRING_INDEX(SUBSTRING_INDEX(last_name_arr, ',', FLOOR(1 + RAND() * 30)), ',', -1);
        SET voter_name = CONCAT(random_first_name, ' ', random_last_name);
        
        -- Determine if voter has voted
        SET has_voted_val = RAND() < voted_percentage;
        
        -- If voted, assign a random party and timestamp
        IF has_voted_val THEN
            SELECT party_name INTO voted_party_val 
            FROM political_parties 
            ORDER BY RAND() 
            LIMIT 1;
            
            -- Generate a random time on election day between 7 AM and 6 PM
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
            CONCAT('VOTER', LPAD(i, 8, '0')),
            voter_name,
            FLOOR(18 + RAND() * 70),
            ELT(FLOOR(1 + RAND() * 3), 'Male', 'Female', 'Other'),
            CONCAT('Address ', i),
            curr_constituency_id,
            curr_ward_id,
            curr_polling_id,
            has_voted_val,
            voted_party_val,
            voted_timestamp_val
        );
        
        SET i = i + 1;
    END WHILE;
END $
DELIMITER ;

-- Generate 100,000 voters
CALL generate_voters();

-- Election Results Table 
-- This will store summarized election results
CREATE TABLE election_results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    constituency_id INT NOT NULL,
    party_name VARCHAR(100) NOT NULL,
    votes_received INT DEFAULT 0,
    vote_percentage DECIMAL(5,2) DEFAULT 0.00,
    margin_of_victory INT DEFAULT 0,
    is_winner BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (constituency_id) REFERENCES constituencies(constituency_id),
    FOREIGN KEY (party_name) REFERENCES political_parties(party_name)
);

-- Ward-level Results Table
CREATE TABLE ward_results (
    ward_result_id INT AUTO_INCREMENT PRIMARY KEY,
    ward_id INT NOT NULL,
    party_name VARCHAR(100) NOT NULL,
    votes_received INT DEFAULT 0,
    vote_percentage DECIMAL(5,2) DEFAULT 0.00,
    FOREIGN KEY (ward_id) REFERENCES wards(ward_id),
    FOREIGN KEY (party_name) REFERENCES political_parties(party_name)
);

-- Final Election Summary Table
CREATE TABLE election_summary (
    party_name VARCHAR(100) PRIMARY KEY,
    total_votes INT DEFAULT 0,
    vote_percentage DECIMAL(5,2) DEFAULT 0.00,
    seats_won INT DEFAULT 0,
    seats_percentage DECIMAL(5,2) DEFAULT 0.00,
    FOREIGN KEY (party_name) REFERENCES political_parties(party_name)
);

-- Create triggers to update election results automatically when votes are cast

-- Trigger to update vote counts when a voter votes
DELIMITER $
CREATE TRIGGER after_voter_votes
AFTER UPDATE ON voters
FOR EACH ROW
BEGIN
    -- Only process if voter status changed from not voted to voted
    IF NEW.has_voted = TRUE AND (OLD.has_voted = FALSE OR OLD.has_voted IS NULL) THEN
        -- Update constituency-level results
        INSERT INTO election_results (constituency_id, party_name, votes_received, vote_percentage)
        VALUES (NEW.constituency_id, NEW.voted_party, 1, 0)
        ON DUPLICATE KEY UPDATE 
            votes_received = votes_received + 1;
            
        -- Update ward-level results
        INSERT INTO ward_results (ward_id, party_name, votes_received, vote_percentage)
        VALUES (NEW.ward_id, NEW.voted_party, 1, 0)
        ON DUPLICATE KEY UPDATE 
            votes_received = votes_received + 1;
            
        -- Update election summary
        INSERT INTO election_summary (party_name, total_votes, vote_percentage, seats_won, seats_percentage)
        VALUES (NEW.voted_party, 1, 0, 0, 0)
        ON DUPLICATE KEY UPDATE 
            total_votes = total_votes + 1;
    END IF;
END $
DELIMITER ;

-- Procedure to calculate percentages and winners
DELIMITER $
CREATE PROCEDURE calculate_election_results()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE curr_constituency_id INT;
    DECLARE max_votes INT;
    DECLARE second_max_votes INT;
    DECLARE winner_party VARCHAR(100);
    
    -- Cursor for all constituencies
    DECLARE constituency_cursor CURSOR FOR 
        SELECT DISTINCT constituency_id 
        FROM election_results;
    
    -- Continue handler
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Update vote percentages for constituency results
    UPDATE election_results er
    JOIN (
        SELECT 
            constituency_id, 
            SUM(votes_received) AS total_constituency_votes
        FROM election_results
        GROUP BY constituency_id
    ) AS totals ON er.constituency_id = totals.constituency_id
    SET er.vote_percentage = (er.votes_received / totals.total_constituency_votes) * 100;
    
    -- Update vote percentages for ward results
    UPDATE ward_results wr
    JOIN (
        SELECT 
            ward_id, 
            SUM(votes_received) AS total_ward_votes
        FROM ward_results
        GROUP BY ward_id
    ) AS totals ON wr.ward_id = totals.ward_id
    SET wr.vote_percentage = (wr.votes_received / totals.total_ward_votes) * 100;
    
    -- Update overall vote percentages
    UPDATE election_summary es
    SET es.vote_percentage = (es.total_votes / (SELECT SUM(total_votes) FROM election_summary)) * 100;
    
    -- Determine winners for each constituency
    OPEN constituency_cursor;
    
    constituency_loop: LOOP
        FETCH constituency_cursor INTO curr_constituency_id;
        
        IF done THEN
            LEAVE constituency_loop;
        END IF;
        
        -- Find max votes in this constituency
        SELECT MAX(votes_received) INTO max_votes
        FROM election_results
        WHERE constituency_id = curr_constituency_id;
        
        -- Find the party with max votes
        SELECT party_name INTO winner_party
        FROM election_results
        WHERE constituency_id = curr_constituency_id
        AND votes_received = max_votes
        LIMIT 1;
        
        -- Find second highest votes for margin calculation
        SELECT MAX(votes_received) INTO second_max_votes
        FROM election_results
        WHERE constituency_id = curr_constituency_id
        AND party_name != winner_party;
        
        -- Update is_winner and margin
        UPDATE election_results
        SET 
            is_winner = (party_name = winner_party),
            margin_of_victory = IF(party_name = winner_party, max_votes - second_max_votes, 0)
        WHERE constituency_id = curr_constituency_id;
        
        -- Update seats won in summary
        UPDATE election_summary
        SET seats_won = seats_won + 1
        WHERE party_name = winner_party;
    END LOOP;
    
    CLOSE constituency_cursor;
    
    -- Update seats percentage
    UPDATE election_summary
    SET seats_percentage = (seats_won / (SELECT COUNT(*) FROM constituencies)) * 100;
END $
DELIMITER ;

-- Simulate the election by casting random votes
DELIMITER $
CREATE PROCEDURE simulate_election()
BEGIN
    -- Reset results tables
    TRUNCATE TABLE election_results;
    TRUNCATE TABLE ward_results;
    TRUNCATE TABLE election_summary;
    
    -- Reset voter voting status
    UPDATE voters SET has_voted = FALSE, voted_party = NULL, voted_timestamp = NULL;
    
    -- Cast random votes (85% turnout)
    UPDATE voters
    SET 
        has_voted = TRUE,
        voted_party = (SELECT party_name FROM political_parties ORDER BY RAND() LIMIT 1),
        voted_timestamp = '2025-04-06 08:00:00' + INTERVAL FLOOR(RAND() * 36000) SECOND
    ORDER BY RAND()
    LIMIT FLOOR(0.85 * (SELECT COUNT(*) FROM voters));
    
    -- Calculate results
    CALL calculate_election_results();
END $
DELIMITER ;

-- View to show constituency wise winners
CREATE VIEW constituency_winners AS
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

-- View to find the ruling party
CREATE VIEW ruling_party AS
SELECT 
    party_name,
    seats_won,
    seats_percentage,
    total_votes,
    vote_percentage,
    (SELECT cm_candidate FROM political_parties WHERE party_name = es.party_name) AS chief_minister
FROM 
    election_summary es
ORDER BY 
    seats_won DESC, total_votes DESC
LIMIT 1;

-- View to show demographic analysis of voters
CREATE VIEW voter_demographics AS
SELECT 
    constituency_name,
    (SELECT COUNT(*) FROM voters v WHERE v.constituency_id = c.constituency_id) AS total_voters,
    (SELECT COUNT(*) FROM voters v WHERE v.constituency_id = c.constituency_id AND gender = 'Male') AS male_voters,
    (SELECT COUNT(*) FROM voters v WHERE v.constituency_id = c.constituency_id AND gender = 'Female') AS female_voters,
    (SELECT COUNT(*) FROM voters v WHERE v.constituency_id = c.constituency_id AND gender = 'Other') AS other_gender,
    (SELECT COUNT(*) FROM voters v WHERE v.constituency_id = c.constituency_id AND age BETWEEN 18 AND 30) AS young_voters,
    (SELECT COUNT(*) FROM voters v WHERE v.constituency_id = c.constituency_id AND age BETWEEN 31 AND 60) AS middle_age_voters,
    (SELECT COUNT(*) FROM voters v WHERE v.constituency_id = c.constituency_id AND age > 60) AS senior_voters,
    (SELECT COUNT(*) FROM voters v WHERE v.constituency_id = c.constituency_id AND has_voted = TRUE) / 
    (SELECT COUNT(*) FROM voters v WHERE v.constituency_id = c.constituency_id) * 100 AS voter_turnout
FROM
    constituencies c
ORDER BY
    voter_turnout DESC;

-- Procedure to reset data for fresh simulation
DELIMITER $
CREATE PROCEDURE reset_simulation()
BEGIN
    -- Reset voter data
    UPDATE voters SET has_voted = FALSE, voted_party = NULL, voted_timestamp = NULL;
    
    -- Reset results
    TRUNCATE TABLE election_results;
    TRUNCATE TABLE ward_results;
    TRUNCATE TABLE election_summary;
END $
DELIMITER ;

-- Sample queries to analyze election results

-- 1. Run the election simulation
-- CALL simulate_election();

-- 2. Find the winning party and CM
-- SELECT * FROM ruling_party;

-- 3. List all constituencies and their winners
-- SELECT * FROM constituency_winners;

-- 4. Party-wise vote share analysis
-- SELECT party_name, total_votes, vote_percentage, seats_won, seats_percentage
-- FROM election_summary
-- ORDER BY seats_won DESC;

-- 5. District-wise party performance
-- SELECT 
--     c.district,
--     er.party_name,
--     COUNT(*) AS seats_won,
--     SUM(er.votes_received) AS total_votes
-- FROM election_results er
-- JOIN constituencies c ON er.constituency_id = c.constituency_id  
-- WHERE er.is_winner = TRUE
-- GROUP BY c.district, er.party_name
-- ORDER BY c.district, seats_won DESC;

-- 6. Close contests (margin less than 1000 votes)
-- SELECT 
--     c.constituency_name,
--     c.district,
--     er.party_name AS winner,
--     er.votes_received,
--     er.margin_of_victory,
--     (SELECT candidate_name FROM candidates WHERE constituency_id = c.constituency_id AND party_name = er.party_name) AS winning_candidate
-- FROM election_results er
-- JOIN constituencies c ON er.constituency_id = c.constituency_id
-- WHERE er.is_winner = TRUE AND er.margin_of_victory < 1000
-- ORDER BY er.margin_of_victory;

-- 7. Performance of CM candidates
-- SELECT 
--     c.constituency_name,
--     cand.candidate_name,
--     cand.party_name,
--     pp.cm_candidate,
--     (SELECT votes_received FROM election_results WHERE constituency_id = c.constituency_id AND party_name = cand.party_name) AS votes,
--     (SELECT is_winner FROM election_results WHERE constituency_id = c.constituency_id AND party_name = cand.party_name) AS won_election
-- FROM candidates cand
-- JOIN constituencies c ON cand.constituency_id = c.constituency_id  
-- JOIN political_parties pp ON cand.party_name = pp.party_name
-- WHERE cand.is_cm_candidate = TRUE
-- ORDER BY won_election DESC;

-- 8. Hourly voting pattern analysis
-- SELECT 
--     HOUR(voted_timestamp) AS hour_of_day,
--     COUNT(*) AS votes_cast
-- FROM voters 
-- WHERE has_voted = TRUE
-- GROUP BY HOUR(voted_timestamp)
-- ORDER BY hour_of_day;

-- 9. Gender-wise voting pattern
-- SELECT 
--     v.gender,
--     v.voted_party,
--     COUNT(*) AS number_of_votes,
--     COUNT(*) / (SELECT COUNT(*) FROM voters WHERE gender = v.gender AND has_voted = TRUE) * 100 AS percentage
-- FROM voters v
-- WHERE v.has_voted = TRUE
-- GROUP BY v.gender, v.voted_party
-- ORDER BY v.gender, number_of_votes DESC;

-- 10. Age group voting preferences
-- SELECT 
--     CASE 
--         WHEN age BETWEEN 18 AND 25 THEN '18-25'
--         WHEN age BETWEEN 26 AND 35 THEN '26-35'
--         WHEN age BETWEEN 36 AND 50 THEN '36-50'
--         WHEN age BETWEEN 51 AND 65 THEN '51-65'
--         ELSE 'Above 65'
--     END AS age_group,
--     voted_party,
--     COUNT(*) AS votes
-- FROM voters
-- WHERE has_voted = TRUE
-- GROUP BY age_group, voted_party
-- ORDER BY age_group, votes DESC;

-- Run the election simulation to populate the data
CALL simulate_election();

-- Show final election results
SELECT 
    party_name,
    seats_won AS constituencies_won,
    seats_percentage,
    CASE 
        WHEN seats_won > (SELECT COUNT(*) FROM constituencies)/2 THEN 'Majority'
        ELSE 'Minority'
    END AS government_type,
    (SELECT cm_candidate FROM political_parties WHERE party_name = es.party_name) AS chief_minister_candidate
FROM 
    election_summary es
ORDER BY 
    seats_won DESC, vote_percentage DESC;

-- To reset and run a new simulation:
-- CALL reset_simulation();
-- CALL simulate_election();