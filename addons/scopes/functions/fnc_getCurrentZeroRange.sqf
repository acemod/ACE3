#include "..\script_component.hpp"
/*
 * Author: Ruthberg
 * Gets the zero range of the currently used optic
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * current zero range <NUMBER>
 *
 * Example:
 * [player] call ace_scopes_fnc_getCurrentZeroRange
 *
 * Public: No
 */

params ["_unit"];

if (!GVAR(enabled)) exitWith {currentZeroing _unit};

private _currentWeapon = currentWeapon _unit;
private _weaponIndex = [_unit, _currentWeapon] call EFUNC(common,getWeaponIndex);
if (_weaponIndex < 0) exitWith { currentZeroing _unit };

if (GVAR(simplifiedZeroing)) exitWith {
    if !(GVAR(canAdjustElevation) select _weaponIndex) exitWith {currentZeroing _unit};
    private _adjustment = _unit getVariable [QGVAR(Adjustment), [[0, 0, 0], [0, 0, 0], [0, 0, 0]]];
    ((_adjustment select _weaponIndex) select 0)
};

private _local = _unit == ACE_Player;

private _optic = if (_local) then {
    GVAR(Optics) select _weaponIndex
} else {
    ([_unit] call FUNC(getOptics)) select _weaponIndex
};
private _opticConfig = if (_optic != "") then {
    (configFile >> "CfgWeapons" >> _optic)
} else {
    if (_local) then {
        (configFile >> "CfgWeapons" >> (GVAR(Guns) select _weaponIndex))
    } else {
        (configFile >> "CfgWeapons" >> _currentWeapon)
    };
};

private _zeroRange = currentZeroing _unit;
// Revert zeroing to default if overriding is enabled OR the selected sight's magnification is not higher than that of the naked eye, meaning that it is a secondary iron/holo sight
if (
    _local && 
    (GVAR(canAdjustElevation) select _weaponIndex) && 
    {GVAR(overwriteZeroRange) || {getNumber (_opticConfig >> "ItemInfo" >> "OpticsModes" >> (_unit getOpticsMode _weaponIndex) >> "opticsZoomMax") > MIN_ZOOM_NAKEDEYE}}
) then {
    _zeroRange = GVAR(defaultZeroRange);
};
if (isNumber (_opticConfig >> "ACE_ScopeZeroRange")) then {
    _zeroRange = getNumber(_opticConfig >> "ACE_ScopeZeroRange");
};

_zeroRange
