#include "script_component.hpp"
/*
 * Author: Smith
 * Starts the deploy process for object to unload.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_cargo_fnc_deploy
 *
 * Public: No
 */

disableSerialization;

private _display = uiNamespace getVariable QGVAR(menuDisplay);
if (isNil "_display") exitWith {};

private _loaded = GVAR(interactionVehicle) getVariable [QGVAR(loaded), []];
if (_loaded isEqualTo []) exitWith {};

if (GVAR(interactionParadrop)) exitWith {};

private _ctrl = _display displayCtrl 100;

private _selected = (lbCurSel _ctrl) max 0;

if (count _loaded <= _selected) exitWith {};
private _item = _loaded select _selected;

// close opened cargo menu
closeDialog 1;

private _classname = _item;

GVAR(objectToDeploy) = _item;

if (_classname isEqualType ObjNull) then {
    _classname = typeOf _classname;
};

// prevent the placing unit from running
[_unit, "forceWalk", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);
[_unit, "blockThrow", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);

// create the object
private _dummyObject = _classname createVehicleLocal [0, 0, 0];
GVAR(dummyObject) = _dummyObject;

// prevent collisions with object
_dummyObject disableCollisionWith ACE_player;
_dummyObject enableSimulation false;
_dummyObject setMass 1e-12;

private _dummyObjectRadius = ((boundingBoxReal _dummyObject) select 2) / 2;

// set default values for deployment settings
GVAR(deployDistance) = _dummyObjectRadius max (([ACE_player, GVAR(interactionVehicle)] call EFUNC(interaction,getInteractionDistance)) / 2);
GVAR(deployDirection) = 0;
GVAR(deployHeight) = 0;

// pfh that runs while the deployment is in progress
GVAR(deployPFH) = [{
    (_this select 0) params ["_unit", "_dummyObject", "_target", "_item", "_dummyObjectRadius"];

    if !(
        !isNull _dummyObject
        && (alive _target)
        && {locked _target < 2}
        && {([_unit, _target] call EFUNC(interaction,getInteractionDistance)) < MAX_LOAD_DISTANCE}
        && {_item in (_target getVariable [QGVAR(loaded), []])}
    ) exitWith {
        [_unit] call FUNC(deployCancel);
    };

    GVAR(deployDistance) = _dummyObjectRadius max GVAR(deployDistance);

    _dummyObject setPosASL (eyePos _unit vectorAdd (positionCameraToWorld [0, GVAR(deployHeight), GVAR(deployDistance)] vectorDiff positionCameraToWorld [0, 0, 0]));
    _dummyObject setDir (GVAR(deployDirection) + getDir _unit);

    private _dummyObjectASL = getPosASL _dummyObject;
    private _targetModelPos = [_target, _dummyObjectASL] call EFUNC(interaction,getVehiclePosComplex);
    private _distance = _dummyObjectASL distance (_target modelToWorldWorld _targetModelPos);

    // limit distance from object to vehicle
    // this makes deployment user-friendly
    if !(_distance < MAX_LOAD_DISTANCE) exitWith {
        private _safeRelativePosition = (_target worldToModel ASLToAGL (getPosASL _dummyObject)) vectorMultiply (MAX_LOAD_DISTANCE / _distance);
        _dummyObject setPosASL AGLToASL (_target modelToWorld _safeRelativePosition);
    };
}, 0, [ACE_player, _dummyObject, GVAR(interactionVehicle), _item, _dummyObjectRadius]] call CBA_fnc_addPerFrameHandler;

// add mouse button action and hint
[localize LSTRING(unloadObject), localize "STR_DISP_CANCEL", localize LSTRING(ScrollAction)] call EFUNC(interaction,showMouseHint);

ACE_player setVariable [QGVAR(Deploy), [
    ACE_player, "DefaultAction",
    {GVAR(deployPFH) != -1},
    {[_this select 0] call FUNC(deployConfirm)}
] call EFUNC(common,addActionEventHandler)];

ACE_player setVariable [QGVAR(isDeploying), true, true];
