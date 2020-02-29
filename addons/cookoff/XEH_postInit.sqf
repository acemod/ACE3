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

[QGVAR(cleanupEffects), {
    params ["_vehicle"];
    
    private _effects = _vehicle getVariable [QGVAR(effects), []];
    {
        deleteVehicle _x;
    } forEach _effects;
    
}] call CBA_fnc_addEventHandler;

GVAR(cacheTankDuplicates) = call CBA_fnc_createNamespace;

["ReammoBox_F", "init", {
    (_this select 0) addEventHandler ["HandleDamage", {
        if ((_this select 0) getVariable [QGVAR(enableAmmoCookoff), GVAR(enableAmmobox)]) then {
            _this call FUNC(handleDamage);
        };
    }];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

// secondary explosions
["AllVehicles", "killed", {
    params ["_vehicle"];
    if (_vehicle getVariable [QGVAR(enableAmmoCookoff), GVAR(enableAmmoCookoff)]) then {
        if (GVAR(ammoCookoffDuration) == 0) exitWith {};
        ([_vehicle] call FUNC(getVehicleAmmo)) params ["_mags", "_total"];
        [_vehicle, _mags, _total] call FUNC(detonateAmmunition);
    };
}, nil, ["Man","StaticWeapon"]] call CBA_fnc_addClassEventHandler;


