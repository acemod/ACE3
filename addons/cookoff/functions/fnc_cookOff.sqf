#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Start a cook-off in the given vehicle.
 * Spews flames in multiple directions at the same time (ring) or from the turret towards the sky (jet).
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Intensity of fire <NUMBER>
 * 2: Instigator <OBJECT> (default: objNull)
 * 3: Delay between smoke and fire enabled <BOOL> (default: true)
 * 4: Ammo detonation chance <NUMBER> (default: 0)
 * 5: Detonate after cook-off <BOOL> (default: false)
 * 6: Selection for fire source <STRING> (default: "")
 * 7: Can spawn fire ring <BOOL> (default: true)
 * 8: Can spawn fire jet <BOOL> (default: true)
 * 9: Maximum intensity <NUMBER> (default: MAX_COOKOFF_INTENSITY)
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player, 3] call ace_cookoff_fnc_cookOff
 *
 * Public: No
 */

if (!isServer) exitWith {};
if (GVAR(enable) == 0 || {GVAR(cookoffDuration) == 0}) exitWith {};

params [
    "_vehicle",
    "_intensity",
    ["_instigator", objNull],
    ["_delayBetweenSmokeAndFire", true],
    ["_ammoDetonationChance", 0],
    ["_detonateAfterCookoff", false],
    ["_fireSource", ""],
    ["_canRing", true],
    ["_canJet", true],
    ["_maxIntensity", MAX_COOKOFF_INTENSITY]
];

// Check if cook-off is disabled on vehicle specifically
if !(_vehicle getVariable [QGVAR(enable), true]) exitWith {};

// Exit if cook-off enabled only for players and no players in vehicle crew found
if ((GVAR(enable) isEqualTo 1) && {(crew _vehicle) findIf {isPlayer _x} == -1}) exitWith {};

TRACE_2("cooking off",_vehicle,_intensity);
TRACE_8("",_instigator,_delayBetweenSmokeAndFire,_ammoDetonationChance,_detonateAfterCookoff,_fireSource,_canRing,_maxIntensity,_canJet);

if (_vehicle getVariable [QGVAR(isCookingOff), false]) exitWith {};

_vehicle setVariable [QGVAR(isCookingOff), true, true];

// Only required on the server, as the only effect to clean up is to remove the effects from the JIP queue
[QGVAR(addCleanupHandlers), _vehicle] call CBA_fnc_localEvent;

// Limit maximum value of intensity to prevent very long cook-off times
_intensity = _intensity min _maxIntensity;

private _positions = getArray (configOf _vehicle >> QGVAR(cookoffSelections)) select {(_vehicle selectionPosition _x) isNotEqualTo [0, 0, 0]};

if (_positions isEqualTo []) then {
    WARNING_1("no valid selection for cookoff found. %1",typeOf _vehicle);

    {
        if ((_vehicle selectionPosition _x) isNotEqualTo [0, 0, 0]) then {
            _positions pushBack _x;
        };
    } forEach DEFAULT_COMMANDER_HATCHES;

    if (_positions isEqualTo []) then {
        _positions pushBack "#noselection";
    };
};

// Not guaranteed to be active/used, but reserve it nonetheless
private _fireJipID = format [QGVAR(cookOffEffect_%1), hashValue _vehicle];

// Spawn smoke
private _smokeJipID = [QGVAR(smoke), [_vehicle, _positions]] call CBA_fnc_globalEventJIP;
_vehicle setVariable [QGVAR(jipIDs), [_smokeJipID, _fireJipID]];

// Save intensity for looping purposes
_vehicle setVariable [QGVAR(intensity), _intensity];

private _delay = 0;

if (_delayBetweenSmokeAndFire) then {
    _delay = random [SMOKE_DELAY, 1.5 * SMOKE_DELAY, 2 * SMOKE_DELAY];
};

[{
    [{
        (_this select 0) params ["_vehicle", "_positions", "_ammoDetonationChance", "_detonateAfterCookoff", "_instigator", "_fireSource", "_canRing", "_canJet", "_fireJipID"];

        private _intensity = _vehicle getVariable [QGVAR(intensity), 0];

        if (isNull _vehicle || {_intensity <= 1} || {GVAR(enable) == 0} || {GVAR(cookoffDuration) == 0}) exitWith {
            (_this select 1) call CBA_fnc_removePerFrameHandler;

            // Effects are deleted when vehicle is deleted
            if (isNull _vehicle) exitWith {};

            // Remove effects on server
            [QGVAR(cleanupEffects), _vehicle] call CBA_fnc_localEvent;

            if (GVAR(destroyVehicleAfterCookoff) || _detonateAfterCookoff) then {
                _vehicle setDamage [1, true, _instigator, _instigator]; // because it's running on the server, killer and instigator can be set
            };
        };

        // Wait until we are ready for the next flame
        if (_vehicle getVariable [QGVAR(nextFlame), 0] <= CBA_missionTime) then {
            private _ring = false;

            if (_canRing) then {
                _ring = 0.2 > random 1;

                if (!_ring && {_intensity >= 2}) then {
                    _ring = 0.7 > random 1;
                };
            };

            private _duration = linearConversion [0, 10, _intensity, 3, 20] + random COOKOFF_TIME;

            if (_fireSource isEqualTo "") then {
                _fireSource = selectRandom _positions;
            };

            // Sync for JIP players
            [QGVAR(cookOffEffect), [_vehicle, _canJet, _ring, _fireSource, _intensity, CBA_missionTime, _duration], _fireJipID] call CBA_fnc_globalEventJIP;

            _intensity = _intensity - (0.5 max random 1) / GVAR(cookoffDuration);

            _vehicle setVariable [QGVAR(intensity), _intensity];
            _vehicle setVariable [QGVAR(nextFlame), CBA_missionTime + _duration + (MIN_TIME_BETWEEN_FLAMES max random MAX_TIME_BETWEEN_FLAMES)];

            // If there are any crew, burn them
            if (["ace_fire"] call EFUNC(common,isModLoaded)) then {
                {
                    [QEGVAR(fire,burn), [_x, _intensity * 1.5, _instigator]] call CBA_fnc_globalEvent;
                } forEach (crew _vehicle);
            };
        };

        if (_ammoDetonationChance > random 1 && {CBA_missionTime >= _vehicle getVariable [QGVAR(nextExplosiveDetonation), 0]}) then {
            if (_fireSource isEqualTo "") then {
                _fireSource = selectRandom _positions;
            };

            createVehicle ["ACE_ammoExplosionLarge", _vehicle modelToWorld (_vehicle selectionPosition _fireSource), [], 0 , "CAN_COLLIDE"];

            _vehicle setVariable [QGVAR(nextExplosiveDetonation), CBA_missionTime + random 60];
        };
    }, 0.25, _this] call CBA_fnc_addPerFrameHandler;
}, [_vehicle, _positions, _ammoDetonationChance, _detonateAfterCookoff, _instigator, _fireSource, _canRing, _canJet, _fireJipID], _delay] call CBA_fnc_waitAndExecute;
