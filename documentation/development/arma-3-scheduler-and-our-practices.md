---
layout: wiki
title: Arma 3 Scheduler And Our Practices
group: development
parent: wiki
order: 8
---

## 1. Terminology

### 1.1 Frame
A single rendered frame of Arma 3.

### 1.2 Scheduled Space

This refers to execution would is ruled by the Arma 3 default script scheduling engine. This would include:

* spawn
* execVM 

### 1.3 Unscheduled Space
This refers to execution which is linear; what this means is that the code will run to completion prior to executing the current frame. It must complete, but is guaranteed to run within a given frame.

* perFrameHandler
* Extended_EventHandlers
* addEventHandler


## 2. What is the scheduler and why do I care?

BIKI Article: https://community.bistudio.com/wiki/Biki2.0:Performance_Considerations

The Arma 3 script scheduler basically gives a fair-share execution to all running scripts, FSMs, and SQS files running on any given client or server at any given time. See the BIKI article for a in-depth explanation of this. What this basically means though, is that all scripts get a fair share; this also means scheduled execution is drastically affected by other poorly written mods. For example, if 2 different spawn's are running in a tight loop of `do { foo } while (true);`, they will both get exactly 50% of the scheduling time. 

With the way mission makers and mod makers generally use spawn/execVM, this means you're actually getting drastically less execution time in the scheduled environment than you might think. This leads to visible delay issues all the way up to massive delay on execution. You can easily test and prove this by looping spawns and watching the execution times extend. 

What does this all mean? It means we need to live outside of the spawn execution as much as possible. There are 2 places that the majority of our functionality should stem from, which means that as long as we strictly always perform calls between functions, we are executing within the same frame. If our execution is either stemming from the perFrameHandlers, or any default Extended_EventHandlers, than we can guarantee execution within a single frame. *ANY OTHER CIRCUMSTANCE IS NOT GUARANTEED.*

The scheduler will also actually halt your script mid-execution, usually at the end of a given control block, and pause you to yield to other scripts. This can lead to drastically incorrect results when performing calculations. Again, this is the reason we want all our given code to run to completion in a single given frame.

## 3 Design Patterns

Because we are attempting to always run to completion; execution occurs from 2 places. Either PFH handles or event handlers; in both cases, we wish our code to run to completion. This takes a change in mind set for design to ensure your executing that way. In a nutshell though, this all distills down to the fact that you will always call other chunks of code; nothing will ever be spawned off. The only circumstance this really becomes a problem is for waiting or delay. If designed correctly, though, you can avoid those circumstances. 

Rules of thumb for component design:

* If you need to wait for a value, don't wait, use a CBA event! This means everything should be designed and written with an event-driven model in mind.
* If you have to wait, use a PFH delay/diag_tickTime check.


### 3.1 PFH-Design Pattern

Line Notes:
 
* PerFrameHandlers should be self-removing. If a PFH is no longer needed, it is responsible for removing itself.



### 3.2 ACE3 General Rules

* Always use call whenever possible. We should be calling functions chains exclusive and not be relying on spawn/execVM ever. Consider spawn/execVM banned without good reason. All code should be a chain of execution which is traceable, and not triggered between seperate threads.
* waitUntil and sleep are banned. If you need to use them, use scheduled delay execution instead.  **Reasoning: Sleep/waitUntil surrender about 5x the scheduler time than even normal execution does.**
* If we need a spawn or exec, we should utilize the perFrame scheduler. Spawn/execVM are subject to the Arma 3 scheduler and as such, cannot be relied upon. In order to give our players a consistent gameplay experience, we need to have total control over how and when all of our code runs.
* PFH should be utilized at all possible times when the player can see the result of whatever the code is. This applies to missile guidance, bullets, wind, optics, interactive UI, HUD's, and rendering. We should only consider scheduled execution if the code is running out of the visual range of the player. 


### 3.3 Code Examples

#### 3.3.1 Generic PFH functions
See: https://dev.withsix.com/docs/cba/files/common/fnc_addPerFrameHandler-sqf.html for more details. 

```c++
[{ code } , delayTime, [ARGS] ] call CBA_fnc_addPerFrameHandler;
```


#### 3.3.2 PFH Wait

```c++
DFUNC(myDelayedFunction) = {
    // Our argument array is passed in a PFH as select 0
    _args = _this select 0;
    
    // Print our arguments
    diag_log text format["I received: %1", (_args select 0)];
    
    // Delete this PFH, so it is only executed once
    [_this select 1] call CBA_fnc_removePerFrameHandler;
};

// This runs the PFH once every 5 seconds, with the variable array ["balls"] being passed in
// This executes FUNC(myDelayedFunction), that could also be a { code } block.
// Parameter 2 is the delay (in seconds) for a PFH. This is "execute every N seconds", 0 will be every frame.
[FUNC(myDelayedFunction), 5, ["balls"] ] call CBA_fnc_addPerFrameHandler;
```
