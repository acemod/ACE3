#include "script_component.hpp"
/*
 * Author: esteldunedain / Cyruz / diwako
 * Produces a casing matching the fired rifles caliber on the ground around the unit
 *
 * Arguments:
 * 0: unit - Object the event handler is assigned to <OBJECT>
 * 1: weapon - Fired weapon <STRING>
 * 2: ammo - Ammo used <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, currentWeapon player, "","", player ammo currentWeapon player] call ace_casings_fnc_createCase
 *
 * Public: No
 */

params ["_unit", "_weapon", "", "", "_ammo"];

if (!isNull objectParent _unit) exitWith {};

private _modelPath = GVAR(cachedCasings) get _ammo;

if (isNil "_modelPath") then {
    private _cartridge = getText (configFile >> "CfgAmmo" >> _ammo >> "cartridge");
    //Default cartridge is a 5.56mm model
    _modelPath = switch (_cartridge) do {
        case "FxCartridge_9mm":     { "A3\Weapons_f\ammo\cartridge_small.p3d" };
        case "FxCartridge_65":      { "A3\weapons_f\ammo\cartridge_65.p3d" };
        case "FxCartridge_762":     { "A3\weapons_f\ammo\cartridge_762.p3d" };
        case "FxCartridge_127":     { "A3\weapons_f\ammo\cartridge_127.p3d" };
        case "FxCartridge_slug":    { "A3\weapons_f\ammo\cartridge_slug.p3d" };
        case "":                    { "" };
        default { "A3\Weapons_f\ammo\cartridge.p3d" };
    };
    GVAR(cachedCasings) set [_ammo, _modelPath];
};

if (_modelPath isEqualTo "") exitWith {};

private _unitPos = getposASL _unit;
// Distant shooters don't produce as many cases
if ((AGLToASL positionCameraToWorld [0,0,0]) vectorDistance _unitPos > 100 && {random 1 < 0.9}) exitWith {};

private _weapDir = _unit weaponDirection currentWeapon _unit;
private _ejectDir = _weapDir vectorCrossProduct [0, 0, 1];
private _pos = _unitPos
    vectorAdd (_weapDir vectorMultiply (-0.5 + random 1 + random 1))
    vectorAdd (_ejectDir vectorMultiply (0.2 + random 1 + random 1))
    vectorAdd [0, 0, 0.005];

[
    {
        params ["_modelPath", "_pos"];

        private _casing = createSimpleObject [_modelPath, [0,0,0], true];
        _casing setPosASL _pos;
        _casing setDir (random 360);
        private _idx = GVAR(casings) pushBack _casing;

        for "_" from 0 to (_idx - GVAR(maxCasings)) do {
            deleteVehicle (GVAR(casings) deleteAt 0);
        };
    },
    [_modelPath,_pos],
    0.4
] call CBA_fnc_waitAndExecute;
