#include "script_component.hpp"
/*
 * Author: chris579, Salbei
 * Inits a trench
 *
 * Arguments:
 * 0: trench <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [TrenchObj] call ace_trenches_fnc_initTrench
 *
 * Public: No
 */

params [
   ["_object", objNull, [objNull]]
];
if (isServer) then {
   _object setVariable [QGVAR(progress), 1, true];
};

if (is3DEN) exitWith {
   [_object] call FUNC(initTrench3DEN);
};

if (local _object) then {
   // Has to be spawned to ensure MP compatibility
   [{
      private _texture = [_this select 0] call FUNC(getSurfaceTexturePath);
      (_this select 0) setObjectTextureGlobal [0, _texture];
   }, [_this]] call CBA_fnc_execNextFrame;
};
