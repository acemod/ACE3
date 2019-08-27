#include "script_component.hpp"
/*
 * Author: PabstMirror
 *
 *
 * Arguments:
 * 0: List of signals (Return) <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_radiodirectionfinder_fnc_getSignalsUAV
 *
 * Public: No
 */

params ["_list"];

{
    private _freqMhz = _x getVariable [QGVAR(freqMhz), -1];
    if (_freqMhz < 0) then {
        [QGVAR(getUavFreq), [_x]] call CBA_fnc_serverEvent;
    } else {
        _list pushBack [getPosASL _x, _freqMhz, 10000];
        private _unit = (UAVControl _x) param [0, objNull];
        if (alive _unit) then {
            _list pushBack [getPosASL _unit, _freqMhz, 10000];
        };
    };
} forEach allUnitsUAV;
