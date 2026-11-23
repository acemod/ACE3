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

if (_slot != TYPE_HMD) exitWith {
    if (_slot != TYPE_HEADGEAR && {(hmd _unit) isEqualTo ""}) exitWith {};
    if (!_assign) exitWith {
        if ((hmd _unit) isEqualTo "") exitWith {
            GVAR(playerHMD) = "";
        };
    };
    private _subItems = getArray (configFile >> "CfgWeapons" >> _item >> "subItems");
    if (_subItems isEqualTo []) exitWith {};
    private _nvg = _subItems findIf { "nvg" in (toLower _x) };
    if (_nvg isEqualTo -1) exitWith {};
    [{
        GVAR(playerHMD) = (_this select 0);
        [] call FUNC(refreshGoggleType);
    },[(_subItems select _nvg)]] call CBA_fnc_execNextFrame;
};

if (!_assign) exitWith {
    GVAR(playerHMD) = "";
};

if (_item != GVAR(playerHMD)) then {
    GVAR(playerHMD) = _item;
    [] call FUNC(refreshGoggleType);
};
