#include "..\script_component.hpp"
/*
 * Author: Timi007
 * Returns true if throwable is lethal otherwise false.
 *
 * Arguments:
 * 0: Throwable classname <STRING>
 *
 * Return Value:
 * Throwable is lethal <BOOL>
 *
 * Example:
 * ["HandGrenade"] call ace_interaction_fnc_isThrowableLethal
 *
 * Public: No
 */

params [["_throwable", "", [""]]];

([_throwable] call FUNC(getThrowableInfo)) params [["_explosive", 0, [0]]];

// Some throwables are not lethal but define explosive > 0. Therefore we use some small epsilon
// E.g. ACE_G_M84, ACE_G_CTS9
_explosive > 0.0001
