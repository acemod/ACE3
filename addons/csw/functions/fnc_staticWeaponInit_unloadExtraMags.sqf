#include "..\script_component.hpp"
/*
 * Author: tcvm, PabstMirror
 * Dumps ammo to container
 *
 * Arguments:
 * 0: Weapon <OBJECT>
 * 1: Using advanced assembly <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, false] call ace_csw_fnc_staticWeaponInit_unloadExtraMags
 *
 * Public: No
 */

params ["_staticWeapon", "_assemblyMode", "_emptyWeapon"];
TRACE_3("staticWeaponInit_unloadExtraMags",_staticWeapon,_assemblyMode,_emptyWeapon);
if (!_assemblyMode) exitWith {};

private _desiredAmmo = getNumber (configOf _staticWeapon >> QUOTE(ADDON) >> "desiredAmmo");
private _storeExtraMagazines = GVAR(handleExtraMagazines);
if (_emptyWeapon) then {
    _desiredAmmo = 0;
    _storeExtraMagazines = false;
};
TRACE_3("settings",_emptyWeapon,_desiredAmmo,_storeExtraMagazines);

private _magsToRemove = [];
private _loadedMagazineInfo = [];
private _containerMagazineClassnames = [];
private _containerMagazineCount = [];

{
    _x params ["_xMag", "_xTurret", "_xAmmo"];

    private _carryMag = _xMag call FUNC(getCarryMagazine);
    if (_carryMag != "") then {
        if ((_desiredAmmo > 0) && {_loadedMagazineInfo isEqualTo []}) then {
            private _loadedMagAmmo = _desiredAmmo min _xAmmo;
            _loadedMagazineInfo = [_xMag, _xTurret, _loadedMagAmmo];
            _xAmmo = _xAmmo - _loadedMagAmmo;
            TRACE_1("",_loadedMagAmmo);
        };
        if (_xAmmo > 0) then {
            _magsToRemove pushBackUnique [_xMag, _xTurret];
            private _index = _containerMagazineClassnames find _carryMag;
            if (_index < 0) then {
                _index = _containerMagazineClassnames pushBack _carryMag;
                _containerMagazineCount pushBack 0;
            };
            _containerMagazineCount set [_index, (_containerMagazineCount select _index) + _xAmmo];
        };
    } else {
        if ((_xMag select [0,4]) != "fake") then { WARNING_1("Unable to unload [%1] - No matching carry mag",_xMag); };
    };
} forEach (magazinesAllTurrets _staticWeapon);


TRACE_1("Remove all loaded magazines",_magsToRemove);
{
    _staticWeapon removeMagazinesTurret _x;
    if ((_loadedMagazineInfo select [0,2]) isEqualTo _x) then {
        TRACE_1("Re-add the starting mag",_loadedMagazineInfo);
        _staticWeapon addMagazineTurret _loadedMagazineInfo;
    };
} forEach _magsToRemove;

if (_staticWeapon getVariable [QGVAR(secondaryWeaponMagazine), ""] isNotEqualTo "") then {
    private _secondaryWeaponMagazine = _staticWeapon getVariable QGVAR(secondaryWeaponMagazine);
    private _turret = allTurrets _staticWeapon param [0, []];
    private _vehicleMag = [_staticWeapon, _turret, _secondaryWeaponMagazine] call FUNC(reload_getVehicleMagazine);
    TRACE_3("Re-add previous mag",_secondaryWeaponMagazine,_turret,_vehicleMag);
    if (!isClass (configFile >> "CfgMagazines" >> _vehicleMag)) exitWith {};
    _staticWeapon addMagazineTurret [_vehicleMag, _turret, 1];
    _staticWeapon setVariable [QGVAR(secondaryWeaponMagazine), nil];
};

if (_storeExtraMagazines) then {
    TRACE_1("saving extra mags to container",_containerMagazineCount);
    {
        [_staticWeapon, _x, _containerMagazineCount select _forEachIndex] call FUNC(reload_handleReturnAmmo);
    } forEach _containerMagazineClassnames;
};
