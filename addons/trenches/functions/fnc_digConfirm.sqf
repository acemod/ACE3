/*
 * Author: Garth 'L-H' de Wet, Ruthberg, edited by commy2 for better MP and eventual AI support and esteldunedain
 * Confirms trench dig
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player] call ace_trenches_fnc_digConfirm
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

// enable running again
[_unit, "forceWalk", "ACE_Trenches", false] call EFUNC(common,statusEffect_set);

// delete placement dummy and create real trench
[{
    if (isNull GVAR(trench)) exitWith {};

    params ["_unit"];

    GVAR(trenchType) params ["", "", "_dx", "_dy", "_offset"];
    private _position = getPosASL GVAR(trench);
    private _angle = (GVAR(digDirection) + getDir _unit);
    private _minz = (getTerrainHeightASL _position);
    _position set [2, _minz + _offset];
    private _v3 = [sin _angle, +cos _angle, 0] vectorCrossProduct surfaceNormal _position;
    private _v1 = (surfaceNormal _position) vectorCrossProduct _v3;

    deleteVehicle GVAR(trench);

    private _trench = createVehicle [GVAR(trenchType) select 0, [0, 0, 0], [], 0, "NONE"];
    _trench setPosASL _position;
    _trench setVectorDirAndUp [_v1, surfaceNormal _position];

    GVAR(trench) = objNull;
}, [_unit], 1] call EFUNC(common,waitAndExecute);

// remove dig pfh
[GVAR(digPFH)] call CBA_fnc_removePerFrameHandler;
GVAR(digPFH) = -1;

// remove mouse button actions
call EFUNC(interaction,hideMouseHint);

[_unit, "DefaultAction", _unit getVariable [QGVAR(Dig), -1]] call EFUNC(common,removeActionEventHandler);
[_unit, "zoomtemp",      _unit getVariable [QGVAR(Cancel), -1]] call EFUNC(common,removeActionEventHandler);

// play animation
_unit playActionNow "PutDown";

_unit setVariable [QGVAR(isDigging), false, true];
