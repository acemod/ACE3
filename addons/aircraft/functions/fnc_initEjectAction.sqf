/*
 * Author: Dystopian
 * Add Eject action to vehicle if needed.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * _vehicle call ace_aircraft_fnc_initEjectAction
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle"];

if (unitIsUAV _vehicle) exitWith {};

private _config = configFile >> "CfgVehicles" >> (typeOf _vehicle);

private _addAction = false;

if (0 == getNumber (_config >> "driverCanEject")) then {
    _vehicle setVariable [QUOTE(DOUBLES(GVAR(ejectAction),driver_[])), true];
    _addAction = true;
};

{
    _x params ["", "_role", "", "_turretPath"];
    if (0 == getNumber (([_vehicle, _turretPath] call CBA_fnc_getTurret) >> "canEject")) then {
        _vehicle setVariable [format ["%1_%2_%3", QGVAR(ejectAction), _role, _turretPath], true];
        _addAction = true;
    };
} forEach (fullCrew [_vehicle, "gunner", true] + fullCrew [_vehicle, "turret", true]);

if (!_addAction) exitWith {};

GVAR(ejectActionParams) params ["_params", "_text", "_picture"];
private _actionID = _vehicle addAction _params;
_vehicle setUserActionText [_actionID, _text, "", _picture];
_vehicle setVariable [QGVAR(ejectAction), _actionID];
