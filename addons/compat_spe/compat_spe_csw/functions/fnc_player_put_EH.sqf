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

private _vectorDir = vectorDir _unit;

private _tripodClass = if (EGVAR(csw,defaultAssemblyMode)) then {
    getText (_weaponConfig >> "ace_csw" >> "deploy")
} else {
    // Note M6 is also considered a tripod as far as the next instruction is concerned
    getText (_weaponConfig >> "SPE_Deployed_Tripod_Name")
};

if (_tripodClass == "") exitWith {};

// Remove tripod from container
_container addItemCargoGlobal [_item, -1];

// Create a vehicle replacing the tripod
private _weaponPlatform = createVehicle [_tripodClass, (getPosATL _unit) vectorAdd (_vectorDir vectorMultiply 1.1), [], 0, "CAN_COLLIDE"];

_weaponPlatform setVectorDir _vectorDir;
