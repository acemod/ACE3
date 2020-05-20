#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Renders all marking lasers.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_markinglaser_fnc_renderPFH
 *
 * Public: No
 */

if (GVAR(lasers) isEqualTo []) exitWith {};

#ifndef DEBUG_MODE_FULL
if (!IN_NVGS) exitWith {
    { _x hideObject true } forEach GVAR(lasers);
};
#endif

{
    private _laser = _x;
    private _aircraft = attachedTo _laser;
    private _origin = _aircraft getVariable [QGVAR(laserOrigin), [0, 0, 0]];
    private _originWorld = _aircraft modelToWorldVisualWorld _origin;

    // Unhide laser in case NVGs were turned off
    _laser hideObject false;

    // Update laser direction
    private _vector = [_aircraft, _laser] call FUNC(getVector);
    _laser setVectorUp (_aircraft vectorWorldToModelVisual _vector);

    // Adjust length of laser so it doesn't go through objects
    private _intersectPos = lineIntersectsSurfaces [
        _originWorld,
        _originWorld vectorAdd (_vector vectorMultiply LIS_LIMIT),
        _laser
    ] param [0, []] param [0, []];

    if (_intersectPos isEqualTo []) then {
        _laser animate ["adjustLength", 0, true];
    } else {
        _laser animate ["adjustLength", (_originWorld distance _intersectPos) - LASER_MAX, true];
    };

    // Add random flickering, about once per second
    _laser setObjectTexture [0, selectRandomWeighted [
        "#(rgb,8,8,3)color(1,1,1,1,co)", diag_fps - 2,
        "#(rgb,8,8,3)color(1,1,0,1,co)", 1,
        "#(rgb,8,8,3)color(1,0,0,1,co)", 1
    ]];

    // setVectorUp is not instant, hide laser so it doesn't point straight up
    if ((_aircraft vectorWorldToModel vectorUp _laser) vectorDotProduct [0, 0, 1] >= 0.99) then {
        _laser animate ["adjustLength", -LASER_MAX, true];
    };
} forEach GVAR(lasers);
