#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, Ruthberg, commy2, Smith, johnb43
 * Starts the deploy process for unloading an object.
 *
 * Arguments:
 * 0: Unit deploying <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_csw_fnc_assemble_startDeployTripod
 *
 * Public: No
 */

params ["_player"];

// Don't allow deploying if already deploying
if (_player getVariable [QGVAR(isDeploying), false]) exitWith {};

private _secondaryWeaponClassname = secondaryWeapon _player;
private _classname = getText (configFile >> "CfgWeapons" >> _secondaryWeaponClassname >> QUOTE(ADDON) >> "deploy");

// Prevent the placing unit from running
[_player, "forceWalk", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);
[_player, "blockThrow", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);

// Create a local preview object
private _tripodPreviewObject = createVehicleLocal [_classname, [0, 0, 0], [], 0, "CAN_COLLIDE"];

GVAR(tripodPreviewObject) = _tripodPreviewObject;

// Prevent collisions with object
_tripodPreviewObject disableCollisionWith _player;
_tripodPreviewObject enableSimulation false;
_tripodPreviewObject setMass 1e-12;

// Detect radius of zone where collision can damage the player
private _tripodPreviewObjectRadius = 1 max ((boundingBoxReal [_tripodPreviewObject, "FireGeometry"]) select 2);

// Attach object
_tripodPreviewObject attachTo [_player, [0, 1.5 * _tripodPreviewObjectRadius, 1]];

GVAR(placeAction) = PLACE_WAITING;

// PFH that runs while the deployment is in progress
GVAR(deployPFH) = [{
    (_this select 0) params ["_player", "_secondaryWeaponClassname", "_tripodPreviewObject"];

    // Cancel deployment if criteria not met
    if (
        isNull _tripodPreviewObject ||
        {secondaryWeapon _player != _secondaryWeaponClassname} ||
        {!(_player call FUNC(canDeployTripod))} ||
        {GVAR(placeAction) == PLACE_CANCEL}
    ) exitWith {
        _player call FUNC(deployCancel);
    };

    // Check if the center of the object is not inside another (don't check for other intersections though)
    private _validPosition = (lineIntersectsSurfaces [eyePos _player, getPosASL _tripodPreviewObject, _player]) isEqualTo [];

    // Update mouse hint
    ((uiNamespace getVariable [QEGVAR(interaction,mouseHint), displayNull]) displayCtrl 2420) ctrlSetText (localize ([LSTRING(BlockedAction), LSTRING(PlaceAction)] select _validPosition));

    if (GVAR(placeAction) != PLACE_APPROVE) exitWith {};

    // Deploy the CSW
    if (_validPosition) exitWith {
        _player call FUNC(deployConfirm);
    };

    // Don't allow placing in an invalid position
    GVAR(placeAction) = PLACE_WAITING;
}, 0, [_player, _secondaryWeaponClassname, _tripodPreviewObject]] call CBA_fnc_addPerFrameHandler;

// Add mouse button action and hint
[LLSTRING(PlaceAction), LELSTRING(common,Cancel), LLSTRING(RaiseLowerRotate)] call EFUNC(interaction,showMouseHint);

_player setVariable [QGVAR(deploy), [_player, "DefaultAction", {GVAR(deployPFH) != -1}, {GVAR(placeAction) = PLACE_APPROVE}] call EFUNC(common,addActionEventHandler)];

_player setVariable [QGVAR(isDeploying), true, true];
