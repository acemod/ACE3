/*
 * Author: esteldunedain
 * Start linking the belt
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, kevin] call ace_reload_fnc_startLinkingBelt
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_player", "_target"];

if (vehicle _target != _target) exitWith {false};

private _magazineType = currentMagazine _target;


private _maxAmmo = [_player, _target] call FUNC(getAmmoToLinkBelt);

//if _maxAmmo is below 0 we quit
if (_maxAmmo <= 0) exitWith {};

// Condition to call each frame
private _condition = {
    (_this select 0) params ["_player", "_target"];
    ([_player, _target, []] call EFUNC(common,canInteractWith)) && ((_player distance _target) < 3) && ((speed _target) < 1)
};

private _onFinish = {
    (_this select 0) params ["_player", "_target", "_magazine"];

    // Raise event on remote unit
    [QGVAR(ammoLinked), [_target, _player, _magazine], [_target]] call CBA_fnc_targetEvent;
};

private _onFailure = {
    (_this select 0) params ["_player", "_target", "_magazine"];
    [_player, "AmovPknlMstpSrasWrflDnon", 1] call EFUNC(common,doAnimation);

    // Add back the magazine with the former ammo count
    _player addMagazine _magazine;
};

[_player, "PutDown"] call EFUNC(common,doGesture);

// Remove the magazine with maximum remaining ammo
[_player, _magazineType, _maxAmmo] call EFUNC(common,removeSpecificMagazine);

// Call progress bar
[4, [_player, _target, [_magazineType, _maxAmmo]], _onFinish, _onFailure, (localize LSTRING(LinkingBelt)), _condition, ["isNotInside"]] call EFUNC(common,progressBar);
