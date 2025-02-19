# Parking Ticket System

## Overview
The **Parking Ticket System** is a Flutter-based mobile application that simulates a police officer issuing a parking ticket. The app allows users to enter vehicle details, parking duration, and officer details. It then checks if the parking time has expired and generates a ticket with a fine if necessary.

## Features
- Input details for the parked car (make, model, color, license number, parked minutes).
- Input the purchased parking time from the parking meter.
- Input police officer details (name and badge number).
- Check if the parking time has expired and calculate the fine.
- Display a ticket report with details of the violation and fine.

## How It Works
1. The user enters vehicle details in the input form.
2. The user enters the number of purchased parking minutes.
3. The police officer's name and badge number are also provided.
4. The app compares the parked time with the purchased time.
5. If the parked time exceeds the purchased time, a fine is calculated.
   - The first hour fine is **$25.00**.
   - Each additional hour costs **$10.00**.
6. The generated ticket is displayed in the app.

## Running the Project
1. Clone the repository.
2. Run `flutter pub get` to install dependencies.
3. Start the application with `flutter run`.
4. Fill in the required details and generate a ticket.

This project demonstrates **Flutter forms, state management, and logic processing**.

