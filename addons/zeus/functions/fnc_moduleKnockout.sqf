/*
 * Author: SilentSpike
 * Flips the unconscious state of the unit the module is attached to.
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: units <ARRAY>
 * 2: activated <BOOL>
 *
 * ReturnValue:
 * nil
 *
 * Public: no
 */

#include "script_component.hpp"

private ["_logic","_unit","_conscious","_previous"];

_logic = _this select 0;
_unit = attachedTo _logic;

if (isNil QEFUNC(medical,setUnconscious)) exitWith {
	["Requires ACE_Medical to work."] call DEFUNC(common,displayTextStructured);
	deleteVehicle _logic;
};
if (isNull _unit) exitWith {
	["Module must be placed on a unit."] call DEFUNC(common,displayTextStructured);
	deleteVehicle _logic;
};

_conscious = _unit getVariable ["ACE_isUnconscious", false];

//Hacky method, will be replaced once #1205 is complete
_previous = _unit getvariable [QEGVAR(medical,enableUnconsciousnessAI), EGVAR(medical,enableUnconsciousnessAI)];
if (_previous < 2) then {_unit setvariable [QEGVAR(medical,enableUnconsciousnessAI), 2];};

[_unit, !_conscious] call DEFUNC(medical,setUnconscious);

if (_previous < 2) then {
    _unit setvariable [QEGVAR(medical,enableUnconsciousnessAI), _previous];
};

deleteVehicle _logic;