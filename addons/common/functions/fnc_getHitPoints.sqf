/*
 * Author: commy2
 *
 * Returns all hitpoints of any vehicle. Non unique hitpoints in turrets are ignored.
 *
 * Arguments:
 * 0: A vehicle, not the classname (Object)
 *
 * Return Value:
 * The hitpoints (Array)
 */
#include "script_component.hpp"

params ["_vehicle", ["_includeHitSelections", false]];

private ["_hitpoints", "_allHitpointsAndSelections"];

_hitpoints = [];

_allHitpointsAndSelections = getAllHitPointsDamage _vehicle;
_allHitpointsAndSelections params ["_allHitpoints", "_allHitselections"];

{
    if(!(_x in _hitpoints) && (_x != "")) then {
        _hitpoints pushback _x;
    };
    nil
} count _allHitpoints;

if(_includeHitSelections) then {
    private "_hitselections";

    _hitselections = [];
    {
        if(!(_x in _hitselections) && (_x != "")) then {
            _hitselections pushback _x;
        };
        nil
    } count _allHitselections;

    [_hitpoints, _hitselections]
} else {
    _hitpoints
};
