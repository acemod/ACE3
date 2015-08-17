/*
 * Author: Glowbal
 * Spawns litter for the treatment action on the ground around the target
 *
 * Arguments:
 * 0: The target <OBJECT>
 * 1: The treatment classname <STRING>
 *
 * Return Value:
 *
 *
 * Public: No
 */

#include "script_component.hpp"

#define MIN_ENTRIES_LITTER_CONFIG 3

private ["_target", "_className", "_config", "_litter", "_createLitter", "_position", "_createdLitter", "_caller", "_selectionName", "_usersOfItems", "_previousDamage"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_className = _this select 3;
_usersOfItems = _this select 5;
_previousDamage = _this select 6;

if !(GVAR(allowLitterCreation)) exitwith {};
if (vehicle _caller != _caller || vehicle _target != _target) exitwith {};

_config = (configFile >> "ACE_Medical_Actions" >> "Basic" >> _className);
if (GVAR(level) >= 2) then {
    _config = (configFile >> "ACE_Medical_Actions" >> "Advanced" >> _className);
};
if !(isClass _config) exitwith {false};


if !(isArray (_config >> "litter")) exitwith {};
_litter = getArray (_config >> "litter");

_createLitter = {
    private["_position", "_litterClass", "_direction"];
    
    // @TODO: handle carriers over water
    // For now, don't spawn litter if we are over water to avoid floating litter
    if(surfaceIsWater (getPos (_this select 0))) exitWith { false };
    
    _position = getPosATL (_this select 0);
    _position = [_position select 0, _position select 1, 0];
    _litterClass = _this select 1;
    if (random(1) >= 0.5) then {
        _position = [(_position select 0) + random 1, (_position select 1) + random 1, _position select 2];
    } else {
       _position =  [(_position select 0) - random 1, (_position select 1) - random 1, _position select 2];
    };
    _direction = (random 360);

    // Create the litter, and timeout the event based on the cleanup delay
    // The cleanup delay for events in MP is handled by the server side
    [QGVAR(createLitter), [_litterClass,_position,_direction], 0] call EFUNC(common,syncedEvent);

    true
};

_createdLitter = [];
{
    if (typeName _x == "ARRAY") then {
        if (count _x < MIN_ENTRIES_LITTER_CONFIG) exitwith {};
        private ["_selection", "_litterCondition", "_litterOptions"];
        _selection = _x select 0;
        if (toLower _selection in [toLower _selectionName, "all"]) then { // in is case sensitve. We can be forgiving here, so lets use toLower.
            _litterCondition = _x select 1;
            _litterOptions = _x select 2;

            if (isnil _litterCondition) then {
                _litterCondition = if (_litterCondition != "") then {compile _litterCondition} else {{true}};
            } else {
                _litterCondition = missionNamespace getvariable _litterCondition;
                if (typeName _litterCondition != "CODE") then {_litterCondition = {false}};
            };
            if !([_caller, _target, _selectionName, _className, _usersOfItems, _previousDamage] call _litterCondition) exitwith {};

            if (typeName _litterOptions == "ARRAY") then {
                // Loop through through the litter options and place the litter
                {
                    if (typeName _x == "ARRAY" && {(count _x > 0)}) then {
                        [_target, _x select (floor(random(count _x)))] call _createLitter;
                    };
                    if (typeName _x == "STRING") then {
                        [_target, _x] call _createLitter;
                    };
                }foreach _litterOptions;
            };
        };
    };
}foreach _litter;