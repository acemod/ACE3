#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Checks if a given object is a terrain object.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * True if object is a terrain object, otherwise false <BOOL>
 *
 * Example:
 * cursorObject call ace_common_fnc_isTerrainObject
 *
 * Public: Yes
 */

params [["_object", objNull, [objNull]]];
TRACE_1("fnc_isTerrainObject",_object);

if (isNull _object) exitWith { false };

// Terrain objects always have an owner of 1, but `owner` command is server exec. So we just check first character of netId
// They also have a negative netId, but Dedmen said not to rely on it in the case that BI fixes it
(netId _object) select [0, 1] == "1"
