#include "..\script_component.hpp"
/*
 * Author: Alganthe, johnb43
 * Port VA loadouts to ACE Arsenal.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_arsenal_fnc_portVALoadouts
 *
 * Public: Yes
*/

private _unit = player;

// Need a player object to transfer loadouts
if (isNull _unit) exitWith {
    [LLSTRING(portLoadoutsPlayerError)] call BIS_fnc_error;
};

// Check if there are any VA loadouts
private _VALoadouts = profileNamespace getVariable ["BIS_fnc_saveInventory_data", []];

if (_VALoadouts isEqualTo []) exitWith {
    [LLSTRING(portLoadoutsLoadoutError)] call BIS_fnc_error;
};

private _aceLoadouts = +(profileNamespace getVariable [QGVAR(saved_loadouts),[]]);
private _name = "";
private _index = -1;

// Go through all VA loadouts and save them as ACE Arsenal loadouts
for "_i" from 0 to (count _VALoadouts) - 1 step 2 do {
    _name = _VALoadouts select _i;

    // Load VA loadout onto player
    [_unit, [profileNamespace, _name]] call BIS_fnc_loadInventory;

    // See if there is an already existing loadout with the same name
    _index = _aceLoadouts findIf {(_x select 0) == _name};

    // If there is an already existing loadout with same name, overwrite it (in CBA extended loadout array)
    if (_index != -1) then {
        _aceLoadouts set [_index, [_name, [getUnitLoadout _unit, createHashMap]]];
    } else {
        // Otherwise just add
        _aceLoadouts pushBack [_name, [getUnitLoadout _unit, createHashMap]];
    };
};

profileNamespace setVariable [QGVAR(saved_loadouts), _aceLoadouts];
