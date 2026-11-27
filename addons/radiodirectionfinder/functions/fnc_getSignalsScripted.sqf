#include "script_component.hpp"
/*
 * Author: PabstMirror
 *
 *
 * Arguments:
 * 0: List of signals (Return) <ARRAY>
 *
 * Return Value:
 * <ARRAY>
 *
 * Example:
 * [] call ace_radiodirectionfinder_fnc_getSignalsScripted
 *
 * Public: No
 */

params ["_list"];

{
    _x params ["_obj", "_freqMhz", "_powerMW"];
    if (_obj isEqualType objNull) then {
        if (isNull _obj) exitWith {};
        if (_obj getVariable [QGVAR(enabled), true]) then {
            _list pushBack [getPosASL _obj, _freqMhz, _powerMW];
        };
    } else {
        _list pushBack _x;
    };
} forEach (missionNamespace getVariable [QGVAR(signalList), []]);
