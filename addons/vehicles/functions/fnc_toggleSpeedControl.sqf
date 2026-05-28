#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * Checks if player can toggle speed control and runs proper speed control mode.
 * Should run as key handler.
 *
 * Arguments:
 * 0: Cruise Control <BOOL> (default: false)
 * 1: Preserve Speed Limit <BOOL> (default: false)
 *
 * Return Value:
 * Key handled <BOOL>
 *
 * Example:
 * true call ace_vehicles_fnc_toggleSpeedControl
 *
 * Public: No
 */

params [["_cruiseControl", false], ["_preserveSpeedLimit", false]];

private _role = ACE_player call EFUNC(common,getUavControlPosition);

private _vehicle = objNull;
private _continue = true;
if (_role != "") then {
    GVAR(isUAV) = true;
    _vehicle = getConnectedUAV ACE_player;
    _continue = (
        !visibleMap
        && {_role == "DRIVER" || {!(_vehicle isKindOf "Plane")}}
    );
} else {
    GVAR(isUAV) = false;
    _vehicle = vehicle ACE_player;
    _continue = (
        ACE_player == currentPilot _vehicle
        && {[ACE_player, objNull, ["isNotInside"]] call EFUNC(common,canInteractWith)}
    );
};
if (
    !_continue
    || {!(isEngineOn _vehicle)}
    || {!GVAR(isSpeedLimiter) && _cruiseControl && {speed _vehicle < 1}} // don't enable CC when stop or move backward
) exitWith {false};

private _allowedVehicleClasses = ["Car", "Tank", "Ship"];
if (_cruiseControl) then {
    _allowedVehicleClasses pushBack "Plane";
};
if (-1 == _allowedVehicleClasses findIf {_vehicle isKindOf _x}) exitWith {false};

if (_vehicle isKindOf "Plane") then {
    [ACE_player, _vehicle, _preserveSpeedLimit] call FUNC(autoThrottle);
} else {
    [ACE_player, _vehicle, _cruiseControl, _preserveSpeedLimit] call FUNC(speedLimiter);
};

true
