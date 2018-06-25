#include "script_component.hpp"
/*
 * Author: Rocko, Ruthberg
 * Place down spotting scope
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: scope class <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "ACE_SpottingScope"] call ace_spottingscope_fnc_place
 *
 * Public: No
 */

params ["_unit", "_scopeClass"];

_unit removeItem _scopeClass;

if ((_unit call CBA_fnc_getUnitAnim) select 0 == "stand") then {
    _unit playMove "AmovPercMstpSrasWrflDnon_diary";
};

[{
    params ["_unit"];

    // prevent collision damage
    [QEGVAR(common,fixCollision), _unit] call CBA_fnc_localEvent;

    // Check for a place to land the spotting scope
    private _direction = getDir _unit;
    private _position = (getPosASL _unit) vectorAdd [0.8 * sin(_direction), 0.8 * cos(_direction), 0];
    private _vectorUp = [0, 0, 1];
    private _intersections = lineIntersectsSurfaces [_position vectorAdd [0, 0, 1.5], _position vectorDiff [0, 0, 1.5], _unit, objNull, true, 1, "GEOM", "FIRE"];
    if (_intersections isEqualTo []) then {
        TRACE_1("No intersections",_intersections);
    } else {
        (_intersections select 0) params ["_touchingPoint", "_surfaceNormal"];
        _position = _touchingPoint vectorAdd [0, 0, 0.05];
        _vectorUp = _surfaceNormal;
    };

    // Create the scope and set its position and orientation
    private _spottingScope = "ACE_SpottingScopeObject" createVehicle [0, 0, 0];
    _spottingScope setDir _direction;
    _spottingScope setPosASL _position;
    _spottingScope setVectorUp _vectorUp;
    [QEGVAR(common,fixPosition), _spottingScope, _spottingScope] call CBA_fnc_targetEvent;
    [QEGVAR(common,fixFloating), _spottingScope, _spottingScope] call CBA_fnc_targetEvent;

    _unit reveal _spottingScope;

}, [_unit], 1, 0] call CBA_fnc_waitAndExecute;
