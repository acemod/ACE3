---
layout: wiki
title: Coding Guidelines
description:
group: development
parent: wiki
order: 1
---


## 1. Naming Conventions

### 1.1. Variable Names
#### 1.1.1. Global Variable naming
All global variables must start with the ACE prefix followed by the component, separated by underscores. Global variables may not contain the fnc_ prefix if the value is not callable code.

Example: `ACE_Component_myVariableName`

_For ACE this is done automatically through the usage of the GVAR macro family._

#### 1.1.2. Function naming
All functions shall use ACE and the component name as a prefix, as well as the fnc_ prefix behind the component name.

Example: `PREFIX_COMPONENT_fnc_functionName`

_For ACE this is done automatically through the usage of the PREP macro_

### 1.2. Files & Config

#### 1.2.1. SQF File extension
Files containing sqf scripts will always have a file name extension of ".sqf".

#### 1.2.2. Header files
All header files will always have the file name extension of `.hpp`.

#### 1.2.3. Own SQF File
All functions shall be put in their own .sqf file.

#### 1.2.4. Config elements
Config files will be split up into different header files, each with the name of the config and be included in the `config.cpp` of the component.
Example:
    #include "ACE_Settings.hpp"
And in `ACE_Settings.hpp`:
```
class ACE_Settings {
    // Content
};
```

### 1.3. Stringtable
All text that will be displayed to a user shall be defined in a `stingtable.xml` file for multi-language support.

* There will not be any empty stringtable language values.
* All stringtables will follow the format as specified by Tabler and the translation guidelines from .


## 2. Macro Usage

### 2.1. Module/PBO specific Macro Usage
The family of `GVAR` macro's define global variable strings or constants for use within a module. Please use these to make sure we follow naming conventions across all modules and also prevent duplicate/overwriting between variables in different modules. The macro family expands as follows, for the example of the module 'balls':


| Macros |  Expands to |
| -------|---------|
| `GVAR(face)` | ace_balls_face |
|`QGVAR(face)` | "ace_balls_face" |
| `EGVAR(balls,face)` | ace_balls_face |
| `EGVAR(leg,face)` | ace_leg_face |
| `QEGVAR(leg,face)` | "ace_leg_face" |

There also exists the FUNC family of Macros:

| Macros  |  Expands to |
| -------|---------|
|`FUNC(face)` | ace_balls_fnc_face or the call trace wrapper for that function.|
|`EFUNC(balls,face)` | ace_balls_fnc_face or the call trace wrapper for that function.|
|`EFUNC(leg,face) `| ace_leg_fnc_face or the call trace wrapper for that function.|
|`DFUNC(face)` | ace_balls_fnc_face and will ALWAYS be the function global variable.|
|`DEFUNC(leg,face)` | ace_leg_fnc_face and will ALWAYS be the function global variable.|
|`QFUNC(face)` | "ace_balls_fnc_face" |
|`QEFUNC(leg,face)` | "ace_leg_fnc_face" |

The `FUNC` and `EFUNC` macros should NOT be used inside `QUOTE` macros if the intention is to get the function name or assumed to be the function variable due to call tracing (see below). If you need to 100% always be sure that you are getting the function name or variable use the `DFUNC` or `DEFUNC` macros. For example `QUOTE(FUNC(face)) == "ace_balls_fnc_face"` would be an illegal use of `FUNC` inside `QUOTE`.

Using `FUNC` or `EFUNC` inside a `QUOTE` macro is fine if the intention is for it to be executed as a function.

#### 2.1.1. FUNC Macros, Call Tracing, and Non-ACE3 /Anonymous Functions

ACE3 implements a basic call tracing system that can dump the call stack on errors or wherever you want. To do this the `FUNC` macros in debug mode will expand out to include metadata about the call including line numbers and files. This functionality is automatic with the use of calls via `FUNC` and `EFUNC`, but any calls to other functions need to use the following macros:

| Macro  | example |
| -------|---------|
|`CALLSTACK(functionName)` | `[] call CALLSTACK(cba_fnc_someFunction)` |
|`CALLSTACK_NAMED(function,functionName)` | `[] call CALLSTACK_NAMED(_anonymousFunction,'My anonymous function!')`|

These macros will call these functions with the appropriate wrappers and enable call logging into them (but to no further calls inside obviously).

### 2.2. General Purpose Macros

[CBA script_macros_common.hpp](https://gist.github.com/commy2/9ed6cc73fbe6a2b3f4e1)

* `QUOTE()` is utilized within configuration files for bypassing the quote issues in configuration macros. So, all code segments inside a given config should utilize wrapping in the QUOTE() macro instead of direct strings. This allows us to use our macros inside the string segments, such as `QUOTE(_this call FUNC(balls))`

#### 2.2.1. setVariable, getVariable family macros

| Macro  | Expands to |
| -------|---------|
|`GETVAR(player,MyVarName,false)` | player getVariable ["MyVarName", false]|
|`GETMVAR(MyVarName,objNull)` | missionNamespace getVariable ["MyVarName", objNull]|
|`GETUVAR(MyVarName,displayNull)` | uiNamespace getVariable ["MyVarName", displayNull]|
|`SETVAR(player,MyVarName,127)` |  player setVariable ["MyVarName", 127]  SETPVAR(player,MyVarName,127) player setVariable ["MyVarName", 127, true] |
|`SETMVAR(MyVarName,player)` | missionNamespace setVariable ["MyVarName", player] |
|`SETUVAR(MyVarName,_control)` | uiNamespace setVariable ["MyVarName", _control] |

#### 2.2.2. STRING family macros

Note that you need the strings in module stringtable.xml in the correct format
`STR_ACE_<module>_<string>`</br>
Example:</br>
`STR_Balls_Banana`</br>

Script strings:

| Macro  |  Expands to |
| -------|---------|
| `LSTRING(banana)` |  "STR_ACE_balls_banana"|
| `ELSTRING(balls,banana)` | "STR_ACE_balls_banana"|


Config Strings (require `$` as first character):

| Macro  |  Expands to |
| -------|---------|
| `CSTRING(banana)` |  "$STR_ACE_balls_banana" |
| `ECSTRING(balls,banana)` | "$STR_ACE_balls_banana" |


## 3. Functions

Functions should be created in the functions\ subdirectory, named `fnc_functionName.sqf` They should then be indexed via the `PREP(functionName)` macro in the XEH_preInit.sqf file.

The `PREP` macro allows for CBA function caching, which drastically speeds up load times. **Beware though that function caching is enabled by default and as such to disable it you need to `#define DISABLE_COMPILE_CACHE` above your `#include "script_components.hpp"` include!**

### 3.1. Headers
Every function should have a header of the following format as the start of their function file:

```cpp
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
 * ["something", player] call ace_common_fnc_imanexample
 *
 * Public: [Yes/No]
 */
```

This is not the case for inline functions or functions not containing their own file.

### 3.2. Includes
Every function includes the `script_component.hpp` file just below the function header. Any additional includes or defines must be below this include.

All scripts written must be below this include and any potential additional incldues or defines.

#### 3.2.1. Reasoning
This ensures every function starts of in an uniform way and enforces function documentation.

## 4. Global Variables
All Global Variables are defined in the XEH_preInit.sqf file of the component they will be used in with an initial default value.

Exceptions:
* Dynamically generated global variables
* Variables that do not origin from he ACE project, such as BI global variables or third party such as CBA.

## 5. Code Style

### 5.1. Braces placement
Braces "{ }" which enclose a code block will have the first bracket placed behind the statement in case of if, switch statements or while, waituntil & for loops. The second bracket will be placed on the same column as the statement but on a separate line.

- Opening brace on the same line as keyword
- Closing brace in own line, same level of indentation as keyword

**Yes:**

```c++
class Something: Or {
    class Other {
        foo = "bar";
    };
};
```

**No:**

```c++
class Something : Or
{
    class Other
    {
        foo = "bar";
    };
};
```

**Also no:**

```c++
class Something : Or {
    class Other {
        foo = "bar";
        };
    };
```

When using `if`/`else`, it is encouraged to put `else` on the same line as the closing brace to save space:

```c++
if (alive player) then {
    player setDamage 1;
} else {
    hint ":(";
};
```

In cases where you , e.g, have a lot of one-liner classes, it is allowed to use something like this to save space:

```c++
class One {foo = 1;};
class Two {foo = 2;};
class Three {foo = 3;};
```

#### 5.1.1. Reasoning

Putting the opening brace in it's own line wastes a lot of space, and keeping the closing brace on the same level as the keyword makes it easier to recognize what exactly the brace closes.

### 5.2. Indents
Ever new scope should be on a new ident. This will make the code easier to understand and read. Indentations consist of 4 spaces. Tabs are not allowed.

Good example:
```
call {
    call {
        if (/* condition */) then {
            /* code */
        };
    };
};
```
Bad Example:
```
call {
        call {
        if (/* condition */) then {
            /* code */
        };  
        };
};
```

### 5.3. Inline comments
Inline comments should use `//`. Usage of `/* */` is allowed for larger comment blocks.

Example:
```
//// Comment   < incorrect
// Comment     < correct
/* Comment */  < correct
```

### 5.4. Comments in code
All code should be documented by comments that describe what is being done. This can be done through the function header and/or inline comments.

Comments within the code should be used when they are describing a complex and critical section of code or if the subject code does something a certain way because of a specific reason. Uncessary comments in the code are not allowed.

Good:
```
// find the object with the most blood loss
_highestObj = objNull;
_highestLoss = -1;
{
    if ([_x] call EFUNC(medical,getBloodLoss) > _highestLoss) then {
        _highestLoss = [_x] call EFUNC(medical,getbloodloss);
        _highestObj = _x;
    };
} foreach _units;
```
Good:
```
// Check if the unit is an engineer
(_obj getvariable [QGVAR(engineerSkill), 0] >= 1);
```

Bad:
```
// Get the engineer skill and check if it is above 1
(_obj getvariable [QGVAR(engineerSkill), 0] >= 1);
```

Bad:
```
// Get the variable myValue from the object
_myValue = _obj getvariable [QGVAR(myValue), 0];
```

Bad:
```
// Loop through all units to increase the myvalue variable
{
    _x setvariable [QGVAR(myValue), (_x getvariable [QGVAR(myValue), 0]) + 1];
} forEach _units;
```

### 5.5. Brackets around code
When making use of brackets “( )”, use as view as possible, unless doing so decreases readability of the code. Avoid statements such as:
```
if (!(_value)) then { };
```
However the following is allowed:
```
_value = (_array select 0) select 1;
```

Any conditions in statements should always be wrapped around brackets.
Example:
```
if (!_value) then {};
if (_value) then {};
```


### 5.6. Magic Numbers
There should be no magic numbers. Any magic number should be put in a define either on top of the .sqf file (below the header), or in the script_component.hpp file in the root directory of the component (recommended) in case it is used in multiple locations.

Magic numbers are any of the following:
* A constant numerical or text value used to identify a file format or protocol
* Distinctive unique values that are unlikely to be mistaken for other meanings
* Unique values with unexplained meaning or multiple occurrences which could (preferably) be replaced with named constants

[Source](http://en.wikipedia.org/wiki/Magic_number_%28programming%29)

## 6. Code Standards

### 6.1. Error testing
If a function returns error information, then that error information will be tested.

### 6.2. Unreachable Code
There shall be no unreachable code.

### 6.3. Function Parameters
Parameters of functions must be retreived through the usage of the param or params commands. If the function is part of the public API, parameters must be checked on allowed data types and values through the usage of the param and params commands.

* Usage of the CBA Macro `PARAM_x` or `BIS_fnc_Param` is deprecated and not allowed within the ACE project unless very specific reasons allow no other alternative.

### 6.4. Return Values
Functions and code blocks that specific a return a value must have a meaningfull return value.

### 6.5. Private Variables
All private variables shall be declared in a private array.
```
private [“_myVariable”];
```

### 6.6. Lines of Code
Any one function shall contain no more than 250 lines of code, excluding the function header and any includes.

### 6.7. Variable declarations
Declarations should be at the smallest feasible scope.

### 6.8. Variable initialization
Private variables will not be introduced until they can be initialized with meaningful values.

Good:
```
_myVariable = 0;
{
    _x params ["_value", "_amount"];
    if (_value > 0) then {
        _myVariable = _myVariable + _amount;
    };
} forEach _array;
```
Bad:
```
_myvariable = 0;
if (_condition) then {
    _myVariable = 1;
} else {
    _myvariable = 2;
};
```
Good:
```
_myvariable = [1, 2] select _condition;
```

### 6.9. Initialization expression in for loops
The initialization expression in a for loop will perform no actions other than to initialize the value of a single for loop parameter.

### 6.10. Increment expression in for loops
The increment expression in a for loop will perform no action other than to change a single loop parameter to the next value for the loop.

### 6.11. GetVariable
When using getvariable, there should either be a default value  given in the statement or the return value should be checked for correct data type as well as return value. A default value may not be given after a nil check.

Bad:
```
_return = obj getvariable "varName";
if (!isnil "_return") then {_return = 0 };
```
Good:
```
_return = obj getvariable ["varName", 0];
```
Good:
```
_return = obj getvariable "varName";
if (!isnil "_return") exitwith {};
```

### 6.12. Global Variables
Global variables should not be used to pass along information from one function to another. Use arguments instead.

### 6.13. Temporary Objects & Variables
Unnecessary temporary objects or variables should be avoided.

### 6.14. Commented out Code
Code that is not used (commented out) shall be deleted.

### 6.15. Constant Global Variables
All global variables that are intended to be used as a constant shall be written in all caps with underscores between the words, with the exception of the prefix. This should be done through the usage of the `GVAR` macro family.

Good:
```
ACE_Common_CATEGORY_NAME = 1;
GVAR(CATEGORY_NAME) = 1
```

### 6.16. Logging
Functions should whenever possible and logical, make use of logging functionality through the logging and debugging macros from CBA and ACE.

### 6.17. Constant Private Variables
Constant private variables that are used more as once should be put in a #define.

### 6.18. Code used more than once
Any piece of code that could/is used more than once, should be put in a function and it’s seperate .sqf file, unless this code is less as 5 lines and used only in a per frame handler.

## 7. Design considerations

### 7.1. Readability vs Performance
This is a large open source project that will get many different maintainers in it's lifespan. When writing code, keep in mind that other developers also need to be able to understand your code. Balancing readability and performance of code is a non black and white subject. The rule of tumb is:
* When improving performance of code that sacrifies readability (or visa-versa), first see if the design of the implementation is done in the best possible way.
* Document that change with the reasoning in the code.

### 7.2. Scheduled vs Unscheduled
Avoid the usage of scheduled space as much as possible and stick in unscheduled. This is to provide a smooth expereince to the user by guaranteeing code to run when we want it. See Performance considerations, Spawn & ExecVm for more information.

### 7.3. Event driven
All ACE3 components shall be implemented in an event driven fashion. This is done so that code only runs when it is required and allows for modularity through low coupling components.

Event handlers in ACE3 are implemented through our event system. They should be used to trigger or allow triggering of specific functionality.

The commands are listed below.

| Even Handler  |  Use |
| -------|---------|
|`[eventName, eventCodeBlock] call ace_common_fnc_addEventHandler` | adds an event handler with the event name and returns the event handler id.|
| `[eventName, args] call ace_common_fnc_globalEvent` | calls an event with the listed args on all machines, the local machine, and the server. |
|`[eventName, args] call ace_common_fnc_serverEvent` | calls an event just on the server computer (dedicated or self-hosted).|
| `[eventName, targetObject(s), args] call ace_common_fnc_targetEvent` | calls an event just on the targeted object or list of objects.|
|`[eventName, args] call ace_common_fnc_localEvent` | calls an event just on the local machine, useful for inter-module events.|

Events can be removed or cleared with the following commands.

| Even Handler  |  Use |
| -------|---------|
|`[eventName, eventHandlerId] call ace_common_fnc_removeEventHandler` | will remove a specific event handler of the event name, using the ID returned from `ace_common_fnc_addEventHandler`.|
|`[eventName] call ace_common_fnc_removeAllEventHandlers` | will remove all event handlers for that type of event.|

More information on the [ACE3 Events System](https://ace3mod.com/wiki/ACE-Events-System) page.

### 7.4. Hashes

When a key value pair is required, make use of the Hash implementation from ACE.

Hashes are a variable type that store key value pairs. They are not implemented natively in SQF, so there are a number of macros and functions for their usage in ACE3. If you are unfamiliar with the idea, they are similar in function to `setVariable`/`getVariable` but do not require an object to use.

The following example is a simple usage using our macros which will be explained further below.

```c++
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

| Macro  |  Use |
| -------|---------|
|`HASHCREATE` | used to create an empty hash.|
| `HASH_SET(hash, key, val)` | will set the hash key to that value, a key can be anything, even objects. |
|`HASH_GET(hash, key)` | will return the value of that key (or nil if it doesn't exist). |
| `HASH_HASKEY(hash, key)` | will return true/false if that key exists in the hash. |
| `HASH_REM(hash, key)` | will remove that hash key.|

#### 7.4.1. Hashlists

A hashlist is an extension of a hash. It is a list of hashes! The reason for having this special type of storage container rather than using a normal array is that an array of normal hashes that are are similar will duplicate a large amount of data in their storage of keys. A hashlist on the other hand uses a common list of keys and an array of unique value containers. The following will demonstrate it's usage.

```c++
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


| Macro  |  Use |
| -------|---------|
|`HASHLIST_CREATELIST(keys)` | creates a new hashlist with the default keys, pass [] for no default keys.|
|`HASHLIST_CREATEHASH(hashlist)` | returns a blank hash template from a hashlist.|
|`HASHLIST_PUSH(hashList, hash)` | pushes a new hash onto the end of the list.|
|`HASHLIST_SELECT(hashlist, index)` | returns the hash at that index in the list. |
|`HASHLIST_SET(hashlist, index, hash)` | sets a specific index to that hash.|

##### 7.4.1.1. A note on pass by reference and hashes

Hashes and hashlists are implemented with SQF arrays, and as such they are passed by reference to other functions. Remember to make copies (using the + operator) if you intend for the hash or hashlist to be modified with out the need for changing the original value.

## 8. Performance Considerations

### 8.1. Adding Elements to Arrays
When adding new elements to an array, pushback shall be used instead of the binary addition or set. When adding multiple elements to an array `append` may be used instead of pushback.

Good:
```
_a pushback _value;
```
Also good:
```
_a append [1,2,3];
```
Bad:
```
_a set [ count _a, _value];
_a = a + _[value];
```
When adding an new element to a dynamic location in an array or when the index is precaluclated, set may be used.

When adding multiple elements to an array, the binary addition may be used for the entire addition.

### 8.2. CreateVehicle
CreateVehicle array shall be used instead of createVehicle

### 8.3. Unscheduled vs Scheduled
All code that has a visable effect for the user or requires time specific guaranteed excution shall be written in unscheduled space.

### 8.4. Avoid Spawn & execVM
ExecVM and spawn are to be avoided wherever possible.

### 8.5. Empty Arrays
When checking if an array is empty, you can use both count or isEqualTo.

### 8.6. For Loops
`for "_y" from # to # step # do { ... }` should be used instead of: `for [{ ... },{ ... },{ ... }] do { ... };` whenever possible.

### 8.7. While Loops
While is only allowed when used to perform a unknown finite amount of steps with unknown or variable increments. Infinited while loops are not allowed.

Good:
```
_original = _obj getvariable [QGVAR(value), 0];
while {_original < _weaponThreshold} do {
    _original = [_original, _weaponClass] call FUNC(getNewValue);
}
```
Bad:
```
while {true} do {
    // anything
};
```

### 8.8. waituntil
The waituntil command shall not be used. Instead, make use of a per frame handler:
```
[{
    params ["_args", "_id"];
    _args params ["_unit"];

    if (_unit getvariable [QGVAR(myVariable), false]) exitwith {
        [_id] call CBA_fnc_removePerFrameHandler;

        // Execute any code
    };
}, [_unit], 0] call CBA_fnc_addPerFrameHandler;
```

