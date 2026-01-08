#include "..\script_component.hpp"
/*
 * Author: tcvm, johnb43
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
 * 7: Selection for fire source <STRING or ARRAY> (default: "")
 * 8: Can spawn fire ring <BOOL> (default: true)
 * 9: Can spawn fire jet <BOOL> (default: true)
 * 10: Maximum intensity <NUMBER> (default: MAX_COOKOFF_INTENSITY)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, 3] call ace_cookoff_fnc_cookOffServer
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
    ["_fireSelection", ""],
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

TRACE_3("cooking off",_vehicle,_intensity,_maxIntensity);
TRACE_8("",_source,_instigator,_delayBetweenSmokeAndFire,_ammoDetonationChance,_detonateAfterCookoff,_fireSelection,_canRing,_canJet);

if (_vehicle getVariable [QGVAR(isCookingOff), false]) exitWith {};

_vehicle setVariable [QGVAR(isCookingOff), true, true];

// Limit maximum value of intensity to prevent very long cook-off times
_intensity = _intensity min _maxIntensity;

private _selections = getArray (configOf _vehicle >> QGVAR(cookoffSelections)) select {(_vehicle selectionPosition _x) isNotEqualTo [0, 0, 0]};

if (_selections isEqualTo []) then {
    WARNING_1("no valid selection for cookoff found. %1",typeOf _vehicle);

    {
        if ((_vehicle selectionPosition _x) isNotEqualTo [0, 0, 0]) then {
            _selections pushBack _x;
        };
    } forEach DEFAULT_COMMANDER_HATCHES;

    if (_selections isEqualTo []) then {
        _selections pushBack "#noselection";
    };
};

// Not guaranteed to be active/used, but reserve it nonetheless
private _fireJipID = format [QGVAR(cookOffLocal_%1), hashValue _vehicle];
[_fireJipID, _vehicle] call CBA_fnc_removeGlobalEventJIP;

// Spawn smoke
private _smokeJipID = [QGVAR(smoke), [_vehicle, _selections]] call CBA_fnc_globalEventJIP;
[_smokeJipID, _vehicle] call CBA_fnc_removeGlobalEventJIP;

// Save intensity for looping purposes
_vehicle setVariable [QGVAR(intensity), _intensity];

private _delay = 0;

if (_delayBetweenSmokeAndFire) then {
    _delay = random [SMOKE_DELAY, 1.5 * SMOKE_DELAY, 2 * SMOKE_DELAY];
};

[{
    [{
        (_this select 0) params ["_vehicle", "_selections", "_ammoDetonationChance", "_detonateAfterCookoff", "_source", "_instigator", "_fireSelection", "_canRing", "_canJet", "_smokeJipID", "_fireJipID"];

        if (
            isNull _vehicle ||
            !GVAR(enableFire) ||
            {!(_vehicle getVariable [QGVAR(enable), true])} || // QGVAR(enable) is API
            {GVAR(cookoffDuration) == 0} ||
            {underwater _vehicle} ||
            {private _posASL = getPosWorld _vehicle; surfaceIsWater _posASL && {(_posASL select 2) < 0}} // Underwater is not very reliable, so use model center instead
        ) exitWith {
            // Effects are deleted when vehicle is deleted
            (_this select 1) call CBA_fnc_removePerFrameHandler;
        };

        private _intensity = _vehicle getVariable [QGVAR(intensity), 0];

        if (_intensity <= 1) exitWith {
            (_this select 1) call CBA_fnc_removePerFrameHandler;

            // Wait until the previous flame has finished
            private _nextFlameTime = (_vehicle getVariable [QGVAR(endCurrentFlame), CBA_missionTime]) - CBA_missionTime + (MIN_TIME_BETWEEN_FLAMES max random MAX_TIME_BETWEEN_FLAMES);

            if (_fireSelection isEqualTo "") then {
                _fireSelection = selectRandom _selections;
            };

            [{
                params ["_vehicle", "_source", "_instigator", "_detonateAfterCookoff", "_fireSelection", "_smokeJipID", "_fireJipID"];

                // Effects are deleted when vehicle is deleted
                if (isNull _vehicle) exitWith {};

                // Remove effects from JIP
                _smokeJipID call CBA_fnc_removeGlobalEventJIP;
                _fireJipID call CBA_fnc_removeGlobalEventJIP;

                // Remove effects
                [QGVAR(cleanupEffects), _vehicle] call CBA_fnc_globalEvent;

                // Reset variable, so it can cook-off again
                _vehicle setVariable [QGVAR(isCookingOff), nil, true];

                if (GVAR(destroyVehicleAfterCookoff) || _detonateAfterCookoff) then {
                    createVehicle ["ACE_ammoExplosionLarge", _vehicle modelToWorld (_vehicle selectionPosition _fireSelection), [], 0 , "CAN_COLLIDE"];

                    _vehicle setDamage [1, true, _source, _instigator]; // Because it's running on the server, source and instigator can be set
                };
            }, [_vehicle, _source, _instigator, _detonateAfterCookoff, _fireSelection, _smokeJipID, _fireJipID], _nextFlameTime] call CBA_fnc_waitAndExecute;
        };

        // Wait until we are ready for the next flame
        if ((_vehicle getVariable [QGVAR(nextFlame), 0]) <= CBA_missionTime) then {
            private _ring = false;

            if (_canRing) then {
                _ring = 0.2 > random 1;

                if (!_ring && {_intensity >= 2}) then {
                    _ring = 0.7 > random 1;
                };
            };

            private _duration = linearConversion [0, 10, _intensity, 3, 20] + random COOKOFF_TIME;

            if (_fireSelection isEqualTo "") then {
                _fireSelection = selectRandom _selections;
            };

            // Sync for JIP players
            [QGVAR(cookOffLocal), [_vehicle, _canJet, _ring, _fireSelection, _intensity, CBA_missionTime, _duration], _fireJipID] call CBA_fnc_globalEventJIP;

            // If there are any crew, burn them
            if (["ace_fire"] call EFUNC(common,isModLoaded)) then {
                // Use current intensity, in case GVAR(cookoffDuration) is very large and only 1 flameout stage happens
                {
                    [QEGVAR(fire,burn), [_x, _intensity * 1.5, _instigator], _x] call CBA_fnc_targetEvent;
                } forEach (crew _vehicle);
            };

            _intensity = (_intensity - (0.5 max random 1) / GVAR(cookoffDuration)) max 0;

            _vehicle setVariable [QGVAR(intensity), _intensity];
            _vehicle setVariable [QGVAR(endCurrentFlame), CBA_missionTime + _duration];
            _vehicle setVariable [QGVAR(nextFlame), CBA_missionTime + _duration + (MIN_TIME_BETWEEN_FLAMES max random MAX_TIME_BETWEEN_FLAMES)];
        };

        if (_ammoDetonationChance > random 1 && {_vehicle getVariable [QGVAR(nextExplosiveDetonation), 0] <= CBA_missionTime}) then {
            if (_fireSelection isEqualTo "") then {
                _fireSelection = selectRandom _selections;
            };

            createVehicle ["ACE_ammoExplosionLarge", _vehicle modelToWorld (_vehicle selectionPosition _fireSelection), [], 0 , "CAN_COLLIDE"];

            _vehicle setVariable [QGVAR(nextExplosiveDetonation), CBA_missionTime + random 60];
        };
    }, 0.25, _this] call CBA_fnc_addPerFrameHandler;
}, [_vehicle, _selections, _ammoDetonationChance, _detonateAfterCookoff, _source, _instigator, _fireSelection, _canRing, _canJet, _smokeJipID, _fireJipID], _delay] call CBA_fnc_waitAndExecute;

// API
[QGVAR(cookoff), [_vehicle, _intensity, _instigator, _delayBetweenSmokeAndFire, _ammoDetonationChance, _detonateAfterCookoff, _fireSelection, _canRing, _maxIntensity, _canJet]] call CBA_fnc_globalEvent;
