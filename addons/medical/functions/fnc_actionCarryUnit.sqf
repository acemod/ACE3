/*
 * Author: Glowbal
 * makes the calling unit start carrying the specified unit
 *
 * Arguments:
 * 0: The caller <OBJECT>
 * 1: The target <OBJECT>
 * 2: Carry object. True is carry, false is dragging <BOOL>
 *
 * Return Value:
 * NONE
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_caller", "_target", "_positionUnit", "_carry"];
_caller = _this select 0;
_target = _this select 1;
_carry = _this select 2;

if (!(_target isKindOf "CaManBase") || !(_caller isKindOf "CaManBase")) exitwith{ };
if (vehicle _caller != _caller || vehicle _target != _target) exitwith {};
if (!([_caller] call EFUNC(common,canInteract)) || {_caller == _target} || {(([_target] call EFUNC(common,isAwake)))}) exitwith {};

_caller action ["WeaponOnBack", _caller];
if (!alive _target) exitwith {
    if (GVAR(allowDeadBodyMovement)) then {
        [{
            _this call FUNC(actionCarryUnit);
        }, [_caller, ([_target,_caller] call FUNC(makeCopyOfBody)), _carry], 0.25, 0.25] call EFUNC(common,waitAndExecute);
    };
};

if !([_caller,_target] call EFUNC(common,carryObj)) exitwith {};

if (primaryWeapon _caller == "") then {
    _caller addWeapon "ACE_FakePrimaryWeapon";
};
_caller selectWeapon (primaryWeapon _caller);

if (_carry) then {
    _target attachTo [_caller, [0.1, -0.1, -1.25], "LeftShoulder"];
    [_target, "AinjPfalMstpSnonWnonDf_carried_dead", 2, true] call EFUNC(common,doAnimation);
    [_caller, "acinpercmstpsraswrfldnon", 1] call EFUNC(common,doAnimation);
} else {
    _target attachTo [_caller, [0.125, 1.007, 0]];
    _target setDir (getDir _target + 180) % 360;
    _target setPos ((getPos _target) vectorAdd ((vectorDir _caller) vectorMultiply 1.5));
};

[
    2,
    [_caller, _target, _carry],
    {
        private ["_caller","_target"];
        _caller = _this select 0;
        _target = _this select 1;
        _carry = _this select 2;

        _target setvariable [QGVAR(beingCarried), _caller, true];
        _caller setvariable [QGVAR(carrying), _target, true];
        _caller setvariable [QGVAR(isCarrying), if (_carry) then {1} else {0}, true];

        // Removing any old drop scroll wheel actions
        // TODO Do we still want scroll wheel actions?
        if (!isnil QGVAR(DROP_ADDACTION)) then {
            _caller removeAction GVAR(DROP_ADDACTION);
            GVAR(DROP_ADDACTION) = nil;
        };
        // Adding the drop scroll wheel action.
        GVAR(DROP_ADDACTION) = _caller addAction [format["Drop %1",[_target] call EFUNC(common,getName)], {[_this select 1, _this select 2] call FUNC(actionDropUnit);}];

        [_target, true] call EFUNC(common,disableAI);
    },
    {
        [(_this select 0), objNull,[0, 0, 0]] call EFUNC(common,carryObj);
        // TODO reset animations..
    },
    if (_carry) then {localize "STR_ACE_MEDICAL_ACTION_CARRY"} else {localize "STR_ACE_MEDICAL_ACTION_DRAG"},
    {true}
] call EFUNC(common,progressBar);
