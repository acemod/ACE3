/*
 * Author: GitHawk, Jonpas
 * Get rearm return value.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Magazine Classname <STRING>
 *
 * Return Value:
 * Return Value <ARRAY>
 * 0: Can Rearm <BOOL>
 * 1: TurretPath <ARRAY>
 * 2: Number of current magazines in turret path <NUMBER>
 * 3: Pylon Index (-1 if not a pylon) <NUMBER>
 *
 * Example:
 * [tank, "500Rnd_127x99_mag_Tracer_Red"] call ace_rearm_fnc_getNeedRearmMagazines
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_vehicle", objNull, [objNull]], ["_magazineClass", "", [""]]];

private _return = [false, [], 0, -1];
{
    private _magazines = [_vehicle, _x] call FUNC(getVehicleMagazines);

    if (_magazineClass in _magazines) then {
        private _currentMagazines = {_x == _magazineClass} count (_vehicle magazinesTurret _x);

        if ((_vehicle magazineTurretAmmo [_magazineClass, _x]) < getNumber (configFile >> "CfgMagazines" >> _magazineClass >> "count")) exitWith {
            _return = [true, _x, _currentMagazines, -1];
        };

        if (_currentMagazines < ([_vehicle, _x, _magazineClass] call FUNC(getMaxMagazines))) exitWith {
            _return = [true, _x, _currentMagazines, -1];
        };
    };

    if (_return select 0) exitWith {};
    false
} count REARM_TURRET_PATHS;

if (!(_return select 0)) then {
    // 1.70 pylons
    private _pylonConfigs = configProperties [configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"];
    {
        private _pylonName = configName _x;
        private _pylonIndex = _forEachIndex + 1; // WTF BIS
        private _pylonAmmo = _vehicle ammoOnPylon _pylonName;
        private _pylonMagazine = (getPylonMagazines _vehicle) select _forEachIndex;
        private _pylonTurret = getArray (_x >> "turret");
        if (_pylonTurret isEqualTo []) then {_pylonTurret = [-1];}; // convert to expected array for driver
        TRACE_4("",_pylonName,_pylonAmmo,_pylonMagazine,_pylonTurret);

        if (_pylonAmmo > 0) then {
            if (_magazineClass == _pylonMagazine) then { // Try to refill current pylon:
                private _magAmmo = getNumber (configFile >> "CfgMagazines" >> _pylonMagazine >> "count");
                if (_pylonAmmo < _magAmmo) then {
                    _return = [true, _pylonTurret, 0, _pylonIndex];
                };
            };
        } else {
            // See what we magazines can add to the empty pylon:
            private _hardpointMags = [_x] call FUNC(getHardpointMagazines);
            {
                if (_x == _magazineClass) then {
                    _return = [true, _pylonTurret, 0, _pylonIndex];
                };
            } forEach _hardpointMags;
        };
        if (_return select 0) exitWith {};
    } forEach _pylonConfigs;
};

TRACE_3("getNeedRearmMagazines",_vehicle,_magazineClass,_return);
_return
