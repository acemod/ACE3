/*
 * Author: GitHawk
 * Get the caliber of the ammo in a magazine and return its parameters.
 *
 * Arguments:
 * 0: Magazine Classname <STRING>
 *
 * Return Value:
 * 0: Caliber information <ARRAY>
 *   0: Rounded caliber <NUMBER>
 *   1: Caliber index <NUMBER>
 *
 * Example:
 * ["500Rnd_127x99_mag_Tracer_Red"] call ace_rearm_fnc_getCaliber
 *
 * Public: No
 */
#include "script_component.hpp"

params [
    ["_magazineClass", ""]
];

if (_magazineClass isEqualTo "") exitWith {[8, 2]};

private _ammo = getText (configFile >> "CfgMagazines" >> _magazineClass >> "ammo");
private _tmpCal = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ace_caliber");
private _cal = 8;
if (_tmpCal > 0) then {
    _cal = _tmpCal;
} else {
    _tmpCal = getNumber (configFile >> "CfgAmmo" >> _ammo >> QGVAR(caliber));
    if (_tmpCal > 0) then {
        _cal = _tmpCal;
    } else {
        diag_log format ["[ACE] ERROR: Undefined Ammo [%1 : %2]", _ammo, inheritsFrom (configFile >> "CfgAmmo" >> _ammo)];
        if (_ammo isKindOf "BulletBase") then {
            _cal = 8;
        } else {
            _cal = 100;
        };
    };
};
_cal = round _cal;
private _idx = REARM_CALIBERS find _cal;
if (_idx == -1 ) then {
    _idx = 2;
};

[_cal, _idx]
