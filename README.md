# Makers BnB Week 5

## Team: Dylan, Ginny, Andy and Luke

### MVP

```
Program allows functionality of being able to post a place available and to book a place available (whether or not you are a user, logged in, etc.)
```


# MakersBnB specification

We would like a web application that allows users to list spaces they have available, and to hire spaces for the night.

### Headline specifications

- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.

### User Stories (translated from Headline Specifications)

```
As a User
So I can promote my space
I want to be able to sign in and list a new space
```
```
As a User
So I can promote more than one space
I want to be able to list multiple spaces
```
```
As a User
So that information is available to enhance booking probability
I want to be able to name my space, provide a description and price-per-night
```
```
As a User
So I can fully utilise my space
I want to make my space available for a range of dates
```
```
As a User
So that I can secure a booking, on a specific day
I want to be be able to book a space for one night
```
```
As a User/Owner
So that I decide who stays in my space
I want to be able to approve a booking before it's confirmed
```
```
So I can avoid double bookings
I want my space to be unavailable for nights that it is already booked
```
```
As a User/Owner
So I can ensure best usage of the space
I would only like my space to be unavailable after I have confirmed a booking
```

# CRC Card

<img width="1094" alt="Screenshot 2021-11-15 at 16 51 50" src="https://user-images.githubusercontent.com/90717175/141821698-5831c10b-16ee-428d-80e2-ae481fff34b9.png">

# Domain Model Diagram

<img width="1371" alt="Screenshot 2021-11-15 at 16 49 37" src="https://user-images.githubusercontent.com/90717175/141821476-21101dbe-5544-4028-ab66-d50edafa72de.png">

### Nice-to-haves

- Users should receive an email whenever one of the following happens:
 - They sign up
 - They create a space
 - They update a space
 - A user requests to book their space
 - They confirm a request
 - They request to book a space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
- Users should receive a text message to a provided number whenever one of the following happens:
 - A user requests to book their space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
- A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
- Basic payment implementation though Stripe.

### Set up the live database

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE MakersBNB;
3. Connect to the database using the pqsl command \c MakersBNB;
4. Run the query we have save in the db/migrations directory - files 01-04 to setup users_table, spaces_table, availabilities_table, and bookings_table
### Set up the test database

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE MakersBNB_test;
3. Connect to the database using the pqsl command \c MakersBNB_test;
4. Run the query we have save in the db/migrations directory - files 01-04 to setup users_table, spaces_table, availabilities_table, and bookings_table

# Relational Drawing
![](../../../Downloads/relational drawing.jpg)

# Printed Database Relational Diagram
![](../../../Desktop/Screenshot 2021-11-15 at 20.21.41.png)

### Mockups

Mockups for MakersBnB are available [here](https://github.com/makersacademy/course/blob/main/makersbnb/makers_bnb_images/MakersBnB_mockups.pdf).
