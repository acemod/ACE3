#include "script_component.hpp"
/*
 * Author: Glowbal
 * Gets magazine children for interaciton menu
 *
 * Argument:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return value:
 * ChildActiosn<ARRAY>
 *
 * Example:
 * [player, player] call ace_magazinerepack_fnc_getBFTActionChildren
 *
 * Public: No
 */


params ["_target", "_player"];

private _actions = [];
{
    if (isClass _x) then {
        private _action = [_player, _target, configName _x, configName _x, getText (_x >> "icon")] call FUNC(createAction);
        if !(_action isEqualType true) then {
            _actions pushBack [_action, [], _player];
        };
    };
} forEach ("true" configClasses (configFile >> "ACE_BFT" >> "Devices"));

_actions
