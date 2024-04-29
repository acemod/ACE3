#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Checks hitpoint damage and determines if a vehicle should cook off.
 *
 * Arguments:
 * 0: The vehicle <OBJECT>
 * 1: Chance of fire <NUMBER>
 * 2: Intensity of cookoff <NUMBER>
 * 3: Source of damage <OBJECT>
 * 4: Person who instigated cook-off <OBJECT>
 * 5: Part of vehicle which got hit <STRING> (default: "")
 * 6: Whether or not the vehicle can spawn ring-fire effect <BOOL> (default: false)
 * 7: Can Jet <BOOL> (default: true)
 *
 * Return Value:
 * If cooked off <BOOL>
 *
 * Example:
 * [cursorObject, 0.1, 5] call ace_vehicle_damage_fnc_handleCookoff;
 *
 * Public: No
 */

params ["_vehicle", "_chanceOfFire", "_intensity", "_source", "_instigator", ["_hitPart", ""], ["_canRing", true], ["_canJet", true]];

// Ignore if the vehicle is already cooking off
if (_vehicle getVariable [QEGVAR(cookoff,isCookingOff), false]) exitWith {true};

_chanceOfFire = _chanceOfFire * EGVAR(cookoff,probabilityCoef);

if (_chanceOfFire >= random 1) exitWith {
    private _configOf = configOf _vehicle;
    private _fireDetonateChance = getNumber (_configOf >> QGVAR(detonationDuringFireProb));

    if (_canRing) then {
        _canRing = getNumber (_configOf >> QGVAR(canHaveFireRing)) == 1;
    };

    if (_canJet) then {
        _canJet = ([_configOf >> QEGVAR(cookoff,canHaveFireJet), "NUMBER", 1] call CBA_fnc_getConfigEntry) == 1;
    };

    private _delaySmoke = _chanceOfFire < random 1;
    private _detonateAfterCookoff = (_fireDetonateChance / 4) > random 1;

    private _source = "";

    if (_hitPart == "engine") then {
        _source = ["hit_engine_point", "HitPoints"];
    };

    [QEGVAR(cookOff,cookOff), [_vehicle, _intensity, _source, _instigator, _delaySmoke, _fireDetonateChance, _detonateAfterCookoff, _source, _canRing, _canJet]] call CBA_fnc_serverEvent;
    TRACE_4("Cooking-off [%1] with a chance-of-fire [%2] - Delayed Smoke | Detonate after cookoff [%3 | %4]",_vehicle,_chanceOfFire,_delaySmoke,_detonateAfterCookoff);

    // Abandon vehicle
    _vehicle call FUNC(abandon);
    TRACE_1("vehicle is on fire, crew bailing",_vehicle);

    true
};

TRACE_3("no cook-off",_vehicle,_chanceOfFire,_intensity);

false
