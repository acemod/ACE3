#include "..\script_component.hpp"
/*
 * Author: esteldunedain, johnb43
 * Start linking the belt.
 *
 * Arguments:
 * 0: Unit linking the belt <OBJECT>
 * 1: Unit equipped with the weapon <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget] call ace_reload_fnc_startLinkingBelt
 *
 * Public: No
 */

params ["_unit", "_target"];

if !(isNull objectParent _target) exitWith {false};

private _magazine = currentMagazine _target;
private _ammo = [_unit, _target] call FUNC(getAmmoToLinkBelt);

// If _ammo is below 0 we quit
if (_ammo <= 0) exitWith {};

// Condition to call each frame
private _condition = {
    (_this select 0) params ["_unit", "_target"];

    ([_unit, _target, []] call EFUNC(common,canInteractWith)) && {(_unit distance _target) < 3} && {(speed _target) < 1}
};

private _onFinish = {
    (_this select 0) params ["_unit", "_target", "_magazineInfo"];

    // Remove the magazine with given remaining ammo; If not possible, quit
    if !([_unit, _magazineInfo select 0, _magazineInfo select 1] call EFUNC(common,removeSpecificMagazine)) exitWith {
        [LSTRING(BeltNotLinked)] call EFUNC(common,displayTextStructured);
    };

    // Raise event on remote unit
    [QGVAR(ammoLinked), [_target, _unit, _magazineInfo], _target] call CBA_fnc_targetEvent;
};

private _onFailure = {
    (_this select 0) params ["_unit"];

    [_unit, "AmovPknlMstpSrasWrflDnon", 1] call EFUNC(common,doAnimation);

    [LSTRING(BeltNotLinked)] call EFUNC(common,displayTextStructured);
};

[_unit, "PutDown"] call EFUNC(common,doGesture);

// Call progress bar
[4, [_unit, _target, [_magazine, _ammo]], _onFinish, _onFailure, LLSTRING(LinkingBelt), _condition, ["isNotInside"]] call EFUNC(common,progressBar);
