#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Injures occupants in a vehicle based on percent chance of injury.
 *
 * Arguments:
 * 0: The vehicle <OBJECT>
 * 1: Injury Chance <NUMBER>
 * 2: Maximum people to injure <NUMBER>
 * 3: Projectile source <OBJECT> (default: objNull)
 * 4: Modifiers for probability for each crew type to be injured. <ARRAY> (In order of: driver, gunner, commander, cargo)
 *
 * Return Value:
 * None
 *
 * Example:
 * [myVehicle, 0.6, 10] call ace_vehicle_damage_fnc_injureOccupants;
 *
 * Public: No
 */

params ["_vehicle", "_chance", "_count", ["_source", objNull], ["_probabilityModifier", [1, 1, 1, 1]]];
TRACE_4("adding damage to units", _vehicle, _chance, _count, _source);

private _vehicleCrew = crew _vehicle;
private _crewCount = count _vehicleCrew;
if (_crewCount <= 0) exitWith {};

private _crewInjuryIndices = [];
{
    _crewInjuryIndices pushBack _forEachIndex;
} forEach _vehicleCrew;

_crewInjuryIndices = _crewInjuryIndices call BIS_fnc_arrayShuffle;

private _injuryCount = 0;
// Not actually doing anything to any initial vehicle crew in this forEach - just a way to loop through all crew at least once
{
    private _indexToInjure = -1;
    {
        private _modifier = _probabilityModifier select 3;
        if ((_vehicleCrew select _x) isEqualTo driver _vehicle) then {
            _modifier = _probabilityModifier select 0;
        };
        if ((_vehicleCrew select _x) isEqualTo gunner _vehicle) then {
            _modifier = _probabilityModifier select 1;
        };
        if ((_vehicleCrew select _x) isEqualTo commander _vehicle) then {
            _modifier = _probabilityModifier select 2;
        };

        if ((_chance * _modifier) > random 1) exitWith {
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
