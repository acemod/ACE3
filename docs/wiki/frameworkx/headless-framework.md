---
layout: wiki
title: Headless Framework
description: Explains how to set-up the Headless component.
group: framework
order: 5
parent: wiki
mod: acex
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Overview

The system works on the basis of unit spawning, when a unit is spawned it will schedule a rebalance after the specified delay (described below), after the delay rebalance runs on all groups. Groups already local to any Headless Client are skipped, also those blacklisted (described below) and in the same group as any player are skipped. All others applicable for a transfer are then transferred in round-robin fashion, equalizing the number of groups on each Headless Client (most effective with 3 Headless Clients).

In an event when a Headless Clients disconnects during the mission (is kicked, loses connection or similar) all units local to that Headless Client are automatically transferred to the server by Arma 3 and a full rebalance will be forced, meaning all units, including those already on other Headless Clients, are transferred again to equalize the load. Same happens when a Headless Client connects during the mission.

A server admin or mission maker can also define the minimal delay between transfers, in order to minimize the desync due to changes in locality of many units. Log can also be enabled to keep track of the transfers (_note: it is counting groups and not units_). That can be set through [ACE3 Settings](../framework/settings-framework.html) or a mission module.

### 1.1 End Mission

Since ACEX v3.1.0 Headless component supports automatic ending of mission when Headless Clients are connencted but no players are present. It is basically `server.cfg` setting `persistent = 1;` with Headless Client support.

As of ACEX v3.2.0 this feature can also be enabled without enabling AI distribution (overall setting).


## 2. Scripting

### 2.1 Disable Transferring for a Group

To prevent a group from transferring to a Headless Client use the following line on a group leader (or every unit in a group in case group leader may not spawn):

```cpp
this setVariable ["acex_headless_blacklist", true];
```


## 3. Limitations

Some Arma 3 features are incompatible, this is up to BI to add support. Disable transferring for units using the following features to ensure expected functionality:

- Vanilla Support Modules (will stop functioning)

Additionally, groups will not be transferred due to lack of support if they:

- Have waypoints with synchronized triggers (waypoint would not change status based on trigger condition) (added in ACEX v3.2.0)
