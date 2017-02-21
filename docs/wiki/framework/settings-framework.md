---
layout: wiki
title: Settings Framework
description: ACE3 contains an extensive settings framework that allows you to tweak the modification without having to mess around with deleting PBOs.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

ACE3 contains an extensive settings framework that allows you to tweak the modification without having to mess around with deleting PBOs. These settings are all handled server side and broadcasted to the clients connecting to that server. This ensures that everyone playing on the server will have a uniform experience.

Part of this settings framework are global settings and client settings. Both use the same underlaying framework, with the difference that client settings can be adjusted by clients, where global settings can not.


## 1. How do they work

Settings are entries in the config that get translated to `missionNamespace` global variables. An example settings entry looks like this:

```cpp
class ACE_Settings {
    class ACE_module_sampleSetting {
        // Following 2 entries are redundant if isClientSettable = 0
        displayName = "$STR_ACE_Common_SettingName";  // Stringtable entry with the setting name
        description = "$STR_ACE_Common_SettingDescription";  // Stringtable entry with the setting description

        isClientSettable = 1;  // Show in client options menu (0-no, 1-yes)
        typeName = "SCALAR";  // Type (BOOL/SCALAR/STRING/ARRAY/COLOR)
        value = 1;  // Value

        // Following entry is redundant if typeName is NOT "SCALAR"
        values[] = {"Disabled", "Enabled", "Only Cursor", "Only On Keypress", "Only Cursor and KeyPress"};  // (Optional) Stringtable entries that describe the options

        // Following entry is present only in export
        force = 0;  // Force the setting (0-no, 1-yes), exported settings are forced by default
    };
};
```

Settings are defined from the mod's config but can be adjusted through the following methods:

- Optional config entries
- Mission Parameters
- Mission modules


## 2. Load order

The load order for the settings are:

1. Mod Config
2. Server Config
3. Mission Config
4. Mission Paramaters
5. Placed Mission Modules

What this means is that at any the 4 points after the Mod Config it is possible to insert your adjusted settings and force those (optionally). This is a powerful tool for server admins; it will ensure that everyone is using uniform settings across the board on their server. And it provides mission makers the ability to easily set settings for their mission, without creating a large dependency on ACE3; you do not have to place down mission modules.


## 3. How do I use them?

In the '[how do they work](#how-do-they-work)' chapter an example of settings was shown. This is the same for any settings config. The only difference is the location. For ACE3 modules, the settings are placed in the class `ACE_Settings`. The same goes for the mission config.

The server config setting entries are done through our optional `ace_server.pbo`, which can be found in the optionals folder of `@ace`. It also contains a `userconfig` folder, which inside contains the file `ace\serverconfig.hpp`. This is the location where ACE3 settings are placed. There is no need for a sub-class. Once the settings file is updated everything should be copied to the `Arma 3\userconfig` folder. When loaded `ace_server.pbo` will try to read the settings from the following path `Arma 3\userconfig\ace\serverconfig.hpp`.

### 3.1 Exporting the settings

ACE3 contains a lot of settings, for that reason tweaking everything to your liking manually can be quite a task. We have provided the option to export all settings in the editor (single-player). For this, follow these simple steps:

- Open the editor (single-player).
- Under modules (<kbd>F7</kbd>), find ACE, `Allow Config Export [ACE]`.
- Place down the module, ensure that the `Allow` parameter is set to `Yes`.
- Press preview, once in the game, press <kbd>Esc</kbd> and open the ACE3 Options dialog (top left)
- This is the dialog where you can modify client side settings. On the bottom left of it, you will now see a button called `Config Export`. Press it and a new dialog opens.
- You are now in the dialog that allows you to adjust all settings from ACE3. Tweak this to your liking.
- Once you are done tweaking, press the `Export` button and all settings will be copied to your clipboard.
- Paste the settings in your `serverconfig.hpp` file and you're done.

Please note that in the `serverconfig.hpp` file there is no need for adding the `ACE_Settings` class.

#### Using the exported settings in the mission description.ext

Note that the format copied to your clipboard by this can also be used in the mission config (`description.ext`), as long as they are in the class `ACE_Settings`.

```cpp
class ACE_Settings {
    // Add exported settings here
};
```

#### 3.1.1 Notes

- If a setting is forced it cannot be changed further down the line, see `2. Load order` for the hierarchy.
- Client settings can be forced, include while exporting (the button is next to export on the UI)
- You can use `ACE_common_forceAllSettings` to force settings in a mission, it will lock **all** the settings (which are not already forced) to the values they are set in either modules or server config

Example of `ACE_common_forceAllSettings`:

```cpp
class ACE_Settings {
    class ACE_common_forceAllSettings {
        value = 1;
        typeName = "BOOL";
    };
};
```


### 3.2 Loading up the server config

As stated before, the server config gets loaded through the optional `ace_server.pbo`. This PBO is only required (and should only be used) on the server - clients do not need to have this! It is for this reason we have not signed this PBO.

Load the `ace_server.pbo` like any other addon on your server. It is advised to create an `@aceServer` mod folder with an `addons` sub folder where you would paste the `ace_server.pbo` and load that through `-serverMod=@aceServer`.


### 3.3 Changing ACE_settings dynamically with Mission Parameters

It is possible to change `ACE3 settings` via [Mission Parameters](https://community.bistudio.com/wiki/Arma_3_Mission_Parameters).
This can allow a single mission to be played with different realism settings.
They are read after all other configs but before modules. Mission Parameters are forced so they will override any module setting.

#### Basic Setup:
1. Add a Mission Parameter with the same name as an ace_setting
2. Add the `ACE_setting = 1;` flag
3. Add `values[]` and optionally `texts[]` to match the setting

<div class="panel callout">
    <h5>Please note:</h5>
    <p>For now only <code>BOOL</code> or <code>SCALAR</code> settings are supported.</p>
</div>

#### Example **description.ext**:
```cpp
class Params {
    class ace_medical_level { //This needs to match an ace_setting, this one is a "SCALAR"(number)
        title = "Medical Level"; // Name that is shown
        ACE_setting = 1; //Marks param to be read as an ace setting, without this nothing will happen!
        values[] = {1, 2}; //Values that ace_medical_level can be set to
        texts[] =  {"Basic", "Advanced"}; //Text names to show for values (Basic will set level to 1, Advanced will set level to 2)
        default = 2; //Default value used - Value should be in the values[] list
    };
    class ace_repair_addSpareParts { //This ia a "BOOL"
        title = "$STR_ACE_Repair_addSpareParts_name"; //You can use ACE's stringtables
        ACE_setting = 1;
        values[] = {0, 1}; //setting is a BOOL, but values still need to be numbers, so 0 is false, 1 is true
        texts[] =  {"False", "True"};
        default = 1;
    };
};
```

Review the [biki](https://community.bistudio.com/wiki/Arma_3_Mission_Parameters) for more information on setting up Mission Parameters.
