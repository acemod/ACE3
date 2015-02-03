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

if (getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(Enabled)) == 1) then {   // @todo for all turrets
    _vehicle addEventHandler ["Fired", {_this call FUNC(firedEH)}];

    _vehicle setVariable [QGVAR(Distance),  0,  true];
    _vehicle setVariable [QGVAR(Magazines), [], true];
    _vehicle setVariable [QGVAR(Elevation), [], true];
    _vehicle setVariable [QGVAR(Azimuth),   0,  true];

    // calculate offset between gunner camera and muzzle position
    if !(_vehicle isKindOf "Air") then {
        private ["_turretConfig", "_gunBeg", "_gunnerView", "_gunBegPos", "_gunnerViewPos", "_viewDiff"];

        _turretConfig = configFile >> "CfgVehicles" >> typeOf _vehicle >> "Turrets" >> "MainTurret";

        _gunBeg = getText (_turretConfig >> "gunBeg");                          // @todo player turret path
        _gunnerView = getText (_turretConfig >> "memoryPointGunnerOptics");    // @todo player turret path

        _gunBegPos = (_vehicle selectionPosition _gunBeg) select 0;
        _gunnerViewPos = (_vehicle selectionPosition _gunnerView) select 0;
        _viewDiff = _gunBegPos - _gunnerViewPos;

        _vehicle setVariable [QGVAR(ViewDiff), _viewDiff, true];
    } else {
        _vehicle setVariable [QGVAR(ViewDiff), 0, true];
    };
};
