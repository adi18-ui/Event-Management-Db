# Design Document

By Aditya Sahoo

Video overview: <https://youtu.be/Edfqok8s1dA?si=aVLQyYrMrqMab438>

## Scope
The database "Events Management System" facilitates event management by capturing essential details, thus simplifying the process for users. Its scope includes:

* Specification of host details, encompassing their basic information.
* Guests invited by hosts for various events. Notably, a person becomes a guest only upon receiving at least one invitation.
* Events table containing relevant information such as event name and location.

This system is designed to cater to anyone looking to host an event, offering streamlined organization of data.

Out of scope are elements like payment systems, which are optional for some events.

Out of scope are the elements like payment system(optional for some events) which is one of the major factor of any paid event.

## Functional Requirements

* Things users can do with our database :
* Viewing upcoming events, including names and locations.
* Hosts can retrieve the information of the guests invited and also update it to include more guests.

* Things that are beyond the scope of the user :
* A user cannot modify the event details once mentioned to maintain data integrity and consistency to prevent unauthorised changes.
* Database accessibility is restricted to authorized users (hosts) only.


## Representation

Entities are captured in SQLite tables with the following schema.

### Entities

The Database includes the following entities:

### Events
The "events" table includes :

* 'id', its the unique identifier for the events table which is of `INTEGER` data type.It serves as the **Primary Key** for the table.
* `name` column represents the name of the event which is being organised/hosted and its type is `TEXT`.
* 'event_start_date` signifies the event starting date which is important for the invited guests, the chosen type is NUMERIC.
* 'event_end_date` signifies the event starting date which is important for the invited guests, the chosen type is NUMERIC, same as that if event_start_date.
* `location` tells the users about the location where the event is going to conducted, its type affinity is `TEXT`.

All the columns in the `events` table are required so `NOT NULL` constraint is applied.

### Hosts
The "hosts" table includes :

* `id` which includes the unique identifier of each event organised for the events table.It serves as the **Primary Key** for the table.
* `name` column includes the name of the host who is organising the event,data type is `TEXT`.
* `gender` column includes the gender of the host,data type is `TEXT`.
* `age` column signifies the age of the host who is organising the event.
* `phone_no` column specifies the phone number of the host the data type is `INTEGER`.

NOT NULL constraint is applied to the name column explicitly and as for the id column its the Primary Key.

### Guests

The "guests" table includes :

* `id` unique identifier of each of the guest invited to an event.It serves as the **Primary Key** for the table.
* `name` column signfies the name of the guest invited, the chosen type is `TEXT`.
* `gender` column signifies the gender of each guest, `TEXT` is the chosen data type.
* `age` column specifies the age of the Guest and the type is `INTEGER`.
* `phone_no` column specifies the phone number of the host the data type is `INTEGER`.

Here I have not separated name as first_name and last_name for simplicity purposes.
NOT NULL column is applied to name columnn only, apart from that CHECK constraint is applied to gender column.
PRIMARY KEY is the id column.

### Invites

The "invites" table includes :

* `guest_id` represents the id of the guesta table that corresponds to the id in the guests table.The data type is `INTEGER`
* `host_id` column represents the id of the guests table that corresponds to the id in the hosts table.The data type is `INTEGER`

guest_id serves as the foreign key that references the primary key(id) of the guests table.
Similarly the host_id serves as the foreign key that references the primary key(id) of the hosts table.

### Organised

The "organised" table includes :

* `host_id` column represents the id of the organised table that corresponds to the id in the hosts table.The data type is `INTEGER`
* `event_id` column represents the id of the organised table that corresponds to the id in the events table.The data type is `INTEGER`
The host_id serves as the foreign key that references the primary key(id) of the hosts table.
Similarly the event_id serves as the foreign key that references to the primiary key(id) of the events table.

### Event_Guest

The "event_guests" table includes :

* `guest_id` represents the id of the guests table that corresponds to the id in the guests table, the chosen data type is `INTEGER`.
* `event_id` column represents the id of the organised table that corresponds to the id in the events table, the chosen data type is `INTEGER`.
guest_id serves as the foreign key that references the primary key(id) of the guests table.
Similarly the event_id serves as the foreign key that references to the primiary key(id) of the events table.


### Relationships


![ER Diagram](diagram.png)

* From the ER diagram depicted above it  can be seen that an Event can be organised by one and only one Host which means that an event should have only one one organiser. But a Host can organise atleast one or more events.

* As for the relation between Host and Guest, a Host can invite atleast one or many Guests, similarly a person can be called Guest only if he's invited to atleast one event.so we have a many to many relationship between Guest and Host. And also a Guesst can be invited my more than one host.

* A Guest can be invited in anyone or more than 1 event and an Event can have one or more than one event.

The Organised table serves as a connection between Hosts and Events Table.
And the Invites table acts as the junction between Hosts and Guest Table.

## Optimizations

To enhance query performance, the following optimizations are implemented:

Per the typical queries in `queries.sql`, it's common for the users of the database to access information like the events organised by a particular host. For that reason index `host_index` is created on hosts table for speeding up the query results for the host_id.
Similarly `event_index` is created on the events table for the name column for faster retrieval of data from the events table.

* Additionally, a view named `Marriage_guest` is created, providing comprehensive information about guests invited to the Marriage event.t.


## Limitations

Although the current schema covers every possible information related to events but there are some limitations to this design:

* It does not incorporate features for purchasing event tickets, which might be essential for ticketed(paid) events.
