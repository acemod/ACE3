#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Runs each frame while inside of a vehicle with viewports
 *
 * Arguments:
 * 0: PFEH Args <ARRAY>
 *   0: Player <OBJECT>
 *   1: Vehicle <OBJECT>
 *   2: Viewport configuration <ARRAY>
 *   3: Viewport index shown (-1 for none) <NUMBER>
 *   4: Last visionmode <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_viewports_fnc_eachFrame
 *
 * Public: No
 */

params ["_args", "_pfID"];
_args params ["_player", "_vehicle", "_viewports", "_shownIndex", "_lastVisionMode"];

private _newIndex = -1;
if (cba_events_control) then {
    if (cameraView != "INTERNAL") exitWith {};
    if (isTurnedOut _player) exitWith {};
    if (!([_player, _vehicle, []] call EFUNC(common,canInteractWith))) exitWith {};

    BEGIN_COUNTER(newIndex);
    if ((_shownIndex > -1) && {currentVisionMode _player != _lastVisionMode}) then {
        // Vision Mode Changed - Force stop cam and restart
        call FUNC(viewCleanup);
        _shownIndex = -1;
    };

    ([_player] call FUNC(getSeatInfo)) params ["_role", "", "", "_comparment"];

    private _newIndexAngle = 45; // Controls the max angle
    private _eyesPosASL = AGLtoASL (positionCameraToWorld [0, 0, 0]);
    private _eyesDir = (AGLtoASL (positionCameraToWorld [0, 0, 1])) vectorDiff _eyesPosASL;
    {
        _x params ["", "", "_camLocation", "", "_screenLocation", "_maxDistance", "_compartments", "_roles"];

        private _viewASL = AGLtoASL (_vehicle modelToWorldVisual _screenLocation);
        private _viewDiff = _viewASL vectorDiff _eyesPosASL;
        private _viewAngle = acos (_viewDiff vectorCos _eyesDir);
        #ifdef DEBUG_MODE_FULL
        systemChat format ["%1: %2 @ %3",_forEachIndex,round _viewAngle, vectorMagnitude _viewDiff];
        #endif
        if (
            (_viewAngle < _newIndexAngle)
            && {(_compartments isEqualTo []) || {(toLower _comparment) in _compartments}}
            && {(_roles isEqualTo []) || {(toLower _role) in _roles}}
            && {(vectorMagnitude _viewDiff) < _maxDistance}
        ) then {
            _newIndex = _forEachIndex;
            _newIndexAngle = _viewAngle;
        };
    } forEach _viewports;
    END_COUNTER(newIndex);
};

if (_shownIndex == _newIndex) exitWith {}; // No-change - fast exit

if (_shownIndex > -1) then {
    call FUNC(viewCleanup);
};

if (_newIndex > -1) then {
    [_vehicle, _viewports # _newIndex, currentVisionMode _player] call FUNC(viewCreate);
    _args set [4, currentVisionMode _player];
};

_args set [3, _newIndex];
