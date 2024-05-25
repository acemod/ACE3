#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Start a cook-off in the given vehicle.
 * Spews flames in multiple directions at the same time (ring) or from the turret towards the sky (jet).
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Intensity of fire <NUMBER>
 * 2: Source <OBJECT> (default: objNull)
 * 3: Instigator <OBJECT> (default: objNull)
 * 4: Delay between smoke and fire enabled <BOOL> (default: true)
 * 5: Ammo detonation chance <NUMBER> (default: 0)
 * 6: Detonate after cook-off <BOOL> (default: false)
 * 7: Selection for fire source <STRING> (default: "")
 * 8: Can spawn fire ring <BOOL> (default: true)
 * 9: Can spawn fire jet <BOOL> (default: true)
 * 10: Maximum intensity <NUMBER> (default: MAX_COOKOFF_INTENSITY)
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
if (!GVAR(enableFire) || {GVAR(cookoffDuration) == 0}) exitWith {};

params [
    "_vehicle",
    "_intensity",
    ["_source", objNull],
    ["_instigator", objNull],
    ["_delayBetweenSmokeAndFire", true],
    ["_ammoDetonationChance", 0],
    ["_detonateAfterCookoff", false],
    ["_fireSource", ""],
    ["_canRing", true],
    ["_canJet", true],
    ["_maxIntensity", MAX_COOKOFF_INTENSITY]
];

// Make sure it's a vehicle (important, because deleted EH is assigned to AllVehicles only in postInit)
if !(_vehicle isKindOf "AllVehicles") exitWith {};

if (_vehicle isKindOf "CAManBase" || {_vehicle isKindOf "StaticWeapon"}) exitWith {};

// If under water, ignore
// underwater is not very reliable, so use model center instead
if (underwater _vehicle || {private _posASL = getPosWorld _vehicle; surfaceIsWater _posASL && {(_posASL select 2) < 0}}) exitWith {};

// Check if cook-off is disabled on vehicle specifically
if !(_vehicle getVariable [QGVAR(enable), true]) exitWith {}; // QGVAR(enable) is API

TRACE_2("cooking off",_vehicle,_intensity);
TRACE_9("",_source,_instigator,_delayBetweenSmokeAndFire,_ammoDetonationChance,_detonateAfterCookoff,_fireSource,_canRing,_canJet,_maxIntensity);

if (_vehicle getVariable [QGVAR(isCookingOff), false]) exitWith {};

_vehicle setVariable [QGVAR(isCookingOff), true, true];

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

// Save intensity for looping purposes
_vehicle setVariable [QGVAR(intensity), _intensity];

private _delay = 0;

if (_delayBetweenSmokeAndFire) then {
    _delay = random [SMOKE_DELAY, 1.5 * SMOKE_DELAY, 2 * SMOKE_DELAY];
};

[{
    [{
        (_this select 0) params ["_vehicle", "_positions", "_ammoDetonationChance", "_detonateAfterCookoff", "_source", "_instigator", "_fireSource", "_canRing", "_canJet", "_smokeJipID", "_fireJipID"];

        private _intensity = _vehicle getVariable [QGVAR(intensity), 0];
        private _nextFlameTime = _vehicle getVariable [QGVAR(nextFlame), 0];

        if (
            isNull _vehicle ||
            !GVAR(enableFire) ||
            {!(_vehicle getVariable [QGVAR(enable), true])} || // QGVAR(enable) is API
            {_intensity <= 1} ||
            {GVAR(cookoffDuration) == 0} ||
            {underwater _vehicle} ||
            {private _posASL = getPosWorld _vehicle; surfaceIsWater _posASL && {(_posASL select 2) < 0}}
        ) exitWith {
            (_this select 1) call CBA_fnc_removePerFrameHandler;

            // Remove effects from JIP
            _smokeJipID call CBA_fnc_removeGlobalEventJIP;
            _fireJipID call CBA_fnc_removeGlobalEventJIP;

            // Effects are deleted when vehicle is deleted
            if (isNull _vehicle) exitWith {};

            if (GVAR(destroyVehicleAfterCookoff) || _detonateAfterCookoff) exitWith {
                if (_fireSource isEqualTo "") then {
                    _fireSource = selectRandom _positions;
                };

                if (_nextFlameTime <= 0) then {
                    _nextFlameTime = MIN_TIME_BETWEEN_FLAMES max random MAX_TIME_BETWEEN_FLAMES;
                };

                [{
                    params ["_vehicle", "_source", "_instigator", "_fireSource"];

                    // Effects are deleted when vehicle is deleted
                    if (isNull _vehicle) exitWith {};

                    // Remove effects
                    [QGVAR(cleanupEffects), _vehicle] call CBA_fnc_globalEvent;

                    // Reset variable, so it can cook-off again
                    _vehicle setVariable [QGVAR(isCookingOff), nil, true];

                    createVehicle ["ACE_ammoExplosionLarge", (_vehicle modelToWorld (_vehicle selectionPosition _fireSource)), [], 0 , "CAN_COLLIDE"];

                    _vehicle setDamage [1, true, _source, _instigator]; // because it's running on the server, killer and instigator can be set
                }, [_vehicle, _source, _instigator, _fireSource], _nextFlameTime] call CBA_fnc_waitAndExecute;
            };

            // Remove effects
            [QGVAR(cleanupEffects), _vehicle] call CBA_fnc_globalEvent;

            // Reset variable, so it can cook-off again
            _vehicle setVariable [QGVAR(isCookingOff), nil, true];
        };

        // Wait until we are ready for the next flame
        if (_nextFlameTime <= CBA_missionTime) then {
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

        if (_ammoDetonationChance > random 1 && {_vehicle getVariable [QGVAR(nextExplosiveDetonation), 0] <= CBA_missionTime}) then {
            if (_fireSource isEqualTo "") then {
                _fireSource = selectRandom _positions;
            };

            createVehicle ["ACE_ammoExplosionLarge", _vehicle modelToWorld (_vehicle selectionPosition _fireSource), [], 0 , "CAN_COLLIDE"];

            _vehicle setVariable [QGVAR(nextExplosiveDetonation), CBA_missionTime + random 60];
        };
    }, 0.25, _this] call CBA_fnc_addPerFrameHandler;
}, [_vehicle, _positions, _ammoDetonationChance, _detonateAfterCookoff, _source, _instigator, _fireSource, _canRing, _canJet, _smokeJipID, _fireJipID], _delay] call CBA_fnc_waitAndExecute;
