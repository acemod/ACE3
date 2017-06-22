/*
 * Author: KoffeinFlummi, commy2
 * Checks if a vehicle is equipped with an FCS and if so, adds the fired event handler. Execute on server.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [car] call ace_fcs_fnc_vehicleInit
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle"];

{
    private _turretConfig = [configFile >> "CfgVehicles" >> typeOf _vehicle, _x] call EFUNC(common,getTurretConfigPath);

    if (getNumber (_turretConfig >> QGVAR(Enabled)) == 1) then {
        _vehicle setVariable [format ["%1_%2", QGVAR(Distance),  _x],  0, true];
        _vehicle setVariable [format ["%1_%2", QGVAR(Magazines), _x], [], true];
        _vehicle setVariable [format ["%1_%2", QGVAR(Elevation), _x], [], true];
        _vehicle setVariable [format ["%1_%2", QGVAR(Azimuth),   _x],  0, true];

        // calculate offset between gunner camera and muzzle position
        if !(_vehicle isKindOf "Air") then {
            private ["_gunBeg", "_gunnerView", "_gunBegPos", "_gunnerViewPos", "_viewDiff"];

            _gunBeg = getText (_turretConfig >> "gunBeg");
            _gunnerView = getText (_turretConfig >> "memoryPointGunnerOptics");

            _gunBegPos = (_vehicle selectionPosition _gunBeg) select 0;
            _gunnerViewPos = (_vehicle selectionPosition _gunnerView) select 0;
            _viewDiff = _gunBegPos - _gunnerViewPos;

            _vehicle setVariable [format ["%1_%2", QGVAR(ViewDiff), _x], _viewDiff, true];
        } else {
            _vehicle setVariable [format ["%1_%2", QGVAR(ViewDiff), _x],         0, true];
        };
    };
    false
} count allTurrets _vehicle;
