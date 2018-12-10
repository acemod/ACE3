#include "script_component.hpp"
/*
 * Author: chris579
 * Removes camouflage from a trench.
 *
 * Arguments:
 * 0: Trench <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [TrenchObj, Unit] call ace_trenches_fnc_removeCamouflage
 *
 * Public: No
 */


params ["_trench", "_unit"];

private _fnc_onFinish = {
    (_this select 0) params ["_unit", "_trench"];
    [_trench] call FUNC(deleteCamouflage);

    // Reset animation
    [_unit, "", 1] call EFUNC(common,doAnimation);
};

private _fnc_onFailure = {
    (_this select 0) params ["_unit"];
    // Reset animation
    [_unit, "", 1] call EFUNC(common,doAnimation);
};

[CAMOUFLAGE_DURATION, [_unit, _trench], _fnc_onFinish, _fnc_onFailure, localize LSTRING(removeCamouflageProgress)] call EFUNC(common,progressBar);

[_unit, "AinvPknlMstpSnonWnonDnon_medic4"] call EFUNC(common,doAnimation);
