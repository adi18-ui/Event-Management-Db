
-- Adding new events
INSERT INTO "events"("id","name","event_start_date","event_end_date","location")
VALUES
    (1,"Aditya's Birthday Celebration","2024-03-10 19:00:00","2024-03-10 21:00:00","Jamshedpur"),
    (2,"Mr. & Mrs. Avengers Marriage Reception","2024-03-12 09:00:00","2024-03-13 22:00:00","Texas"),
    (3,"New Year Celebration","2023-12-31 19:00:00","2024-01-01 02:00:00","Jamshedpur"),
    (4,"Mr. Kumars' Retirement Party","2024-03-10 19:00:00","2024-03-10 21:00:00","Cape Town"),
    (5,"Kitty Party","2024-03-10 17:00:00","2024-03-10 21:30:00","Haldia"),
    (6,"Community Centre Festival","2024-03-15 10:00:00","2024-03-20 17:00:00","Turamdih"),
    (7,"Promotion Party","2024-03-15 10:00:00","2024-03-20 17:00:00","Florida");

-- Adding details about hosts hosting the events
INSERT INTO "hosts"("id","name","gender","age","phone_no")
VALUES
    (1,"Aditya","M",19,1228975678),
    (2,"Tony","M",30,6528975678),
    (3,"Shruti","F",23,8220975678),
    (4,"Ajay","M",20,1208975678),
    (5,"Jaya","F",48,1108975670),
    (6,"Leonardo","M",56,1928975078);

-- Adding details about guests invited to events
INSERT INTO "guests"("id","name","gender","age","phone_no")
VALUES
    (1,"Adi","M",19,1228973378),
    (2,"Rohit","M",30,1224375678),
    (3,"Tom","M",28,1228944678),
    (4,"Max","M",10,1228940608),
    (5,"Suzzane","F",16,9228975678),
    (6,"Dhoti","F",20,7828975678),
    (7,"Laura","F",22,1228975986),
    (8,"Arc","M",19,1228987578),
    (9,"Dhoni","M",42,2128975678),
    (10,"Virat","M",35,9228975670),
    (11,"John","M",36,8228975678),
    (12,"Krissy","F",27,6228975676),
    (13,"Harry","M",30,9628975678),
    (14,"Devleena","F",23,1228985678),
    (15,"Saurabh","M",19,9028975671);

-- Adding details to invites table
INSERT INTO "invites"("host_id","guest_id")
VALUES
    (1,1),
    (1,2),
    (1,3),
    (1,7),
    (1,9),
    (1,10),
    (1,11),
    (1,12),
    (1,14),
    (1,15),

    (2,1),
    (2,3),
    (2,4),
    (2,9),
    (2,13),

    (3,4),
    (3,5),
    (3,12),

    (4,2),
    (4,9),
    (4,10),

    (5,6),
    (5,14),

    (6,1),
    (6,14),
    (6,15);

-- Adding details to organised table
INSERT INTO "organised"("host_id","event_id")
VALUES
    (1,1),
    (1,7),
    (2,2),
    (3,3),
    (4,4),
    (5,5),
    (6,6);


INSERT INTO "event_guest"("event_id","guest_id")
VALUES
    (1,1),
    (1,2),
    (1,3),
    (1,15),
    (1,14),

    (2,1),
    (2,3),
    (2,4),
    (2,9),
    (2,13),

    (3,4),
    (3,5),
    (3,12),

    (4,2),
    (4,9),
    (4,10),

    (5,6),
    (5,14),

    (6,1),
    (6,14),
    (6,15),

    (7,9),
    (7,10),
    (7,7);


-- To find all the events hosted given host's name
SELECT "name" FROM "events"
WHERE "id" IN
(SELECT "event_id" FROM "organised" WHERE "host_id"=
(SELECT "id" FROM "hosts" WHERE "name" = 'Aditya'));

-- To retrieve all those guests who were invited by a specific host grouped by event
SELECT "e"."name" AS "event_name", "g"."name" AS "guest_name"
FROM "event_guest" "eg"
JOIN "guests" "g" ON "eg.guest_id" = "g"."id"
JOIN "organised" "o" ON "eg"."event_id" = "o"."event_id"
JOIN "events" "e" ON "eg"."event_id" = "e"."id"
WHERE "o"."host_id" = 1
GROUP BY "eg"."event_id", "eg"."guest_id";


-- To display the number of guests in each event in Descending order
SELECT e.name AS event_name, COUNT(eg.guest_id) AS guest_count
FROM events e
JOIN organised o ON e.id = o.event_id
JOIN event_guest eg ON e.id = eg.event_id
GROUP BY e.name
ORDER BY guest_count DESC;

-- To count and display the number of males and females attending an event
SELECT COUNT("gender") AS "Number of Guests","Gender" AS "gender"
 FROM "guests"
WHERE"id" IN
(SELECT "guest_id" FROM "event_guest" WHERE "event_id" = 1)
GROUP BY "gender";


-- To display the age groups of the guests invited to an event with string "Marriage" in between using a view
SELECT "age" FROM "Marriage_guest";

