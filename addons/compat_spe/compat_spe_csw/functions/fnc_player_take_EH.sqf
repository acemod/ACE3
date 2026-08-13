#include "..\script_component.hpp"
/*
 * Author: Kerc (SPE), edited by johnb43 to be made CSW compatible
 * EH Backup for when the Put EH does not run (Swapping items).
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
 * [player, cursorObject, "SPE_MLE_27_31_Stand"] call SPE_Weapons_Static_fnc_player_take_EH
 *
 * Public: No
 */

params ["_unit", "_container", "_item"];

if (!alive _unit) exitWith {};

// Don't run when placing a tripod in a vehicle/box
if !(_container isKindOf "GroundWeaponHolder") exitWith {};

private _cfgWeapons = configFile >> "CfgWeapons";
private _tripods = (weaponCargo _container) select {getNumber (_cfgWeapons >> _x >> "SPE_isTripod") == 1};

if (_tripods isEqualTo []) exitWith {};

private _vectorDir = vectorDir _unit;
private _posASL = (eyePos _unit) vectorAdd (_vectorDir vectorMultiply 1.1);

private _lisPos = lineIntersectsSurfaces [_posASL, _posASL vectorAdd [0, 0, -3], _unit, objNull, true, 1, "ROADWAY", "FIRE"];

if (_lisPos isEqualTo []) exitWith {};

_lisPos = _lisPos select 0;

_posASL = (ASLToAGL (_lisPos select 0)) vectorAdd [0, 0, 0.1];

{
    private _tripodClass = if (EGVAR(csw,defaultAssemblyMode)) then {
        getText (_cfgWeapons >> _x >> "ace_csw" >> "deploy")
    } else {
        // Note M6 is also considered a tripod as far as the next instruction is concerned
        getText (_cfgWeapons >> _x >> "SPE_Deployed_Tripod_Name")
    };

    if (_tripodClass == "") then {
        continue;
    };

    // Remove tripod from container
    _container addItemCargoGlobal [_x, -1];

    // Create a vehicle replacing the tripod
    private _weaponPlatform = createVehicle [_tripodClass, _posASL, [], 0, ["NONE", "CAN_COLLIDE"] select (_forEachIndex == 0)];

    _weaponPlatform setVectorDirAndUp [_vectorDir, _lisPos select 1];
} forEach _tripods;
