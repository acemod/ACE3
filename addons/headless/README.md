ace_headless
============

Adds automatic passing of AI groups to (up to 3) Headless Clients.
- Automatic Headless Client recognition
- Event-based transferring (on unit spawn, Headless Client connect and disconnect)
- Round-robin transferring when more than 1 Headless Client is present
- Mission makers can use the following to prevent a group from transferring to a Headless Client:
    `this setVariable ["acex_headless_blacklist", true, true];`
