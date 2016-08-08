// by esteldunedain
#include "script_component.hpp"

if (hasInterface) then {
    // Add keybinds
    ["ACE3 Weapons", QGVAR(unjamWeapon), localize LSTRING(UnjamWeapon), {
        // Conditions: canInteract
        if !([ACE_player, objNull, ["isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
        // Conditions: specific

        if !(GVAR(enabled) && {[ACE_player] call FUNC(canUnjam)}) exitWith {false};

        // Statement
        [ACE_player, currentMuzzle ACE_player, false] call FUNC(clearJam);
        true
    }, {false}, [19, [true, false, false]], false] call CBA_fnc_addKeybind; //SHIFT + R Key
};

["ace_settingsInitialized", {
    TRACE_1("SettingsInitialized eh", GVAR(enabled));
    if (!GVAR(enabled)) exitWith {};

    if (isServer) then {
        GVAR(pseudoRandomList) = [];
        // Construct a list of pseudo random 2D vectors
        for "_i" from 0 to 30 do {
            GVAR(pseudoRandomList) pushBack [-1 + random 2, -1 + random 2];
        };
        publicVariable QGVAR(pseudoRandomList);

        // Keep track of the temperature of stored spare barrels
        GVAR(storedSpareBarrels) = [] call CBA_fnc_hashCreate;

        // Install event handlers for spare barrels
        [QGVAR(sendSpareBarrelTemperatureHint), FUNC(sendSpareBarrelsTemperaturesHint)] call CBA_fnc_addEventHandler;
        [QGVAR(loadCoolestSpareBarrel), FUNC(loadCoolestSpareBarrel)] call CBA_fnc_addEventHandler;

        // Schedule cool down calculation of stored spare barrels
        [] call FUNC(updateSpareBarrelsTemperaturesThread);
    };

    if !(hasInterface) exitWith {};

    GVAR(cacheWeaponData) = call CBA_fnc_createNamespace;
    GVAR(cacheAmmoData) = call CBA_fnc_createNamespace;
    GVAR(cacheSilencerData) = call CBA_fnc_createNamespace;

    //Add Take EH (for reload)
    ["CAManBase", "Take", {_this call FUNC(handleTakeEH);}] call CBA_fnc_addClassEventHandler;

    // Register fire event handler
    ["ace_firedPlayer", DFUNC(firedEH)] call CBA_fnc_addEventHandler;
    // Only add eh to non local players if dispersion is enabled
    if (GVAR(overheatingDispersion)) then {
        ["ace_firedPlayerNonLocal", DFUNC(firedEH)] call CBA_fnc_addEventHandler;
    };

    // Schedule cool down calculation of player weapons at (infrequent) regular intervals
    [] call FUNC(updateTemperatureThread);

    // Install event handler to display temp when a barrel was swapped
    [QGVAR(showWeaponTemperature), DFUNC(displayTemperature)] call CBA_fnc_addEventHandler;
    // Install event handler to initiate an assisted barrel swap
    [QGVAR(initiateSwapBarrelAssisted), DFUNC(swapBarrel)] call CBA_fnc_addEventHandler;

}] call CBA_fnc_addEventHandler;
