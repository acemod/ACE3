#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Check dogtag self menu action.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 * 2: Item class <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, unit, "itemClass"] call ace_dogtags_fnc_checkDogtagItem
 *
 * Public: No
 */

params ["_player", "_target", "_item"];

[QGVAR(sendDogtagData), [_player, _item]] call CBA_fnc_serverEvent;
