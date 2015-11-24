/*
 * Author: BaerMitUmlaut
 * PerFrameHandler during fast roping.
 *
 * Arguments:
 * 0: PFH arguments <ARRAY>
 * 1: PFH handle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[_unit, _vehicle, _rope, _ropeIndex], 0] call ace_fastroping_fastRopePFH
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_arguments", "_pfhHandle"];
_arguments params ["_unit", "_vehicle", "_rope", "_ropeIndex"];
_rope params ["_attachmentPoint", "_ropeTop", "_ropeBottom", "_dummy", "_anchor", "_hook", "_occupied"];
private ["_origin"];

//Wait until the unit is actually outside of the helicopter
if (vehicle _unit != _unit) exitWith {};

_unit setVectorUp [0, 0, 1];

//Start fast roping
if (isNull attachedTo _unit) exitWith {
    _unit attachTo [_dummy, [0, 0, -1.2]];
    [_unit, "ACE_FastRoping", 2] call EFUNC(common,doAnimation);
    ropeUnwind [_ropeTop, 6, 35];
    ropeUnwind [_ropeBottom, 6, 0];
};

//Check if fast rope is finished
if (((getPos _unit select 2) < 0.2) || {ropeUnwound _ropeTop} || {vectorMagnitude (velocity _vehicle) > 5}) exitWith {
    detach _unit;
    [_unit, "", 2] call EFUNC(common,doAnimation);

    //Reset rope
    deleteVehicle _ropeTop;
    deleteVehicle _ropeBottom;

    _origin = AGLtoASL (_vehicle modelToWorld _attachmentPoint);
    _dummy setPosASL (_origin vectorAdd [0, 0, -2]);

    _ropeTop = ropeCreate [_dummy, [0, 0, 0], _hook, [0, 0, 0], 2];
    _ropeBottom = ropeCreate [_dummy, [0, 0, 0], _anchor, [0, 0, 0], 33];

    //Update deployedRopes array
    _deployedRopes = _vehicle getVariable [QGVAR(deployedRopes), []];
    _deployedRopes set [_ropeIndex, [_attachmentPoint, _ropeTop, _ropeBottom, _dummy, _anchor, _hook, false]];
    _vehicle setVariable [QGVAR(deployedRopes), _deployedRopes, true];

    [_pfhHandle] call CBA_fnc_removePerFrameHandler;
};
