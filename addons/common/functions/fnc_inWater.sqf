/**
 * fn_inWater_f.sqf
 * @Descr: Check if unit is underwater
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: BOOL True if unit is in the water
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_return","_aslPos"];

PARAMS_1(_unit);
_return = false;

if ((surfaceIsWater getPos _unit)) then {
    _aslPos = _unit modelToWorldVisual (_unit selectionPosition "head");
    if ((_aslPos select 2) <= 0) then {
        _return = true;
    };
};

_return;
