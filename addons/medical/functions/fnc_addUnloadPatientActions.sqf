/*
 * Author: esteldunedain
 * Create one unload action per unconscious passenger
 *
 * Argument:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 * 3: Parameters <ARRAY>
 *
 * Return value:
 * Children actions <ARRAY>
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_3_PVT(_this,_vehicle,_player,_parameters);

private ["_actions", "_unit"];
_actions = [];

{
    _unit = _x;
    if (_unit != _player && {(alive _unit) && {_unit getVariable ["ACE_isUnconscious", false]}}) then {
        _actions pushBack
            [
                [
                    str(_unit),
                    [_unit, true] call EFUNC(common,getName),
                    "",
                    {[_player, (_this select 2) select 0] call FUNC(actionUnloadUnit);},
                    {true},
                    {},
                    [_unit]
                ] call EFUNC(interact_menu,createAction),
                [],
                _unit
            ];
    };
} forEach crew _vehicle;

_actions
