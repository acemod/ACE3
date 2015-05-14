/*
 * Author: commy2
 * Sort options by priority
 *
 * Arguments:
 * Actions <ARRAY>
 *
 * Return value:
 * None
 *
 * Example:
 * customActions call ace_interaction_fnc_sortOptionsByPriority
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_actions", "_count", "_index", "_actionN", "_actionM"];

_actions = _this;
_count = count _actions;
_index = 0;

while {_index < _count - 1} do {
    _actionN = + _actions select _index;
    _actionM = + _actions select (_index + 1);

    if (_actionN select 3 < _actionM select 3) then {
        _actions set [_index, _actionM];
        _actions set [_index + 1, _actionN];
        _index = 0;
    } else {
        _index = _index + 1;
    };
};
