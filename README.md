# Pursuit-Core-iOS-Firebase-Auth-Lab

Build an app with the following components:

## Login View Controller

This VC should allow the user to log in or create a new account.  It should have

- An email field
- A password field
- A login button
- A create account button

Logging in or creating an account should segue to a Profile View Controller.

## Profile View Controller

This VC should display the user's profile with the following information:

- Profile Picture
- Display Name
- Phone Number
- Email

Have all of the fields by editable.  A `createProfileChangeRequest()` will be helpful.

Additionally, give the user an option to delete their account.  This should return the user to the Login View Controller.  Verify that their account was deleted on Firebase.
