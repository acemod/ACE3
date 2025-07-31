#include "..\script_component.hpp"
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
 * [_player] call ace_field_rations_fnc_getConsumableChildren
 *
 * Public: No
 */

params ["_player"];

private _fnc_getActions = {
    TRACE_1("Creating consumable item actions",_player);

    private _actions = [];
    private _cfgWeapons = configFile >> "CfgWeapons";
    private _cfgMagazines = configFile >> "CfgMagazines";

    {
        _x params ["_config", "_items"];
        private _isMagazine = _config == _cfgMagazines;
        {
            private _itemConfig = _config >> _x;
            if (getNumber (_itemConfig >> QXGVAR(thirstQuenched)) != 0 || {getNumber (_itemConfig >> QXGVAR(hungerSatiated)) != 0}) then {
                private _displayName = getText (_itemConfig >> "displayName");
                private _picture = getText (_itemConfig >> "picture");

                // Exec next frame so closing interaction menu doesn't block progressBar
                private _action = [_x, _displayName, _picture, {[FUNC(consumeItem), _this] call CBA_fnc_execNextFrame}, {true}, {}, [_x, _itemConfig, _isMagazine]] call EFUNC(interact_menu,createAction);
                _actions pushBack [_action, [], _player];
            };
        } forEach _items;
    } forEach [
        [_cfgWeapons, _player call EFUNC(common,uniqueItems)],
        [_cfgMagazines, [_player, 2] call EFUNC(common,uniqueItems)]
    ];

    _actions
};

[[], _fnc_getActions, _player, QGVAR(consumableActionsCache), 9999, "cba_events_loadoutEvent"] call EFUNC(common,cachedCall);
