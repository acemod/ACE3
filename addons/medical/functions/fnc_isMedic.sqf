/**
 * fn_medicClass.sqf
 * @Descr: Check if a unit is any medical class above normal.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: BOOL
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_unit","_class","_return"];
_unit = [_this, 0, objNull,[ObjNull]] call BIS_fnc_Param;

if (isnil QGVAR(setting_advancedMedicRoles)) exitwith {
    true;
};

if (GVAR(setting_advancedMedicRoles)) then {
    _class = [_unit,QGVAR(medicClass)] call EFUNC(common,getDefinedVariable);
    _return = switch (_class) do {
        case 0: {false};
        case 1: {true};
        case 2: {true};
        default {false};

    };
} else {
    _return = true;
};

_return