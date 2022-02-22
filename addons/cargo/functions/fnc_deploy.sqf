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

// Deny creating preview item because it will
// destroy player vehicle instantly by collision.
if (GVAR(interactionParadrop)) exitWith {};

// This can be an object or a classname string.
private _item = call FUNC(getSelectedItem);

if (isNil "_item") exitWith {};

// Close opened cargo menu.
closeDialog 1;

private _classname = _item;

GVAR(selectedItem) = _item;

if (_classname isEqualType ObjNull) then {
    _classname = typeOf _classname;
};

// Prevent the placing unit from running.
[_unit, "forceWalk", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);
[_unit, "blockThrow", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);

// Create the objects.
private _itemPreviewObject = createSimpleObject [_classname, [0, 0, 0], true];
GVAR(itemPreviewObject) = _itemPreviewObject;

// Prevent collisions with object.
_itemPreviewObject disableCollisionWith ACE_player;
_itemPreviewObject enableSimulation false;
_itemPreviewObject setMass 1e-12;

// Detect radius of zone where collision can damage the player.
private _itemPreviewObjectRadius = 0.2 + ((boundingBoxReal _itemPreviewObject) select 2) / 2;

// Set default values for deployment settings.
GVAR(deployDistance) = _itemPreviewObjectRadius max (([ACE_player, GVAR(interactionVehicle)] call EFUNC(interaction,getInteractionDistance)) / 2);
GVAR(deployDirection) = 0;
GVAR(deployHeight) = 0;
GVAR(canDeploy) = true;

// Pfh that runs while the deployment is in progress.
GVAR(deployPFH) = [{
    (_this select 0) params ["_unit", "_itemPreviewObject", "_vehicle", "_item", "_itemPreviewObjectRadius"];

    if !(
        !isNull _itemPreviewObject
        && {alive _vehicle}
        && {locked _vehicle < 2}
        && {([_unit, _vehicle] call EFUNC(interaction,getInteractionDistance)) < MAX_LOAD_DISTANCE}
        && {_item in (_vehicle getVariable [QGVAR(loaded), []])}
    ) exitWith {
        [_unit] call FUNC(deployCancel);
    };

    GVAR(deployDistance) = _itemPreviewObjectRadius max GVAR(deployDistance);

    // Prepare safe position with z-position limit.
    private _itemPreviewObjectASL = (eyePos _unit) vectorAdd ((positionCameraToWorld [0, GVAR(deployHeight), GVAR(deployDistance)]) vectorDiff positionCameraToWorld [0, 0, 0]);

    private _minDeployHeightASL = (getPosASL _unit select 2) + 0.1;
    private _maxDeployHeightASL = (getPosASL _vehicle select 2) + 2;
    _itemPreviewObjectASL set [2, _maxDeployHeightASL min (_minDeployHeightASL max (_itemPreviewObjectASL select 2))];

    _itemPreviewObject setPosASL _itemPreviewObjectASL;
    _itemPreviewObject setDir (GVAR(deployDirection) + getDir _unit);

    private _vehicleModelPos = [_vehicle, _itemPreviewObjectASL] call EFUNC(interaction,getVehiclePosComplex);
    private _distance = _itemPreviewObjectASL distance (_vehicle modelToWorldWorld _vehicleModelPos);

    // Limit distance from object to vehicle.
    // This makes deployment user-friendly.
    if !(_distance < MAX_LOAD_DISTANCE) then {
        private _safeRelativePosition = (_vehicle worldToModel ASLToAGL (getPosASL _itemPreviewObject)) vectorMultiply (MAX_LOAD_DISTANCE / _distance);
        _itemPreviewObject setPosASL AGLToASL (_vehicle modelToWorld _safeRelativePosition);
    };

    // Hide object and deny placing
    // when deploying can corrupt collision bug/killing
    // or deploying behind another objects.
    private _ctrlTextLMB = (uiNamespace getVariable [QEGVAR(interaction,mouseHint), displayNull]) displayCtrl 2420;
    private _intersection = lineIntersects [getPosASL _itemPreviewObject, getPosASL _vehicle, _itemPreviewObject, _vehicle]
        || lineIntersects [getPosASL _itemPreviewObject, eyePos _unit, _itemPreviewObject, _unit];

    if (_intersection || {(_itemPreviewObject distance2D _unit) < _itemPreviewObjectRadius}) then {
        if (GVAR(canDeploy)) then {
            GVAR(canDeploy) = false;
            _itemPreviewObject hideObject true;
            _ctrlTextLMB ctrlSetText localize LSTRING(BlockedAction);
        };
    } else {
        if (!GVAR(canDeploy)) then {
            GVAR(canDeploy) = true;
            _itemPreviewObject hideObject false;
            _ctrlTextLMB ctrlSetText localize LSTRING(unloadObject);
        };
    };

    #ifdef DEBUG_MODE_FULL
    drawLine3D [
        ASLToAGL _itemPreviewObjectASL,
        ASLToAGL getPosASL _vehicle,
        if (GVAR(canDeploy)) then {[1, 1, 1, 1]} else {[1, 0, 0, 1]}
    ];
    #endif
}, 0, [ACE_player, _itemPreviewObject, GVAR(interactionVehicle), _item, _itemPreviewObjectRadius]] call CBA_fnc_addPerFrameHandler;

// Add mouse button action and hint.
[localize LSTRING(unloadObject), localize "STR_DISP_CANCEL", localize LSTRING(ScrollAction)] call EFUNC(interaction,showMouseHint);

ACE_player setVariable [QGVAR(Deploy), [
    ACE_player, "DefaultAction",
    {GVAR(deployPFH) != -1},
    {[_this select 0] call FUNC(deployConfirm)}
] call EFUNC(common,addActionEventHandler)];

ACE_player setVariable [QGVAR(isDeploying), true, true];
