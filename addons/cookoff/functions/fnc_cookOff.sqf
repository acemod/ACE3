#include "script_component.hpp"
/*
 * Author: Dani (TCVM)
 * Start a cook-off in the given vehicle.
 *
 * Arguments:
 * 0: Vehicle <Object>
 * 1: Intensity of fire <Number>
 *
 * Return Value:
 * None
 *
 * Example:
 * [(vehicle player), 3] call ace_cookoff_fnc_cookOff
 *
 * Public: No
 */

params ["_vehicle", "_intensity", ["_instigator", objNull], ["_smokeDelayEnabled", true], ["_ammoDetonationChance", 0], ["_detonateAfterCookoff", false], ["_fireSource", ""], ["_canRing", true], ["_maxIntensity", MAX_COOKOFF_INTENSITY, [0]]];

if (GVAR(enable) == 0) exitWith {};
if !(GVAR(enableFire)) exitWith {};
if (_vehicle getVariable [QGVAR(enable), GVAR(enable)] in [0, false]) exitWith {};
// exit if cook-off enabled only for players and no players in vehicle crew found
if (_vehicle getVariable [QGVAR(enable), GVAR(enable)] isEqualTo 1 && {fullCrew [_vehicle, "", false] findIf {isPlayer (_x select 0)} == -1}) exitWith {};


TRACE_9("cooking off",_vehicle,_intensity,_instigator,_smokeDelayEnabled,_ammoDetonationChance,_detonateAfterCookoff,_fireSource,_canRing,_maxIntensity);

if (_vehicle getVariable [QGVAR(isCookingOff), false]) exitWith {};
_vehicle setVariable [QGVAR(isCookingOff), true, true];

[QGVAR(addCleanupHandlers), [_vehicle]] call CBA_fnc_globalEvent;

// limit maximum value of intensity to prevent very long cook-off times
_intensity = _intensity min _maxIntensity;

private _config = _vehicle call CBA_fnc_getObjectConfig;
private _positions = getArray (_config >> QGVAR(cookoffSelections)) select {(_vehicle selectionPosition _x) isNotEqualTo [0,0,0]};

if (_positions isEqualTo []) then {
    WARNING_1("no valid selection for cookoff found. %1",typeOf _vehicle);
    {
        private _pos = _vehicle selectionPosition _x;
        if (_pos isEqualTo [0, 0, 0]) exitWith {};
        _positions pushBack _x;
    } forEach DEFAULT_COMMANDER_HATCHES;

    if (_positions isEqualTo []) then {
        _positions pushBack "#noselection";
    };
};

// default fire jet to enabled when not set in configs
private _canJet = ([_config >> QGVAR(canHaveFireJet), "number", 1] call CBA_fnc_getConfigEntry) == 1;

private _delay = 0;
if (_smokeDelayEnabled) then {
    _delay = SMOKE_TIME + random SMOKE_TIME;
};
[QGVAR(smoke), [_vehicle, _positions]] call CBA_fnc_globalEvent;

[{
    params ["_vehicle", "_positions", "_intensity", "_ammoDetonationChance", "_detonateAfterCookoff", "_instigator", "_fireSource", "_canRing", "_canJet"];
    _vehicle setVariable [QGVAR(intensity), _intensity];
    private _smokeEffects = _vehicle getVariable [QGVAR(effects), []];

    [{
        params ["_args", "_pfh"];
        _args params ["_vehicle", "_positions", "_ammoDetonationChance", "_detonateAfterCookoff", "_instigator", "_fireSource", "_canRing", "_canJet", "_smokeEffects"];
        private _intensity = _vehicle getVariable [QGVAR(intensity), 0];
        if (isNull _vehicle || {_intensity <= 1}) exitWith {
            [QGVAR(cleanupEffects), [_vehicle, _smokeEffects]] call CBA_fnc_globalEvent;
            _vehicle setVariable [QGVAR(isCookingOff), false, true];
            [_pfh] call CBA_fnc_removePerFrameHandler;

            if (GVAR(destroyVehicleAfterCookoff) || _detonateAfterCookoff) then {
                _vehicle setDamage [1, _detonateAfterCookoff];
            };
        };

        private _lastFlameTime = _vehicle getVariable [QGVAR(lastFlame), 0];
        private _nextFlameTime = _vehicle getVariable [QGVAR(nextFlame), 0];

        // Wait until we are ready for the next flame
        // dt = Tcurrent - Tlast
        // dt >= Tnext
        if ((CBA_missionTime - _lastFlameTime) >= _nextFlameTime) then {
            private _ring = (0.2 > random 1);
            if (!_ring && _intensity >= 2) then {
                _ring = (0.7 > random 1);
            };

            if !(_canRing) then {
                _ring = false;
            };

            private _time = linearConversion [0, 10, _intensity, 3, 20] + random COOKOFF_TIME;

            if (_fireSource isEqualTo "") then {
                _fireSource = selectRandom _positions;
            };

            [QGVAR(cookOffEffect), [_vehicle, _canJet, _ring, _time, _fireSource, _intensity]] call CBA_fnc_globalEvent;

            _intensity = _intensity - (0.5 max random 1);
            _vehicle setVariable [QGVAR(intensity), _intensity];
            _vehicle setVariable [QGVAR(lastFlame), CBA_missionTime];
            _vehicle setVariable [QGVAR(nextFlame), _time + (MIN_TIME_BETWEEN_FLAMES max random MAX_TIME_BETWEEN_FLAMES)];

            {
                [QEGVAR(fire,burn), [_x, _intensity * 1.5, _instigator]] call CBA_fnc_globalEvent;
            } forEach crew _vehicle
        };

        if (_ammoDetonationChance > random 1) then {
            private _lastExplosiveDetonationTime = _vehicle getVariable [QGVAR(lastExplosiveDetonation), 0];
            private _nextExplosiveDetonation = _vehicle getVariable [QGVAR(nextExplosiveDetonation), 0];

            if ((CBA_missionTime - _lastExplosiveDetonationTime) > _nextExplosiveDetonation) then {
                if (_fireSource isEqualTo "") then {
                    _fireSource = selectRandom _positions;
                };
                createVehicle ["ACE_ammoExplosionLarge", (_vehicle modelToWorld (_vehicle selectionPosition _fireSource)), [], 0 , "CAN_COLLIDE"];

                _vehicle setVariable [QGVAR(lastExplosiveDetonation), CBA_missionTime];
                _vehicle setVariable [QGVAR(nextExplosiveDetonation), random 60];
            };
        };
    }, 0.25, [_vehicle, _positions, _ammoDetonationChance, _detonateAfterCookoff, _instigator, _fireSource, _canRing, _canJet, _smokeEffects]] call CBA_fnc_addPerFrameHandler
}, [_vehicle, _positions, _intensity, _ammoDetonationChance, _detonateAfterCookoff, _instigator, _fireSource, _canRing, _canJet], _delay] call CBA_fnc_waitAndExecute;
