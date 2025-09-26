#include "..\script_component.hpp"
/*
 * Author: tcvm, PabstMirror
 * Dumps ammo to container.
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Empty weapon <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, false] call ace_csw_fnc_staticWeaponInit_unloadExtraMags
 *
 * Public: No
 */

params ["_vehicle", "_emptyWeapon"];
TRACE_2("staticWeaponInit_unloadExtraMags",_vehicle,_emptyWeapon);

_vehicle setVariable [QGVAR(initialising), true];

private _desiredAmmo = getNumber (configOf _vehicle >> QUOTE(ADDON) >> "desiredAmmo");
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
} forEach (magazinesAllTurrets _vehicle);


TRACE_1("Remove all loaded magazines",_magsToRemove);
{
    [QEGVAR(common,removeMagazinesTurret), [_vehicle, _x select 0, _x select 1], _vehicle, _x select 1] call CBA_fnc_turretEvent;

    if ((_loadedMagazineInfo select [0,2]) isEqualTo _x) then {
        TRACE_1("Re-add the starting mag",_loadedMagazineInfo);

        [QEGVAR(common,addMagazineTurret), [_vehicle, _loadedMagazineInfo], _vehicle, _x select 1] call CBA_fnc_turretEvent;
    };
} forEach _magsToRemove;

private _secondaryWeaponMagazines = _vehicle getVariable [QGVAR(secondaryWeaponMagazines), []];

if (_secondaryWeaponMagazines isNotEqualTo []) then {
    // Check if the static weapon can take magazines
    private _turret = (allTurrets _vehicle) param [0, []];
    private _compatibleMagazinesTurret = flatten ((_vehicle weaponsTurret _turret) apply {compatibleMagazines _x});
    private _container = objNull;

    {
        private _vehicleMag = [_vehicle, _turret, _x select 0] call FUNC(reload_getVehicleMagazine);
        TRACE_3("Re-add previous mag",_x select 0,_turret,_vehicleMag);

        // If the magazine can be added to the static weapon, do it now
        if (_vehicleMag in _compatibleMagazinesTurret) then {
            [QEGVAR(common,addMagazineTurret), [_vehicle, [_vehicleMag, _turret, _x select 1]], _vehicle, _turret] call CBA_fnc_turretEvent;
        } else {
            // Find a suitable container to place items in if necessary
            if (isNull _container) then {
                _container = (nearestObjects [_vehicle, ["GroundWeaponHolder"], 10]) param [0, objNull];

                // Create ammo storage container
                if (isNull _container) then {
                    _container = createVehicle ["GroundWeaponHolder", getPosATL _vehicle, [], 0, "NONE"];
                };
            };

            // If the mag can't be added to the static weapon, add it to the ground holder
            _container addMagazineAmmoCargo [_x select 0, 1, _x select 1];
        };
    } forEach _secondaryWeaponMagazines;

    _vehicle setVariable [QGVAR(secondaryWeaponMagazines), nil, true];
};

if (_storeExtraMagazines) then {
    TRACE_1("saving extra mags to container",_containerMagazineCount);
    {
        [_vehicle, _x, _containerMagazineCount select _forEachIndex] call FUNC(reload_handleReturnAmmo);
    } forEach _containerMagazineClassnames;
};

[{ _this setVariable [QGVAR(initialising), false]; }, _vehicle] call CBA_fnc_execNextFrame;
