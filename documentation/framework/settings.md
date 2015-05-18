---
layout: wiki
title: Settings Framework
description: ACE3 contains an extensive settings framework that allows you to tweak the modification without having to mess around with deleting pbos.
group: framework
order: 5
parent: wiki
---

ACE3 contains an extensive settings framework that allows you to tweak the modification without having to mess around with deleting pbos. These settings are all handled server side and broadcasted to the clients connecting to that server. This ensures that everyone playing on the server will have a uniform experience.

Part of this settings framework are global settings and client settings. Both use the same underlaying framework, with the difference that client settings can be adjusted by clients, where global settings can not.


## 1. How do they work

Settings are entries in the config that get translated to `missionnamespace` global variables. An example settings entry looks like this:

```c++
class ACE_module_sampleSetting {
    // Value
   value = 1;

    // Type (SCALAR, BOOL, STRING, ARRAY, COLOR)
    typeName = "SCALAR";

    // Force the setting?
    force = 0;

    // Does it appear on the options menu?
    isClientSettable = 1;

    // The following settings only apply when isClientSettable == 1
    // Stringtable entry with the setting name
    displayName = "$STR_ACE_Common_SettingName";

    // Stringtable entry with the setting description
    description = "$STR_ACE_Common_SettingDescription";

    // Stringtable entries that describe the options
    // Only applies if typeName == "SCALAR"; and is optional
    values[] = {"Disabled", "Enabled", "Only Cursor", "Only On Keypress", "Only Cursor and KeyPress"};
};
```

Settings are defined from the mods config but can be adjusted through the following methods:

* Optional config entries
* Mission side modules

## 2. Load order

The load order for the settings are:

* 1. Mod config
* 2. Server config
* 3. Mission config
* 4. Placed down mission modules

What this means is that at any the 3 points after the mod config it is possible to insert your adjusted settings and force those (optionally). This is a powerful tool for server admins, whom can ensure that everyone is using uniform settings across the board on their server. And it provides mission makers the ability to easily set settings for their mission, without creating a large dependency on ACE3; you do not have to place down mission modules.

## 3. How do I use them?

In the 'how do they work' chapter an example of settings was shown. This is the same for any settings config. The only difference is the location. For ACE3 modules, the settings are placed in the class `ACE_settings`. The same goes for the mission config.

The server config setting entries are done through our optional ACE_server.pbo, which can be found in the optionals folder of @ace. It also contains a `userconfig` folder, which inside contains the file `ace\serverconfig.hpp`. This is the location ACE3 settings are placed. There is no need for a sub class.

### 3.1 Getting all the settings!

ACE3 contains a lot of settings; for that reason tweaking everything to your liking manually can be quite a task. We have provided the option to export all settings in the editor (single-player). For this, follow these simple steps:

* Open the editor (single-player).
* Under modules (<kbd>F7</kbd>), find ACE, `Config Export [ACE]`.
* Place down the module, ensure that the allow parameter is set to yes.
* Press preview, once in game, press <kbd>Esc</kbd> and open the ACE3 Options dialog (top left)
* This is the dialog where you can modify client side settings. On the bottom left of it, you will now see a button called `Config Export`. Press it and a new dialog opens.
* You are now in the dialog that allows you to adjust all settings from ACE3. Tweak this to your liking.
* Once you are done tweaking, press the `Export` button and all settings will be copied to your clipboard.
* Paste the settings in your `serverconfig.hpp` file and you're done.

Note that the format copied to your clipboard by this can also be used in the mission config (`description.ext`), as long as they are in the class `ACE_Settings`.

```c++
class ACE_Settings {
    // add exported settings here
};
```


### 3.2 Loading up the server config

As stated before, the server config gets loaded through the optional `ACE_server.pbo`. This PBO is only required (and should only be used) on the server - clients do not need to have this! It is for this reason we have not signed this PBO. 

Load the `ACE_server.pbo` like any other addon on your server. It is advised to create an `@aceServer` mod folder with an `addons` sub folder where you would paste the `ACE_server.pbo` and load that through `-serverMod=@aceServer`.

