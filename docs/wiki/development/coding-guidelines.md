---
layout: wiki
title: Coding Guidelines
description:
group: development
parent: wiki
order: 1
---

## 1. Naming Conventions

### 1.1 Variable Names

#### 1.1.1 Global Variable naming
All global variables must start with the ACE prefix followed by the component, separated by underscores. Global variables may not contain the `fnc_` prefix if the value is not callable code.

Example: `ace_component_myVariableName`

_For ACE this is done automatically through the usage of the `GVAR` macro family._

#### 1.1.2 Private Variable naming
To make code as readable as possible, try to use self explanatory variable names and avoid using single character variable names.

Example: `_velocity` instead of `_v`

#### 1.1.3 Function naming
All functions shall use ACE and the component name as a prefix, as well as the `fnc_` prefix behind the component name.

Example: `PREFIX_COMPONENT_fnc_functionName`

_For ACE this is done automatically through the usage of the `PREP` macro._

### 1.2 Files & Config

#### 1.2.1 SQF files
Files containing SQF scripts shall have a file name extension of `.sqf`.

#### 1.2.2 Header files
All header files shall have the file name extension of `.hpp`.

#### 1.2.3 Own SQF File
All functions shall be put in their own `.sqf` file.

#### 1.2.4 Config elements
Config files shall be split up into different header files, each with the name of the config and be included in the `config.cpp` of the component.

Example:

```cpp
#include "ACE_Settings.hpp"
```

And in `ACE_Settings.hpp`:

```cpp
class ACE_Settings {
    // Content
};
```

#### 1.2.5 Addon template
Addon template is at [extras/blank](https://github.com/acemod/ACE3/tree/master/extras/blank){:target="_blank"} repo directory.

### 1.3 Stringtable
All text that shall be displayed to a user shall be defined in a `stringtable.xml` file for multi-language support.

- There shall be no empty stringtable language values.
- All stringtables shall follow the format as specified by [Tabler](https://github.com/bux/tabler){:target="_blank"} and the [translation guidelines]({{ site.baseurl }}/wiki/development/how-to-translate-ace3.html) form.


## 2. Macro Usage

### 2.1 Module/PBO specific Macro Usage
The family of `GVAR` macros define global variable strings or constants for use within a module. Please use these to make sure we follow naming conventions across all modules and also prevent duplicate/overwriting between variables in different modules. The macro family expands as follows, for the example of the module 'balls':

| Macros | Expands to |
| -------|---------|
|`GVAR(face)` | `ace_balls_face` |
|`QGVAR(face)` | `"ace_balls_face"` |
|`QQGVAR(face)` | `""ace_balls_face""` used inside `QUOTE` macros where double quotation is required.  |
|`EGVAR(leg,face)` | `ace_leg_face` |
|`QEGVAR(leg,face)` | `"ace_leg_face"` |
|`QQEGVAR(leg,face)` | `""ace_leg_face""` used inside `QUOTE` macros where double quotation is required. |

There also exists the `FUNC` family of Macros:

| Macros | Expands to |
| -------|---------|
|`FUNC(face)` | `ace_balls_fnc_face` or the call trace wrapper for that function. |
|`EFUNC(leg,face)` | `ace_leg_fnc_face` or the call trace wrapper for that function. |
|`DFUNC(face)` | `ace_balls_fnc_face` and will ALWAYS be the function global variable. |
|`DEFUNC(leg,face)` | `ace_leg_fnc_face` and will ALWAYS be the function global variable. |
|`LINKFUNC(face)` | `FUNC(face)` or "pass by reference" `{_this call FUNC(face)}` |
|`QFUNC(face)` | `"ace_balls_fnc_face"` |
|`QEFUNC(leg,face)` | `"ace_leg_fnc_face"` |
|`QQFUNC(face)` | `""ace_balls_fnc_face""` used inside `QUOTE` macros where double quotation is required.  |
|`QQEFUNC(leg,face)` | `""ace_leg_fnc_face""` used inside `QUOTE` macros where double quotation is required.  |

The `FUNC` and `EFUNC` macros shall NOT be used inside `QUOTE` macros if the intention is to get the function name or assumed to be the function variable due to call tracing (see below). If you need to 100% always be sure that you are getting the function name or variable use the `DFUNC` or `DEFUNC` macros. For example `QUOTE(FUNC(face)) == "ace_balls_fnc_face"` would be an illegal use of `FUNC` inside `QUOTE`.

Using `FUNC` or `EFUNC` inside a `QUOTE` macro is fine if the intention is for it to be executed as a function.

`LINKFUNC` macro allows to recompile function used in event handler code when function cache is disabled. E.G. `player addEventHandler ["Fired", LINKFUNC(firedEH)];` will run updated code after each recompile.

#### 2.1.1 `FUNC` Macros, Call Tracing, and Non-ACE3/Anonymous Functions
ACE3 implements a basic call tracing system that can dump the call stack on errors or wherever you want. To do this the `FUNC` macros in debug mode will expand out to include metadata about the call including line numbers and files. This functionality is automatic with the use of calls via `FUNC` and `EFUNC`, but any calls to other functions need to use the following macros:

| Macro  | Example |
| -------|---------|
|`CALLSTACK(functionName)` | `[] call CALLSTACK(cba_fnc_someFunction)` |
|`CALLSTACK_NAMED(function,functionName)` | `[] call CALLSTACK_NAMED(_anonymousFunction,'My anonymous function!')`|

These macros will call these functions with the appropriate wrappers and enable call logging into them (but to no further calls inside obviously).

### 2.2 General Purpose Macros

[CBA script_macros_common.hpp](https://github.com/CBATeam/CBA_A3/blob/master/addons/main/script_macros_common.hpp){:target="_blank"}

`QUOTE()` is utilized within configuration files for bypassing the quote issues in configuration macros. So, all code segments inside a given config should utilize wrapping in the `QUOTE()` macro instead of direct strings. This allows us to use our macros inside the string segments, such as `QUOTE(_this call FUNC(balls))`

#### 2.2.1 `setVariable`, `getVariable` family macros
These macros are allowed but are not enforced.

| Macro | Expands to |
| -------|---------|
|`GETVAR(player,MyVarName,false)` | `player getVariable ["MyVarName", false]` |
|`GETMVAR(MyVarName,objNull)` | `missionNamespace getVariable ["MyVarName", objNull]` |
|`GETUVAR(MyVarName,displayNull)` | `uiNamespace getVariable ["MyVarName", displayNull]` |
|`SETVAR(player,MyVarName,127)` |  `player setVariable ["MyVarName", 127]  SETPVAR(player,MyVarName,127) player setVariable ["MyVarName", 127, true]` |
|`SETMVAR(MyVarName,player)` | `missionNamespace setVariable ["MyVarName", player]` |
|`SETUVAR(MyVarName,_control)` | `uiNamespace setVariable ["MyVarName", _control]` |

#### 2.2.2 STRING family macros
Note that you need the strings in module `stringtable.xml` in the correct format:
`STR_ACE_<module>_<string>`

Example: `STR_Balls_Banana`

Script strings (still require `localize` to localize the string):

| Macro | Expands to |
| -------|---------|
|`LSTRING(banana)` | `"STR_ACE_balls_banana"` |
|`ELSTRING(leg,banana)` | `"STR_ACE_leg_banana"` |


Config Strings (require `$` as first character):

| Macro | Expands to |
| -------|---------|
|`CSTRING(banana)` | `"$STR_ACE_balls_banana"` |
|`ECSTRING(leg,banana)` | `"$STR_ACE_leg_banana"` |

### 2.2.3 Path family macros
The family of path macros define global paths to files for use within a module. Please use these to reference files in the ACE3 project. The macro family expands as follows, for the example of the module 'balls':

| Macro | Expands to |
| -------|---------|
|`PATHTOF(data\banana.p3d)` | `\z\ace\addons\balls\data\banana.p3d` |
|`QPATHTOF(data\banana.p3d)` | `"\z\ace\addons\balls\data\banana.p3d"` |
|`PATHTOEF(leg,data\banana.p3d)` | `\z\ace\addons\leg\data\banana.p3d` |
|`QPATHTOEF(leg,data\banana.p3d)` | `"\z\ace\addons\leg\data\banana.p3d"` |


## 3. Functions
Functions shall be created in the `functions\` subdirectory, named `fnc_functionName.sqf` They shall then be indexed via the `PREP(functionName)` macro in the `XEH_preInit.sqf` file.

The `PREP` macro allows for CBA function caching, which drastically speeds up load times. **Beware though that function caching is enabled by default and as such to disable it you need to `#define DISABLE_COMPILE_CACHE` above your `#include "script_components.hpp"` include!**

### 3.1 Headers
Every function should have a header of the following format as the start of their function file:

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
 * ["something", player] call ace_common_fnc_imanexample
 *
 * Public: [Yes/No]
 */
```

This is not the case for inline functions or functions not containing their own file.

### 3.2 Includes
Every function includes the `script_component.hpp` file just below the function header. Any additional includes or defines must be below this include.

All scripts written must be below this include and any potential additional includes or defines.

#### 3.2.1 Reasoning
This ensures every function starts of in an uniform way and enforces function documentation.


## 4. Global Variables
All Global Variables are defined in the `XEH_preInit.sqf` file of the component they will be used in with an initial default value.

Exceptions:
- Dynamically generated global variables.
- Variables that do not origin from the ACE3 project, such as BI global variables or third party such as CBA.


## 5. Code Style

To help with some of the coding style we recommend you get the plugin [EditorConfig](http://editorconfig.org/#download) for your editor. It will help with correct indentations and deleting trailing spaces.

### 5.1 Braces placement

Braces `{ }` which enclose a code block will have the first bracket placed behind the statement in case of `if`, `switch` statements or `while`, `waitUntil` & `for` loops. The second brace will be placed on the same column as the statement but on a separate line.

- Opening brace on the same line as keyword
- Closing brace in own line, same level of indentation as keyword

**Yes:**

```cpp
class Something: Or {
    class Other {
        foo = "bar";
    };
};
```

**No:**

```cpp
class Something : Or
{
    class Other
    {
        foo = "bar";
    };
};
```

**Also no:**

```cpp
class Something : Or {
    class Other {
        foo = "bar";
        };
    };
```

When using `if`/`else`, it is encouraged to put `else` on the same line as the closing brace to save space:

```js
if (alive player) then {
    player setDamage 1;
} else {
    hint ":(";
};
```

In cases where there are a lot of one-liner classes, it is allowed to use something like this to save space:

```cpp
class One {foo = 1;};
class Two {foo = 2;};
class Three {foo = 3;};
```

#### 5.1.1 Reasoning
Putting the opening brace in its own line wastes a lot of space, and keeping the closing brace on the same level as the keyword makes it easier to recognize what exactly the brace closes.

### 5.2 Indents
Every new scope should be on a new indent. This will make the code easier to understand and read. Indentations consist of 4 spaces. Tabs are not allowed. Tabs or spaces are not allowed to trail on a line, last character needs to be non blank.

Good:

```js
call {
    call {
        if (/* condition */) then {
            /* code */
        };
    };
};
```

Bad:

```js
call {
        call {
        if (/* condition */) then {
            /* code */
        };  
        };
};
```

### 5.3 Inline comments
Inline comments should use `//`. Usage of `/* */` is allowed for larger comment blocks.

Example:

```js
//// Comment   // < incorrect
// Comment     // < correct
/* Comment */  // < correct
```

### 5.4 Comments in code
All code shall be documented by comments that describe what is being done. This can be done through the function header and/or inline comments.

Comments within the code shall be used when they are describing a complex and critical section of code or if the subject code does something a certain way because of a specific reason. Unnecessary comments in the code are not allowed.

Good:

```js
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

```js
// Check if the unit is an engineer
(_obj getvariable [QGVAR(engineerSkill), 0] >= 1);
```

Bad:

```js
// Get the engineer skill and check if it is above 1
(_obj getvariable [QGVAR(engineerSkill), 0] >= 1);
```

Bad:

```js
// Get the variable myValue from the object
_myValue = _obj getvariable [QGVAR(myValue), 0];
```

Bad:

```js
// Loop through all units to increase the myvalue variable
{
    _x setvariable [QGVAR(myValue), (_x getvariable [QGVAR(myValue), 0]) + 1];
} forEach _units;
```

### 5.5 Brackets around code
When making use of brackets `( )`, use as few as possible, unless doing so decreases readability of the code. Avoid statements such as:

```js
if (!(_value)) then { };
```

However the following is allowed:

```js
_value = (_array select 0) select 1;
```

Any conditions in statements shall always be wrapped around brackets.

```js
if (!_value) then {};
if (_value) then {};
```

### 5.6 Magic Numbers
There shall be no magic numbers. Any magic number shall be put in a define either on top of the `.sqf` file (below the header), or in the `script_component.hpp` file in the root directory of the component (recommended) in case it is used in multiple locations.

Magic numbers are any of the following:

- A constant numerical or text value used to identify a file format or protocol
- Distinctive unique values that are unlikely to be mistaken for other meanings
- Unique values with unexplained meaning or multiple occurrences which could (preferably) be replaced with named constants

[Source](http://en.wikipedia.org/wiki/Magic_number_%28programming%29){:target="_blank"}


## 6. Code Standards

### 6.1 Error testing
If a function returns error information, then that error information will be tested.

### 6.2 Unreachable Code
There shall be no unreachable code.

### 6.3 Function Parameters
Parameters of functions must be retrieved through the usage of the `param` or `params` commands. If the function is part of the public API, parameters must be checked on allowed data types and values through the usage of the `param` and `params` commands.

Usage of the CBA Macro `PARAM_x` or `BIS_fnc_param` is deprecated and not allowed within the ACE project.

### 6.4 Return Values
Functions and code blocks that specific a return a value must have a meaningful return value. If no meaningful return value, the function should return nil.

### 6.5 Private Variables
All private variables shall make use of the `private` keyword on initialization. When declaring a private variable before initialization, usage of the `private ARRAY` syntax is allowed. All private variables must be either initialized using the `private` keyword, or declared using the `private ARRAY` syntax. Exceptions to this rule are variables obtained from an array, which shall be done with usage of the `params` command family, which ensures the variable is declared as private.

Good:

```js
private _myVariable = "hello world";
```

Good:

```js
_myArray params ["_elementOne", "_elementTwo"];
```

Bad:

```js
_elementOne = _myArray select 0;
_elementTwo = _myArray select 1;
```

### 6.6 Lines of Code
Any one function shall contain no more than 250 lines of code, excluding the function header and any includes.

### 6.7 Variable declarations
Declarations should be at the smallest feasible scope.

Good:

```js
if (call FUNC(myCondition)) then {
   private _areAllAboveTen = true; // <- smallest feasable scope

   {
      if (_x >= 10) then {
         _areAllAboveTen = false;
      };
   } forEach _anArray;

   if (_areAllAboveTen) then {
       hint "all values are above ten!";
   };
}
```

Bad:

```js
private _areAllAboveTen = true; // <- this is bad, because it can be initialized in the if statement
if (call FUNC(myCondition)) then {
   {
      if (_x >= 10) then {
         _areAllAboveTen = false;
      };
   } forEach _anArray;

   if (_areAllAboveTen) then {
       hint "all values are above ten!";
   };
};
```

### 6.8 Variable initialization
Private variables will not be introduced until they can be initialized with meaningful values.

Good:

```js
private _myVariable = 0; // good because the value will be used
{
    _x params ["_value", "_amount"];
    if (_value > 0) then {
        _myVariable = _myVariable + _amount;
    };
} forEach _array;
```

Bad:

```js
private _myvariable = 0; // Bad because it is initialized with a zero, but this value does not mean anything
if (_condition) then {
    _myVariable = 1;
} else {
    _myvariable = 2;
};
```

Good:

```js
private _myvariable = [1, 2] select _condition;
```

### 6.9 Initialization expression in `for` loops
The initialization expression in a `for` loop shall perform no actions other than to initialize the value of a single `for` loop parameter.

### 6.10. Increment expression in `for` loops
The increment expression in a `for` loop shall perform no action other than to change a single loop parameter to the next value for the loop.

### 6.11. `getVariable`
When using `getVariable`, there shall either be a default value given in the statement or the return value shall be checked for correct data type as well as return value. A default value may not be given after a `nil` check.

Bad:

```js
_return = obj getvariable "varName";
if (isnil "_return") then {_return = 0 };
```

Good:

```js
_return = obj getvariable ["varName", 0];
```

Good:

```js
_return = obj getvariable "varName";
if (isnil "_return") exitwith {};
```

### 6.12. Global Variables
Global variables should not be used to pass along information from one function to another. Use arguments instead.

Bad:

```js
fnc_example = {
    hint GVAR(myVariable);
};
```

```js
GVAR(myVariable) = "hello my variable";
call fnc_example;
```

Good:

```js
fnc_example = {
   params ["_content"];
   hint _content;
};
```

```js
["hello my variable"] call fnc_example;
```

### 6.13. Temporary Objects & Variables
Unnecessary temporary objects or variables should be avoided.

### 6.14. Commented out Code
Code that is not used (commented out) shall be deleted.

### 6.15. Constant Global Variables
There shall be no constant global variables, constants shall be put in a `#define`.

### 6.16. Logging
Functions shall whenever possible and logical, make use of logging functionality through the logging and debugging macros from CBA and ACE3.

### 6.17. Constant Private Variables
Constant private variables that are used more as once shall be put in a `#define`.

### 6.18. Code used more than once
Any piece of code that could/is used more than once, shall be put in a function and it's separate `.sqf` file, unless this code is less as 5 lines and used only in a [per-frame handler](#waituntil).


## 7. Design considerations

### 7.1 Readability vs Performance
This is a large open source project that will get many different maintainers in its lifespan. When writing code, keep in mind that other developers also need to be able to understand your code. Balancing readability and performance of code is a non black and white subject. The rule of thumb is:

- When improving performance of code that sacrifices readability (or visa-versa), first see if the design of the implementation is done in the best way possible.
- Document that change with the reasoning in the code.

### 7.2 Scheduled vs Unscheduled
Avoid the usage of scheduled space as much as possible and stay in unscheduled. This is to provide a smooth experience to the user by guaranteeing code to run when we want it. See [Performance considerations, `spawn` & `execVM`](#avoid-spawn--execvm) for more information.

This also helps avoid various bugs as a result of unguaranteed execution sequences when running multiple scripts.

### 7.3 Event driven
All ACE3 components shall be implemented in an event driven fashion. This is done to ensure code only runs when it is required and allows for modularity through low coupling components.

Event handlers in ACE3 are implemented through the CBA event system (ACE3's own event system is deprecated since 3.6.0). They should be used to trigger or allow triggering of specific functionality.

More information on the [CBA Events System](https://github.com/CBATeam/CBA_A3/wiki/Custom-Events-System){:target="_blank"} and [CBA Player Events](https://github.com/CBATeam/CBA_A3/wiki/Player-Events){:target="_blank"} pages.

<div class="panel info">
    <h5>Warning about BIS event handlers:</h5>
    <p>BIS's event handlers (`addEventHandler`, `addMissionEventHandler`) are slow when passing a large code variable. Use a short code block that calls the function you want.</p>
    ```js
    player addEventHandler ["Fired", FUNC(handleFired)]; // bad
    player addEventHandler ["Fired", {call FUNC(handleFired)}]; // good
    ```
</div>

### 7.4 Hashes

When a key value pair is required, make use of the hash implementation from ACE3.

Hashes are a variable type that store key value pairs. They are not implemented natively in SQF, so there are a number of macros and functions for their usage in ACE3. If you are unfamiliar with the idea, they are similar in function to `setVariable`/`getVariable` but do not require an object to use.

The following example is a simple usage using our macros which will be explained further below.

```js
_hash = HASHCREATE;
HASH_SET(_hash,"key","value");
if (HASH_HASKEY(_hash,"key")) then {
    player sideChat format ["val: %1", HASH_GET(_hash,"key"); // will print out "val: value"
};
HASH_REM(_hash,"key");
if (HASH_HASKEY(_hash,"key")) then {
    // this will never execute because we removed the hash key/val pair "key"
};
```

A description of the above macros is below.

| Macro | Use |
| ------|-------|
|`HASHCREATE` | Used to create an empty hash. |
|`HASH_SET(hash,key,val)` | Will set the hash key to that value, a key can be anything, even objects. |
|`HASH_GET(hash,key)` | Will return the value of that key (or nil if it doesn't exist). |
|`HASH_HASKEY(hash,key)` | Will return true/false if that key exists in the hash. |
|`HASH_REM(hash,key)` | Will remove that hash key. |

#### 7.4.1 Hashlists

A hashlist is an extension of a hash. It is a list of hashes! The reason for having this special type of storage container rather than using a normal array is that an array of normal hashes that are similar will duplicate a large amount of data in their storage of keys. A hashlist on the other hand uses a common list of keys and an array of unique value containers. The following will demonstrate its usage.

```js
_defaultKeys = ["key1", "key2", "key3"];
// create a new hashlist using the above keys as default
_hashList = HASHLIST_CREATELIST(_defaultKeys);

//lets get a blank hash template out of this hashlist
_hash = HASHLIST_CREATEHASH(_hashList);

//_hash is now a standard hash...
HASH_SET(_hash,"key1","1");

//to store it to the list we need to push it to the list
HASHLIST_PUSH(_hashList, _hash);

//now lets get it out and store it in something else for fun
//it was pushed to an empty list, so it's index is 0
_anotherHash = HASHLIST_SELECT(_hashList,0);

// this should print "val: 1"
player sideChat format["val: %1", HASH_GET(_anotherHash,"key1")];

//Say we need to add a new key to the hashlist
//that we didn't initialize it with? We can simply
//set a new key using the standard HASH_SET macro
HASH_SET(_anotherHash,"anotherKey","another value");
```

As you can see above working with hashlists are fairly simple, a more in depth explanation of the macros is below.

| Macro  |  Use |
| -------|---------|
|`HASHLIST_CREATELIST(keys)` | Creates a new hashlist with the default keys, pass [] for no default keys. |
|`HASHLIST_CREATEHASH(hashlist)` | Returns a blank hash template from a hashlist. |
|`HASHLIST_PUSH(hashList, hash)` | Pushes a new hash onto the end of the list. |
|`HASHLIST_SELECT(hashlist, index)` | Returns the hash at that index in the list. |
|`HASHLIST_SET(hashlist, index, hash)` | Sets a specific index to that hash. |

##### 7.4.1.1 A note on pass by reference and hashes

Hashes and hashlists are implemented with SQF arrays, and as such they are passed by reference to other functions. Remember to make copies (using the `+` operator) if you intend for the hash or hashlist to be modified with out the need for changing the original value.

## 8. Performance Considerations

### 8.1 Adding Elements to Arrays
When adding new elements to an array, `pushBack` shall be used instead of the binary addition or `set`. When adding multiple elements to an array `append` may be used instead.

Good:

```js
_a pushBack _value;
```

Also good:

```js
_a append [1,2,3];
```

Bad:

```js
_a set [ count _a, _value];
_a = a + _[value];
```

When adding an new element to a dynamic location in an array or when the index is pre-calculated, `set` may be used.

When adding multiple elements to an array, the binary addition may be used for the entire addition.

### 8.2 `createVehicle`
`createVehicle` array shall be used.

### 8.3 `createVehicle(Local)` position
`createVehicle(Local)` used with a non-`[0, 0, 0]` position performs search for empty space to prevent collisions on spawn.
Where possible `[0, 0, 0]` position shall be used, except on `#` objects (e.g. `#lightsource`, `#soundsource`) where empty position search is not performed.

This code requires ~1.00ms and will be higher with more objects near wanted position:

```js
_vehicle = _type createVehicleLocal _posATL;
_vehicle setposATL _posATL;
```

While this one requires ~0.04ms:

```js
_vehicle = _type createVehicleLocal [0, 0, 0];
_vehicle setposATL _posATL;
```

### 8.4 Unscheduled vs Scheduled
All code that has a visible effect for the user or requires time specific guaranteed execution shall be written in unscheduled space.

### 8.5 Avoid `spawn` & `execVM`
`execVM` and `spawn` are to be avoided wherever possible.

### 8.6 Empty Arrays
When checking if an array is empty `isEqualTo` shall be used.

### 8.7 `for` Loops

```js
for "_y" from # to # step # do { ... }
```

shall be used instead of

```js
for [{ ... },{ ... },{ ... }] do { ... };
```

whenever possible.

### 8.8 `while` Loops
While is only allowed when used to perform a unknown finite amount of steps with unknown or variable increments. Infinite `while` loops are not allowed.

Good:

```js
_original = _obj getvariable [QGVAR(value), 0];
while {_original < _weaponThreshold} do {
    _original = [_original, _weaponClass] call FUNC(getNewValue);
}
```

Bad:

```js
while {true} do {
    // anything
};
```

### 8.9 `waitUntil`
The `waitUntil` command shall not be used. Instead, make use of a per-frame handler:

```js
[{
    params ["_args", "_id"];
    _args params ["_unit"];

    if (_unit getvariable [QGVAR(myVariable), false]) exitwith {
        [_id] call CBA_fnc_removePerFrameHandler;

        // Execute any code
    };
}, [_unit], 0] call CBA_fnc_addPerFrameHandler;
```
