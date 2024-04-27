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

// Handle special grenades and sounds
if (local _unit) then {
    // Handle priming sound, if present
    private _soundConfig = getArray (_config >> QGVAR(pullPinSound));

    if (_soundConfig isNotEqualTo []) then {
        _soundConfig params ["_file", "_volume", "_pitch", "_distance"];
        playSound3D [_file, objNull, insideBuilding _unit >= 0.5, getPosASL _projectile, _volume, _pitch, _distance];
    };

    if (getNumber (_config >> QGVAR(flashbang)) == 1) then {
        private _fuzeTimeBase = getNumber (_config >> "explosionTime");
        private _bangs = [_config >> QGVAR(flashbangBangs), "NUMBER", 1] call CBA_fnc_getConfigEntry;
        private _interval = [_config >> QGVAR(flashbangInterval), "NUMBER", 0.5] call CBA_fnc_getConfigEntry;
        private _maxDeviation = [_config >> QGVAR(flashbangIntervalMaxDeviation), "NUMBER", 0.1] call CBA_fnc_getConfigEntry;

        for "_i" from 0 to (_bangs - 1) do {
            private _fuzeTime = _fuzeTimeBase + _i * _interval + random [-_maxDeviation, 0, _maxDeviation];

            [LINKFUNC(flashbangThrownFuze), _projectile, _fuzeTime] call CBA_fnc_waitAndExecute;
        };
    };
};

if (getNumber (_config >> QGVAR(flare)) == 1) then {
    private _fuzeTime = getNumber (_config >> "explosionTime");
    private _timeToLive = getNumber (_config >> "timeToLive");
    private _color = getArray (_config >> QGVAR(color));
    private _intensity = _color deleteAt 3;

    [LINKFUNC(flare), [_projectile, _color, _intensity, _timeToLive], _fuzeTime] call CBA_fnc_waitAndExecute;
};

if (getNumber (_config >> QGVAR(incendiary)) == 1) then {
    private _fuzeTime = getNumber (_config >> "explosionTime");
    private _timeToLive = getNumber (_config >> "timeToLive");

    [LINKFUNC(incendiary), [_projectile, _timeToLive, side group _unit], _fuzeTime] call CBA_fnc_waitAndExecute; // get the unit's real side (will return civilian if unconscious)
};

// Handle throw modes
if (_unit != ACE_player) exitWith {};
if (_unit getVariable [QEGVAR(advanced_throwing,primed), false]) exitWith {LOG("advanced_throwing throw");};

private _mode = missionNamespace getVariable [QGVAR(currentThrowMode), 0];

if (_mode != 0) then {
    private _velocity = velocity _projectile;

    switch (_mode) do {
        // High throw
        case 1: {
            _velocity = _velocity vectorMultiply 0.5;

            _velocity set [2, vectorMagnitude _velocity];
        };
        // Precise throw
        case 2: {
            _velocity = (_unit weaponDirection _weapon) vectorMultiply (vectorMagnitude _velocity);
        };
        // Roll grande
        case 3: {
            //@todo
        };
        // Drop grenade
        case 4: {
            _velocity = [0, 0, 0];
        };
    };

    _projectile setVelocity _velocity;
};
