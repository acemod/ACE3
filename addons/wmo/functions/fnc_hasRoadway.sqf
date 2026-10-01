#include "..\script_component.hpp"
/*
 * Author: Bloodwyn, LinkIsGrim
 * Checks whether the helper roadway should be placed under the unit for this object.
 * Objects without one are stood on directly, which is what the engine already does.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Object should receive a helper roadway <BOOL>
 *
 * Example:
 * [cursorObject] call ace_wmo_fnc_hasRoadway
 *
 * Public: No
 */

params ["_object"];

if (isNull _object) exitWith {false};

private _walkable = getNumber (configOf _object >> QGVAR(walkable));

if (_walkable isEqualTo 0) exitWith {false};

!([_object] call FUNC(isExcluded))
