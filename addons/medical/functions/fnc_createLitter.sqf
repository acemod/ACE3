/*
 * Author: Glowbal
 * Spawns litter for the treatment action on the ground around the target
 *
 * Arguments:
 * 0: The Caller <OBJECT>
 * 1: The target <OBJECT>
 * 2: The treatment Selection Name <STRING>
 * 3: The treatment classname <STRING>
 * 4: ?
 * 5: Users of Items <?>
 * 6: Previous Damage <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

#define MIN_ENTRIES_LITTER_CONFIG 3

private ["_config", "_litter", "_createLitter", "_position", "_createdLitter"];
params ["_caller", "_target", "_selectionName", "_className", "", "_usersOfItems", "_previousDamage"];

if !(GVAR(allowLitterCreation)) exitWith {};
if (vehicle _caller != _caller || vehicle _target != _target) exitWith {};

_config = (configFile >> "ACE_Medical_Actions" >> "Basic" >> _className);
if (GVAR(level) >= 2) then {
    _config = (configFile >> "ACE_Medical_Actions" >> "Advanced" >> _className);
};
if !(isClass _config) exitWith {false};


if !(isArray (_config >> "litter")) exitWith {};
_litter = getArray (_config >> "litter");

_createLitter = {
    private["_position", "_direction"];
    params ["_unit", "_litterClass"];
    // @TODO: handle carriers over water
    // For now, don't spawn litter if we are over water to avoid floating litter
    if(surfaceIsWater (getPos _unit)) exitWith { false };

    _position = getPosATL _unit;
    _position params ["_posX", "_posY"];
    _position = if (random(1) >= 0.5) then {
        [_posX + random 1, _posY + random 1, 0]
    } else {
       [_posX - random 1, _posY - random 1, 0];
    };
    _direction = (random 360);

    // Create the litter, and timeout the event based on the cleanup delay
    // The cleanup delay for events in MP is handled by the server side
    [QGVAR(createLitter), [_litterClass, _position, _direction], 0] call EFUNC(common,syncedEvent);

    true
};

_createdLitter = [];
{
    if (typeName _x == "ARRAY") then {
        if (count _x < MIN_ENTRIES_LITTER_CONFIG) exitWith {};

        _x params ["_selection", "_litterCondition", "_litterOptions"];

        if (toLower _selection in [toLower _selectionName, "all"]) then { // in is case sensitve. We can be forgiving here, so lets use toLower.

            if (isNil _litterCondition) then {
                _litterCondition = if (_litterCondition != "") then {compile _litterCondition} else {{true}};
            } else {
                _litterCondition = missionNamespace getVariable _litterCondition;
                if (typeName _litterCondition != "CODE") then {_litterCondition = {false}};
            };
            if !([_caller, _target, _selectionName, _className, _usersOfItems, _previousDamage] call _litterCondition) exitWith {};

            if (typeName _litterOptions == "ARRAY") then {
                // Loop through through the litter options and place the litter
                {
                    if (typeName _x == "ARRAY" && {(count _x > 0)}) then {
                        [_target, _x select (floor(random(count _x)))] call _createLitter;
                    };
                    if (typeName _x == "STRING") then {
                        [_target, _x] call _createLitter;
                    };
                } forEach _litterOptions;
            };
        };
    };
} forEach _litter;
