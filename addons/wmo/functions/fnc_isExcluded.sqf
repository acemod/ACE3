#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Checks a classname against the runtime exclusion list. Used for engine objects such
 * as rope segments, which have no CfgVehicles entry to carry ace_wmo_walkable.
 *
 * isKindOf is used rather than an exact classname match so subclasses are covered too.
 * The result only depends on the class, so it is cached per type and the config walk
 * is paid once.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Object's class is excluded <BOOL>
 *
 * Example:
 * [cursorObject] call ace_wmo_fnc_isExcluded
 *
 * Public: No
 */

params ["_object"];

private _type = typeOf _object;
private _excluded = GVAR(excludedCache) get _type;

if (isNil "_excluded") then {
    _excluded = GVAR(excludedClasses) findIf {_object isKindOf _x} > -1;
    GVAR(excludedCache) set [_type, _excluded];
};

_excluded
