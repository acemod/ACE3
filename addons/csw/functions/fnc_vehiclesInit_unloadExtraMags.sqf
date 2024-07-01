#include "../script_component.hpp"
 /*
 * Author: [KND]Liquid, Brandon (TCVM), PabstMirror
 * Describe your function
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: TurretPath <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle,[0]] call ace_csw_fnc_vehiclesInit_unloadExtraMags;
 *
 * Public: No
 */

params ["_vehicle", "_turret"];
TRACE_2("vehiclesInit_unloadExtraMags",_vehicle,_turret);
if (!alive _vehicle) exitWith {TRACE_1("dead/deleted",alive _vehicle);};

private _emptyWeapon = _vehicle getVariable [QGVAR(emptyWeapon), false];
TRACE_1("",_emptyWeapon);

private _desiredAmmo = getNumber (configOf _vehicle >> QUOTE(ADDON) >> "desiredAmmo");
private _storeExtraMagazines = GVAR(handleExtraMagazines);
if (_emptyWeapon) then {
    _desiredAmmo = 0;
    _storeExtraMagazines = false;
};
TRACE_2("settings",_desiredAmmo,_storeExtraMagazines);

private _magsToRemove = [];
private _loadedMagazineInfo = [];
private _containerMagazineClassnames = [];
private _containerMagazineCount = [];

{
    _x params ["_xMag", "_xTurret", "_xAmmo"];
    TRACE_4("",_xMag,_xTurret,_xAmmo,_turret);

    if (_xTurret isEqualTo _turret) then
    {
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
    };

} forEach (magazinesAllTurrets _vehicle); //_vehicle magazinesTurret _x


TRACE_1("Remove all loaded magazines",_magsToRemove);
{ 
    _vehicle removeMagazinesTurret _x;
} forEach _magsToRemove;

TRACE_1("Re-add the starting mag",_loadedMagazineInfo);
if (!(_loadedMagazineInfo isEqualTo [])) then {
    _vehicle addMagazineTurret _loadedMagazineInfo;
};

if (_storeExtraMagazines) then {
    TRACE_1("saving extra mags to container",_containerMagazineCount);
    {
        [_vehicle, _x, _containerMagazineCount select _forEachIndex] call FUNC(reload_handleReturnAmmo);
    } forEach _containerMagazineClassnames;
};
