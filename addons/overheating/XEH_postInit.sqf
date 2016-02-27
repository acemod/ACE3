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

    ["spareBarrelsCheckTemperatures", {
        params ["_player","_unit"];
        // Find all spare barrel the player has
        private _allMags = magazinesDetail _unit;
        _allMags = _allMags select {_x find "ACE Spare Barrel" == 0};
        if ((count _allMags) < 1) exitWith {};

        // Determine the temp of each barrel
        private _temps = [];
        {
            private _temp = 0;
            if ([GVAR(storedSpareBarrels), _x] call CBA_fnc_hashHasKey) then {
                _temp = ([GVAR(storedSpareBarrels), _x] call CBA_fnc_hashGet) select 0;
            };
            _temps pushBack _temp;
        } forEach _allMags;
        TRACE_1("_temps",_temps);

        // Count cool
        private _countCool = {_x < 20} count _temps;
        private _countWarm = {(_x >= 20) && (_x < 100)} count _temps;
        private _countHot = {(_x >= 100) && (_x < 200)} count _temps;
        private _countVeryHot = {(_x >= 200) && (_x < 600)} count _temps;
        private _countExtremelyHot = {_x >= 600} count _temps;
        private _output = ["%1 %2%3%4 %5%6%7 %8%9%10 %11%12%13 %14"];
        private _size = 1.0;
        if (_countCool > 0) then {
            _output pushBack _countCool;
            _output pushBack LSTRING(BarrelCool);
            _output pushBack "<br/>";
            _size = _size + 0.5;
        };
        if (_countWarm > 0) then {
            _output pushBack _countWarm;
            _output pushBack LSTRING(BarrelWarm);
            _output pushBack "<br/>";
            _size = _size + 0.5;
        };
        if (_countHot > 0) then {
            _output pushBack _countHot;
            _output pushBack LSTRING(BarrelHot);
            _output pushBack "<br/>";
            _size = _size + 0.5;
        };
        if (_countVeryHot > 0) then {
            _output pushBack _countVeryHot;
            _output pushBack LSTRING(BarrelVeryHot);
            _output pushBack "<br/>";
            _size = _size + 0.5;
        };
        if (_countExtremelyHot > 0) then {
            _output pushBack _countExtremelyHot;
            _output pushBack LSTRING(BarrelExtremelyHot);
            _size = _size + 0.5;
        };

        TRACE_1("_output",_output);
        ["displayTextStructured", [_player], [_output, _size, _player]] call EFUNC(common,targetEvent);
    }] call EFUNC(common,addEventHandler);

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
