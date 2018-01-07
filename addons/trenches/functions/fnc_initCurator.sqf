/*
 * Author: chris579
 * Inits curator logics with evhs
 *
 * Arguments:
 * 0: curator logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [Logic] call ace_trenches_fnc_initCurator
 *
 * Public: No
 */
#include "script_component.hpp"
params [
    ["_logic", objnull, [objNull]]
];

_logic addEventHandler ["CuratorObjectEdited", {
    params ["_logic", "_object"];

    if ([_object] call FUNC(isTrench)) then {
        private _texture = [_object] call FUNC(getSurfaceTexturePath);
        _object setObjectTextureGlobal [0, _texture];
    };
}];
