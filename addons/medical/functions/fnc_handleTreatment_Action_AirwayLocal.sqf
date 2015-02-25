/**
 * fn_treatmentAirwayLocal.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_caller","_target","_selectedData", "_selectionName", "_prevAnim", "_displayingIcon", "_part"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;


if (!local _target) exitwith{};

[_target,"STR_ACE_AIRWAY","STR_ACE_IS_TREATING_YOUR_AIRWAY",0, [([_caller] call EFUNC(common,getName))]] call EFUNC(common,sendDisplayMessageTo);
[_target,_removeItem] call FUNC(addToTriageList);


_airwayStatus = [_target,QGVAR(airway)] call EFUNC(common,getDefinedVariable);
if (_airwayStatus > 0) then {
    if (!([_treatingPerson] call FUNC(isMedic))) then {
        _target setvariable [QGVAR(airwayTreated), true, true];
    } else {
        if (random (1) >= 0.35) then {
            _target setvariable [QGVAR(airwayTreated), true, true];
        };
    };
};
true