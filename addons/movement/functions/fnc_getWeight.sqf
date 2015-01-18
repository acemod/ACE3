// by commy2
#include "script_component.hpp"

private ["_unit", "_weight"];

_unit = _this select 0;

_weight = loadAbs _unit * 0.1;

if (profileNamespace getVariable ["ACE_useImperial", false]) then {
    _weight = format ["%1lb", (round (_weight * 100)) / 100];
} else {
    _weight = format ["%1kg", (round (_weight * FACTOR_POUND_TO_KILOGRAMM * 100)) / 100];
};

_weight
