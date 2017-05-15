/*
 * Author: Nelson Duarte, AACO, SilentSpike
 * Function used to handle list single/double clicks
 *
 * Public: No
 */
#include "script_component.hpp"
TRACE_1("Params",_this);
disableSerialization;

params ["_dblClick","_params"];
_params params ["_list","_index"];

private _handled = false;
private _object = GETMVAR(_list tvData _index,objNull); // List contains unique object variables

if !(isNull _object) then {
    if (_dblClick) then {
        private _pos = getPosASLVisual _object;
        {
            _pos set [_forEachIndex, _x + 1 + random 10];
        } forEach _pos;
        GVAR(camera) setPosASL _pos;

        [_object] call FUNC(setFocus);
        playsound "ReadoutClick";

        _handled = true;
    } else {
        if (_object != GVAR(camTarget)) then {
            [_object] call FUNC(setFocus);
            playsound "ReadoutClick";

            _handled = true;
        };
    };
};

_handled
