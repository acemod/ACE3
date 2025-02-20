#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: mrschick
 * Attempts to recover a loadout with invalid containers by substituting them for the currently worn containers.
 * It is meant to be passed a loadout modified by `[loadout, true] call ace_arsenal_fnc_verifyLoadout`, nested in the format: `[[_loadout, _extendedInfo], _nullItemsList, _unavailableItemsList, _missingExtendedInfo]`
 *
 * Arguments:
 * 0: Unit from which to get valid (worn) containers <OBJECT>
 * 1: Verified loadout to insert valid containers into <ARRAY>
 *
 * Return Value:
 * Copy of the passed loadout, with recovered containers <ARRAY>
 *
 * Public: No
*/

params ["_unit", "_loadout"];

// Work on a copy of the original array
private _loadoutData = +_loadout;

{
    _x params ["_containerIdx", "_wornContainer"];

    // Only modify the loadout if it has a filled invalid container to be recovered
    if (
        (_loadoutData#0#0#_containerIdx isNotEqualTo []) && 
        {_loadoutData#0#0#_containerIdx#0 == ""}
    ) then {
        // Replace loadout container with worn one, if present
        if (_wornContainer == "") then {
            (_loadoutData#0#0) set [_containerIdx, []];
        } else {
            (_loadoutData#0#0#_containerIdx) set [0, _wornContainer];
        };
    };
} forEach [
    [3, uniform _unit],
    [4, vest _unit],
    [5, backpack _unit]
];

_loadoutData
