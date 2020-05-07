#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Helper function for ace_rearm; Gets magazines that should be loaded by csw
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Specific Turret or pass bool to check all turrets <ARRAY><BOOL>(default: true)
 *
 * Return Value:
 * [0: compatible veh mags, 1: carry mags] <ARRAY>
 *
 * Example:
 * [cursorObject, [0]] call ace_csw_fnc_aceRearmGetCarryMagazines
 *
 * Public: No
 */

params ["_vehicle", ["_targetTurret", true, [[], true]]];

if (!(_vehicle isKindOf "StaticWeapon")) exitWith { [[],[]] }; // limit to statics for now
// Assembly mode: [0=disabled, 1=enabled, 2=enabled&unload, 3=default]
if ((GVAR(ammoHandling) == 0) && {!([false, true, true, GVAR(defaultAssemblyMode)] select (_vehicle getVariable [QGVAR(assemblyMode), 3]))}) exitWith { [[],[]] };

private _turretMagsCSW = [];
private _allCarryMags = [];
{
    private _turretPath = _x;
    if ((_targetTurret isEqualTo true) || {_turretPath isEqualTo _targetTurret}) then {
        {
            private _weapon = _x;
            {
                private _xMag = _x;
                private _carryMag = GVAR(vehicleMagCache) getVariable _xMag;
                if (isNil "_carryMag") then {
                    private _groups = "getNumber (_x >> _xMag) == 1 && {isClass (configFile >> 'CfgMagazines' >> configName _x)}" configClasses (configFile >> QGVAR(groups));
                    _carryMag = configName (_groups param [0, configNull]);
                    GVAR(vehicleMagCache) setVariable [_x, _carryMag];
                    TRACE_2("setting cache",_xMag,_carryMag);
                };
                if (_carryMag != "") then {
                    _turretMagsCSW pushBackUnique _xMag;
                    _allCarryMags pushBackUnique _carryMag;
                };
            } forEach ([_weapon] call CBA_fnc_compatibleMagazines);
        } forEach (_vehicle weaponsTurret _turretPath);
    };
} forEach (allTurrets _vehicle);

[_turretMagsCSW, _allCarryMags]
