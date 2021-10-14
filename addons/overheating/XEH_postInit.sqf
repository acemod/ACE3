// by esteldunedain
#include "script_component.hpp"

// Spare barrel item to magazine
["ACE_SpareBarrel_Item", "ACE_SpareBarrel"] call EFUNC(common,registerItemReplacement);

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

["CBA_settingsInitialized", {
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
        GVAR(storedSpareBarrels) = createHashMap;

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

    //Add Take EH if required
    if (GVAR(unJamOnReload) || {GVAR(cookoffCoef) > 0}) then {
        ["CAManBase", "Take", {_this call FUNC(handleTakeEH);}] call CBA_fnc_addClassEventHandler;
    };

    // Register fire event handler
    ["ace_firedPlayer", DFUNC(firedEH)] call CBA_fnc_addEventHandler;
    // Only add eh to non local players if dispersion is enabled
    if (GVAR(overheatingDispersion) || {GVAR(showParticleEffectsForEveryone)}) then {
        ["ace_firedPlayerNonLocal", DFUNC(firedEH)] call CBA_fnc_addEventHandler;
    };

    // Schedule cool down calculation of player weapons at (infrequent) regular intervals
    [] call FUNC(updateTemperatureThread);

    //Add event handlers and start ammo heating loop for cookoff
    if (GVAR(cookoffCoef) > 0) then {
        [] call FUNC(updateAmmoTemperatureThread);

        // Reset ammo temperature on reload, unless the reload is a second muzzle.
        ["CAManBase", "Reloaded", {
            params ["_unit", "_weapon", "_muzzle"];
            if (_muzzle == _weapon) then {
                _unit setVariable [format [QGVAR(%1_ammoTemp), _weapon], 0];
            };
        }] call CBA_fnc_addClassEventHandler;
    };

    // Install event handler to display temp when a barrel was swapped
    [QGVAR(showWeaponTemperature), DFUNC(displayTemperature)] call CBA_fnc_addEventHandler;
    // Install event handler to initiate an assisted barrel swap
    [QGVAR(initiateSwapBarrelAssisted), DFUNC(swapBarrel)] call CBA_fnc_addEventHandler;

    // Add an action to allow hot weapons to be cooled off in AceX Field Rations water sources
    if (isClass(configfile >> "CfgPatches" >> "acex_field_rations")) then {
        [
            {acex_field_rations_enabled || CBA_missionTime > 1},
            {
                if (!acex_field_rations_enabled) exitWith {};

                _CoolWeaponWithWaterSourceAction = [
                    QGVAR(CoolWeaponWithWaterSource),
                    LLSTRING(CoolWeaponWithWaterSource),
                    "\z\acex\addons\field_rations\ui\icon_water_tap.paa",
                    {
                        private _waterSource = _target getVariable ["acex_field_rations_waterSource", objNull];
                        [_player, _waterSource] call FUNC(coolWeaponWithWaterSource);
                    },
                    {
                        private _waterSource = _target getVariable ["acex_field_rations_waterSource", objNull];
                        [_player, _waterSource] call acex_field_rations_fnc_canDrinkFromSource;
                    }
                ] call EFUNC(interact_menu,createAction);

                ["acex_field_rations_helper", 0, ["acex_field_rations_waterSource"], _CoolWeaponWithWaterSourceAction] call EFUNC(interact_menu,addActionToClass);
            },
            []
        ] call CBA_fnc_waitUntilAndExecute;
    };

}] call CBA_fnc_addEventHandler;
