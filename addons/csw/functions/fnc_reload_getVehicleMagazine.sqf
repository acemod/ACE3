#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Finds the best vehicle magazines to create from a carryable magazine for a given weapon.
 *
 * Arguments:
 * 0: Weapon <STRING>
 * 1: Magazine that is carryable <STRING>
 *
 * Return Value:
 * Vehicle Magazine <STRING>
 *
 * Example:
 * [cursorObject, [0], "ace_csw_100Rnd_127x99_mag"] call ace_csw_fnc_reload_getVehicleMagazine
 *
 * Public: No
 */

params ["_vehicle", "_turret", "_carryMag"];
TRACE_3("reload_getVehicleMagazine",_vehicle,_turret,_carryMag);

private _carryGroupCfg = configFile >> QGVAR(groups) >> _carryMag;
private _desiredAmmo = getNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> QUOTE(ADDON) >> "desiredAmmo");
if (_desiredAmmo == 0) then { _desiredAmmo = 100; };

private _bestMag = "#";
private _bestMagCount = -1;

{
    private _weapon = _x;
    {
        if ((getNumber (_carryGroupCfg >> _x)) == 1) then {
            private _xAmmo = getNumber (configFile >> "CfgMagazines" >> _x >> "ammo");
            if (((_xAmmo >= _bestMagCount) && {_bestMagCount < _desiredAmmo}) || {(_xAmmo >= _desiredAmmo) && {_xAmmo < _bestMagCount}}) then {
                _bestMag = _x;
                _bestMagCount = _xAmmo;
            };
        };
    } forEach (getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines"));
} forEach (_vehicle weaponsTurret _turret);
TRACE_3("best fit",_desiredAmmo,_bestMag,_bestMagCount);

if (_bestMag == "#") then { ERROR_1("veh mag not found for %1",_carryMag); };

_bestMag
