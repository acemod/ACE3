#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Handles various objects on fire and determines if units close to objects deserve to get burned.
 *
 * Arguments:
 * 0: Args (not used) <ARRAY>
 * 1: PFH Handle (not used) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[], -1] call CBA_fnc_addPerFrameHandler
 *
 * Public: No
 */

private _distancePercent = 0;
private _adjustedIntensity = 0;

{
    _y params ["_fireLogic", "_radius", "_intensity", "_condition", "_conditionArgs"];

    // Remove when condition is no longer valid
    if !(_conditionArgs call _condition) then {
        (GVAR(fireSources) deleteAt _x) params [["_fireLogic", objNull]];

        detach _fireLogic;
        deleteVehicle _fireLogic;

        continue;
    };

    // Burn units (alive or dead) close to the fire
    {
        _distancePercent = 1 - ((_fireLogic distance _x) / _radius);
        _adjustedIntensity = _intensity * _distancePercent;

        // Don't burn if intensity is too low
        if (BURN_MIN_INTENSITY > _adjustedIntensity) then {
            continue;
        };

        [QGVAR(burn), [_x, _adjustedIntensity], _x] call CBA_fnc_targetEvent;
    } forEach nearestObjects [_fireLogic, ["CAManBase"], _radius];
} forEach GVAR(fireSources);
