/*
 * Author: Dslyecxi, MikeMatrix
 * Initializes Settings for the groups modules and transcodes settings to a useable format.
 *
 * Arguments:
 * 0: Logic <LOGIC>
 * 1: Units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [module, [player], true] call ace_map_gestures_fnc_moduleGroupSettings
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic", "_units", "_activated"];
TRACE_3("params",_logic,_units,_activated);

if (!_activated) exitWith {};

// Transcode string setting into usable array. Example: "1,1,1,1" -> [1, 1, 1, 1]
private _leadColor = call compile ("[" + (_logic getVariable ["leadColor", ""]) + "]");
if (!([_leadColor] call FUNC(isValidColorArray))) exitWith {ERROR("leadColor is not a valid color array.")};
private _color = call compile ("[" + (_logic getVariable ["color", ""]) + "]");
if (!([_color] call FUNC(isValidColorArray))) exitWith {ERROR("color is not a valid color array.")};

// Add all synchronized groups and reference custom configuration for them
{
    [group _x, _leadColor, _color] call FUNC(addGroupColorMapping);
} forEach _units;
