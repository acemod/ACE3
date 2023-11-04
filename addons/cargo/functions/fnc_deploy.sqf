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
 * player call ace_cargo_fnc_deploy
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
closeDialog 1;

GVAR(selectedItem) = _item;

private _classname = _item;

if (_classname isEqualType ObjNull) then {
    _classname = typeOf _classname;
};

// Prevent the placing unit from running
[_unit, "forceWalk", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);
[_unit, "blockThrow", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);

// Create a local preview object
private _itemPreviewObject = createSimpleObject [_classname, [0, 0, 0], true];

GVAR(itemPreviewObject) = _itemPreviewObject;

// Prevent collisions with object
_itemPreviewObject disableCollisionWith _unit;
_itemPreviewObject enableSimulation false;
_itemPreviewObject setMass 1e-12;

// Detect radius of zone where collision can damage the player
private _itemPreviewObjectRadius = 0.2 + ((boundingBoxReal _itemPreviewObject) select 2);

// Set default values for deployment settings
GVAR(deployDistance) = _itemPreviewObjectRadius max (([_unit, GVAR(interactionVehicle)] call EFUNC(interaction,getInteractionDistance)) / 2);
GVAR(deployDirection) = 0;
GVAR(deployHeight) = 0;
GVAR(canDeploy) = true;

// Pfh that runs while the deployment is in progress
GVAR(deployPFH) = [{
    (_this select 0) params ["_unit", "_vehicle", "_item", "_itemPreviewObject", "_itemPreviewObjectRadius"];

    if !(
        !isNull _itemPreviewObject &&
        {alive _vehicle} &&
        {locked _vehicle < 2} &&
        {_vehicle getVariable [QGVAR(hasCargo), getNumber (configOf _vehicle >> QGVAR(hasCargo)) == 1]} &&
        {([_unit, _vehicle] call EFUNC(interaction,getInteractionDistance)) < MAX_LOAD_DISTANCE} &&
        {_item in (_vehicle getVariable [QGVAR(loaded), []])}
    ) exitWith {
        _unit call FUNC(deployCancel);
    };

    // Make sure the object does not get too close to the player
    GVAR(deployDistance) = _itemPreviewObjectRadius max GVAR(deployDistance);

    private _eyePos = eyePos _unit;
    private _vehiclePosASL = getPosASL _vehicle;

    // Prepare safe position with z-position limit
    private _itemPreviewObjectASL = _eyePos vectorAdd ((positionCameraToWorld [0, GVAR(deployHeight), GVAR(deployDistance)]) vectorDiff positionCameraToWorld [0, 0, 0]);

    private _minDeployHeightASL = (getPosASL _unit select 2) + 0.1;
    private _maxDeployHeightASL = (_vehiclePosASL select 2) + 2;
    _itemPreviewObjectASL set [2, _maxDeployHeightASL min (_minDeployHeightASL max (_itemPreviewObjectASL select 2))];

    _itemPreviewObject setPosASL _itemPreviewObjectASL;
    _itemPreviewObject setDir (GVAR(deployDirection) + getDir _unit);

    private _vehicleModelPos = [_vehicle, _itemPreviewObjectASL] call EFUNC(interaction,getVehiclePosComplex);
    private _distance = _itemPreviewObjectASL distance (_vehicle modelToWorldWorld _vehicleModelPos);

    // Limit distance from object to vehicle. This makes deployment more user-friendly
    if (_distance >= MAX_LOAD_DISTANCE) then {
        private _safeRelativePosition = (_vehicle worldToModel ASLToAGL _itemPreviewObjectASL) vectorMultiply (MAX_LOAD_DISTANCE / _distance);
        _itemPreviewObject setPosASL (_vehicle modelToWorldWorld _safeRelativePosition);
    };

    // Prevent deploying behind other objects
    private _intersection = lineIntersects [_itemPreviewObjectASL, _vehiclePosASL, _itemPreviewObject, _vehicle] ||
                            {lineIntersects [_itemPreviewObjectASL, _eyePos, _itemPreviewObject, _unit]};

    // Prevent placing object too close to player
    if (_intersection || {(_itemPreviewObject distance2D _unit) < _itemPreviewObjectRadius}) then {
        if (GVAR(canDeploy)) then {
            GVAR(canDeploy) = false;

            _itemPreviewObject hideObject true;

            ((uiNamespace getVariable [QEGVAR(interaction,mouseHint), displayNull]) displayCtrl 2420) ctrlSetText LLSTRING(blockedAction);
        };
    } else {
        if (!GVAR(canDeploy)) then {
            GVAR(canDeploy) = true;

            _itemPreviewObject hideObject false;

            ((uiNamespace getVariable [QEGVAR(interaction,mouseHint), displayNull]) displayCtrl 2420) ctrlSetText LLSTRING(unloadObject);
        };
    };

    #ifdef DEBUG_MODE_FULL
    drawLine3D [
        ASLToAGL _itemPreviewObjectASL,
        ASLToAGL _vehiclePosASL,
        if (GVAR(canDeploy)) then {[1, 1, 1, 1]} else {[1, 0, 0, 1]}
    ];
    #endif
}, 0, [_unit, GVAR(interactionVehicle), _item, _itemPreviewObject, _itemPreviewObjectRadius]] call CBA_fnc_addPerFrameHandler;

// Add mouse button action and hint
[LLSTRING(unloadObject), localize "STR_DISP_CANCEL", LLSTRING(scrollAction)] call EFUNC(interaction,showMouseHint);

_unit setVariable [QGVAR(deploy), [
    _unit, "DefaultAction",
    {GVAR(deployPFH) != -1},
    {[_this select 0] call FUNC(deployConfirm)}
] call EFUNC(common,addActionEventHandler)];

_unit setVariable [QGVAR(isDeploying), true, true];
