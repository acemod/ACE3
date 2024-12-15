#include "..\script_component.hpp"
/*
 * Author: SzwedzikPL, mharis001
 * Returns children actions for checking dog tags in the player's inventory.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * player call ace_dogtags_fnc_addDogtagActions
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
            _actions pushBack [
                [
                    _x,
                    getText (_config >> "displayName"),
                    getText (_config >> "picture"),
                    {[GVAR(dogtagsData) getOrDefault [_this select 2, []]] call FUNC(showDogtag)},
                    {true},
                    {},
                    _x
                ] call EFUNC(interact_menu,createAction),
                [],
                _player
            ];
        };
    } forEach (_player call EFUNC(common,uniqueItems));

    _actions
};

[[], _fnc_getActions, _player, QGVAR(actionsCache), 9999, "cba_events_loadoutEvent"] call EFUNC(common,cachedCall);
