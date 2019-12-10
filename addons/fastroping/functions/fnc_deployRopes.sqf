#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Deploy ropes from the helicopter.
 *
 * Arguments:
 * 0: The helicopter itself <OBJECT>
 * 1: The unit that called the action (may be remote) <OBJECT>
 * 2: Rope classname <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player, player, "ACE_rope36"] call ace_fastroping_fnc_deployRopes
 *
 * Public: No
 */
params ["_vehicle", "_player", "_ropeClass"];
TRACE_3("deployRopes",_vehicle,_player,_ropeClass);

private _config = configFile >> "CfgVehicles" >> typeOf _vehicle;

private _ropeOrigins = getArray (_config >> QGVAR(ropeOrigins));
private _deployedRopes = _vehicle getVariable [QGVAR(deployedRopes), []];
private _hookAttachment = _vehicle getVariable [QGVAR(FRIES), _vehicle];

private _ropeLength = getNumber (configfile >> "CfgWeapons" >> _ropeClass >> QGVAR(ropeLength));
TRACE_3("",_ropeClass,_ropeLength,GVAR(requireRopeItems));
if (GVAR(requireRopeItems)) then {
    if (_ropeClass in (items _player)) then {
        _player removeItem _ropeClass;
    } else {
        _vehicle removeItem _ropeClass;
    };
};

{
    private _ropeOrigin = _x;
    private _hook = QGVAR(helper) createVehicle [0, 0, 0];
    _hook allowDamage false;
    if (_ropeOrigin isEqualType []) then {
        _hook attachTo [_hookAttachment, _ropeOrigin];
    } else {
        _hook attachTo [_hookAttachment, [0, 0, 0], _ropeOrigin];
    };

    private _origin = getPosATL _hook;

    private _dummy = createVehicle [QGVAR(helper), _origin vectorAdd [0, 0, -1], [], 0, "CAN_COLLIDE"];
    _dummy allowDamage false;
    _dummy disableCollisionWith _vehicle;

    private _ropeTop = ropeCreate [_dummy, [0, 0, 0], _hook, [0, 0, 0], 0.5];
    private _ropeBottom = ropeCreate [_dummy, [0, 0, 0], 1];
    ropeUnwind [_ropeBottom, 30, _ropelength, false];

    _ropeTop addEventHandler ["RopeBreak", {[_this, "top"] call FUNC(onRopeBreak)}];
    _ropeBottom addEventHandler ["RopeBreak", {[_this, "bottom"] call FUNC(onRopeBreak)}];

    //deployedRopes format: attachment point, top part of the rope, bottom part of the rope, attachTo helper object, occupied, broken
    _deployedRopes pushBack [_ropeOrigin, _ropeTop, _ropeBottom, _dummy, _hook, false, false];

    false
} count _ropeOrigins;

_vehicle setVariable [QGVAR(deployedRopes), _deployedRopes, true];
_vehicle setVariable [QGVAR(deploymentStage), 3, true];
_vehicle setVariable [QGVAR(ropeLength), _ropeLength, true];
