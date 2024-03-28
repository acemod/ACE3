#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Checks hitpoint damage and determines if a vehicle should cookoff.
 *
 * Arguments:
 * 0: The vehicle <OBJECT>
 * 1: Chance of fire <NUMBER>
 * 2: Intensity of cookoff <NUMBER>
 * 3: Person who instigated cookoff <OBJECT> (default: objNull)
 * 4: Part of vehicle which got hit <STRING> (default: "")
 * 5: Whether or not the vehicle can spawn ring-fire effect <BOOL> (default: false)
 * 6: Can Jet <BOOL> (default: true)
 *
 * Return Value:
 * If cooked off
 *
 * Example:
 * [tank2, 0.1, 5] call ace_vehicle_damage_fnc_handleCookoff;
 *
 * Public: No
 */

params ["_vehicle", "_chanceOfFire", "_intensity", ["_injurer", objNull], ["_hitPart", ""], ["_canRing", false], ["_canJet", true]];

// Ignore if the vehicle is already cooking off
if (_vehicle getVariable [QEGVAR(cookoff,isCookingOff), false]) exitWith {true};

_chanceOfFire = _chanceOfFire * EGVAR(cookoff,probabilityCoef);

if (_chanceOfFire >= random 1) exitWith {
    private _configOf = configOf _vehicle;
    private _fireDetonateChance = [_configOf >> QGVAR(detonationDuringFireProb), "number", 0] call CBA_fnc_getConfigEntry;
    if (_canRing) then {
        _canRing = ([_configOf >> QGVAR(canHaveFireRing), "number", 0] call CBA_fnc_getConfigEntry) == 1;
    };

    if (_canJet) then {
        _canJet = ([_configOf >> QEGVAR(cookoff,canHaveFireJet), "number", 1] call CBA_fnc_getConfigEntry) == 1;
    };

    private _delayWithSmoke = _chanceOfFire < random 1;
    private _detonateAfterCookoff = (_fireDetonateChance / 4) > random 1;

    private _source = "";
    if (_hitPart == "engine") then {
        _source = ["hit_engine_point", "HitPoints"];
    };

    [QEGVAR(cookOff,cookOff), [_vehicle, _intensity, _injurer, _injurer, _delayWithSmoke, _fireDetonateChance, _detonateAfterCookoff, _source, _canRing, _canJet]] call CBA_fnc_serverEvent;
    LOG_4("Cooking-off [%1] with a chance-of-fire [%2] - Delayed Smoke | Detonate after cookoff [%3 | %4]",_vehicle,_chanceOfFire,_delayWithSmoke,_detonateAfterCookoff);
    [_vehicle] spawn FUNC(abandon);
    LOG_1("[%1] is on fire is bailing",_vehicle);

    true
};

LOG_2("[%1] No Cook-off - Chance of fire [%2]",_vehicle,_chanceOfFire);
false
