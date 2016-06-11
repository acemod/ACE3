/*
 * Author: SzwedzikPL
 * Check dogtag self menu action
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 * 2: Item class <STRING>
 *
 * Return Value:
 * Mone
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", "_target", "_item"];

[QGVAR(sendDogtagData), [_player, _item]] call CBA_fnc_serverEvent;
