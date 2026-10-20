#include "..\script_component.hpp"
/*
 * Author: Dslyecxi, PabstMirror, LinkIsGrim
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
 * [player, "ACE_NVG_Wide", 616, true] call ace_nightvision_fnc_onSlotItemChanged
 *
 * Public: No
 */

params ["_unit", "_item", "_slot", "_assign"];
TRACE_4("onSlotItemChanged",_unit,_item,_slot,_assign);

if (_slot != TYPE_HMD) exitWith {};

if (!_assign) exitWith {
    GVAR(playerHMD) = "";
};

if (_item != GVAR(playerHMD)) then {
    GVAR(playerHMD) = _item;
    [] call FUNC(refreshGoggleType);
};
