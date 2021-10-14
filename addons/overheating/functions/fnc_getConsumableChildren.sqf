#include "script_component.hpp"
/*
 * Author: mharis001, Glowbal, PabstMirror
 * Returns children actions for consumable items in player's inventory.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [_unit] call ace_overheating_fnc_getConsumableChildren
 *
 * Public: No
 */

params ["_unit"];

private _fnc_getActions = {
    TRACE_1("Creating overheating consumable item actions",_unit);

    private _actions = [];
    private _cfgWeapons = configFile >> "CfgWeapons";

    {
        private _config = _cfgWeapons >> _x;
        if (getNumber (_config >> "acex_field_rations_thirstQuenched") > 0) then {
            private _displayName = getText (_config >> "displayName");
            private _picture = getText (_config >> "picture");

            // Exec next frame so closing interaction menu doesn't block progressBar
            private _action = [_x, _displayName, _picture, {[FUNC(coolWeaponWithItem), _this] call CBA_fnc_execNextFrame}, {true}, {}, _x] call EFUNC(interact_menu,createAction);
            _actions pushBack [_action, [], _unit];
        };
    } forEach (_unit call EFUNC(common,uniqueItems));

    _actions
};

[[], _fnc_getActions, _unit, QGVAR(overheatingConsumableActionsCache), 9999, "cba_events_loadoutEvent"] call EFUNC(common,cachedCall);
