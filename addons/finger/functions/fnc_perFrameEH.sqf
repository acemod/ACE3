/*
 * Author: TheDrill, PabstMirror
 * The perFrameEventHandler to draw the icons
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [fromCBA] call ace_finger_fnc_perFrameEH;
 *
 * Public: No
 */
#include "script_component.hpp"

if (!alive ACE_player) then {GVAR(fingersHash) = HASH_CREATE;};
// Conditions: canInteract
if !([ACE_player, ACE_player, ["isNotInside"]] call EFUNC(common,canInteractWith)) then {GVAR(fingersHash) = HASH_CREATE;};
// Make sure player is dismounted or in a static weapon:
if ((ACE_player != vehicle ACE_player) && {!((vehicle ACE_player) isKindOf "StaticWeapon")}) then {GVAR(fingersHash) = HASH_CREATE;};

private _iconSize = BASE_SIZE * 0.10713 * (call EFUNC(common,getZoom));

{
    private _data = HASH_GET(GVAR(fingersHash), _x);
    _data params ["_lastTime", "_pos", "_name"];
    private _timeLeftToShow = _lastTime + FP_TIMEOUT - diag_tickTime;
    if (_timeLeftToShow <= 0) then {
        HASH_REM(GVAR(fingersHash), _x);
    } else {
        private _drawColor = + GVAR(indicatorColor);
        // Fade out:
        _drawColor set [3, ((_drawColor select 3) * ((_timeLeftToShow min 0.5) / 0.5))];

        drawIcon3D [QPATHTOF(UI\fp_icon2.paa), _drawColor, ASLtoAGL _pos, _iconSize, _iconSize, 0, _name, 1, 0.03, "RobotoCondensed"];
    };
} count (GVAR(fingersHash) select 0);

if ((count (GVAR(fingersHash) select 0)) == 0) then {
    [GVAR(pfeh_id)] call CBA_fnc_removePerFrameHandler;
    GVAR(pfeh_id) = -1;
};
