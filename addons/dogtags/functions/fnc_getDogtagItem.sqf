#include "..\script_component.hpp"
/*
 * Author: SzwedzikPL
 * Server: Creates new dogtag item and sends it to client.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget] call ace_dogtags_fnc_getDogtagItem
 *
 * Public: No
 */

if (!isServer) exitWith {};

params ["_player", "_target"];
TRACE_2("getDogtagItem",_player,_target);

if (isNil QGVAR(dogtagsData)) then {
    GVAR(dogtagsData) = createHashMap;
    GVAR(idCounter) = 0;
};

GVAR(idCounter) = GVAR(idCounter) + 1;

if (GVAR(idCounter) > 999) exitWith {
    ERROR("Ran out of IDs");
};

private _dogTagData = _target call FUNC(getDogTagData);
private _item = format ["ACE_dogtag_%1", GVAR(idCounter)];

GVAR(dogtagsData) set [_item, _dogTagData];
publicVariable QGVAR(dogtagsData); // Broadcast data, so that the arsenal can use it client side

// Dogtags have no mass, so no need to check if it can fit in container, but check if unit has an inventory at all
[_player, _item, true] call CBA_fnc_addItem;

_name = _dogtagData param [0, ""];

// If data doesn't exist or body has no name, set name as "unknown"
if (_name == "") then {
    _name = LELSTRING(common,unknown);
};

// Display message
[{
    [QEGVAR(common,displayTextStructured), [_this select 0, 2.5], _this select 1] call CBA_fnc_targetEvent;
}, [format [LLSTRING(takeDogtagSuccess), _name], _player], DOGTAG_SHOW_DELAY] call CBA_fnc_waitAndExecute;
