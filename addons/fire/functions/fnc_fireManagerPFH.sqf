#include "..\script_component.hpp"
/*
 * Author: tcvm, johnb43
 * Handles various objects on fire and determines if units close to objects deserve to get burned.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * ace_fire_fnc_fireManagerPFH call CBA_fnc_addPerFrameHandler
 *
 * Public: No
 */

{
    _y params ["_fireLogic", "_radius", "_intensity", "_condition", "_conditionArgs"];
    TRACE_2("fireManagerPFH loop",_x,_y);

    // Remove when condition is no longer valid
    if !(_conditionArgs call _condition) then {
        TRACE_2("condition no longer valid, deleting",_x,_y);

        detach _fireLogic;
        deleteVehicle _fireLogic;

        GVAR(fireSources) deleteAt _x;

        continue;
    };

    // Burn units (alive or dead) close to the fire
    {
        private _distancePercent = 1 - ((_fireLogic distance _x) / _radius);
        private _adjustedIntensity = _intensity * _distancePercent;

        // Don't burn if intensity is too low or already burning with higher intensity
        if (BURN_MIN_INTENSITY > _adjustedIntensity || {(_x getVariable [QGVAR(intensity), 0]) > _adjustedIntensity}) then {
            continue;
        };

        [QGVAR(burn), [_x, _adjustedIntensity], _x] call CBA_fnc_targetEvent;

        TRACE_3("propagate fire",_x,_intensity,_adjustedIntensity);
    } forEach nearestObjects [_fireLogic, ["CAManBase"], _radius];
} forEach GVAR(fireSources);
