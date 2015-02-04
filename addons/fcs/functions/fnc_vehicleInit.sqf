/*
 * Author: KoffeinFlummi
 *
 * Checks if a vehicle is equipped with an FCS and if so, adds the fired event handler
 *
 * Arguments:
 * 0: Vehicle
 *
 * Return Value:
 * none
 */

#include "script_component.hpp"

private "_vehicle";

_vehicle = _this select 0;

{
    if (getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(Enabled)) == 1) then {   // @todo for all turrets
        _vehicle addEventHandler ["Fired", {_this call FUNC(firedEH)}];

        _vehicle setVariable [format ["%1_%2", QGVAR(Distance),  _x],  0, true];
        _vehicle setVariable [format ["%1_%2", QGVAR(Magazines), _x], [], true];
        _vehicle setVariable [format ["%1_%2", QGVAR(Elevation), _x], [], true];
        _vehicle setVariable [format ["%1_%2", QGVAR(Azimuth),   _x],  0, true];

        // calculate offset between gunner camera and muzzle position
        if !(_vehicle isKindOf "Air") then {
            private ["_turretConfig", "_gunBeg", "_gunnerView", "_gunBegPos", "_gunnerViewPos", "_viewDiff"];

            _turretConfig = [configFile >> "CfgVehicles" >> typeOf _vehicle, _x] call EFUNC(common,getTurretConfigPath);

            _gunBeg = getText (_turretConfig >> "gunBeg");                          // @todo player turret path
            _gunnerView = getText (_turretConfig >> "memoryPointGunnerOptics");    // @todo player turret path

            _gunBegPos = (_vehicle selectionPosition _gunBeg) select 0;
            _gunnerViewPos = (_vehicle selectionPosition _gunnerView) select 0;
            _viewDiff = _gunBegPos - _gunnerViewPos;

            _vehicle setVariable [format ["%1_%2", QGVAR(ViewDiff), _x], _viewDiff, true];
        } else {
            _vehicle setVariable [format ["%1_%2", QGVAR(ViewDiff), _x],         0, true];
        };
    };
} forEach allTurrets _vehicle;
