#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Helper function for ace_rearm; Gets magazines that should be loaded by csw.
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Specific Turret or pass bool to check all turrets <ARRAY|BOOL> (default: true)
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

private _return = [[], []];

if !(_vehicle isKindOf "StaticWeapon") exitWith {_return}; // limit to statics for now
// Assembly mode: [0=disabled, 1=enabled, 2=enabled&unload, 3=default]
if ((GVAR(ammoHandling) == 0) && {!([false, true, true, GVAR(defaultAssemblyMode)] select (_vehicle getVariable [QGVAR(assemblyMode), 3]))}) exitWith {_return};

private _turretMagsCSW = _return select 0;
private _allCarryMags = _return select 1;

private _turrets = allTurrets _vehicle;
if (_targetTurret isNotEqualTo true) then {
    _turrets = _turrets select {_x isEqualTo _targetTurret};
};

{
    private _turretPath = _x;
    {
        private _weapon = _x;
        {
            private _xMag = _x;
            private _carryMag = _xMag call FUNC(getCarryMagazine);
            if (_carryMag != "") then {
                _turretMagsCSW pushBackUnique _xMag;
                _allCarryMags pushBackUnique _carryMag;
            };
        } forEach (compatibleMagazines _weapon);
    } forEach (_vehicle weaponsTurret _turretPath);
} forEach _turrets;

_return
