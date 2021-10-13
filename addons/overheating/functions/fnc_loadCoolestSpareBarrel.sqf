#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Collect the temperature of all the spare barrels a unit has and load the
 * coolest on the unit weapon. Runs on the server.
 *
 * Arguments:
 * 0: Unit that has the spare barrels <OBJECT>
 * 1: Unit that has the weapon <OBJECT>
 * 2: Weapon <STRING>
 * 3: Weapon temp before switching <NUMBER>
 * 4: Mass of the removed barrel <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, bob, "weapon",5, 2] call ace_overheating_fnc_loadCoolestSpareBarrel
 *
 *
 * Public: No
 */

params ["_assistant", "_gunner", "_weapon", "_weaponTemp", "_barrelMass"];
TRACE_5("loadCoolestSpareBarrel1",_assistant,_gunner,_weapon,_weaponTemp,_barrelMass);
private _weaponBarrelClass = getText (configFile >> 'CfgWeapons' >> _weapon >> QGVAR(barrelClassname));
//If the weapon has no defined classname then use the ACE one
if (_weaponBarrelClass == "") then {
    _weaponBarrelClass = "ACE_SpareBarrel";
};
// Find all spare barrel the player has
private _allBarrels = [_assistant, _weaponBarrelClass] call CBA_fnc_getMagazineIndex;
TRACE_1("_allBarrels",_allBarrels);
if ((count _allBarrels) < 1) exitWith {};

// Determine which on is coolest
private _coolestTemp = 10000;
private _coolestMag = _allBarrels select 0;
{
    private _temp = GVAR(storedSpareBarrels) getOrDefault [_x, [0]] select 0;
    TRACE_2("loadCoolestSpareBarrel4",_x,_temp);
    if (_temp < _coolestTemp) then {
        _coolestTemp = _temp;
        _coolestMag = _x;
    };
} forEach _allBarrels;
TRACE_3("loadCoolestSpareBarrel5",_coolestTemp,_coolestMag,_weaponTemp);

// The new weapon temperature is similar to the coolest barrel
// Publish the new temperature value
_gunner setVariable [format [QGVAR(%1_temp), _weapon], _coolestTemp, true];

// Heat up the coolest barrel to the former weapon temperature
GVAR(storedSpareBarrels) set [_coolestMag, [_weaponTemp, CBA_missionTime, _barrelMass]];

// Send an event so the machines of the assistant and gunner can show the hint
[QGVAR(showWeaponTemperature), [_gunner, _weapon], [_assistant, _gunner]] call CBA_fnc_targetEvent;
