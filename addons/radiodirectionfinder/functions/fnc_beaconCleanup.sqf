#include "script_component.hpp"
/*
 * Author: PabstMirror
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_radiodirectionfinder_fnc_beaconCleanup
 *
 * Public: No
 */

TRACE_1("beaconCleanup",_this);

[{
    private _removed = false;
    private _list = missionNamespace getVariable [QGVAR(signalList), []];
    _list = _list select {
        _x params ["_obj"];
        if ((_obj isEqualType []) || {alive _obj} || {!isNull _obj && {!(_obj isKindOf "ACE_transmitter_base")}}) then {
            true
        } else {
            _removed = true;
            false
        };
    };
    TRACE_1("",_removed);
    if (!_removed) exitWith {};
    missionNamespace setVariable [QGVAR(signalList), _list, true];
}, []] call CBA_fnc_execNextFrame;
