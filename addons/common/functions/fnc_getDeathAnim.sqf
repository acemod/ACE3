/**
 * fn_getDeathAnim.sqf
 * @Descr: Get the death animation for the unit at current time
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: STRING animation
 * @PublicAPI: true
 */
#include "script_component.hpp"

private ["_unit", "_curAnim", "_animation", "_cfg","_unitAnimation", "_animationState"];
_unit = _this select 0;

if (vehicle _unit != _unit) exitwith {
    _animation = "";
    _animationState = (animationState _unit);
    _unitAnimation = (configFile >> "CfgMovesMaleSdr" >> "States" >> _animationState);
    if (isText (_unitAnimation >> "actions")) then {
        if ((vehicle _unit) != _unit) then {
            _cfg = (configFile >> "CfgMovesMaleSdr" >> "States" >> _animationState);
            if (isArray (_cfg >> "interpolateTo")) then {
                _animation = getArray (_cfg >> "interpolateTo") select 0;
            };
        } else {
            _cfg = (configFile >> "CfgMovesBasic" >> "Actions" >> (getText (_unitAnimation >> "actions")) >> "die");
            if (isText _cfg) then {
                _animation = getText _cfg;
            };
        };
    };
    if (isnil "_animation") then {
        _animation = "";
    };
    _animation;
};

"Unconscious";
