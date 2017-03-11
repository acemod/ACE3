/*
 * Author: TheDrill, PabstMirror
 * On keypress, point and send position to nearby players
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Key Handeled <BOOL>
 *
 * Example:
 * [] call ace_finger_fnc_keyPress;
 *
 * Public: No
 */
#include "script_component.hpp"


if (!alive ACE_player) exitWith {false};
// Conditions: canInteract
if !([ACE_player, ACE_player, ["isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};
//make sure player is dismounted or in a static weapon:
if ((ACE_player != vehicle ACE_player) && {!((vehicle ACE_player) isKindOf "StaticWeapon")}) exitWith {false};
//Check camera view (not in GUNNER)
if !(cameraView in ["INTERNAL", "EXTERNAL"]) exitWith {false};
//Exit if run recently (run every 1 seconds)
if (diag_tickTime < (GVAR(lastFPTime) + FP_ACTION_TIMEOUT)) exitWith {true};

GVAR(lastFPTime) = diag_tickTime;

// Find where is the finger pointing
private _originASL = AGLtoASL positionCameraToWorld [0, 0, 0];
private _fingerPosASL = AGLtoASL positionCameraToWorld [0, 0, FP_DISTANCE];
private _intersections = lineIntersectsSurfaces [_originASL, _fingerPosASL, ACE_player, vehicle ACE_player, true, 1];
if !(_intersections isEqualTo []) then {
    _fingerPosASL = _intersections select 0 select 0;
};

// Find who should the finger be sent to
private _playerEyePosASL = eyePos ACE_player;
private _sendFingerToPlayers = [];
private _nearbyMen = (ACE_player nearObjects ["CAManBase", (GVAR(maxRange) + 2)]);
{
    _nearbyMen append (crew _x);
} count (ACE_player nearObjects ["StaticWeapon", (GVAR(maxRange) + 2)]);
{
    if ((((eyePos _x) vectorDistance _playerEyePosASL) < GVAR(maxRange)) &&
            {alive _x} &&
            {(_x == (vehicle _x)) || {(vehicle _x) isKindOf "StaticWeapon"}} &&
            {GVAR(indicatorForSelf) || {_x != ACE_player}} &&
            {!(lineIntersects [(eyePos _x), _playerEyePosASL, ACE_player, _x])} &&
            {[_x] call EFUNC(common,isPlayer)}) then {

        _sendFingerToPlayers pushBack _x;
    };
    true
} count _nearbyMen;

TRACE_1("sending finger to",_sendFingerToPlayers);

[QGVAR(fingered), [ACE_player, _fingerPosASL, _originASL vectorDistance _fingerPosASL], _sendFingerToPlayers] call CBA_fnc_targetEvent;

// BI gestures do not work underwater, play custom "point" gesture if loaded
if (["ace_gestures"] call EFUNC(common,isModLoaded)) then {
    QEGVAR(gestures,point) call EFUNC(gestures,playSignal); // Works underwater
} else {
    [ACE_player, "GestureGo"] call EFUNC(common,doGesture); // Does not work underwater
};

true
