#include "script_component.hpp"
/*
 * Author: Dslyecxi, MikeMatrix, PabstMirror
 * Adds a group id color mapping.
 *
 * Arguments:
 * 0: Group ID or group <STRING><GROUP>
 * 1: Leader color array (4 numbers including alpha) <ARRAY>
 * 2: Unit (non-leader) color array (4 numbers including alpha) <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Alpha 1-1", [1,0,0,1], [0,1,0,1]] call ace_map_gestures_fnc_addGroupColorMapping
 *
 * Public: Yes
 */

if (!params [["_group", "", [grpNull, ""]], ["_leadColor", [1,1,1,1], [[]], 4], ["_unitColor", [1,1,1,1], [[]], 4]]) exitWith {
    ERROR_1("Bad Params: %1",_this);
};
TRACE_3("params",_group,_leadColor,_unitColor);

if (_group isEqualType grpNull) then {_group = groupID _group};

if (_group == "") exitWith {ERROR("Group ID is blank, which is not valid.")};
if (!([_leadColor] call FUNC(isValidColorArray))) exitWith {ERROR("leadColor is not a valid color array.")};
if (!([_unitColor] call FUNC(isValidColorArray))) exitWith {ERROR("color is not a valid color array.")};

GVAR(GroupColorCfgMappingNew) setVariable [_group, [_leadColor, _unitColor]];
