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

if (!alive ACE_player) then {GVAR(fingersHash) = [] call CBA_fnc_hashCreate;};
// Conditions: canInteract
if !([ACE_player, ACE_player, ["isNotInside"]] call EFUNC(common,canInteractWith)) then {GVAR(fingersHash) = [] call CBA_fnc_hashCreate;};
// Make sure player is dismounted or in a static weapon:
if ((ACE_player != vehicle ACE_player) && {!((vehicle ACE_player) isKindOf "StaticWeapon")}) then {GVAR(fingersHash) = [] call CBA_fnc_hashCreate;};

private _iconSize = BASE_SIZE * 0.10713 * (call EFUNC(common,getZoom));

[+GVAR(fingersHash), {
    //IGNORE_PRIVATE_WARNING ["_key", "_value"];
    _value params ["_lastTime", "_pos", "_name"];
    private _timeLeftToShow = _lastTime + FP_TIMEOUT - diag_tickTime;
    if (_timeLeftToShow <= 0) then {
        [GVAR(fingersHash), _key] call CBA_fnc_hashRem;
    } else {
        private _drawColor = + GVAR(indicatorColor);
        // Fade out:
        _drawColor set [3, ((_drawColor select 3) * ((_timeLeftToShow min 0.5) / 0.5))];

        drawIcon3D [QPATHTOF(UI\fp_icon2.paa), _drawColor, ASLtoAGL _pos, _iconSize, _iconSize, 0, _name, 1, 0.03, "RobotoCondensed"];
    };
}] call CBA_fnc_hashEachPair;

if ((GVAR(fingersHash) select 1) isEqualTo []) then {
    TRACE_1("Ending PFEH", GVAR(pfeh_id));
    [GVAR(pfeh_id)] call CBA_fnc_removePerFrameHandler;
    GVAR(pfeh_id) = -1;
};
