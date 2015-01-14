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

private ["_gunBeg", "_gunnerView", "_gunBegPos", "_gunnerViewPos", "_viewDiff"];

if (getNumber (configFile >> "CfgVehicles" >> (typeOf (_this select 0)) >> QGVAR(Enabled)) == 1) then {
  (_this select 0) addEventHandler ["Fired", {_this call FUNC(firedEH)}];

  (_this select 0) setVariable [QGVAR(Distance),  0,   true];
  (_this select 0) setVariable [QGVAR(Magazines), [],  true];
  (_this select 0) setVariable [QGVAR(Elevation), [],  true];
  (_this select 0) setVariable [QGVAR(Azimuth),   0,   true];

  // calculate offset between gunner camera and muzzle position
  if !((_this select 0) isKindOf "Air") then {
    _gunBeg = getText (configFile >> "CfgVehicles" >> (typeOf (_this select 0)) >> "Turrets" >> "MainTurret" >> "gunBeg");
    _gunnerView = getText (configFile >> "CfgVehicles" >>  (typeOf (_this select 0)) >> "Turrets" >> "MainTurret" >> "memoryPointGunnerOptics");
    _gunBegPos = ((_this select 0) selectionPosition _gunBeg) select 0;
    _gunnerViewPos = ((_this select 0) selectionPosition _gunnerView) select 0;
    _viewDiff = _gunBegPos - _gunnerViewPos;
    (_this select 0) setVariable [QGVAR(ViewDiff), _viewDiff, true];
  } else {
    (_this select 0) setVariable [QGVAR(ViewDiff), 0, true];
  };
};
