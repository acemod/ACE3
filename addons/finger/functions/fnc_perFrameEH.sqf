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

private["_drawColor", "_fovCorrection", "_iconSize", "_sourceUnit", "_timeLeftToShow"];

if (!alive ACE_player) then {GVAR(fingersHash) = HASH_CREATE;};
// Conditions: canInteract
if !([ACE_player, ACE_player, ["isNotInside"]] call EFUNC(common,canInteractWith)) then {GVAR(fingersHash) = HASH_CREATE;};
//make sure player is dismounted or in a static weapon:
if ((ACE_player != vehicle ACE_player) && {!((vehicle ACE_player) isKindOf "StaticWeapon")}) then {GVAR(fingersHash) = HASH_CREATE;};

_fovCorrection = ((worldToScreen (positionCameraToWorld [1000, 0, 10000])) select 0) - 0.5;
_iconSize = BASE_SIZE * _fovCorrection;

{
    _sourceUnit = _x;
    _data = HASH_GET(GVAR(fingersHash), _x);
    EXPLODE_3_PVT(_data,_lastTime,_pos,_name);
    _timeLeftToShow = _lastTime + FP_TIMEOUT - ACE_diagTime;
    if (_timeLeftToShow <= 0) then {
        HASH_REM(GVAR(fingersHash), _x);
    } else {
        _drawColor = + GVAR(indicatorColor);
        //Fade out:
        if (_timeLeftToShow < 0.5) then {
            _drawColor set [3, ((_drawColor select 3) * (_timeLeftToShow / 0.5))];
        };

        drawIcon3D [QUOTE(PATHTOF(UI\fp_icon.paa)), _drawColor, _pos, _iconSize, _iconSize, 0, _name, 1, 0.03, "PuristaMedium"];
    };
} forEach (GVAR(fingersHash) select 0);

if ((count (GVAR(fingersHash) select 0)) == 0) then {
    [GVAR(pfeh_id)] call CBA_fnc_removePerFrameHandler;
    GVAR(pfeh_id) = -1;
};
