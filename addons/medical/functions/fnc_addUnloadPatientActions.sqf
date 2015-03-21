/*
 * Author: CAA-Picard
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

systemChat format ["Generating for %1 %2", _vehicle, _player];

private ["_actions"];
_actions = [];

{
    _unit = _x;
    systemChat str(_unit);
    if (_unit != _player && {(alive _unit) && {_unit getVariable ["ACE_isUnconscious", false]}}) then {
        systemChat "Entered";
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

systemChat str(count _actions);

_actions
