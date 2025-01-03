#include "..\script_component.hpp"
/*
 * Author: GabrielPearce / esteldunedain / Cyruz / diwako / PabstMirror
 * Produces a casing matching the reloaded and dropped magazine
 *
 * Arguments:
 * 0: unit - Object the reloaded event handler is assigned to <OBJECT>
 * 4: Old magazine (can be nil) - <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "", "","", ["1Rnd_HE_Grenade_shell", 0]] call ace_casings_fnc_createMagazine
 *
 * Public: No
 */

params ["_unit", "", "", "", "_oldMagazine"];
TRACE_2("createMagazine",_unit,_oldMagazine);

if (isNil "_oldMagazine") exitWith {};
_oldMagazine params ["_mag", "_ammo"];
if (_ammo != 0) exitWith {};

private _modelPath = GVAR(cachedMagazines) getOrDefaultCall [_mag, {
    switch (true) do {
         // Should cover most 40x36
        case (_mag in compatibleMagazines ["arifle_Mk20_GL_F", "EGLM"]): { "A3\Weapons_F\MagazineProxies\mag_40x36_HE_1rnd.p3d" };
        default { getText (configFile >> "CfgMagazines" >> _mag >> QGVAR(model)) };
    };
}, true];

if (_modelPath isEqualTo "") exitWith {};

private _unitPos = getPosASL _unit;
private _weapDir = _unit weaponDirection currentWeapon _unit;
private _ejectDir = _weapDir vectorCrossProduct [0, 0, 1];
private _pos = _unitPos
    vectorAdd (_weapDir vectorMultiply (-0.5 + random 2))
    vectorAdd (_ejectDir vectorMultiply (0.2 + random 2));

[
    {
        params ["_modelPath", "_pos"];
        TRACE_2("creating magazine",_modelPath,_pos);

        private _lisPos = (lineIntersectsSurfaces [_pos, _pos vectorAdd [0,0,-1e11], objNull, objNull, true, 1, "ROADWAY", "FIRE"]) #0;
        private _casing = createSimpleObject [_modelPath, (_lisPos #0 vectorAdd [0,0,0.010]), false]; // global
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
