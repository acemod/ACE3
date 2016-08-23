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
        if (GVAR(enable)) then {
            ["tank", _this] call FUNC(handleDamage);
        };
    }];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["Wheeled_APC_F", "init", {
    (_this select 0) addEventHandler ["HandleDamage", {
        if (GVAR(enable)) then {
            ["tank", _this] call FUNC(handleDamage);
        };
    }];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["Car", "init", {
    (_this select 0) addEventHandler ["HandleDamage", {
        if (GVAR(enable)) then {
            ["car", _this] call FUNC(handleDamage);
        };
    }];
}, nil, ["Wheeled_APC_F"], true] call CBA_fnc_addClassEventHandler;

// secondary explosions
["AllVehicles", "killed", {
    if (GVAR(enable)) then {
        (_this select 0) call FUNC(secondaryExplosions);
    };
}, nil, ["Man"]] call CBA_fnc_addClassEventHandler;

// blow off turret effect
["Tank", "killed", {
    if (GVAR(enable)) then {
        (_this select 0) call FUNC(blowOffTurret);
    };
}] call CBA_fnc_addClassEventHandler;
