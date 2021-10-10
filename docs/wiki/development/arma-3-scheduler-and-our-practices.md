---
layout: wiki
title: Arma 3 Scheduler and our Practices
description: Explanation for certain ACE3 practices and rules regarding scheduled and unscheduled execution in Arma.
group: development
parent: wiki
order: 8
---

## 1. Terminology

### 1.1 Frame
A single rendered frame of Arma 3 or a single simulation frame for dedicated servers and headless clients.

### 1.2 Scheduled Environment
Functions and scripts run in the scheduled environment when they are executed by one of the following:

* `spawn`
* `execVM`
* `call` from a function running in *scheduled* environment
* functions (not commands) executed with `remoteExec`
* scripts called from `addAction`
* CfgFunctions postInit

They can be suspended by `waitUntil`, `sleep` or `uiSleep`. To check if a function runs in the scheduled environment you can use `canSuspend`.

### 1.3 Unscheduled Environment
Code running in the unscheduled environment uses linear execution, that means it will always run from start to finish within one frame, without any pauses. The following will always be executed in the unscheduled environment:

* Event Handlers
* CBA Per Frame Handlers (PFHs)
* CBA Extended Event Handlers (XEHs)
* functions called with `CBA_fnc_directCall`
* `call` from a function running in *unscheduled* environment
* functions and commands executed with `remoteExecCall`


## 2. What is the scheduler and why do I care?
The Arma 3 script scheduler basically gives a fair-share execution to all running scripts, FSMs, and SQS files running on any given client or server at any given time. See the [Biki article](https://community.bistudio.com/wiki/Biki2.0:Performance_Considerations){:target="_blank"} for a in-depth explanation of this. What this basically means though, is that all scripts get a fair share; this also means scheduled execution is drastically affected by other mods that use scheduled execution. For example, if 2 different spawn's are running in a tight loop of `while {true} do {...};`, they will both get exactly 50% of the scheduling time.

With the way mission makers and mod makers generally use `spawn`/`execVM`, this means you're actually getting drastically less execution time in the scheduled environment than you might think. This leads to visible delay issues all the way up to massive delay on execution. You can easily test and prove this by looping spawns and watching the execution times extend.

### What does this all mean?
It means we need to live outside of the spawn execution as much as possible. There are 2 places that the majority of our functionality should stem from, which means that as long as we strictly always perform calls between functions, we are executing within the same frame. If our execution is either stemming from the Per Frame Handlers, or any default Extended Event Handlers, than we can guarantee execution within a single frame. *ANY OTHER CIRCUMSTANCE IS NOT GUARANTEED.*

The scheduler will also actually halt your script mid-execution, usually at the end of a given control block, and pause you to yield to other scripts. This can lead to drastically incorrect results when performing calculations and unexpected behaviours. For example, try the following code. Even though it doesn't seem logical, it will show a hint.

```cpp
myVar = true;
0 spawn {
    while {true} do {
        if (myVar) then {
            if (!myVar) then {
                hint "hi";
            };
        };
    };
};
0 spawn {
    while {true} do {
        myVar = !myVar;
    };
};
```


## 3 Design Patterns
Because we are attempting to always run to completion, execution occurs from 2 places: PFHs and event handlers. In both cases, we wish our code to run to completion. This takes a change in mind set for design to ensure you're executing that way. In a nutshell though, this all distills down to the fact that you will always call other chunks of code; nothing will ever be spawned off. The only circumstance this really becomes a problem is for waiting or delay, however, thanks to some rather new CBA functions we can circumvent this issue.


### 3.1 Rules of thumb for unscheduled code design:
* If you want to run code regularily in a loop, use a PFH. Make sure that PFH gets removed once it's no more needed. Not every PFH needs to run with a delay of 0 (so every frame), but everything that's directly seen by the user (visual feedback etc.) should run instantly.
* If you want to run code on certain conditions, check if it triggers an event. If it does, make an event handler for it instead of constantly checking that condition.
* If you run multiple functions on a condition you defined, consider creating a custom CBA event and add those functions as event handlers.
* If there is no event available, you can use `CBA_fnc_waitUntilAndExecute`, which is the unscheduled equivalent for the `waitUntil` command - it even is "frame perfect" too!
* If you need to wait a certain time, use `CBA_fnc_waitAndExecute`, which will execute your code unscheduled after a given time.


### 3.2 ACE3 General Rules
These rules follow from the rules of thumb above:

* Always use `call` whenever possible. You should be calling functions chains exclusive and not be relying on `spawn`/`execVM` ever. All code should be a chain of execution which is traceable, and not triggered between separate threads.
* `waitUntil` and `sleep` are banned. If you need to use them, use `CBA_fnc_waitUntilAndExecute` and `CBA_fnc_waitAndExecute` instead.
* If you need to run code regularily, you should utilize a PFH. `spawn`/`execVM` are subject to the Arma 3 scheduler and as such, cannot be relied upon. In order to give your players a consistent gameplay experience, you need to have total control over how and when all of your code runs.
* PFHs with a delay of 0 should be utilized at all possible times when the player can see the result of whatever the code is. This applies to missile guidance, bullets, wind, optics, interactive UI, HUDs, rendering and so on. Only if something is not directly visible for the player a larger delay can be used.


### 3.3 Code Examples

#### 3.3.1 Per Frame Handler
See: [https://github.com/CBATeam/CBA_A3/blob/master/addons/common/fnc_addPerFrameHandler.sqf](https://github.com/CBATeam/CBA_A3/blob/master/addons/common/fnc_addPerFrameHandler.sqf) for more details.

```cpp
[{code} , delay, [params]] call CBA_fnc_addPerFrameHandler;
```


#### 3.3.2 WaitAndExecute
See: [https://github.com/CBATeam/CBA_A3/blob/master/addons/common/fnc_waitAndExecute.sqf](https://github.com/CBATeam/CBA_A3/blob/master/addons/common/fnc_waitAndExecute.sqf) for more details.

```cpp
[{delayed code}, [params], delay] call CBA_fnc_waitAndExecute;
```


#### 3.3.3 WaitUntilAndExecute
See: [https://github.com/CBATeam/CBA_A3/blob/master/addons/common/fnc_waitUntilAndExecute.sqf](https://github.com/CBATeam/CBA_A3/blob/master/addons/common/fnc_waitUntilAndExecute.sqf) for more details.

```cpp
[{condition}, {code}, [params]] call CBA_fnc_waitUntilAndExecute;
```
