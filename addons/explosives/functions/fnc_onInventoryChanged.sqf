#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * When a take/put event handler fires and a detonator changes hands, take/give "attached" explosives.
 *
 * Arguments:
 * 0: Receiver <OBJECT>
 * 1: Giver <OBJECT>
 * 2: Item <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "ACE_M26_Clacker"] call ace_explosives_fnc_onInventoryChanged
 *
 * Public: No
 */

params ["_receiver", "_giver", "_item"];
TRACE_3("params",_receiver,_giver,_item);

if !(ACE_player in [_receiver, _giver]) exitWith {};
if !(_item in GVAR(detonators)) exitWith {};

// Transfer ownership if receiver is taking out of uniform, vest or backpack
if (_receiver isKindOf "ContainerSupply" || {getNumber (configOf _receiver >> "isBackpack") == 1}) then {
    _receiver = objectParent _receiver;
};

if (isNull _receiver) exitWith {};

// Transfer ownership if giver is giving out of uniform, vest or backpack
if (_giver isKindOf "ContainerSupply" || {getNumber (configOf _giver >> "isBackpack") == 1}) then {
    _giver = objectParent _giver;
};

if (isNull _giver) exitWith {};

// Skip if moving within player's inventory
if (_giver == _receiver) exitWith {};

// Don't give code if giver still has an identical trigger
if (_item in items _giver) exitWith {}; // EFUNC(common,hasItem) isn't reliable in this context

// Update giver's valid explosives and get valid explosives for detonator
private _explosivesList = [_giver, getText (configFile >> "CfgWeapons" >> _item >> QGVAR(triggerType))] call FUNC(getPlacedExplosives);

TRACE_1("explosives changing hands",_explosivesList);

if (_explosivesList isEqualTo []) exitWith {};

// Remove explosives from giver
_giver setVariable [QGVAR(clackers), (_giver getVariable [QGVAR(clackers), []]) - _explosivesList, true];

// Update receiver's list and add explosives to receiver
_receiver setVariable [QGVAR(clackers), (_receiver call FUNC(getPlacedExplosives)) + _explosivesList, true];
