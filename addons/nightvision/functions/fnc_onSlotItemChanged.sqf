#include "..\script_component.hpp"
/*
 * Author: Dslyecxi, PabstMirror
 * Refreshes nvg effect if switching NVG goggles.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Slot item <STRING>
 * 2: Slot number <NUMBER>
 * 3: Item assigned <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_nightvision_fnc_onSlotItemChanged
 *
 * Public: No
 */

params ["_unit", "_item", "_slot", "_assign"];
TRACE_4("onSlotItemChange",_unit,_item,_slot,_assign);

if (_unit != ACE_player || _slot != TYPE_HMD) exitWith {};
if (!_assign) exitWith {
    GVAR(playerHMD) = "";
};

if (_item != GVAR(playerHMD)) then {
    GVAR(playerHMD) = _item;
    [] call FUNC(refreshGoggleType);
};
