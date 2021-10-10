#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Called when the mortar is fired.
 *
 * Arguments:
 * 0: mortar - Object the event handler is assigned to <OBJECT>
 * 1: weapon - Fired weapon <STRING>
 * 2: muzzle - Muzzle that was used <STRING>
 * 3: mode - Current mode of the fired weapon <STRING>
 * 4: ammo - Ammo used <STRING>
 * 5: magazine - magazine name which was used <STRING>
 * 6: projectile - Object of the projectile that was shot <OBJECT>
 * 7: gunner - Gunner <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bisFiredEH] call ace_artillerytables_fnc_firedEH
 *
 * Public: No
 */

params ["_vehicle", "", "", "", "", "_magazine", "_projectile", "_gunner"];
TRACE_4("firedEH",_vehicle,_magazine,_projectile,_gunner);

if (!([_gunner] call EFUNC(common,isPlayer))) exitWith {}; // AI don't know how to use (this does give them more range than a player)
if ((gunner _vehicle) != _gunner) exitWith {}; // check if primaryGunner


// Get airFriction
private _airFriction = DEFAULT_AIR_FRICTION;
if (isNumber (configFile >> "CfgMagazines" >> _magazine >> QGVAR(airFriction))) then {
    _airFriction = getNumber (configFile >> "CfgMagazines" >> _magazine >> QGVAR(airFriction));
};
TRACE_1("",_airFriction);
if (_airFriction >= 0) exitWith {}; // 0 disables everything, >0 makes no sense

BEGIN_COUNTER(adjustmentsCalc);

// Calculate air density
private _altitude = (getPosASL _vehicle) select 2;
private _temperature = _altitude call EFUNC(weather,calculateTemperatureAtHeight);
private _pressure = _altitude call EFUNC(weather,calculateBarometricPressure);
private _relativeHumidity = EGVAR(weather,currentHumidity);
private _airDensity = [_temperature, _pressure, _relativeHumidity] call EFUNC(weather,calculateAirDensity);
private _relativeDensity = _airDensity / 1.225;
TRACE_5("Weather",_temperature,_pressure,_relativeHumidity,_airDensity,_relativeDensity);

private _kFactor = _airFriction * _relativeDensity;
private _newMuzzleVelocityCoefficent = (((_temperature + 273.13) / 288.13 - 1) / 40 + 1);
TRACE_2("",_kFactor,_newMuzzleVelocityCoefficent);

// Apply powder effects
if (_newMuzzleVelocityCoefficent != 1) then {
    private _bulletVelocity = velocity _projectile;
    private _bulletSpeed = vectorMagnitude _bulletVelocity;
    _bulletVelocity = (vectorNormalized _bulletVelocity) vectorMultiply (_bulletSpeed * _newMuzzleVelocityCoefficent);
    _projectile setVelocity _bulletVelocity;
};


[{
    params ["_projectile", "_kFactor", "_time"];

    if (isNull _projectile) exitWith {true};

    private _deltaT = CBA_missionTime - _time;
    _this set[2, CBA_missionTime];

    private _bulletVelocity = velocity _projectile;
    private _trueVelocity = _bulletVelocity vectorDiff wind;
    private _trueSpeed = vectorMagnitude _trueVelocity;

    private _drag = _deltaT * _kFactor * _trueSpeed;
    private _accel = _trueVelocity vectorMultiply _drag;
    // TRACE_3("",_bulletVelocity,_trueSpeed,_accel);
    _bulletVelocity = _bulletVelocity vectorAdd _accel;

    _projectile setVelocity _bulletVelocity;

    false
}, {
    // TRACE_1("done",_this);
}, [_projectile, _kFactor, CBA_missionTime]] call CBA_fnc_waitUntilAndExecute;

END_COUNTER(adjustmentsCalc);
