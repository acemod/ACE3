#include "..\script_component.hpp"
/*
 * Author: GitHawk
 * Stores ammo in an ammo truck.
 *
 * Arguments:
 * 0: Ammo Truck <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ammo_truck, player] call ace_rearm_fnc_storeAmmo
 *
 * Public: No
 */

params ["_truck", "_unit"];

private _attachedDummy = _unit getVariable [QGVAR(dummy), objNull];
if (isNull _attachedDummy) exitWith {};

private _magazineClass = _attachedDummy getVariable [QGVAR(magazineClass), "#noVar"];

[
    TIME_PROGRESSBAR(5),
    [_unit, _truck, _attachedDummy],
    {
        params ["_args"];
        _args params ["_unit", "_truck", "_attachedDummy"];
        [_truck, (_attachedDummy getVariable [QGVAR(magazineClass), ""]), true] call FUNC(addMagazineToSupply);
        [_unit, true, true] call FUNC(dropAmmo);
    },
    "",
    format [localize LSTRING(StoreAmmoAction), _magazineClass call FUNC(getMagazineName), getText(configOf _truck >> "displayName")],
    {true},
    ["isnotinside"]
] call EFUNC(common,progressBar);
