#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Injures occupants in a vehicle based on percent chance of injury
 *
 * Arguments:
 * 0: The vehicle
 * 1: Injury Chance
 * 2: Maximum people to injure
 * 3: Projectile source
 *
 * Return Value:
 * None
 *
 * Example:
 * [myVehicle, 0.6, 10] call ace_vehicleDamage_fnc_injureOccupants;
 *
 *
 * Public: No
 */
params ["_vehicle", "_chance", "_count", ["_source", objNull]];
TRACE_4("adding damage to units", _vehicle, _chance, _count, _source);

private _vehicleCrew = crew _vehicle;
private _crewCount = count _vehicleCrew;
if (_crewCount <= 0) exitWith {};

private _crewInjuryIndices = [];
{
    _crewInjuryIndices pushBack _forEachIndex;
} forEach _vehicleCrew;

private _injuryCount = 0;
// Not actually doing anything to any initial vehicle crew in this forEach - just a way to loop through all crew at least once
{
    private _indexToInjure = -1;
    {
        if (_chance > random 1) exitWith {
            _indexToInjure = _forEachIndex;
        };
    } forEach _crewInjuryIndices;
    
    if (_indexToInjure >= 0) then {
        private _casualty = _vehicleCrew select (_crewInjuryIndices select _indexToInjure);
        if (alive _casualty) then {
            _injuryCount = _injuryCount + 1;
            private _indexCount = count _crewInjuryIndices;
            if (_indexCount >= 0) then {
                _crewInjuryIndices deleteAt _indexToInjure;
                
                // arbitrary percentages
                private _injuredBodyPart = ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"] selectRandomWeighted [0.3, 0.8, 0.5, 0.5, 0.3, 0.3];
                private _currentUnitDamage = _casualty getHitpointDamage _injuredBodyPart;
                private _damageAmount = (_currentUnitDamage + random 1.8) max (_currentUnitDamage + 0.1);

                [_casualty, _damageAmount, _injuredBodyPart, "shell", _source] call EFUNC(medical,addDamageToUnit);
            };
        };
    };
    
    if (_injuryCount >= _count) exitWith {};
} forEach _vehicleCrew;

