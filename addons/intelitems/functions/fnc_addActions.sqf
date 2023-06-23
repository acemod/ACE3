#include "script_component.hpp"
/*
 * Author: mharis001
 * Returns children actions for intel items in the player's inventory.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [player] call ace_intelitems_fnc_addActions
 *
 * Public: No
 */

params ["_player"];

private _actions = [];

private _cfgMagazines = configFile >> "CfgMagazines";
private _magazines = magazines _player;

private _openIndices = GVAR(controlsGroups) apply {_x getVariable QGVAR(index)};

{
    private _config = _cfgMagazines >> _x;

    if (getNumber (_config >> QGVAR(intel)) == 1) then {
        private _displayName = getText (_config >> "displayName");
        private _picture     = getText (_config >> "picture");
        private _controlType = getText (_config >> QGVAR(control));

        private _magazineIds = [_player, _x] call CBA_fnc_getMagazineIndex;

        {
            private _index = GVAR(intelMap) getVariable _x;

            // Only add actions for intel indices that are not open
            if !(_index in _openIndices) then {
                private _action = [
                    format [QGVAR(%1), _index],
                    _displayName,
                    _picture,
                    {(_this select 2) call FUNC(createControl)},
                    {true},
                    {},
                    [_controlType, _index]
                ] call EFUNC(interact_menu,createAction);

                _actions pushBack [_action, [], _player];
            };
        } forEach _magazineIds;
    };
} forEach (_magazines arrayIntersect _magazines);

_actions
