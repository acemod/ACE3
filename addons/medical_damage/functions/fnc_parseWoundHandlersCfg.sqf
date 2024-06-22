#include "..\script_component.hpp"
/*
 * Author: Pterolatypus
 * Read a list of wound handler entries from config, accounting for inheritance
 *
 * Arguments:
 * 0: The config class containing the entries <CONFIG>
 *
 * ReturnValue:
 * None
 *
 * Example:
 * [configFile >> "ace_medical_injuries" >> "damageTypes" >> "woundHandlers"] call ace_medical_damage_fnc_parseWoundHandlersCfg
 *
 * Public: No
 */

params ["_config"];

// Read all valid entries from config and store
private _entries = [];

{
    private _entryResult = getText _x;

    if (_entryResult != "") then {
        // In case function doesn't exist yet, wrap in extra layer
        _entries pushBack (compile format ["call %1", _entryResult]);
    };
} forEach configProperties [_config, "isText _x", false];

private _parent = inheritsFrom _config;

if (isNull _parent) exitWith {_entries};

// Recursive call for parent
// Can't use configProperties for inheritance since it returns entries in the wrong order
([_parent] call FUNC(parseWoundHandlersCfg)) + _entries // return
