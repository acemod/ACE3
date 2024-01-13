#include "script_component.hpp"

[QGVAR(engineFire), FUNC(engineFire)] call CBA_fnc_addEventHandler;
[QGVAR(cookOff), {
    params ["_vehicle"];
    if (local _vehicle) then {
        _this call FUNC(cookOff);
    };
}] call CBA_fnc_addEventHandler;
[QGVAR(cookOffEffect), FUNC(cookOffEffect)] call CBA_fnc_addEventHandler;
[QGVAR(smoke), FUNC(smoke)] call CBA_fnc_addEventHandler;
[QGVAR(cookOffBox), FUNC(cookOffBox)] call CBA_fnc_addEventHandler;

// handle cleaning up effects when vehicle is deleted mid-cookoff
[QGVAR(addCleanupHandlers), {
    params ["_vehicle"];
    
    // Don't add a new EH if cookoff is run multiple times
    if ((_vehicle getVariable [QGVAR(deletedEH), -1]) == -1) then {
        private _deletedEH = _vehicle addEventHandler ["Deleted", {
            params ["_vehicle"];
            
            [QGVAR(cleanupEffects), [_vehicle]] call CBA_fnc_localEvent;
        }];
    
        _vehicle setVariable [QGVAR(deletedEH), _deletedEH];
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(cleanupEffects), {
    params ["_vehicle", ["_effects", []]];

    _effects = _effects + (_vehicle getVariable [QGVAR(effects), []]);
    if (_effects isNotEqualTo []) then {
         { deleteVehicle _x } count _effects;
    };
}] call CBA_fnc_addEventHandler;

["ReammoBox_F", "init", {
    (_this select 0) addEventHandler ["HandleDamage", {
        if ((_this select 0) getVariable [QGVAR(enableAmmoCookoff), GVAR(enableAmmobox)]) then {
            _this call FUNC(handleDamageBox);
        };
    }];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

// secondary explosions
["AllVehicles", "killed", {
    params ["_vehicle", "", "", "_useEffects"];
    if (
        _useEffects &&
        _vehicle getVariable [QGVAR(enableAmmoCookoff), GVAR(enableAmmoCookoff)]
    ) then {
        if (GVAR(ammoCookoffDuration) == 0) exitWith {};
        ([_vehicle] call FUNC(getVehicleAmmo)) params ["_mags", "_total"];

        private _delay = (random MAX_AMMO_DETONATION_START_DELAY) max MIN_AMMO_DETONATION_START_DELAY;
        [FUNC(detonateAmmunition), [_vehicle, _mags, _total], _delay] call CBA_fnc_waitAndExecute;
    };
}, nil, ["Man","StaticWeapon"]] call CBA_fnc_addClassEventHandler;
