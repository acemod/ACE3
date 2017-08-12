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
#include "script_component.hpp"

params ["_dblClick","_params"];
_params params ["_list","_index"];

private _handled = false;
private _entityList = GVAR(uiListType) == LIST_ENTITIES;
private _data = _list tvData _index;

if (_entityList) then {
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
            if (_object != GVAR(camTarget)) then {
                [_object] call FUNC(setFocus);

                _handled = true;
            };
        };
    };
} else {
    private _location = [];

    // Try to find the location
    {
        if ((_x select 0) == _data) exitWith {
            // Don't want to accidentally modify the GVAR
            _location = +_x;
        };
    } forEach GVAR(locationsList);

    if !(_location isEqualTo []) then {
        _location params ["", "_name", "_description", "", "_pos", "_offset"];

        // Use dummy object if location is a position array
        private _dummy = GVAR(camDummy);
        if (_pos isEqualType objNull) then {
            _dummy = _pos;
        } else {
            // Use dummy to have camera target the location position
            detach _dummy;
            _dummy setPosASL _pos;
        };

        // If in a unit camera mode then only focus when double click
        if (GVAR(camMode) == MODE_FREE || {_dblClick && {FREE_MODE in GVAR(availableModes)}}) then {
            // Reset the focus
            [objNull] call FUNC(setFocus);
            [_dummy, true] call FUNC(setFocus);
        };

        // If double clicked ande mode is now free camera, teleport the camera
        if (_dblClick && {GVAR(camMode) == MODE_FREE}) then {
            // If location has unspecified offset place randomly within ~30m above ground level
            if (_offset isEqualTo [0,0,0]) then {
                _pos = AGLtoASL (_pos getPos [5 + random 30, random 360]) vectorAdd [0,0,2 + random 28];
            } else {
                if (_pos isEqualType objNull) then {
                    _pos = (getPosASL _pos) vectorAdd _offset;
                } else {
                    _pos = (AGLtoASL _pos) vectorAdd _offset;
                };
            };
            GVAR(camera) setPosASL _pos;

            // Location info text
            [parseText format [ "<t align='right' size='1.2'><t font='PuristaBold' size='1.6'>""%1""</t><br/>%2</t>", _name, _description], true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
        };

        _handled = true;
    };
};

if (_handled) then {
    playSound "ReadoutClick";
};

_handled
