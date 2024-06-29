#include "..\script_component.hpp"
/*
 * Author: SzwedzikPL
 * Server: Returns to client data on given dogtag.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Item <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, unit] call ace_dogtags_fnc_sendDogtagData
 *
 * Public: No
 */

if (!isServer) exitWith {};

params ["_target", "_item"];
TRACE_2("sendDogtagData",_target,_item);

// If item doesn't exist, don't send anything back
if (isNil QGVAR(dogtagsData) || {!(_item in GVAR(dogtagsData))}) exitWith {};

[QGVAR(showDogtag), [GVAR(dogtagsData) get _item], _target] call CBA_fnc_targetEvent;
