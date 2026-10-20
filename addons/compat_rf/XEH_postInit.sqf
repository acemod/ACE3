#include "script_component.hpp"

// Compat for ace_cookoff: Extinguish cook-off
if (["ace_cookoff"] call EFUNC(common,isModLoaded)) then {
    [missionNamespace, "lxRF_water_droppedOnVehicle", {
        params ["_vehicle"];

        // Ammo detonation
        if (_vehicle getVariable [QEGVAR(cookoff,isAmmoDetonating), false] && {!(_vehicle getVariable [QEGVAR(cookoff,interruptAmmoCookoff), false])}) then {
            _vehicle setVariable [QEGVAR(cookoff,interruptAmmoCookoff), true, true];
        };

        // Fire
        if (_vehicle getVariable [QEGVAR(cookoff,isCookingOff), false] && {!(_vehicle getVariable [QEGVAR(cookoff,interruptFireCookoff), false])}) then {
            _vehicle setVariable [QEGVAR(cookoff,interruptFireCookoff), true, true];
        };

        // Engine fire
        if (_vehicle getVariable [QEGVAR(cookoff,isEngineSmoking), false] && {!(_vehicle getVariable [QEGVAR(cookoff,interruptEngineFire), false])}) then {
            _vehicle setVariable [QEGVAR(cookoff,interruptEngineFire), true, true];
        };
    }] call BIS_fnc_addScriptedEventHandler;
};

// Compat for ace_fire: Extinguish burning units
if (["ace_fire"] call EFUNC(common,isModLoaded)) then {
    ["CBA_settingsInitialized", {
        if (!EGVAR(fire,enabled)) exitWith {};

        [missionNamespace, "lxRF_water_droppedOnUnit", {
            params ["_unit"];

            if (_unit call EFUNC(fire,isBurning)) then {
                _unit setVariable [QEGVAR(fire,intensity), nil, true];
            };
        }] call BIS_fnc_addScriptedEventHandler;
    }] call CBA_fnc_addEventHandler;
};
