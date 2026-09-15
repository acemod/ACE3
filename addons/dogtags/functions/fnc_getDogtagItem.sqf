#include "..\script_component.hpp"
/*
 * Author: SzwedzikPL
 * Server: Creates a new dog tag item and sends it to client.
 * It broacasts the dog tag info to all machines with interfaces.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_dogtags_fnc_getDogtagItem
 *
 * Public: No
 */

if (!isServer) exitWith {};

params ["_player", "_target"];
TRACE_2("getDogtagItem",_player,_target);

GVAR(idCounter) = GVAR(idCounter) + 1;

if (GVAR(idCounter) > 999) exitWith {ERROR("Ran out of IDs");};

private _dogTagData = [_target] call FUNC(getDogTagData);
private _item = format ["ACE_dogtag_%1", GVAR(idCounter)];

// Broadcast data globally, so that clients can use it where needed
[QGVAR(broadcastDogtagInfo), [_item, _dogTagData]] call CBA_fnc_globalEvent;

// Dog tags have no mass, so no need to check if it can fit in container, but check if unit has an inventory at all
[_player, _item, true] call CBA_fnc_addItem;

private _name = _dogtagData param [0, ""];

// If data doesn't exist or body has no name, set name as "unknown"
if (_name == "") then {
    _name = LELSTRING(common,unknown);
};

// Display message
[{
    [QEGVAR(common,displayTextStructured), [_this select 0, 2.5], _this select 1] call CBA_fnc_targetEvent;
}, [format [LLSTRING(takeDogtagSuccess), _name], _player], DOGTAG_SHOW_DELAY] call CBA_fnc_waitAndExecute;
