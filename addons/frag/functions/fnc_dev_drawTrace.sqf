#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function draws all development traces and is intended to be called on each frame.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_frag_fnc_dev_drawTrace
 *
 * Public: No
 */

#define HITBOX_DRAW_PATH [[3, 2, 1, 5, 6, 7, 3, 0, 4, 5], [0, 1], [2, 6], [7, 4]]

if (!GVAR(debugOptions)) exitWith {};

{
    _y params ["_posArray", "_color"];
    if (count _posArray > 1) then {
        for "_j" from 1 to count _posArray - 1 do {
            drawLine3D [_posArray#(_j - 1), _posArray#_j, _color];
        };
    };
} forEach GVAR(dev_trackLines);

if (GVAR(drawHitBox)) then {
    {
        _y params ["_object", "_boxPoints", "_color"];
        if (!alive _object) then {
            GVAR(dev_hitBoxes) deleteAt _x;
            continue;
        };

        {
            for "_i" from 1 to count _x - 1 do {
                drawLine3D [_object modelToWorld (_boxPoints#(_x#_i)), _object modelToWorld (_boxPoints#(_x#(_i - 1))), _color];
            };
        } forEach HITBOX_DRAW_PATH;
    } forEach GVAR(dev_hitBoxes);
};
