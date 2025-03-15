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

// Update giver's valid explosives and get valid explosives for detonator
private _explosivesList = [_giver, _item] call FUNC(getPlacedExplosives);

TRACE_1("explosives changing hands",_explosivesList);

if (_explosivesList isEqualTo []) exitWith {};

// Remove explosives from giver
_giver setVariable [QGVAR(clackers), (_giver getVariable [QGVAR(clackers), []]) - _explosivesList, true];

// Update receiver's list and add explosives to receiver
_receiver setVariable [QGVAR(clackers), (_receiver call FUNC(getPlacedExplosives)) + _explosivesList, true];
