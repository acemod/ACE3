#include "script_component.hpp"

[QGVAR(engineFire), FUNC(engineFire)] call CBA_fnc_addEventHandler;
[QGVAR(cookOff), FUNC(cookOff)] call CBA_fnc_addEventHandler;

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
        if ((_this select 0) getVariable [QGVAR(enable), GVAR(enable)]) then {
            ["tank", _this] call FUNC(handleDamage);
        };
    }];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["Wheeled_APC_F", "init", {
    params ["_vehicle"];

    _vehicle addEventHandler ["HandleDamage", {
        if ((_this select 0) getVariable [QGVAR(enable), GVAR(enable)]) then {
            ["tank", _this] call FUNC(handleDamage);
        };
    }];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["Car", "init", {
    params ["_vehicle"];

    _vehicle addEventHandler ["HandleDamage", {
        if ((_this select 0) getVariable [QGVAR(enable), GVAR(enable)]) then {
            ["car", _this] call FUNC(handleDamage);
        };
    }];
}, nil, ["Wheeled_APC_F"], true] call CBA_fnc_addClassEventHandler;

// secondary explosions
["AllVehicles", "killed", {
    if ((_this select 0) getVariable [QGVAR(enable),GVAR(enable)]) then {
        (_this select 0) call FUNC(secondaryExplosions);
        if (GVAR(enableAmmoCookoff)) then {
            [(_this select 0), magazinesAmmo (_this select 0)] call FUNC(detonateAmmunition);
        };
    };
}, nil, ["Man"]] call CBA_fnc_addClassEventHandler;

// blow off turret effect
["Tank", "killed", {
    if ((_this select 0) getVariable [QGVAR(enable),GVAR(enable)]) then {
        if (random (1) < 0.25) then {
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
