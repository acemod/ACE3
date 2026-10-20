#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Fires the weapon.
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Muzzle to shoot <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [csw, "Main"] call ace_csw_fnc_autofire_fire
 *
 * Public: No
 */
params ["_csw", "_weapon", "_muzzle"];

TRACE_5("autofire_fire",_csw,_weapon,_muzzle,gunner _csw,local gunner _csw);

private _gunner = gunner _csw;
if (!local _gunner || !local _csw) exitWith {};

private _fireMode = currentWeaponMode _gunner;
if (_fireMode isEqualTo "") then {
    private _cswHashmap = _csw getVariable [QGVAR(autofire_defaultModes), createHashMap];
    _fireMode = _cswHashmap getOrDefaultCall [
        _muzzle,
        {
            private _defaultModes = getArray (configFile >> "CfgWeapons" >> _muzzle >> "modes");
            TRACE_3("setting default mode",_csw,_muzzle,_defaultModes);
            if (_defaultModes isEqualTo []) exitWith { "" };
            _defaultModes select 0
        },
        true
    ];
};

_gunner setVariable [QGVAR(autofire_isProxy), true];

// we have to adjust fire if we aren't a player shooting
// because the engine does some fuckery with players, AI shoot down the barrel, but players shoot with some offset
private _fireEventHandler = _csw addEventHandler [
    "Fired",
    {
        params ["_csw", "_weapon", "", "_mode", "", "", "_projectile", "_gunner"];

        private _isGunnerAgent = _gunner isEqualTo (_csw getVariable [QGVAR(autofire_agent), objNull]);
        private _parent = _gunner;
        if (_isGunnerAgent) then {
            _parent = _csw getVariable [QGVAR(reloader), objNull];
        };
        [QEGVAR(common,setShotParents), [_projectile, _csw, _parent]] call CBA_fnc_serverEvent;

        // disable for non-proxy and players, this is already done for us
        if (_gunner call EFUNC(common,isPlayer) || { !(_gunner getVariable [QGVAR(autofire_isProxy), false ])}) exitWith {};

        (_csw getVariable [QGVAR(autofire_animations), ["", ""]]) params ["_body", "_gun"];

        private _weaponDir = _csw weaponDirection _weapon;

        private _traverse = _csw animationSourcePhase _body;
        private _turretRot = [vectorDir _csw, vectorUp _csw, deg _traverse] call CBA_fnc_vectRotate3D;
        private _elevation = (acos ((_turretRot vectorCos _weaponDir) min 1)) + ((_turretRot call CBA_fnc_vect2polar) select 2);

        private _elev = _csw animationSourcePhase _gun;

        private _lookDirection = _csw vectorModelToWorldVisual ([1, -deg _traverse, deg _elev] call CBA_fnc_polar2vect);
        private _azimuth = (_lookDirection select 0) atan2 (_lookDirection select 1);

        private _options = _csw getVariable [QGVAR(autofire_dispersion), createHashMap] getOrDefault [_mode, [0.001, 0]];
        _options params ["_dispersion", "_modifier"];

        ([0, _dispersion * _modifier] call EFUNC(common,normalRandom)) params ["_azimuthOffset", "_elevationOffset"];

        private _projectileSpeed = vectorMagnitude velocity _projectile;
        private _barrelDirection = [1, _azimuth + _azimuthOffset, _elevation + _elevationOffset] call CBA_fnc_polar2vect;

        TRACE_4("adjusting projectile",velocity _projectile,_barrelDirection vectorMultiply _projectileSpeed,_azimuth,_elevation);
        _projectile setVelocity (_barrelDirection vectorMultiply _projectileSpeed);
    }
];
_csw setVariable [QGVAR(autofire_eh), _fireEventHandler];

if (_fireMode isEqualTo "this") then {
    TRACE_3("fire params",_gunner,_muzzle,_weapon);
    _gunner forceWeaponFire [_muzzle, _weapon];
} else {
    TRACE_3("fire params",_gunner,_muzzle,_fireMode);
    _gunner forceWeaponFire [_muzzle, _fireMode];
};

[{
    params ["_csw"];
    private _agent = _csw getVariable [QGVAR(autofire_agent), objNull];
    if !(isNull _agent) then {
        TRACE_3("deleting agent",_agent,_csw,gunner _csw);
        _agent moveOut _csw;
        deleteVehicle _agent;
        _csw setVariable [QGVAR(autofire_agent), objNull, true];
    };

    // if we are an AI, we don't want them to fire rapidly on their own reload, so we mark them as a proxy
    // they arent deleted after, so we want to reset their variable
    private _gunner = gunner _csw;
    if !(isNull _gunner) then {
        _gunner setVariable [QGVAR(autofire_isProxy), false];
    };

    private _fireEh = _csw getVariable [QGVAR(autofire_eh), -1];
    if (_fireEh >= 0) then {
        _csw removeEventHandler ["Fired", _fireEh];
    };
}, [_csw]] call CBA_fnc_execNextFrame;
