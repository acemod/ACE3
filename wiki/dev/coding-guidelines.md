---
layout: wiki
title: Coding Guidelines
group: dev
parent: wiki
order: 1
---

## Table of Contents

  1. [Modules](#how-to-create-a-new-module)
  2. [Macros](#macro-usage)
  3. [Events](#event-handlers)
  4. [Hashes](#hashes)


## How to create a new module

  1. Copy the structure from `extras\blank` to the `addons\` folder and name it what you wish the new module to be named.
  2. Edit `script_component.hpp`, change the `COMPONENT` definition to the name of the module. Also edit each of the `DEBUG` definitions to be the name of the module (for example, `DEBUG_SETTINGS_BLANK` should be `DEBUG_SETTINGS_BALLS` for module balls)
  3. Edit the `script_component.hpp` file in the the `functions` directory to match the path of the new module, for example `#include "\z\ace\addons\blank\script_component.hpp"` for module called balls should now be `#include "\z\ace\addons\ballls\script_component.hpp"`.
  4. The module is now prepared for development


### Function Definitions

Functions should be created in the `functions\` subdirectory, named `fnc_FunctionName.sqf`. They should then be indexed via the `PREP(FunctionName)` macro in the `XEH_preInit.sqf` file.
The `PREP` macro allows for CBA function caching, which drastically speeds up load times.
**Beware though that function caching is enabled by default and as such to disable it you need to `#define DISABLE_COMPILE_CACHE` above your `#include "script_components.hpp"` include!**

Every function should have a header of the following format:

```js
/*
 * Author: [Name of Author(s)]
 * [Description]
 *
 * Arguments:
 * 0: The first argument <STRING>
 * 1: The second argument <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * _bool = ["something", player] call ace_common_fnc_imanexample
 *
 * Public: [Yes/No]
 */
```


## Macro Usage

### Module/PBO specific Macro Usage
The family of `GVAR` macro's define global variable strings or constants for use within a module. Please use these to make sure we follow naming conventions across all modules and also prevent duplicate/overwriting between variables in different modules. The macro family expands as follows, for the example of the module `'balls'`:

 * `GVAR(face)` is `ace_balls_face`
 * `QGVAR(face)` is `"ace_balls_face"`
 * `EGVAR(balls,face)` is `ace_balls_face`
 * `EGVAR(leg,face)` is `ace_leg_face`
 * `QEGVAR(leg,face)` is `"ace_leg_face"`

There also exists the FUNC family of Macros

  * `FUNC(face)` is `ace_balls_fnc_face` or the call trace wrapper for that function.
  * `EFUNC(balls,face)` is `ace_balls_fnc_face` or the call trace wrapper for that function.
  * `EFUNC(leg,face)` is `ace_leg_fnc_face` or the call trace wrapper for that function.
  * `DFUNC(face)` is `ace_balls_fnc_face` and will ALWAYS be the function global variable.
  * `DEFUNC(leg,face)` is `ace_leg_fnc_face` and will ALWAYS be the function global variable.
  * `QFUNC(face)` is `"ace_balls_fnc_face"`
  * `QEFUNC(leg,face)` is `"ace_leg_fnc_face"`

The `FUNC` and `EFUNC` macros should NOT be used inside `QUOTE` macros if the intention is to get the function name or assumed to be the function variable due to call tracing (see below). If you need to 100% always be sure that you are getting the function name or variable use the `DFUNC` or `DEFUNC` macros. For example `QUOTE(FUNC(face)) == "ace_balls_fnc_face"` would be an illegal use of `FUNC` inside `QUOTE`.

Using `FUNC` or `EFUNC` inside a `QUOTE` macro is fine if the intention is for it to be executed as a function.

#### FUNC Macros, Call Tracing, and Non-ACE/Anonymous Functions

ACE implements a basic call tracing system that can dump the call stack on errors or wherever you want. To do this the `FUNC` macros in debug mode will expand out to include metadata about the call including line numbers and files. This functionality is automatic with the use of calls via `FUNC` and `EFUNC`, but any calls to other functions need to use the following macros:

  * `CALLSTACK(functionName)` example: `[] call CALLSTACK(cba_fnc_someFunction)`
  * `CALLSTACK_NAMED(function,functionName)` example: `[] call CALLSTACK_NAMED(_anonymousFunction,'My anonymous function!')`

These macros will call these functions with the appropriate wrappers and enable call logging into them (but to no further calls inside obviously).

### General Purpose Macros

Link to the [CBA `script_macros_common.hpp`](https://gist.github.com/commy2/9ed6cc73fbe6a2b3f4e1)

* `QUOTE()` is utilized within configuration files for bypassing the quote issues in configuration macros. So, all code segments inside a given config should utilize wrapping in the `QUOTE()` macro instead of direct strings. This allows us to use our macros inside the string segments, such as `QUOTE(_this call FUNC(balls))`.

#### setVariable, getVariable family macros

  * `GETVAR(player,MyVarName,false)`  
    `player getVariable ["MyVarName", false]`
  * `GETMVAR(MyVarName,objNull)`  
    `missionNamespace getVariable ["MyVarName", objNull]`
  * `GETUVAR(MyVarName,displayNull)`  
    `uiNamespace getVariable ["MyVarName", displayNull]`
  * `SETVAR(player,MyVarName,127)`  
    `player setVariable ["MyVarName", 127]`
  * `SETPVAR(player,MyVarName,127)`  
    `player setVariable ["MyVarName", 127, true]`
  * `SETMVAR(MyVarName,player)`  
    `missionNamespace setVariable ["MyVarName", player]`
  * `SETUVAR(MyVarName,_control)`  
    `uiNamespace setVariable ["MyVarName", _control]`


## Event Handlers

Event handlers in ACE are implemented through our event system. They should be used to trigger or allow triggering of specific functionality.

The commands are listed below.

  * `[eventName, eventCodeBlock] call ace_common_fnc_addEventHandler` adds an event handler with the event name and returns the event handler id.
  * `[eventName, args] call ace_common_fnc_globalEvent` calls an event with the listed args on all machines, the local machine, and the server.
  * `[eventName, args] call ace_common_fnc_serverEvent` calls an event just on the server computer (dedicated or self-hosted).
  * `[eventName, targetObject(s), args] call ace_common_fnc_targetEvent` calls an event just on the targeted object or list of objects.
  * `[eventName, args] call ace_common_fnc_localEvent` calls an event just on the local machine, useful for inter-module events.

Events can be removed or cleared with the following commands.

  * `[eventName, eventHandlerId] call ace_common_fnc_removeEventHandler` will remove a specific event handler of the event name, using the ID returned from `ace_common_fnc_addEventHandler`.
  * `[eventName] call ace_common_fnc_removeAllEventHandlers` will remove all event handlers for that type of event.

More information on the [ACE Events System](https://github.com/KoffeinFlummi/ACE3/wiki/ACE-Events-System) page.

## Hashes

Hashes are a variable type that store key value pairs. They are not implemented natively in SQF, so there are a number of macros and functions for their usage in ACE. If you are unfamiliar with the idea, they are similar in function to `setVariable`/`getVariable` but do not require an object to use.

The following example is a simple usage using our macros which will be explained further below.

```
_hash = HASHCREATE;
HASH_SET(_hash, "key", "value");
if(HASH_HASKEY(_hash, "key")) then {
    player sideChat format["val: %1", HASH_GET(_hash, "key"); // will print out "val: value"
};
HASH_REM(_hash, "key");
if(HASH_HASKEY(_hash, "key")) then {
    // this will never execute because we removed the hash key/val pair "key"
};
```

A description of the above macros is below.

* `HASHCREATE` is used to create an empty hash.
* `HASH_SET(hash, key, val)` will set the hash key to that value, a key can be anything, even objects.
* `HASH_GET(hash, key)` will return the value of that key (or nil if it doesn't exist).
* `HASH_HASKEY(hash, key)` will return true/false if that key exists in the hash.
* `HASH_REM(hash, key)` will remove that hash key.

### Hashlists

A hashlist is an extension of a hash. It is a list of hashes! The reason for having this special type of storage container rather than using a normal array is that an array of normal hashes that are are similar will duplicate a large amount of data in their storage of keys. A hashlist on the other hand uses a common list of keys and an array of unique value containers. The following will demonstrate it's usage.

```
_defaultKeys = ["key1","key2","key3"];
// create a new hashlist using the above keys as default
_hashList = HASHLIST_CREATELIST(_defaultKeys);

//lets get a blank hash template out of this hashlist
_hash = HASHLIST_CREATEHASH(_hashList);

//_hash is now a standard hash...
HASH_SET(_hash, "key1", "1");

//to store it to the list we need to push it to the list
HASHLIST_PUSH(_hashList, _hash);

//now lets get it out and store it in something else for fun
//it was pushed to an empty list, so it's index is 0
_anotherHash = HASHLIST_SELECT(_hashList, 0);

// this should print "val: 1"
player sideChat format["val: %1", HASH_GET(_anotherHash, "key1")];

//Say we need to add a new key to the hashlist 
//that we didn't initialize it with? We can simply
//set a new key using the standard HASH_SET macro
HASH_SET(_anotherHash, "anotherKey", "another value");
```

As you can see above working with hashlists are fairly simple, a more in depth explanation of the macros is below.

* `HASHLIST_CREATELIST(keys)` creates a new hashlist with the default keys, pass [] for no default keys.
* `HASHLIST_CREATEHASH(hashlist)` returns a blank hash template from a hashlist.
* `HASHLIST_PUSH(hashList, hash)` pushes a new hash onto the end of the list.
* `HASHLIST_SELECT(hashlist, index)` returns the hash at that index in the list.
* `HASHLIST_SET(hashlist, index, hash)` sets a specific index to that hash.

#### A note on pass by reference and hashes

Hashes and hashlists are implemented with SQF arrays, and as such they are passed by reference to other functions. Remember to make copies (using the + operator) if you intend for the hash or hashlist to be modified with out the need for changing the original value.