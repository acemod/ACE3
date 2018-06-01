/*
 * Author: AACO
 * Take's a given unit's loadout and adds it to a given container
 *
 * Arguments:
 * 0: The unit to copy the loadout for <OBJECT>
 * 1: The container to add the loadout to <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "ACE_bodyBackHolderObject" createVehicle (getPos player)] call ACE_medical_fnc_addUnitLoadoutToContainer
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_container", objNull, [objNull]]
];
TRACE_2("params", _unit, _container);

if (isNull _unit || isNull _container) exitWith { ERROR_2("Either provided unit [%1] or container [%2] is null"); };

(getUnitLoadout _unit) params [
    "_primaryWeapon",
    "_secondaryWeapon",
    "_handgun",
    "_uniform",
    "_vest",
    "_backpack",
    "_helmet",
    "_faceware",
    "_binocular",
    "_linkedItems"
];

// handle primary weapon (should be dropped when dead, but just in case)
[_primaryWeapon, _container] call FUNC(addWeaponArrayToContainer);

// handle seconary weapon (should be dropped when dead, but just in case)
[_secondaryWeapon, _container] call FUNC(addWeaponArrayToContainer);

// handle handgun
[_handgun, _container] call FUNC(addWeaponArrayToContainer);

// handle uniform
[_uniform, _container, false] call FUNC(addContainerArrayToContainer);

// handle vest
[_vest, _container, false] call FUNC(addContainerArrayToContainer);

// handle backpack
[_backpack, _container, true] call FUNC(addContainerArrayToContainer);

// handle binoculars
[_binocular, _container] call FUNC(addWeaponArrayToContainer);

// handle helmet, faceware, and linked items
{
    if (_x != "") then {
        _container addItemCargoGlobal [_x, 1];
    };
} forEach ([_helmet, _faceware] + _linkedItems);
