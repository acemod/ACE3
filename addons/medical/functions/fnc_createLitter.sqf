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

[{
    {
    	deleteVehicle _x;
	}foreach (_this select 0);
}, [_createdLitter], 1800, 0] call EFUNC(common,waitAndExecute);
