#include "..\script_component.hpp"
/*
 * Author: tcvm, johnb43
 * Simulates fire intensity over time on burning units.
 * Arbitrary values to ignite people. Assumed maximum is "10".
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Instigator <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, player] call ace_fire_fnc_burnSimulation
 *
 * Public: No
 */

params ["_unit", "_instigator"];

[{
    params ["_args", "_pfhID"];
    _args params ["_unit", "_instigator"];

    if (isNull _unit) exitWith {
        _pfhID call CBA_fnc_removePerFrameHandler;
    };

    // Locality has changed
    if (!local _unit) exitWith {
        _pfhID call CBA_fnc_removePerFrameHandler;

        [QGVAR(burnSimulation), [_unit, _instigator], _unit] call CBA_fnc_targetEvent;
    };

    // If unit is invulnerable or in water or if the fire has died out, stop burning unit
    if (
        !(_unit call FUNC(isBurning)) ||
        {!(isDamageAllowed _unit && {_unit getVariable [QEGVAR(medical,allowDamage), true]})} ||
        {private _eyePos = eyePos _unit; surfaceIsWater _eyePos && {(_eyePos select 2) < 0.1}}
    ) exitWith {
        // Remove global effects
        (_unit getVariable [QGVAR(jipID), ""]) call CBA_fnc_removeGlobalEventJIP;

        // Update globally that the unit isn't burning anymore
        _unit setVariable [QGVAR(intensity), nil, true];

        _pfhID call CBA_fnc_removePerFrameHandler;

        if (!isNil {_unit getVariable QGVAR(stopDropRoll)} && {!isPlayer _unit}) then {
            _unit setUnitPos "AUTO";

            _unit setVariable [QGVAR(stopDropRoll), nil, true];
        };
    };

    if (isGamePaused) exitWith {};

    private _intensity = _unit getVariable [QGVAR(intensity), 0];

    // Propagate fire to other units (alive or dead) if it's intense
    if (_intensity >= BURN_THRESHOLD_INTENSE) then {
        private _adjustedIntensity = 0;

        {
            _distancePercent = 1 - ((_unit distance _x) / BURN_PROPAGATE_DISTANCE);
            _adjustedIntensity = _intensity * _distancePercent;

            // Don't burn if intensity is too low
            if (BURN_MIN_INTENSITY > _adjustedIntensity) then {
                continue;
            };

            [QGVAR(burn), [_x, _adjustedIntensity, _instigator], _x] call CBA_fnc_targetEvent;
        } forEach nearestObjects [_unit, ["CAManBase"], BURN_PROPAGATE_DISTANCE];
    };

    // Update intensity/fire reactions
    if (CBA_missionTime >= _unit getVariable [QGVAR(intensityUpdate), 0]) then {
        _unit setVariable [QGVAR(intensityUpdate), CBA_missionTime + INTENSITY_UPDATE];

        _intensity = _intensity - INTENSITY_LOSS - (rain / 10);

        if (_unit call EFUNC(common,isAwake)) then {
            if (!isPlayer _unit) then {
                private _sdr = _unit getVariable [QGVAR(stopDropRoll), false];

                private _vehicle = objectParent _unit;

                if (isNull _vehicle && {_sdr || {0.05 > random 1}}) then {
                    _unit setVariable [QGVAR(stopDropRoll), true, true];

                    if (!_sdr) then {
                        TRACE_1("stop, drop, roll!",_unit);

                        _unit setUnitPos "DOWN";
                        doStop _unit;
                    };

                    // Queue up a bunch of animations
                    for "_i" from 0 to 2 do {
                        [_unit, selectRandom ["amovppnemstpsnonwnondnon_amovppnemevasnonwnondl", "amovppnemstpsnonwnondnon_amovppnemevasnonwnondr"], 0] call EFUNC(common,doAnimation);
                    };

                    _intensity = _intensity - (1 / _intensity);
                } else {
                    // Make the unit leave the vehicle
                    if (_vehicle != _unit) then {
                        TRACE_1("Ejecting",_unit);

                        _unit leaveVehicle _vehicle;
                        unassignVehicle _unit;

                        _unit action ["Eject", _vehicle];
                    };

                    _unit disableAI "TARGET";
                    _unit disableAI "AUTOTARGET";

                    // Run away, erraticly
                    if (leader group _unit != _unit) then {
                        [_unit] join grpNull;
                    };

                    _unit doMove ((getPosATL _unit) getPos [20 + random 35, floor (random 360)]);
                    _unit setSpeedMode "FULL";
                    _unit setSuppression 1;
                };
            } else {
                // Decrease intensity of burn if rolling around
                if ((animationState _unit) in PRONE_ROLLING_ANIMS) then {
                    _intensity = _intensity * INTENSITY_DECREASE_MULT_ROLLING;
                };
            };

            // Play screams and throw weapon (if enabled)
            _unit call FUNC(burnReaction);
        };

        // Common burn areas are the hands and face https://www.ncbi.nlm.nih.gov/pubmed/16899341/
        private _woundSelection = ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"] selectRandomWeighted [0.77, 0.5, 0.8, 0.8, 0.3, 0.3];

        if (GET_PAIN_PERCEIVED(_unit) < (PAIN_UNCONSCIOUS + random 0.2)) then {
            // Keep pain around unconciousness limit to allow for more fun interactions
            [_unit, _intensity / BURN_MAX_INTENSITY, _woundSelection, "burn", _instigator] call EFUNC(medical,addDamageToUnit);
        } else {
            [_unit, 0.15, _woundSelection, "burn", _instigator] call EFUNC(medical,addDamageToUnit);
        };

        _unit setVariable [QGVAR(intensity), _intensity, true]; // globally sync intensity across all clients to make sure simulation is deterministic
    };
}, BURN_PROPAGATE_UPDATE, [_unit, _instigator]] call CBA_fnc_addPerFrameHandler;
