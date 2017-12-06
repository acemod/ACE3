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
        if ((_this select 0) getVariable [QGVAR(enable), GVAR(enable)]) then {
            ["tank", _this] call FUNC(handleDamage);
        };
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

["ReammoBox_F", "init", {
    (_this select 0) addEventHandler ["HandleDamage", {
        if ((_this select 0) getVariable [QGVAR(enable), GVAR(enableAmmobox)]) then {
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
    if ((_this select 0) getVariable [QGVAR(enable),GVAR(enable)]) then {
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

if (hasInterface) then {
    GVAR(soundObjPool) = [];

    [QFUNC(poolGetObject), {
        private _pooledObject = GVAR(soundObjPool) param [0, [-999, objNull]];
        _pooledObject params ["_time", "_obj"];
        if (isNull _obj || _time >= time) then {
            _obj = "#particlesource" createVehicleLocal [0, 0, 0];
        } else {
            GVAR(soundObjPool) deleteAt 0;
        };
        GVAR(soundObjPool) pushBack [time + 8, _obj];
        _obj; // return
    }] call CBA_fnc_compileFinal;

    [QGVAR(playCookoffSound), {
        params ["_obj", "_sound", "_maxDis"];
        if (isNull _obj) exitWith {};
        private _distance = _obj distance (positionCameraToWorld [0,0,0]);
        if (_distance > _maxDis) exitWith {};
        _distance = _distance + (random (5) - 2.5);
        private _dis = [["far", "mid"] select (_distance < 952), "close"] select (_distance < 325);
        _sound = format [QGVAR(%1_%2_%3), _sound, _dis, (floor random 3) + 1];
        // Delay sound after Rule of SOS.
        [{
            params ["_obj", "_sound"];

            private _soundSource = call FUNC(poolGetObject);
            _soundSource setPos (getPos _obj);
            _soundSource say3D [_sound, 3000, 0.9 + (random 0.2)];
        }, [_obj, _sound], _distance / SPEED_OF_SOUND] call CBA_fnc_waitAndExecute;
    }] call CBA_fnc_addEventHandler;

    [{
        if (GVAR(soundObjPool) isEqualTo []) exitWith {};
        private _element = GVAR(soundObjPool) param [0, [time, objNull]];
        if (((_element select 0) + 120) < time) then {
            GVAR(soundObjPool) deleteAt 0;
            deleteVehicle (_element select 1);
        };
    }, 0.5] call CBA_fnc_addPerFrameHandler;
};
