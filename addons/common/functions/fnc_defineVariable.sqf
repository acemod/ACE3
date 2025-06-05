#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Define a variable for the ACE variable framework
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Default value <ANY>
 * 2: Public flag <BOOL>
 * 3: Category <STRING>
 * 4: Type <NUMBER> (default: 0)
 * 5: Persistent flag <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["bob", 1, true, "category", 1, true] call ace_common_fnc_defineVariable
 *
 * Public: Yes
 */

params ["_name", "_value", "_defaultGlobal", "_category", ["_code", 0], ["_persistent", false]];

if (isNil "_defaultGlobal") exitWith {};

if !(_name isEqualType "") exitWith {
    [format ["Tried to the deinfe a variable with an invalid name: %1 Arguments: %2", _name, _this]] call FUNC(debug);
};

if (isNil QGVAR(OBJECT_VARIABLES_STORAGE)) then {
    GVAR(OBJECT_VARIABLES_STORAGE) = [];
};

GVAR(OBJECT_VARIABLES_STORAGE) pushBack [_name, _value, _defaultGlobal, _category, _code, _persistent];

missionNamespace setVariable [QGVAR(OBJECT_VARIABLES_STORAGE_) + _name, [_name, _value, _defaultGlobal, _category, _code, _persistent]];
