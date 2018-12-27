#include "script_component.hpp"
/*
 * Author: chris579
 * Gets the path to the ground texture under the object.
 * Native version using Intercept CBA 'surfaceTexture',
 * Is compiled conditionally when Intercept CBA is available.
 *
 * Arguments:
 * 0: Trench <OBJECT>
 *
 * Return Value:
 * Surface path <STRING>
 *
 * Example:
 * [TrenchObj] call ace_trenches_fnc_getSurfaceTexturePath
 *
 * Public: No
 */

params [
    ["_object", objnull, [objNull]]
];

if (isNull _object) exitWith {DEFAULT_TEXTURE};

private _result = surfaceTexture (getPos _object);

if (isNil {_result}) exitWith {DEFAULT_TEXTURE};
_result
