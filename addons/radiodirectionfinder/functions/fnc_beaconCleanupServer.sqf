#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Cleans up beacon on delete or killed (Server Only)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_radiodirectionfinder_fnc_beaconCleanupServer
 *
 * Public: No
 */

TRACE_1("beaconCleanup",_this);

[{
    private _list = missionNamespace getVariable [QGVAR(signalList), []];
    private _countStart = count _list;
    _list = _list select { // select if array or alive or just not-null (if not a transmitter)
        _x params ["_obj"];
        (_obj isEqualType []) || {alive _obj} || {(!isNull _obj) && {!(_obj isKindOf "ACE_transmitter_base")}}
    };
    TRACE_2("",_countStart,count _list);
    if (_countStart != count _list) then {
        missionNamespace setVariable [QGVAR(signalList), _list, true];
    };
}, []] call CBA_fnc_execNextFrame; // delay a frame because deletedEH is weird
