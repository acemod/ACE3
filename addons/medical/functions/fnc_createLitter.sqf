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

private ["_target", "_className", "_config", "_litter", "_createLitter", "_litterObject", "_position", "_createdLitter"];
_target = _this select 0;
_className = _this select 1;

if !(GVAR(allowLitterCreation)) exitwith {};

_config = (configFile >> "ACE_Medical_Actions" >> "Basic" >> _className);
if (GVAR(level) >= 2) then {
    _config = (configFile >> "ACE_Medical_Actions" >> "Advanced" >> _className);
};
if !(isClass _config) exitwith {false};


if !(isArray (_config >> "litter")) exitwith {};
_litter = getArray (_config >> "litter");

_createLitter = {
    _position = getPos (_this select 0);
    _litterClass = _this select 1;
    _litterObject = createVehicle [_litterClass, _position, [], 0, "NONE"];
    _litterObject setPos [(_position select 0) + random 0.5, (_position select 1) + random 1.2, _position select 2];
    _litterObject setDir (random 360);
    _litterObject;
};

if (isnil QGVAR(allCreatedLitter)) then {
    GVAR(allCreatedLitter) = [];
    GVAR(litterPFHRunning) = false;
};

_createdLitter = [];
{
    if (typeName _x == "ARRAY") then {
        {
            if (typeName _x == "STRING") exitwith {
                _createdLitter pushback ([_target, _x] call _createLitter);
            };
        }foreach _x;
    };
    if (typeName _x == "STRING") then {
        _createdLitter pushback ([_target, _x] call _createLitter);
    };
}foreach _litter;

GVAR(allCreatedLitter) pushback [time, 1800, _createdLitter];

if !(GVAR(litterPFHRunning)) then {
    GVAR(litterPFHRunning) = true;
    [{
        {
            if (time - (_x select 0) >= (_x select 1)) then {
                {
                    deleteVehicle _x;
                }foreach (_this select 2);
                GVAR(allCreatedLitter) set[_foreachIndex, objNull];
            };
        }foreach GVAR(allCreatedLitter);
        GVAR(allCreatedLitter) = GVAR(allCreatedLitter) - [objNull];

        if (count GVAR(allCreatedLitter) == 0) exitwith {
            GVAR(litterPFHRunning) = false;
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    }, 30, []] call CBA_fnc_addPerFrameHandler;
};
