-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

-- Represent events table
CREATE TABLE "events"
(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "event_start_date" NUMERIC NOT NULL,
    "event_end_date" NUMERIC NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY("id")
);


-- Represent hosts table
CREATE TABLE "hosts"
(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "gender" TEXT CHECK("gender" = 'M' OR "gender" = 'F'),
    "age" INTEGER,
    "phone_no" INTEGER,
    PRIMARY KEY("id")
);

-- Represent guests table
CREATE TABLE "guests"
(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "gender" TEXT CHECK("gender" = 'M' OR "gender" = 'F'),
    "age" INTEGER,
    "phone_no" INTEGER,
    PRIMARY KEY("id")
);

-- Represent invites table
CREATE TABLE "invites"
(
    "host_id" INTEGER,
    "guest_id" INTEGER,
    FOREIGN KEY("host_id") REFERENCES "hosts"("id"),
    FOREIGN KEY("guest_id") REFERENCES "guests"("id")
);

-- Represent events table
CREATE TABLE "organised"
(
    "host_id" INTEGER,
    "event_id" INTEGER,
    FOREIGN KEY("host_id") REFERENCES "hosts"("id"),
    FOREIGN KEY("event_id") REFERENCES "events"("id")
);

-- Represent event_guest table
CREATE TABLE "event_guest"
(
    "event_id" INTEGER,
    "guest_id" INTEGER,
    FOREIGN KEY("event_id") REFERENCES "events"("id"),
    FOREIGN KEY("guest_id") REFERENCES "guests"("id")
);

-- Create indexes for faster query results
CREATE INDEX "event_index" ON "events"("name");
CREATE INDEX "host_index" ON "hosts"("name");


CREATE VIEW "Marriage_guest" AS
SELECT * FROM "guests" WHERE "id" IN
(SELECT "guest_id" FROM "event_guest" WHERE "event_id" =
(Select "id" from "events" where "name" Like '%Marriage%'));
