/*
 * Author: Glowbal
 * IV Treatment callback
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 * 3: Treatment classname <STRING>
 *
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_target", "_ivItem", "_config", "_volumeAdded", "_typeOf", "_varName"];
_target = _this select 0;
_ivItem = _this select 1;

// Find the proper attributes for the used IV
_config = (configFile >> "ACE_Medical_Advanced" >> "Treatment" >> "IV");
_volumeAdded = getNumber (_medicationConfig >> "volume");
_typeOf = getText (_medicationConfig >> "type");

if (isClass (_config >> _className)) then {
    _config = (_config >> _className);
    if (isNumber (_config >> "volume")) then { _volumeAdded = getNumber (_config >> "volume");};
    if (isText (_config >> "type")) then { _typeOf = getText (_config >> "type"); };
};

_varName = format["ACE_Medical_IVVolume_%1",_typeOf];
_target setvariable [_varName, (_target getvariable [_varName, 0]) + _volumeAdded];

// TODO localization
//[_target,"treatment",format["%1 has given %4 a %2(%3ml)",[_caller] call EFUNC(common,getName),_attributes select 2,_attributes select 1,_target]] call FUNC(addActivityToLog);
//[_target,_removeItem] call FUNC(addToTriageList);
