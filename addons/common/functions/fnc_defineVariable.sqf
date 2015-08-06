 /*
 * Author: Glowbal
 *
 * Define a variable for the ACE variable framework
 *
 * Argument:
 * 0: Name (STRING)
 * 1: defaultValue (ANY)
 * 2: publicFlag (BOOLEAN)
 * 3: category (STRING)
 * 4: type (NUMBER)(Optional)
 * 5: persistentFlag (BOOLEAN)(Optional)
 *
 * Return value:
 * None
 *
 * Public: Yes
*/
#include "script_component.hpp"

params ["_name", "_value", "_defaultGlobal", "_category", ["_code", 0], ["_persistent", false]];
// If not enough parameters are given, exit early.
if (isNil "_defaultGlobal") exitWith {};

if (typeName _name != typeName "") exitwith {
    [format["Tried to the deinfe a variable with an invalid name: %1 Arguments: %2", _name, _this]] call FUNC(debug);
};

if (isnil QGVAR(OBJECT_VARIABLES_STORAGE)) then {
    GVAR(OBJECT_VARIABLES_STORAGE) = [];
};

GVAR(OBJECT_VARIABLES_STORAGE) pushback [_name,_value,_defaultGlobal,_category,_code, _persistent];

missionNamespace setvariable [QGVAR(OBJECT_VARIABLES_STORAGE_) + _name, [_name,_value,_defaultGlobal,_category,_code, _persistent]];
