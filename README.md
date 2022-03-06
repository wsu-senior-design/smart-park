# smart-park
This repository contains the files used for  all code written by the **Computer Science** team of **Smart Park**.

The purpose of our project is to create a mobile iOS application for students to view parking spaces in real time and see what spaces are available or taken.


For the **2022 Spring Semester** we have decided to *revamp* the iOS app.  The old repo from the **2021 Fall Semester** can be found here,
 - https://github.com/wsu-senior-design/smartparking-deprecated 
   - We have sucessfully updated parking spaces from physical transceiver all the way to the mobile iOS app. This repository contains the fully functioning code for the prototype.

## Changelog
 - The current iOS app now contains functionality from the MapKit library to have a UI similar to that of Apple Maps.
 - Arduino code written to connect transceivers to the ChirpStack gateway.
## To-do
- Pull logic from the old iOS app to make API calls to ThingsBoard and update parking spaces.
  - Reauthenticate bearer token.
- Optimize logic for dynamically creating parking space annotations within the iOS app.
- Dockerize base Django/React files for web application.
  - Create customizable dashboards for data analytics.

## UML diagrams

```mermaid
sequenceDiagram
*Transceiver -->> Chirpstack Gateway: Base64 Encoded Payload
Chirpstack Gateway-->>Thingsboard Database: Base64 Decoded Payload

User->>iOS App: Can I see Parking Lot X?
iOS App-->> Thingsboard Database: What is the list of parking spaces in X?
Thingsboard Database -->> iOS App: List of Available/Unavailable parking spaces.
iOS App->>User: Parking Lot X View (Updated every N seconds)
```
*Transceiver - hardware sitting in a single parking space.