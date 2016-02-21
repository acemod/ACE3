/*
 * Author: BaerMitUmlaut
 * Deploy ropes from the helicopter.
 *
 * Arguments:
 * 0: The helicopter itself <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle] call ace_fastroping_fnc_deployRopes
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_vehicle"];
private ["_config", "_ropeOrigins", "_ropeOrigin", "_deployedRopes", "_hookAttachment", "_origin", "_dummy", "_hook", "_ropeTop", "_ropeBottom"];

_config = configFile >> "CfgVehicles" >> typeOf _vehicle;

_ropeOrigins = getArray (_config >> QGVAR(ropeOrigins));
_deployedRopes = _vehicle getVariable [QGVAR(deployedRopes), []];
_hookAttachment = _vehicle getVariable [QGVAR(FRIES), _vehicle];
{
    _ropeOrigin = _x;
    _hook = QGVAR(helper) createVehicle [0, 0, 0];
    _hook allowDamage false;
    if (typeName _ropeOrigin == "ARRAY") then {
        _hook attachTo [_hookAttachment, _ropeOrigin];
    } else {
        _hook attachTo [_hookAttachment, [0, 0, 0], _ropeOrigin];
    };

    _origin = getPosATL _hook;

    _dummy = createVehicle [QGVAR(helper), _origin vectorAdd [0, 0, -1], [], 0, "CAN_COLLIDE"];
    _dummy allowDamage false;
    _dummy disableCollisionWith _vehicle;

    _ropeTop = ropeCreate [_dummy, [0, 0, 0], _hook, [0, 0, 0], 0.5];
    _ropeBottom = ropeCreate [_dummy, [0, 0, 0], 1];
    ropeUnwind [_ropeBottom, 30, 34.5, false];

    _ropeTop addEventHandler ["RopeBreak", {[_this, "top"] call FUNC(onRopeBreak)}];
    _ropeBottom addEventHandler ["RopeBreak", {[_this, "bottom"] call FUNC(onRopeBreak)}];

    //deployedRopes format: attachment point, top part of the rope, bottom part of the rope, attachTo helper object, occupied
    _deployedRopes pushBack [_ropeOrigin, _ropeTop, _ropeBottom, _dummy, _hook, false];

    false
} count _ropeOrigins;

_vehicle setVariable [QGVAR(deployedRopes), _deployedRopes, true];
_vehicle setVariable [QGVAR(deploymentStage), 3, true];
