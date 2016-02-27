// by esteldunedain
#include "script_component.hpp"

if (isServer) then {
    GVAR(pseudoRandomList) = [];
    // Construct a list of pseudo random 2D vectors
    for "_i" from 0 to 30 do {
        GVAR(pseudoRandomList) pushBack [-1 + random 2, -1 + random 2];
    };
    publicVariable QGVAR(pseudoRandomList);

    // Keep track of the temperature of stored spare barrels
    GVAR(storedSpareBarrels) = [] call CBA_fnc_hashCreate;
    ["spareBarrelLoadedCoolest", {
        params ["_unit", "_weapon", "_weaponTemp", "_barrelMass"];
        TRACE_4("spareBarrelLoadedCoolest1",_unit,_weapon,_weaponTemp,_barrelMass);

        // Find all spare barrel the player has
        private _allMags = magazinesDetail _unit;
        TRACE_1("spareBarrelLoadedCoolest2",_allMags);
        _allMags = _allMags select {_x find "ACE Spare Barrel" == 0};
        TRACE_1("spareBarrelLoadedCoolest3",_allMags);
        if ((count _allMags) < 1) exitWith {};

        // Determine which on is coolest
        private _coolestTemp = 10000;
        private _coolestMag = _allMags select 0;
        {
            private _temp = 0;
            if ([GVAR(storedSpareBarrels), _x] call CBA_fnc_hashHasKey) then {
                _temp = ([GVAR(storedSpareBarrels), _x] call CBA_fnc_hashGet) select 0;
            };
            TRACE_2("spareBarrelLoadedCoolest4",_x,_temp);
            if (_temp < _coolestTemp) then {
                _coolestTemp = _temp;
                _coolestMag = _x;
            };
        } forEach _allMags;
        TRACE_3("spareBarrelLoadedCoolest5",_coolestTemp,_coolestMag,_weaponTemp);

        // The new weapon temperature is similar to the coolest barrel
        // Publish the new temperature value
        _unit setVariable [format [QGVAR(%1_temp), _weapon], _coolestTemp, true];

        // Heat up the coolest barrel to the former weapon temperature
        [GVAR(storedSpareBarrels), _coolestMag, [_weaponTemp, ACE_Time, _barrelMass]] call CBA_fnc_hashSet;
    }] call EFUNC(common,addEventHandler);

    // Schedule cool down calculation of stored spare barrels
    [] call FUNC(updateSpareBarrelsTemperaturesThread);
};


if !(hasInterface) exitWith {};

GVAR(cacheWeaponData) = call CBA_fnc_createNamespace;
GVAR(cacheAmmoData) = call CBA_fnc_createNamespace;
GVAR(cacheSilencerData) = call CBA_fnc_createNamespace;

// Add keybinds
["ACE3 Weapons", QGVAR(unjamWeapon), localize LSTRING(UnjamWeapon),
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific

    if !([ACE_player] call FUNC(canUnjam)) exitWith {false};

    // Statement
    [ACE_player, currentMuzzle ACE_player, false] call FUNC(clearJam);
    true
},
{false},
[19, [true, false, false]], false] call CBA_fnc_addKeybind; //SHIFT + R Key


// Schedule cool down calculation of player weapons at (infrequent) regular intervals
[] call FUNC(updateTemperatureThread);

["SettingsInitialized", {
    // Register fire event handler
    ["firedPlayer", DFUNC(firedEH)] call EFUNC(common,addEventHandler);
    // Only add eh to non local players if dispersion is enabled
    if (GVAR(overheatingDispersion)) then {
        ["firedPlayerNonLocal", DFUNC(firedEH)] call EFUNC(common,addEventHandler);
    };
}] call EFUNC(common,addEventHandler);
