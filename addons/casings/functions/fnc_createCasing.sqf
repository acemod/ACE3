#include "..\script_component.hpp"
/*
 * Author: esteldunedain / Cyruz / diwako
 * Produces a casing matching the fired weapons caliber on the ground around the unit
 *
 * Arguments:
 * 0: unit - Object the event handler is assigned to <OBJECT>
 * 1: ammo - Ammo used <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "", "","", "B_556x45_Ball"] call ace_casings_fnc_createCasing
 *
 * Public: No
 */

params ["_unit", "", "", "", "_ammo"];

if (!isNull objectParent _unit) exitWith {};

private _modelPath = GVAR(cachedCasings) get _ammo;

if (isNil "_modelPath") then {
    private _cartridge = getText (configFile >> "CfgAmmo" >> _ammo >> "cartridge");
    //Default cartridge is a 5.56mm model
    _modelPath = switch (_cartridge) do {
        case "FxCartridge_9mm":                 { "A3\Weapons_f\ammo\cartridge_small.p3d" };
        case "FxCartridge_65":                  { "A3\weapons_f\ammo\cartridge_65.p3d" };
        case "FxCartridge_762":                 { "A3\weapons_f\ammo\cartridge_762.p3d" };
        case "FxCartridge_762x39":              { "A3\weapons_f_enoch\ammo\cartridge_762x39.p3d" };
        case "FxCartridge_93x64_Ball":          { "A3\Weapons_F_Mark\Ammo\cartridge_93x64.p3d" };
        case "FxCartridge_338_Ball":            { "A3\Weapons_F_Mark\Ammo\cartridge_338_LM.p3d" };
        case "FxCartridge_338_NM":              { "A3\Weapons_F_Mark\Ammo\cartridge_338_NM.p3d" };
        case "FxCartridge_127":                 { "A3\weapons_f\ammo\cartridge_127.p3d" };
        case "FxCartridge_127x54":              { "A3\Weapons_F_Mark\Ammo\cartridge_127x54.p3d" };
        case "FxCartridge_slug":                { "A3\weapons_f\ammo\cartridge_slug.p3d" };
        case "FxCartridge_12Gauge_HE_lxWS":     { "lxWS\weapons_1_f_lxws\Ammo\cartridge_he_lxws.p3d" };
        case "FxCartridge_12Gauge_Slug_lxWS":   { "lxWS\weapons_1_f_lxws\Ammo\cartridge_slug_lxws.p3d" };
        case "FxCartridge_12Gauge_Smoke_lxWS":  { "lxWS\weapons_1_f_lxws\Ammo\cartridge_smoke_lxws.p3d" };
        case "FxCartridge_12Gauge_Pellet_lxWS": { "lxWS\weapons_1_f_lxws\Ammo\cartridge_pellet_lxws.p3d" };
        case "":                                { "" };
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
    vectorAdd (_weapDir vectorMultiply (-0.5 + random 2))
    vectorAdd (_ejectDir vectorMultiply (0.2 + random 2));

[
    {
        params ["_modelPath", "_pos"];

        private _lisPos = (lineIntersectsSurfaces [_pos, _pos vectorAdd [0,0,-1e11], objNull, objNull, true, 1, "ROADWAY", "FIRE"]) #0;
        private _casing = createSimpleObject [_modelPath, (_lisPos #0 vectorAdd [0,0,0.005]), true];
        _casing setDir (random 360);
        _casing setVectorUp _lisPos #1;
        private _idx = GVAR(casings) pushBack _casing;

        for "_" from 0 to (_idx - GVAR(maxCasings)) do {
            deleteVehicle (GVAR(casings) deleteAt 0);
        };
    },
    [_modelPath,_pos],
    0.4
] call CBA_fnc_waitAndExecute;
