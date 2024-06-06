#include "..\script_component.hpp"
/*
 * Author: commy2
 * Adjust the grenades throwing direction and speed to the selected throwing mode. Called from the unified fired EH only for CAManBase
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * None
 *
 * Example:
 * [clientFiredBIS-XEH] call ace_grenades_fnc_throwGrenade
 *
 * Public: No
 */

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
TRACE_10("firedEH:",_unit,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile,_vehicle,_gunner,_turret);

if (_weapon != "Throw") exitWith {};

// http://feedback.arma3.com/view.php?id=12340
if (isNull _projectile) then {
    _projectile = nearestObject [_unit, _ammo];
};

private _config = configFile >> "CfgAmmo" >> _ammo;

// handle special grenades and sounds
if (local _unit) then {
    // handle priming sound, if present
    private _soundConfig = getArray (configFile >> "CfgAmmo" >> _ammo >> QGVAR(pullPinSound));
    if (_soundConfig isNotEqualTo []) then {
        _soundConfig params ["_file", "_volume", "_pitch", "_distance"];
        playSound3D [_file, objNull, false, getPosASL _projectile, _volume, _pitch, _distance];
    };

    if (getNumber (_config >> QGVAR(flashbang)) == 1) then {
        private _bangs = 1;
        private _entry = _config >> QGVAR(flashbangBangs);
        if (isNumber _entry || isText _entry) then {
            _bangs = getNumber _entry;
        };

        private _fuzeTimeBase = getNumber (_config >> "explosionTime");

        private _interval = 0.5;
        _entry = _config >> QGVAR(flashbangInterval);
        if (isNumber _entry || isText _entry) then {
            _interval = getNumber _entry;
        };

        private _maxDeviation = 0.1;
        _entry = _config >> QGVAR(flashbangIntervalMaxDeviation);
        if (isNumber _entry || isText _entry) then {
            _maxDeviation = getNumber _entry;
        };

        for "_i" from 0 to (_bangs - 1) do {
            private _fuzeTime = _fuzeTimeBase + _i*_interval + random [- _maxDeviation, 0, _maxDeviation];

            [FUNC(flashbangThrownFuze), [_projectile], _fuzeTime] call CBA_fnc_waitAndExecute;
        };
    };
};

if (getNumber (_config >> QGVAR(flare)) == 1) then {
    private _fuzeTime = getNumber (_config >> "explosionTime");
    private _timeToLive = getNumber (_config >> "timeToLive");
    private _color = getArray (_config >> QGVAR(color));
    private _intensity = _color deleteAt 3;

    [FUNC(flare), [_projectile, _color, _intensity, _timeToLive], _fuzeTime] call CBA_fnc_waitAndExecute;
};

if (getNumber (_config >> QGVAR(incendiary)) == 1) then {
    private _fuzeTime = getNumber (_config >> "explosionTime");
    private _timeToLive = getNumber (_config >> "timeToLive");

    [FUNC(incendiary), [_projectile, _timeToLive, side _unit], _fuzeTime] call CBA_fnc_waitAndExecute; // WE WANT THE OBJECTS SIDE HERE!
};

// handle throw modes
if (_unit != ACE_player) exitWith {};
if (_unit getVariable [QEGVAR(advanced_throwing,primed), false]) exitWith {LOG("advanced_throwing throw");};

private _mode = GVAR(currentThrowMode);

if (_mode != 0) then {
    private _velocity = velocity _projectile;

    switch (_mode) do {
        //high throw
        case 1 : {
            _velocity = [
            0.5 * (_velocity select 0),
            0.5 * (_velocity select 1),
            [0, 0, 0] distance (_velocity vectorMultiply 0.5)
            ];
        };
        //precise throw
        case 2 : {
            _velocity = (_unit weaponDirection _weapon) vectorMultiply (vectorMagnitude _velocity);
        };
        //roll grenade
        case 3 : {
            private _posASL = getPosASL _projectile;

            // getPos is unreliable, as surfaces in some ruins are not recognised as surfaces
            private _lisPos = (lineIntersectsSurfaces [_posASL, _posASL vectorAdd [0, 0, -1e11], ACE_player, objNull, true, 1, "ROADWAY", "FIRE"]) select 0;
            _projectile setPosASL ((_lisPos select 0) vectorAdd [0, 0, 0.2]);

            // Rotate throwables by 90° to the side by default, so cylindrical throwables can be rolled
            private _vectorDirAndUp = getArray (_config >> QGVAR(rollVectorDirAndUp));
            _vectorDirAndUp params [["_vectorDir", [0, 1, 0], [[]], 3], ["_vectorUp", [1, 0, 0], [[]], 3]];

            // Do as if object were facing north
            _projectile setVectorDirAndUp ([[_vectorDir, _vectorUp], -(direction _projectile), 0, 0] call BIS_fnc_transformVectorDirAndUp);

            _velocity = (vectorDir _unit) vectorMultiply 10;
        };
        //drop grenade
        case 4 : {
            _velocity = [0, 0, 0];
        };
    };

    _projectile setVelocity _velocity;
};
