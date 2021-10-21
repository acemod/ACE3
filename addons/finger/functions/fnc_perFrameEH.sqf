#include "script_component.hpp"
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

if (!alive ACE_player) then {GVAR(fingersHash) = createHashMap};
// Conditions: canInteract
if !([ACE_player, ACE_player, ["isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith)) then {GVAR(fingersHash) = createHashMap};
// Make sure player is dismounted or in a static weapon:
if ((ACE_player != vehicle ACE_player) && {!((vehicle ACE_player) isKindOf "StaticWeapon")}) then {GVAR(fingersHash) = createHashMap};

private _iconSize = BASE_SIZE * 0.10713 * (call EFUNC(common,getZoom));

{
    //IGNORE_PRIVATE_WARNING ["_x", "_y"];
    _y params ["_lastTime", "_pos", "_name"];
    private _timeLeftToShow = _lastTime + FP_TIMEOUT - diag_tickTime;
    if (_timeLeftToShow <= 0) then {
        GVAR(fingersHash) deleteAt _x;
    } else {
        private _drawColor = + GVAR(indicatorColor);
        // Fade out:
        _drawColor set [3, ((_drawColor select 3) * ((_timeLeftToShow min 0.5) / 0.5))];

        drawIcon3D [QPATHTOF(UI\fp_icon2.paa), _drawColor, ASLtoAGL _pos, _iconSize, _iconSize, 0, _name, 1, 0.03, "RobotoCondensed"];
    };
} forEach GVAR(fingersHash);

if (GVAR(fingersHash) isEqualTo createHashMap) then {
    TRACE_1("Ending PFEH", GVAR(pfeh_id));
    [GVAR(pfeh_id)] call CBA_fnc_removePerFrameHandler;
    GVAR(pfeh_id) = -1;
};
