-- Task 1: SQL Data Insertion

CREATE TABLE Members (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT
);

CREATE TABLE WorkoutSessions (
    session_id INT PRIMARY KEY,
    member_id INT,
    session_date DATE,
    session_time VARCHAR(50),
    activity VARCHAR(255),
    FOREIGN KEY (member_id) REFERENCES Members(id)
);

-- Inserting records into the Members table
INSERT INTO Members (id, name, age) VALUES (1, 'Jane Doe', 28);
INSERT INTO Members (id, name, age) VALUES (2, 'John Smith', 35);
INSERT INTO Members (id, name, age) VALUES (3, 'Alice Johnson', 22);

-- Inserting records into the WorkoutSessions table
INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity) VALUES (1, 1, '2024-09-23', '08:00', 'Yoga');
INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity) VALUES (2, 2, '2024-09-23', '10:00', 'Weightlifting');
INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity) VALUES (3, 3, '2024-09-23', '09:00', 'Cardio');

-- Task 2: SQL Data Update
-- Updating the workout session time for Jane Doe
UPDATE WorkoutSessions
SET session_time = '18:00'
WHERE member_id = (SELECT id FROM Members WHERE name = 'Jane Doe');

-- Task 3: SQL Data Deletion

SET SQL_SAFE_UPDATES = 0;

-- Removing John Smith's record from the Members table
DELETE FROM Members
WHERE name = 'John Smith';

-- Optionally, you may also want to remove John Smith's workout sessions
DELETE FROM WorkoutSessions
WHERE member_id = (SELECT id FROM Members WHERE name = 'John Smith');

SET SQL_SAFE_UPDATES = 1;