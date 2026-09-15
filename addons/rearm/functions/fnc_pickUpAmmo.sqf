#include "..\script_component.hpp"
/*
 * Author: GitHawk
 * Starts progress bar for picking up a specific kind of magazine from the ground.
 *
 * Arguments:
 * 0: Ammo Dummy <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [target, player] call ace_rearm_fnc_pickUpAmmo
 *
 * Public: No
 */

params ["_dummy", "_unit"];

private _attachedDummy = _unit getVariable [QGVAR(dummy), objNull];
if !(isNull _attachedDummy) exitWith {};

_dummy attachTo [_unit, [0,1,0], "pelvis"];

private _nearUnits = _unit nearObjects ["CAManBase", 100];
// disableCollisionWith damage with the nearby units:
[QGVAR(makeDummyEH), [_dummy, [[-1,0,0],[0,0,1]]], _nearUnits] call CBA_fnc_targetEvent;

_unit setVariable [QGVAR(dummy), _dummy];

if (GVAR(usePylonPosition) && {GVAR(level) > 0} && {typeOf _attachedDummy isNotEqualTo QGVAR(defaultCarriedObject)}) then {
    private _action = [
        QGVAR(flipAmmo),
        localize "STR_3DEN_Display3DEN_ControlsHint_Rotate",
        "a3\ui_f_curator\Data\CfgWrapperUI\Cursors\curatorRotate_ca.paa",
        {
            params ["_dummy", "_unit"];
            _dummy setVectorDirAndUp [
                (_unit vectorWorldToModelVisual vectorDir _dummy) vectorMultiply -1,
                [0,0,1]
            ];
        }, {
            params ["_dummy", "_unit"];
            _dummy == _unit getVariable [QGVAR(dummy), objNull]
        }
    ] call EFUNC(interact_menu,createAction);
    [_dummy , 0, [], _action] call EFUNC(interact_menu,addActionToObject);
};
