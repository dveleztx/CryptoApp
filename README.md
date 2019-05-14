# CryptoApp

## Encryption

Encryption Algorithms used:
- Base64
- ROT13
- Base64 + ROT13

## Swift Files
- **EncryptionData.swift** - Has a struct for the ROT13 object
- **CryptoViewController.swift** - Where all the main logic occurs, takes in the text from the *UITextField*, has the multiSwitches to keep track of which algos are being used, then sends the data over to *ResultsViewController*. The Base64 function is in this file, need to refactor to put it in the appropriate place.
- **ResultsViewController.swift** - Where the string is captured and then displayed

## Author
David V
