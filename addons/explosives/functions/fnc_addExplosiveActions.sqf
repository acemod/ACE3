#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, CAA-Picard, mharis001
 * Returns children actions for explosive magazines in the player's inventory.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [_player] call ace_explosives_fnc_addExplosiveActions
 *
 * Public: No
 */

[_this, {
    params ["_player"];
    TRACE_1("Creating explosive actions",_player);

    private _cfgMagazines = configFile >> "CfgMagazines";
    private _magazines = magazines _player;
    private _totalCount = count _magazines;

    private _actions = [];
    {
        private _config = _cfgMagazines >> _x;
        if (getNumber (_config >> QGVAR(Placeable)) == 1) then {
            private _name = getText (_config >> "displayNameShort");
            private _picture = getText (_config >> "picture");
            if (_name isEqualTo "") then {
                _name = getText (_config >> "displayName");
            };

            private _action = [_x, format ["%1 (%2)", _name, _totalCount - count (_magazines - [_x])], _picture, {[{_this call FUNC(setupExplosive)}, _this] call CBA_fnc_execNextFrame}, {true}, {}, _x] call EFUNC(interact_menu,createAction);
            _actions pushBack [_action, [], _player];
        };
    } forEach (_magazines arrayIntersect _magazines);

    _actions
}, ACE_player, QGVAR(explosiveActions), 3600, "cba_events_loadoutEvent"] call EFUNC(common,cachedCall);
