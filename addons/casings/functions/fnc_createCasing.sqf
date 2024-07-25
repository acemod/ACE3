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


private _modelPath = GVAR(cachedCasings) getOrDefaultCall [_ammo, {
    private _cartridge = getText (configFile >> "CfgAmmo" >> _ammo >> "cartridge");
    if (_cartridge == "") then { // return (note: can't use exitWith)
        ""
    } else {
        private _cartridgeConfig = configFile >> "CfgVehicles" >> _cartridge;

        // if explicitly defined, use ACE's config
        if (isText (_cartridgeConfig >> QGVAR(model))) exitWith {
            getText (_cartridgeConfig >> QGVAR(model))
        };
        // use casing's default model
        private _model = getText (_cartridgeConfig >> "model");
        if ("a3\weapons_f\empty" in toLowerANSI _model) exitWith { "" };
        
        // Add file extension if missing (fileExists needs file extension)
        if ((_model select [count _model - 4]) != ".p3d") then {
            _model = _model + ".p3d";
        };

        ["", _model] select (fileExists _model)
    };
}, true];

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
