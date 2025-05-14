#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, Ruthberg, commy2, Smith
 * Starts the deploy process for unloading an object.
 *
 * Arguments:
 * 0: Unit deploying <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_cargo_fnc_startDeploy
 *
 * Public: No
 */

// Deny creating preview item as it will destroy player vehicle instantly by collision
if (GVAR(interactionParadrop)) exitWith {};

params ["_unit"];

// Don't allow deploying if already deploying
if (_unit getVariable [QGVAR(isDeploying), false]) exitWith {};

// This can be an object or a classname string
private _item = call FUNC(getSelectedItem);

if (isNil "_item") exitWith {};

// Close opened cargo menu
closeDialog 0;

GVAR(selectedItem) = _item;

private _classname = _item;

if (_classname isEqualType objNull) then {
    _classname = typeOf _classname;
};

// Prevent the placing unit from running
[_unit, "forceWalk", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);
[_unit, "blockThrow", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);

// Create a local preview object
private _itemPreviewObject = createVehicleLocal [_classname, [0, 0, 0], [], 0, "CAN_COLLIDE"];

GVAR(itemPreviewObject) = _itemPreviewObject;

// Prevent collisions with object
_itemPreviewObject disableCollisionWith _unit;
_itemPreviewObject enableSimulation false;
_itemPreviewObject setMass 1e-12;

// Detect radius of zone where collision can damage the player
private _itemPreviewObjectRadius = 1 max ((boundingBoxReal [_itemPreviewObject, "FireGeometry"]) select 2);

// Add height offset of model
private _offset = ((_itemPreviewObject modelToWorldVisual [0, 0, 0]) select 2) - ((_unit modelToWorldVisual [0, 0, 0]) select 2) + 1;

// Attach object
_itemPreviewObject attachTo [_unit, [0, 1.5 * _itemPreviewObjectRadius, _offset]];

// PFH that runs while the deployment is in progress
GVAR(deployPFH) = [{
    (_this select 0) params ["_unit", "_vehicle", "_item", "_itemPreviewObject"];

    if !(
        !isNull _itemPreviewObject &&
        {[_item, _vehicle, _unit, false, true] call FUNC(canUnloadItem)} // don't check for a suitable unloading position when deploying
    ) exitWith {
        _unit call FUNC(deployCancel);
    };
}, 0.5, [_unit, GVAR(interactionVehicle), _item, _itemPreviewObject]] call CBA_fnc_addPerFrameHandler;

// Add mouse button action and hint
[LLSTRING(unloadObject), localize "STR_DISP_CANCEL", LLSTRING(scrollAction)] call EFUNC(interaction,showMouseHint);

_unit setVariable [QGVAR(deploy), [
    _unit, "DefaultAction",
    {GVAR(deployPFH) != -1},
    {[_this select 1] call FUNC(deployConfirm)}
] call EFUNC(common,addActionEventHandler)];

_unit setVariable [QGVAR(isDeploying), true, true];
