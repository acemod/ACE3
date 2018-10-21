#include "script_component.hpp"
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

            private _gunBeg = getText (_turretConfig >> "gunBeg");
            private _gunnerView = getText (_turretConfig >> "memoryPointGunnerOptics");

            private _gunBegPos = (_vehicle selectionPosition _gunBeg) select 0;
            private _gunnerViewPos = (_vehicle selectionPosition _gunnerView) select 0;
            private _viewDiff = _gunBegPos - _gunnerViewPos;

            _vehicle setVariable [format ["%1_%2", QGVAR(ViewDiff), _x], _viewDiff, true];
        } else {
            _vehicle setVariable [format ["%1_%2", QGVAR(ViewDiff), _x],         0, true];
        };
    };
    false
} count allTurrets _vehicle;
