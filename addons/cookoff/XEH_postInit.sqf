#include "script_component.hpp"

[QGVAR(engineFire), FUNC(engineFire)] call CBA_fnc_addEventHandler;
[QGVAR(cookOff), FUNC(cookOff)] call CBA_fnc_addEventHandler;
[QGVAR(cookOffBox), FUNC(cookOffBox)] call CBA_fnc_addEventHandler;

GVAR(cacheTankDuplicates) = call CBA_fnc_createNamespace;

// cookoff and burning engine
["Tank", "init", {
    params ["_vehicle"];

    private _typeOf = typeOf _vehicle;

    if (isNil {GVAR(cacheTankDuplicates) getVariable _typeOf}) then {
        private _hitpoints = (getAllHitPointsDamage _vehicle param [0, []]) apply {toLower _x};
        private _duplicateHitpoints = [];

        {
            if ((_x != "") && {_x in (_hitpoints select [0,_forEachIndex])}) then {
                _duplicateHitpoints pushBack _forEachIndex;
            };
        } forEach _hitpoints;

        TRACE_2("dupes",_typeOf,_duplicateHitpoints);
        GVAR(cacheTankDuplicates) setVariable [_typeOf, _duplicateHitpoints];
    };

    _vehicle addEventHandler ["HandleDamage", {
        ["tank", _this] call FUNC(handleDamage);
    }];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["Wheeled_APC_F", "init", {
    params ["_vehicle"];

    private _typeOf = typeOf _vehicle;

    if (isNil {GVAR(cacheTankDuplicates) getVariable _typeOf}) then {
        private _hitpoints = (getAllHitPointsDamage _vehicle param [0, []]) apply {toLower _x};
        private _duplicateHitpoints = [];

        {
            if ((_x != "") && {_x in (_hitpoints select [0,_forEachIndex])}) then {
                _duplicateHitpoints pushBack _forEachIndex;
            };
        } forEach _hitpoints;

        TRACE_2("dupes",_typeOf,_duplicateHitpoints);
        GVAR(cacheTankDuplicates) setVariable [_typeOf, _duplicateHitpoints];
    };

    _vehicle addEventHandler ["HandleDamage", {
        ["tank", _this] call FUNC(handleDamage);
    }];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["Car", "init", {
    params ["_vehicle"];

    _vehicle addEventHandler ["HandleDamage", {
        ["car", _this] call FUNC(handleDamage);
    }];
}, nil, ["Wheeled_APC_F"], true] call CBA_fnc_addClassEventHandler;

["ReammoBox_F", "init", {
    (_this select 0) addEventHandler ["HandleDamage", {
        if ((_this select 0) getVariable [QGVAR(enableAmmoCookoff), GVAR(enableAmmobox)]) then {
            ["box", _this] call FUNC(handleDamage);
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

// blow off turret effect
["Tank", "killed", {
    if ((_this select 0) getVariable [QGVAR(enable), GVAR(enable)] in [1, 2, true]) then {
        if (random 1 < 0.15) then {
            (_this select 0) call FUNC(blowOffTurret);
        };
    };
}] call CBA_fnc_addClassEventHandler;

// event to add a turret to a curator if the vehicle already belonged to that curator
if (isServer) then {
    [QGVAR(addTurretToEditable), {
        params ["_vehicle", "_turret"];

        {
            if (_vehicle in curatorEditableObjects _x) then {
                _x addCuratorEditableObjects [[_turret], false];
            };
        } forEach allCurators;
    }] call CBA_fnc_addEventHandler;
};

// init eject from destroyed vehicle
{
    [_x, "init", {
        params ["_vehicle"];
        if (!alive _vehicle) exitWith {};
        TRACE_2("ejectIfDestroyed init",_vehicle,typeOf _vehicle);
        _vehicle addEventHandler ["HandleDamage", {call FUNC(handleDamageEjectIfDestroyed)}];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach EJECT_IF_DESTROYED_VEHICLES;
