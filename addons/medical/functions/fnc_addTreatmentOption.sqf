/**
 * fnc_addTreatmentOption.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_displayName","_tooltip","_condition","_code", "_category","_options"];
_displayName = _this select 0;
_tooltip = _this select 1;
_condition = _this select 2;
_code = _this select 3;
_category = _this select 4;

if (isLocalized _displayName) then {
    _displayName = localize _displayName;
};

if (isLocalized _tooltip) then {
    _tooltip = localize _tooltip;
};

_options = missionNamespace getvariable [QGVAR(registeredTreatmentOptions_)+_category, []];
_options pushback [_displayName, _tooltip, _condition, _code];

missionNamespace setvariable [QGVAR(registeredTreatmentOptions_)+_category, _options];
