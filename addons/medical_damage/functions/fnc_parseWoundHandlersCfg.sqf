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
 * [configFile >> "ace_medical_injuries" >> "damageTypes"] call ace_medical_damage_fnc_parseWoundHandlersCfg
 *
 * Public: No
 */
params ["_config"];

// read all valid entries from config and store
private _entries = [];
{
    private _entryResult = call compile getText _x;
    if !(isNil "_entryResult") then {
        _entries pushBack _entryResult;
    }
} forEach configProperties [_config, "isText _x", false];

private _parent = inheritsFrom _config;
if (isNull _parent) exitWith {_entries};

// recursive call for parent
// can't use configProperties for inheritance since it returns entries in the wrong order
([_parent] call FUNC(parseWoundHandlersCfg)) + _entries;
