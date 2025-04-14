DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS courses_categories;
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS teachers;
DROP TABLE IF EXISTS courses;

-- users table in SQLite
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT (datetime('now')),
    updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

-- teachers table in SQLite
CREATE TABLE teachers (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT (datetime('now')),
    updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

-- courses table in SQLite
CREATE TABLE courses (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    name TEXT NOT NULL,
    hours INTEGER NOT NULL,
    price REAL NOT NULL,
    teacher_id INTEGER NOT NULL,
    date TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT (datetime('now')),
    updated_at TEXT NOT NULL DEFAULT (datetime('now')),
    FOREIGN KEY (teacher_id) REFERENCES teachers(id)
      ON DELETE CASCADE ON UPDATE CASCADE
);

-- categories table in SQLite
CREATE TABLE categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    name TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT (datetime('now')),
    updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

-- courses_categories table in SQLite
CREATE TABLE courses_categories (
    course_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    created_at TEXT NOT NULL DEFAULT (datetime('now')),
    updated_at TEXT NOT NULL DEFAULT (datetime('now')),
    PRIMARY KEY (course_id, category_id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
      ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(id)
      ON DELETE CASCADE ON UPDATE CASCADE
);



-- enrollments table in SQLite
CREATE TABLE enrollments (
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    date TEXT NOT NULL DEFAULT (datetime('now')),
    price REAL NOT NULL,
    updated_at TEXT NOT NULL DEFAULT (datetime('now')),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(id)
      ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id)
      ON DELETE CASCADE ON UPDATE CASCADE
);


-- add 5 sample data to the students table
INSERT INTO students (name, last_name) VALUES ('John', 'Doe');
INSERT INTO students (name, last_name) VALUES ('Jane', 'Smith');
INSERT INTO students (name, last_name) VALUES ('Alice', 'Johnson');
INSERT INTO students (name, last_name) VALUES ('Bob', 'Brown');
INSERT INTO students (name, last_name) VALUES ('Charlie', 'Davis');
INSERT INTO students (name, last_name) VALUES ('Eve', 'Wilson');


-- add 5 sample data to the teachers table
INSERT INTO teachers (name, last_name) VALUES ('Mr. Anderson', 'Smith');
INSERT INTO teachers (name, last_name) VALUES ('Ms. Johnson', 'Doe');
INSERT INTO teachers (name, last_name) VALUES ('Dr. Brown', 'Taylor');
INSERT INTO teachers (name, last_name) VALUES ('Prof. Davis', 'Wilson');
INSERT INTO teachers (name, last_name) VALUES ('Ms. White', 'Clark');


-- add 10 sample data to the programming courses table

INSERT INTO courses (name, hours, price, teacher_id, date) VALUES ('Python Basics', 30, 200.00, 1, '2025-01-01 10:00:00');
INSERT INTO courses (name, hours, price, teacher_id, date) VALUES ('JavaScript Fundamentals', 25, 180.00, 2, '2025-01-10 11:00:00');
INSERT INTO courses (name, hours, price, teacher_id, date) VALUES ('Java for Beginners', 40, 250.00, 3, '2025-01-6 10:00:00');
INSERT INTO courses (name, hours, price, teacher_id, date) VALUES ('C++ Programming', 35, 220.00, 4, '2025-02-02 17:00:00');
INSERT INTO courses (name, hours, price, teacher_id, date) VALUES ('Ruby on Rails', 30, 210.00, 5, '2025-02-9 16:00:00');
INSERT INTO courses (name, hours, price, teacher_id, date) VALUES ('HTML & CSS', 20, 150.00, 1, '2025-02-12 12:00:00');
INSERT INTO courses (name, hours, price, teacher_id, date) VALUES ('React.js', 30, 200.00, 1, '2025-03-03 11:00:00');
INSERT INTO courses (name, hours, price, teacher_id, date) VALUES ('Node.js', 30, 200.00, 1, '2025-03-7 10:00:00');
INSERT INTO courses (name, hours, price, teacher_id, date) VALUES ('Django', 30, 200.00, 3, '2025-03-15 17:00:00');
INSERT INTO courses (name, hours, price, teacher_id, date) VALUES ('Flask', 30, 200.00, 3, '2025-03-22 12:00:00');

-- add 5 sample data to the categories table
INSERT INTO categories (name) VALUES ('Programming');
INSERT INTO categories (name) VALUES ('Web Development');
INSERT INTO categories (name) VALUES ('Data Science');
INSERT INTO categories (name) VALUES ('Machine Learning');
INSERT INTO categories (name) VALUES ('Mobile Development');

-- add 10 sample data to the courses_categories table
INSERT INTO courses_categories (course_id, category_id) VALUES (1, 1);
INSERT INTO courses_categories (course_id, category_id) VALUES (2, 1);
INSERT INTO courses_categories (course_id, category_id) VALUES (3, 1);
INSERT INTO courses_categories (course_id, category_id) VALUES (4, 1);
INSERT INTO courses_categories (course_id, category_id) VALUES (5, 1);
INSERT INTO courses_categories (course_id, category_id) VALUES (5, 2);
INSERT INTO courses_categories (course_id, category_id) VALUES (6, 2);
INSERT INTO courses_categories (course_id, category_id) VALUES (3, 2);
INSERT INTO courses_categories (course_id, category_id) VALUES (8, 3);
INSERT INTO courses_categories (course_id, category_id) VALUES (10, 3);



-- add 10 sample data to the enrollments table with different dates
INSERT INTO enrollments (student_id, course_id, price, date) VALUES (1, 1, 135.00, '2025-01-01 10:00:00');
INSERT INTO enrollments (student_id, course_id, price, date) VALUES (2, 2, 180.00, '2025-01-02 11:00:00');
INSERT INTO enrollments (student_id, course_id, price, date) VALUES (3, 3, 199.00, '2025-01-03 12:00:00');
INSERT INTO enrollments (student_id, course_id, price, date) VALUES (5, 5, 210.00, '2025-01-05 14:00:00');
INSERT INTO enrollments (student_id, course_id, price, date) VALUES (1, 6, 110.00, '2025-01-06 15:00:00');
INSERT INTO enrollments (student_id, course_id, price, date) VALUES (2, 7, 200.00, '2025-01-07 16:00:00');
INSERT INTO enrollments (student_id, course_id, price, date) VALUES (3, 8, 200.00, '2025-01-08 17:00:00');
INSERT INTO enrollments (student_id, course_id, price, date) VALUES (5, 10, 200.00, '2025-01-10 19:00:00');
INSERT INTO enrollments (student_id, course_id, price, date) VALUES (6, 1, 200.00, '2025-01-11 20:00:00');
INSERT INTO enrollments (student_id, course_id, price, date) VALUES (6, 2, 180.00, '2025-01-12 21:00:00');
INSERT INTO enrollments (student_id, course_id, price, date) VALUES (6, 3, 210.00, '2025-01-13 22:00:00');
INSERT INTO enrollments (student_id, course_id, price, date) VALUES (6, 4, 220.00, '2025-01-14 23:00:00');
INSERT INTO enrollments (student_id, course_id, price, date) VALUES (6, 5, 199.00, '2025-01-15 24:00:00');
