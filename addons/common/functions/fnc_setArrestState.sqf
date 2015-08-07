/*
 * Author: esteldunedain
 *
 * Set a unit in arrest state
 *
 * Argument:
 * 0: Unit to be Arrested (OBJECT)
 * 1: set Arrested (BOOL)
 *
 * Return value:
 * None
 *
 * Public: Yes
 */
#include "script_component.hpp"

params[["_unit",ObjNull,[ObjNull]],["_setArrest",false,[false]]];

if (_setArrest) then {
    [_unit, QGVAR(StateArrested), true] call FUNC(setDefinedVariable);

    if ([_unit] call FUNC(isAwake)) then {
        if (vehicle _unit == _unit) then {
            [_unit,"UnaErcPoslechVelitele2",1] call FUNC(doAnimation);
        };
    };
    if (isPlayer _unit) then {
        [["arrested", true],QFUNC(setDisableUserInputStatus),_unit,false] call EFUNC(common,execRemoteFnc);
    };
    _unit disableAI "Move";
    _unit disableAI "ANIM";
} else {
    [_unit, QGVAR(StateArrested), false] call FUNC(setDefinedVariable);

    if ([_unit] call FUNC(isAwake)) then {
        if (vehicle _unit == _unit) then {
            [_unit,"",1] call FUNC(doAnimation);
        };
        _unit enableAI "Move";
        _unit enableAI "ANIM";
    };
    if (isPlayer _unit) then {
        [["arrested", false],QFUNC(setDisableUserInputStatus),_unit,false] call EFUNC(common,execRemoteFnc);
    };
};
