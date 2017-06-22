/*
 * Author: Garth 'L-H' de Wet
 * Dials the number passed and detonates the explosive.
 *
 * Arguments:
 * 0: Unit to do dialing <OBJECT>
 * 1: Code to dial <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_player,"2131"] call ACE_explosives_fnc_dialPhone;
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit", "_code"];
TRACE_2("params",_unit,_code);

private ["_arr", "_ran", "_i"];

if (_unit getVariable [QGVAR(Dialing),false]) exitWith {};
if !(alive _unit) exitWith {};
_unit setVariable [QGVAR(Dialing), true, true];

_ran = (ceil(random 8)) + 1;
_arr = [];
for [{_i=0}, {_i<_ran}, {_i=_i + 1}] do {
    _arr = _arr + ['.','..','...',''];
};
if (_unit == ace_player) then {
    ctrlSetText [1400,"Calling"];
    [FUNC(dialingPhone), 0.25, [_unit,4,_arr,_code]] call CALLSTACK(CBA_fnc_addPerFrameHandler);
} else {
    private ["_explosive"];
    _explosive = [_code] call FUNC(getSpeedDialExplosive);
    if ((count _explosive) > 0) then {
        [{
            playSound3D [QUOTE(PATHTO_R(Data\Audio\Cellphone_Ring.wss)),objNull, false, getPosASL (_this select 1),3.16228,1,75];
            (_this select 0) setVariable [QGVAR(Dialing), false, true];
        }, [_unit,_explosive select 0], 0.25 * (count _arr - 4)] call CBA_fnc_waitAndExecute;
        [_explosive select 0,(0.25 * (count _arr - 1)) + (_explosive select 2), "ACE_Cellphone"] call FUNC(startTimer);
    };
};
