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

private["_fingerPosPrecise", "_playerEyePos", "_sendFingerToPlayers", "_nearbyMen"];

if (!alive ACE_player) exitWith {false};
// Conditions: canInteract
if !([ACE_player, ACE_player, ["isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
//make sure player is dismounted or in a static weapon:
if ((ACE_player != vehicle ACE_player) && {!((vehicle ACE_player) isKindOf "StaticWeapon")}) exitWith {false};
//Check camera view (not in GUNNER)
if !(cameraView in ["INTERNAL", "EXTERNAL"]) exitWith {false};
//Exit if run recently (run every 1 seconds)
if (ACE_diagTime < (GVAR(lastFPTime) + FP_ACTION_TIMEOUT)) exitWith {true};

GVAR(lastFPTime) = ACE_diagTime;

_fingerPosPrecise = positionCameraToWorld [0, 0, FP_DISTANCE];
_playerEyePos = eyePos ACE_player;

_sendFingerToPlayers = [];


_nearbyMen = (ACE_player nearObjects ["CAManBase", (GVAR(maxRange) + 2)]);
{
    _nearbyMen append (crew _x);
} forEach (ACE_player nearObjects ["StaticWeapon", (GVAR(maxRange) + 2)]);

{
    if ((((eyePos _x) vectorDistance _playerEyePos) < GVAR(maxRange)) &&
            {alive _x} &&
            {(_x == (vehicle _x)) || {(vehicle _x) isKindOf "StaticWeapon"}} &&
            {GVAR(indicatorForSelf) || {_x != ACE_player}} &&
            {!(lineIntersects [(eyePos _x), _playerEyePos, ACE_player, _x])} &&
            {[_x] call EFUNC(common,isPlayer)}) then {

        _sendFingerToPlayers pushBack _x;
    };
} count _nearbyMen;

TRACE_1("sending finger to",_sendFingerToPlayers);

[QGVAR(fingered), _sendFingerToPlayers, [ACE_player, _fingerPosPrecise]] call EFUNC(common,targetEvent);

ACE_player playActionNow "GestureGo";

true
