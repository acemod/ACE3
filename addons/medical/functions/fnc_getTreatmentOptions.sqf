/**
 * fnc_getTreatmentOptions.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"


private ["_caller","_target","_category", "_result", "_nameCaller", "_nameTarget"];
_caller = _this select 0;
_target = _this select 1;
_category = _this select 2;

if ((_category == "advanced" || _category == "airway") && (_caller == _target)) exitwith {
    [];
};

if (!([_caller] call EFUNC(common,canInteract))) exitwith {
    [];
};

if (([_caller] call EFUNC(common,beingCarried))) exitwith {
    [];
};

if (!(isNull([_caller] call EFUNC(common,getCarriedObj))) && _category != "drag") exitwith {
    [];
};

_nameCaller = [_caller] call EFUNC(common,getName);
_nameTarget = [_Target] call EFUNC(common,getName);

_result = [];
{
    if ([_caller, _target] call (_x select 2)) then {

        private ["_caller", "_target", "_category"];

        // title, code, tooltip
        _result pushback [format[_x select 0, _nameCaller, _nameTarget], _x select 3, format[_x select 1, _nameCaller, _nameTarget]];
    };
}foreach (missionNamespace getvariable [QGVAR(registeredTreatmentOptions_)+_category, []]);

_result;