#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Initialises the FCS cache to determine if a vehicle has a laser FCS
 *
 * Arguments:
 * Vehicle to watch <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * myTank call ace_laser_warning_fnc_ai_initialiseVehicle;
 *
 * Public: No
 */
params ["_vehicle"];

GVAR(fcs_vehicleCache) getOrDefaultCall [
    configOf _vehicle,
    {
        private _turrets = allTurrets _vehicle;
        private _hasLaser = false;
        {
            private _turretConfig = [_vehicle, _x] call CBA_fnc_getTurret;
            private _weapons = getArray (_turretConfig >> "weapons");
            {
                private _decimalBitmask = getNumber (configFile >> "CfgWeapons" >> _x >> "ballisticsComputer");
                private _bitmask = reverse ([_decimalBitmask, 5] call EFUNC(common,toBin));
                private _setBits = (toArray _bitmask) apply { _x - 48 };
                _hasLaser = 1 == (_setBits select 4);
                TRACE_3("has laser?",_x,_setBits,_hasLaser);
                if (_hasLaser) exitWith { _hasLaser = true };
            } forEach _weapons;
            if (_hasLaser) exitWith {};
        } forEach _turrets;
        _hasLaser
    },
    true
]