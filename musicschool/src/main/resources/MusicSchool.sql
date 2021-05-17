CREATE TABLE email (
 email_id INT NOT NULL,
 email VARCHAR(500) NOT NULL
);

ALTER TABLE email ADD CONSTRAINT PK_email PRIMARY KEY (email_id);


CREATE TABLE instrument_stock (
 instrument_id INT NOT NULL,
 name VARCHAR(500),
 type VARCHAR(500),
 price INT,
 available_to_rent INT,
 amount_rented INT
);

ALTER TABLE instrument_stock ADD CONSTRAINT PK_instrument_stock PRIMARY KEY (instrument_id);


CREATE TABLE person (
 person_id INT NOT NULL,
 person_number VARCHAR(12),
 first_name VARCHAR(500),
 last_name VARCHAR(500),
 city VARCHAR(500),
 street VARCHAR(500),
 zip VARCHAR(10)
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (person_id);


CREATE TABLE person_email (
 person_id INT NOT NULL,
 email_id INT NOT NULL
);

ALTER TABLE person_email ADD CONSTRAINT PK_person_email PRIMARY KEY (person_id,email_id);


CREATE TABLE phone (
 phone_id INT NOT NULL,
 phone_number VARCHAR(500) NOT NULL
);

ALTER TABLE phone ADD CONSTRAINT PK_phone PRIMARY KEY (phone_id);


CREATE TABLE school (
 school_id INT NOT NULL,
 city VARCHAR(500),
 street VARCHAR(500),
 zip VARCHAR(10),
 available_places INT,
 min_age INT
);

ALTER TABLE school ADD CONSTRAINT PK_school PRIMARY KEY (school_id);


CREATE TABLE student (
 student_id INT NOT NULL,
 skill VARCHAR(100),
 person_id INT NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_id);


CREATE TABLE student_rental (
 rental_id INT NOT NULL,
 fee_per_month INT,
 lease_period INT,
 date DATE,
 rental_period INT,
 instrument_id INT,
 school_id INT,
 student_id INT NOT NULL
);

ALTER TABLE student_rental ADD CONSTRAINT PK_student_rental PRIMARY KEY (rental_id);


CREATE TABLE application (
 student_id INT NOT NULL,
 instrument_to_rent_1 VARCHAR(500),
 instrument_to_rent_2 VARCHAR(500),
 skill VARCHAR(100)
);

ALTER TABLE application ADD CONSTRAINT PK_application PRIMARY KEY (student_id);


CREATE TABLE audition (
 student_id INT NOT NULL,
 is_passed VARCHAR(50)
);

ALTER TABLE audition ADD CONSTRAINT PK_audition PRIMARY KEY (student_id);


CREATE TABLE instructor (
 instructor_id INT NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_id);


CREATE TABLE instructor_payment (
 date DATE NOT NULL,
 instructor_id INT NOT NULL,
 amount INT
);

ALTER TABLE instructor_payment ADD CONSTRAINT PK_instructor_payment PRIMARY KEY (date,instructor_id);


CREATE TABLE instrument_to_learn (
 instrument VARCHAR(500) NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE instrument_to_learn ADD CONSTRAINT PK_instrument_to_learn PRIMARY KEY (instrument,student_id);


CREATE TABLE instrument_to_teach (
 instrument VARCHAR(500) NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE instrument_to_teach ADD CONSTRAINT PK_instrument_to_teach PRIMARY KEY (instrument,instructor_id);


CREATE TABLE parent (
 parent_id INT NOT NULL,
 person_number CHAR(12),
 person_id INT NOT NULL
);

ALTER TABLE parent ADD CONSTRAINT PK_parent PRIMARY KEY (parent_id);


CREATE TABLE person_phone (
 phone_id INT NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE person_phone ADD CONSTRAINT PK_person_phone PRIMARY KEY (phone_id,person_id);


CREATE TABLE sibling (
 sibling_id INT NOT NULL,
 student_id INT NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE sibling ADD CONSTRAINT PK_sibling PRIMARY KEY (sibling_id,student_id);


CREATE TABLE sibling_discount (
 sibling_id INT NOT NULL,
 student_id INT NOT NULL,
 amount INT
);

ALTER TABLE sibling_discount ADD CONSTRAINT PK_sibling_discount PRIMARY KEY (sibling_id,student_id);


CREATE TABLE student_payment (
 date DATE NOT NULL,
 student_id INT NOT NULL,
 amount INT,
 sibling_id INT
);

ALTER TABLE student_payment ADD CONSTRAINT PK_student_payment PRIMARY KEY (date,student_id);


CREATE TABLE available_time_slots (
 instructor_id INT NOT NULL,
 time_slot_id INT NOT NULL,
 time TIMESTAMP(10),
 date DATE
);

ALTER TABLE available_time_slots ADD CONSTRAINT PK_available_time_slots PRIMARY KEY (instructor_id,time_slot_id);


CREATE TABLE booking (
 booking_id INT NOT NULL,
 time TIMESTAMP(10),
 date DATE,
 skill VARCHAR(100),
 instructor_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE booking ADD CONSTRAINT PK_booking PRIMARY KEY (booking_id);


CREATE TABLE child (
 parent_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE child ADD CONSTRAINT PK_child PRIMARY KEY (parent_id,student_id);


CREATE TABLE ensemble (
 booking_id INT NOT NULL,
 ens_id INT NOT NULL,
 min_places INT,
 max_places INT,
 genre VARCHAR(500),
 price INT
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (booking_id,ens_id);


CREATE TABLE group_lesson (
 booking_id INT NOT NULL,
 gr_less_id INT NOT NULL,
 min_places INT,
 max_places INT,
 price INT,
 instrument VARCHAR(500)
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (booking_id,gr_less_id);


CREATE TABLE individual_lesson (
 booking_id INT NOT NULL,
 ind_less_id INT NOT NULL,
 price INT,
 instrument VARCHAR(500),
 skill CHAR(10)
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (booking_id,ind_less_id);


CREATE TABLE lesson_participant (
 booking_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE lesson_participant ADD CONSTRAINT PK_lesson_participant PRIMARY KEY (booking_id,student_id);


ALTER TABLE person_email ADD CONSTRAINT FK_person_email_0 FOREIGN KEY (person_id) REFERENCES person (person_id);
ALTER TABLE person_email ADD CONSTRAINT FK_person_email_1 FOREIGN KEY (email_id) REFERENCES email (email_id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (person_id);


ALTER TABLE student_rental ADD CONSTRAINT FK_student_rental_0 FOREIGN KEY (instrument_id) REFERENCES instrument_stock (instrument_id);
ALTER TABLE student_rental ADD CONSTRAINT FK_student_rental_1 FOREIGN KEY (school_id) REFERENCES school (school_id);
ALTER TABLE student_rental ADD CONSTRAINT FK_student_rental_2 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE application ADD CONSTRAINT FK_application_0 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE audition ADD CONSTRAINT FK_audition_0 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (person_id);


ALTER TABLE instructor_payment ADD CONSTRAINT FK_instructor_payment_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE instrument_to_learn ADD CONSTRAINT FK_instrument_to_learn_0 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE instrument_to_teach ADD CONSTRAINT FK_instrument_to_teach_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE parent ADD CONSTRAINT FK_parent_0 FOREIGN KEY (person_id) REFERENCES person (person_id);


ALTER TABLE person_phone ADD CONSTRAINT FK_person_phone_0 FOREIGN KEY (phone_id) REFERENCES phone (phone_id);
ALTER TABLE person_phone ADD CONSTRAINT FK_person_phone_1 FOREIGN KEY (person_id) REFERENCES person (person_id);


ALTER TABLE sibling ADD CONSTRAINT FK_sibling_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE sibling ADD CONSTRAINT FK_sibling_1 FOREIGN KEY (person_id) REFERENCES person (person_id);


ALTER TABLE sibling_discount ADD CONSTRAINT FK_sibling_discount_0 FOREIGN KEY (sibling_id,student_id) REFERENCES sibling (sibling_id,student_id);


ALTER TABLE student_payment ADD CONSTRAINT FK_student_payment_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE student_payment ADD CONSTRAINT FK_student_payment_1 FOREIGN KEY (sibling_id,student_id) REFERENCES sibling_discount (sibling_id,student_id);


ALTER TABLE available_time_slots ADD CONSTRAINT FK_available_time_slots_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE booking ADD CONSTRAINT FK_booking_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE booking ADD CONSTRAINT FK_booking_1 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE child ADD CONSTRAINT FK_child_0 FOREIGN KEY (parent_id) REFERENCES parent (parent_id);
ALTER TABLE child ADD CONSTRAINT FK_child_1 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (booking_id) REFERENCES booking (booking_id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (booking_id) REFERENCES booking (booking_id);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (booking_id) REFERENCES booking (booking_id);


ALTER TABLE lesson_participant ADD CONSTRAINT FK_lesson_participant_0 FOREIGN KEY (booking_id) REFERENCES booking (booking_id);
ALTER TABLE lesson_participant ADD CONSTRAINT FK_lesson_participant_1 FOREIGN KEY (student_id) REFERENCES student (student_id);


