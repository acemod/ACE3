#include "script_component.hpp"
/*
 * Author: SzwedzikPL, mharis001
 * Returns children actions for checking dogtags in player's inventory.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [_player] call ace_dogtags_fnc_addDogtagActions
 *
 * Public: No
 */

params ["_player"];

private _fnc_getActions = {
    private _actions = [];
    private _cfgWeapons = configFile >> "CfgWeapons";

    {
        private _config = _cfgWeapons >> _x;
        if (getNumber (_config >> QGVAR(tagID)) > 0) then {
            private _displayName = getText (_config >> "displayName");
            private _picture = getText (_config >> "picture");

            private _action = [_x, _displayName, _picture, FUNC(checkDogtagItem), {true}, {}, _x] call EFUNC(interact_menu,createAction);
            _actions pushBack [_action, [], _player];
        };
    } forEach (_player call EFUNC(common,uniqueItems));

    _actions
};

[[], _fnc_getActions, _player, QGVAR(actionsCache), 9999, "cba_events_loadoutEvent"] call EFUNC(common,cachedCall);
