#include "script_component.hpp"
/*
 * Author: Nelson Duarte, AACO, SilentSpike
 * Function used to handle list single/double clicks
 *
 * Expected behaviour:
 * Clicking an entry focuses the camera on it (any camera mode)
 * Double clicking an entry teleports the free camera nearby and focuses on it
 *
 * Arguments:
 * 0: Double clicked <BOOL>
 * 1: List Click EH's _this <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [false, _this] call ace_spectator_fnc_ui_handleListClick
 *
 * Public: No
 */

params ["_dblClick","_params"];
_params params ["_list","_index"];

private _handled = false;
private _data = _list tvData _index;

// List contains unique object variables
private _object = missionNamespace getVariable [_data, objNull];

if !(isNull _object) then {
    if (_dblClick) then {
        // Place camera within ~10m of the object and above ground level
        private _pos = getPosASLVisual _object;
        GVAR(camera) setPosASL (AGLtoASL (_pos getPos [1 + random 10, random 360]) vectorAdd [0,0,2 + random 10]);

        // Reset the focus
        [objNull] call FUNC(setFocus);
        [_object] call FUNC(setFocus);

        _handled = true;
    } else {
        if (_object != GVAR(camFocus)) then {
            [_object] call FUNC(setFocus);

            _handled = true;
        };
    };
};

if (_handled) then {
    playSound "ReadoutClick";
};

_handled
