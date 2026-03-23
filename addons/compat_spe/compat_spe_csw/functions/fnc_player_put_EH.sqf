#include "..\script_component.hpp"
/*
 * Author: Kerc (SPE), original by www.3commandobrigade.com, edited by johnb43 to be made CSW compatible
 * EH to allow a player to drop a tripod from the launcher slot, converting it into a weapon base.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Container <OBJECT>
 * 2: Item <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "SPE_MLE_27_31_Stand"] call SPE_Weapons_Static_fnc_player_put_EH
 *
 * Public: No
 */

params ["_unit", "_container", "_item"];

if (!alive _unit) exitWith {};

// Don't run when placing a tripod in a vehicle/box
if !(_container isKindOf "GroundWeaponHolder") exitWith {};

private _weaponConfig = configFile >> "CfgWeapons" >> _item;

// isKindOf does not currently work for weapons
if (getNumber (_weaponConfig >> "SPE_isTripod") == 0) exitWith {};

private _tripodClass = if (EGVAR(csw,defaultAssemblyMode)) then {
    getText (_weaponConfig >> "ace_csw" >> "deploy")
} else {
    // Note M6 is also considered a tripod as far as the next instruction is concerned
    getText (_weaponConfig >> "SPE_Deployed_Tripod_Name")
};

if (_tripodClass == "") exitWith {};

// Check if there is a surface on which the tripod can be placed
private _vectorDir = vectorDir _unit;
private _posASL = (eyePos _unit) vectorAdd (_vectorDir vectorMultiply 1.1);
private _lisPos = lineIntersectsSurfaces [_posASL, _posASL vectorAdd [0, 0, -3], _unit, objNull, true, 1, "ROADWAY", "FIRE"];

if (_lisPos isEqualTo []) exitWith {};

_lisPos = _lisPos select 0;

// Remove tripod from container
_container addItemCargoGlobal [_item, -1];

// Create a vehicle replacing the tripod
private _weaponPlatform = createVehicle [_tripodClass, (ASLToAGL (_lisPos select 0)) vectorAdd [0, 0, 0.1], [], 0, "CAN_COLLIDE"];

_weaponPlatform setVectorDirAndUp [_vectorDir, _lisPos select 1];
