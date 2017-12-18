/*
 * Author: chris579
 * Gets the path to the ground texture under the object
 * Native version using intercept cba 'surfaceTexture'
 * Is compiled conditionally when intercept cba is available
 *
 * Arguments:
 * 0: trench <OBJECT>
 *
 * Return Value:
 * Surface path <STRING>
 *
 * Example:
 * [TrenchObj] call ace_trenches_fnc_getSurfaceTexturePath
 *
 * Public: No
 */
#include "script_component.hpp"
params [
    ["_object", objnull, [objNull]]
];

if (isNull _object) exitWith {DEFAULT_TEXTURE};

private _result = surfaceTexture (getPos _object);

if (isNil {_result}) exitWith {DEFAULT_TEXTURE};
_result
