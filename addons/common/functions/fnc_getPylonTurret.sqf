#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Finds turret owner of a pylon.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Pylon Index (starting at 0) <NUMBER>
 *
 * Return Value:
 * * Turret index (either [-1] or [0]) <ARRAY>
 *
 * Example:
 * [cursorObject, 0] call ace_common_fnc_getPylonTurret
 *
 * Public: No
 */

params ["_vehicle", "_pylonIndex"];

// See if index is in ace_pylonTurrets setVar on vehicle
private _pylonTurrets = _vehicle getVariable ["ace_pylonTurrets", []];
private _returnValue = _pylonTurrets param [_pylonIndex, []];

if (!(_returnValue isEqualTo [])) then {
    TRACE_1("Using ace_pylonTurrets value",_returnValue);
} else {
    // Attempt to determine turret owner based on magazines in the vehicle
    private _pyMags = getPylonMagazines _vehicle;
    private _pylonConfigs = configProperties [configFile >> "CfgVehicles" >> typeOf _vehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"];
    if (_pylonIndex >= (count _pyMags)) exitWith {ERROR("out of bounds");};
    if (_pylonIndex >= (count _pylonConfigs)) exitWith {ERROR("out of bounds");};

    private _targetMag = _pyMags select _pylonIndex;
    private _inPilot = _targetMag in (_vehicle magazinesTurret [-1]);
    private _inGunner = _targetMag in (_vehicle magazinesTurret [0]);

    if (_inPilot) then {
        if (_inGunner) then {
            TRACE_3("ambiguous - in both",_targetMag,_inPilot,_inGunner);
        } else {
            TRACE_3("Pilot Mag",_targetMag,_inPilot,_inGunner);
            _returnValue = [-1];
        };
    } else {
        if (_inGunner) then {
            TRACE_3("Gunner Mag",_targetMag,_inPilot,_inGunner);
            _returnValue = [0];
        } else {
            TRACE_3("ambiguous - in neither",_targetMag,_inPilot,_inGunner);
        };
    };

    if (_returnValue isEqualTo []) then { // If not sure, just use config value
        _returnValue = getArray ((_pylonConfigs select _pylonIndex) >> "turret");
        if (_returnValue isEqualTo []) then {
            _returnValue = [-1];
        };
    };
};

TRACE_3("",_vehicle,_pylonIndex,_returnValue);
_returnValue
