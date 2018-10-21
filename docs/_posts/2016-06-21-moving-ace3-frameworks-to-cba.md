---
title: Moving ACE3 frameworks to CBA
description: We are moving ACE3 functionality to CBA. Everyone can use those functions now without needing a dependency on ACE
parent: posts
image: /img/news/160601_cbaPost.jpg
author: Glowbal
layout: post
---

The upcoming release of ACE3 is going to be version 3.6.0. This release consists of bug fixes, improvements upon existing functionality and moving large parts of our internal frameworks to [CBA A3](https://github.com/CBATeam/CBA_A3){:target="_blank"}. This post is all about that last part. So what does this mean? 

<!--more-->

## Motivation behind moving this functionality

Within ACE3 we have built some awesome and useful frameworks that have helped us develop consistent and high quality sqf components. The ACE3 and CBA teams both believe that such frameworks can benefit the Arma community as a whole. Putting such frameworks in CBA means that other mods will have access to the same internal functionality that ACE3 does, without having to depend upon ACE3 itself, but just CBA.


## For regular users

If you are a regular user this only means that you will need to update your CBA installation to the latest version (Beginning from [CBA 2.4.0](https://github.com/CBATeam/CBA_A3/releases/tag/v2.4.0.160530){:target="_blank"}). This is something we recommend doing on every CBA and or ACE3 release. And that's it. You as an user should see no difference. Feel free to continue reading the rest of this post, though it is meant for developers.

## For developers

If you are a developer, this change will have a more significant impact. A lot of our framework functions are now wrappers around CBA functionality and should no longer be used in any existing modifications or scripts. These changes will be part of [CBA 2.4.0](https://github.com/CBATeam/CBA_A3/releases/tag/v2.4.0.160530){:target="_blank"} and upwards. In accordance with our deprecation policy, all of those wrappers are going to be removed in 2 minor (not hotfixes) updates from 3.6.0, which will be version 3.8.0. This means that from version 3.8.0 all the wrappers won't be usable anymore thus leading to script errors and broken mods/missions. 

So which frameworks are being moved? They are the core parts that are used within our entire project:

**Events Framework:**

|ACE function name | CBA function name|
|------------ | -------------|
|ace_common_fnc_addEventHandler | CBA_fnc_addEventHandler|
|ace_common_fnc_removeEventHandler | CBA_fnc_removeEventHandler|
|ace_common_fnc_globalEvent | CBA_fnc_globalEvent|
|ace_common_fnc_localEvent | CBA_fnc_localEvent|
|ace_common_fnc_serverEvent | CBA_fnc_serverEvent|
|ace_common_fnc_targetEvent | CBA_fnc_targetEvent|
|ace_common_fnc_objectEvent | CBA_fnc_targetEvent (includes functionality from objectEvent)|
|ace_common_fnc_removeAllEventHandlers| *removed* |

**Functionality we build on top of the CBA PerFrameHandler:**

|ACE function name | CBA function name|
|------------ | -------------|
|ace_common_fnc_waitAndExecute | CBA_fnc_waitAndExecute|
|ace_common_fnc_waitUntilAndExecute | CBA_fnc_waitUntilAndExecute|
|ace_common_fnc_execNextFrame | CBA_fnc_execNextFrame|

**Config functions:**
*(note: CBA functions return type config in comparison to ACE3's return type string)*

|ACE function name | CBA function name|
|------------ | -------------|
|ace_common_fnc_getConfigType | CBA_fnc_getItemConfig|
|ace_common_fnc_getConfigTypeObject | CBA_fnc_getObjectConfig|

**Binocular Magazines functions:**

|ACE function name | CBA function name|
|------------ | -------------|
|ace_common_fnc_binocularMagazine | CBA_fnc_binocularMagazine|
|ace_common_fnc_removeBinocularMagazine | CBA_fnc_removeBinocularMagazine|

This update does not mean that if your mod depends on any of this functionality it is going to break right away. We are exposing the functions in a similar fashion as we have previously. Any usage of any function that is deprecated, will result in a warning message being printed in the RPT log file. This message shows what function was used, what it was replaced by and when the used function is no longer going to be available.

### Replacing deprecated functionality

It is recommended to replace any functionality that is deprecated with its replacement as soon as possible. If you are in need of any help with moving from deprecated ACE3 functionality to it's replacement, please visit our [Public Slack team at https://slackin.ace3mod.com](https://slackin.ace3mod.com){:target="_blank"}.


## ACE3 Events

As part of moving the events framework to CBA, events added in ACE3 are being renamed to avoid conflict with other addons using CBA's events framework - it also provides us an opportunity to standardise our event naming convention.

Any code currently using the old ACE3 event functions will still function correctly as the wrappers include code to update old event names to new event names (using entries found in config class ACE_newEvents). However, when you are transfering code over to the CBA system remember to update the event names if you are making use of our events.

---

We hope you like the new frameworks made publicly available in CBA A3 and without needing a dependency on ACE3. Feel free to leave your feedback either on the [CBA BI forum thread](https://forums.bistudio.com/topic/168277-cba-community-base-addons-arma-3/){:target="_blank"}, the [ACE3 BI forum thread](https://forums.bistudio.com/topic/181341-ace3-a-collaborative-merger-between-agm-cse-and-ace/){:target="_blank"} or in our [public chat](https://slackin.ace3mod.com){:target="_blank"}.
