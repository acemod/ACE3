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

#include "script_component.hpp"

private ["_action", "_actions"];
params ["_target", "_player"];

_actions = [];
{
    if (isClass _x) then {
        _action = [_player, _target, configName _x, configName _x, getText (_x >> "icon")] call FUNC(createAction);
        if (typeName _action != "BOOL") then {
            _actions pushBack [_action, [], _player];
        };
    };
}foreach ("true" configClasses (configFile >> "ACE_BFT" >> "Devices"));

_actions
