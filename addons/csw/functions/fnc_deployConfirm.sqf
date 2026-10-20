#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, Ruthberg, commy2, Smith, johnb43
 * Confirms unloading when deploying.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_csw_fnc_deployConfirm
 *
 * Public: No
 */

if (GVAR(deployPFH) == -1) exitWith {};

params ["_player"];

// Delete placement dummy and place real tripod at dummy position
if (!isNull GVAR(tripodPreviewObject) && {_player call FUNC(canDeployTripod)}) then {
    private _posASL = getPosASL GVAR(tripodPreviewObject);
    private _intersect = lineIntersectsSurfaces [_posASL, _posASL vectorAdd [0, 0, -1.5], _player, GVAR(tripodPreviewObject), true, 1, "ROADWAY", "FIRE"];

    private _vectorUp = if (_intersect isNotEqualTo []) then {
        (_intersect select 0) params ["_intersectPosASL", "_normal"];

        _posASL = _intersectPosASL;

        _normal
    } else {
        vectorUp GVAR(tripodPreviewObject)
    };

    [_player, _posASL, [vectorDir GVAR(tripodPreviewObject), _vectorUp]] call FUNC(assemble_deployTripod);
};

// Cleanup EHs and preview object
_player call FUNC(deployCancel);
