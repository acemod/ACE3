#include "script_component.hpp"

["ace_settingsInitialized", {
    //If not enabled, exit
    if (!GVAR(enabled)) exitWith {};

    GVAR(casings) = [];
    for "_i" from 0 to GVAR(maxCasings) - 1 do {
        GVAR(casings) set [_i, objNull];
    };
    GVAR(currentIndex) = 0;

    ["ace_settingsChanged", {
        if (count GVAR(casings) == GVAR(maxCasings)) exitWith {};

        // If maxCasings changed, then delete casings that exceed the max and resize de array
        for "_i" from (count GVAR(casings)) to GVAR(maxCasings) - 1 do {
            deleteVehicle (GVAR(casings) select _i);
            GVAR(casings) set [_i, objNull];
        };
        GVAR(casings) resize GVAR(maxCasings);
        // Also adjust the index
        if (GVAR(currentIndex) >= GVAR(maxCasings)) then {
            GVAR(currentIndex) = 0;
        };
    }] call CBA_fnc_addEventHandler;

    // Register fire event handler
    [QGVAR(fired), DFUNC(firedEH)] call CBA_fnc_addEventHandler;
    [QGVAR(fired), {
        params ["_ammo", "_ammoConfig"];

        private _simulation = getText (_ammoConfig >> "simulation");
        if (_simulation in ["shotTimeBomb", "shotPipeBomb", "shotMine", "shotIlluminating", "shotSmoke", "shotRocket", "shotMissile"]) exitWith {
            false
        };
        // Only ammo from hand-held weapons seem to have the cartridge entry
        private _cartridge = getText (_ammoConfig >> "cartridge");
        if (_cartridge == "") exitWith {
            false
        };

        private _casing = "ACE_casings_" + _cartridge;
        if !(isClass (configFile >> "CfgVehicles" >> _casing)) exitWith {
            false
        };

        private _casingModel = getText (configFile >> "CfgVehicles" >> cartridge >> "model");
        if (toLower _casingModel in ["\a3\weapons_f\empty", ""]) exitWith {
            false
        };

        true
    }, true, true, true, false, false, false] call EFUNC(common,registerAmmoFiredEvent);

}] call CBA_fnc_addEventHandler;
