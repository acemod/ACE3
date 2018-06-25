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
 *
 * Return Value:
 * None
 *
 * Example:
 * [clientFiredBIS-XEH] call ace_mk6mortar_fnc_handleFired
 *
 * Public: No
 */

params ["_vehicle", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];

if (GVAR(useAmmoHandling) && {_vehicle getVariable [QGVAR(initialized),false] && !(_vehicle getVariable [QGVAR(exclude),false])}) then {
    // if !(_vehicle getVariable [QGVAR(exclude),false]) then {
        _vehicle removeMagazineGlobal (_vehicle magazinesTurret [0] select 0);
        TRACE_1("",_vehicle magazinesTurret [0]);
    // };
};

if (!GVAR(airResistanceEnabled)) exitWith {};

// Large enough distance to not simulate any wind deflection
if (_vehicle distance ACE_player > 8000) exitWith {false};

//AI will have no clue how to use:
_shooterMan = gunner _vehicle;
if (!([_shooterMan] call EFUNC(common,isPlayer))) exitWith {false};

//Calculate air density:
private _altitude = (getPosASL _vehicle) select 2;
private _temperature = _altitude call EFUNC(weather,calculateTemperatureAtHeight);
private _pressure = _altitude call EFUNC(weather,calculateBarometricPressure);
private _relativeHumidity = EGVAR(weather,currentHumidity);
private _airDensity = [_temperature, _pressure, _relativeHumidity] call EFUNC(weather,calculateAirDensity);
private _relativeDensity = _airDensity / 1.225;

TRACE_5("FiredWeather",_temperature,_pressure,_relativeHumidity,_airDensity,_relativeDensity);

//powder effects:
private _newMuzzleVelocityCoefficent = (((_temperature + 273.13) / 288.13 - 1) / 40 + 1);
if (_newMuzzleVelocityCoefficent != 1) then {
    _bulletVelocity = velocity _projectile;
    _bulletSpeed = vectorMagnitude _bulletVelocity;
    _bulletVelocity = (vectorNormalized _bulletVelocity) vectorMultiply (_bulletSpeed * _newMuzzleVelocityCoefficent);
    _projectile setVelocity _bulletVelocity;
};


[{
    params ["_args", "_pfID"];
    _args params ["_shell", "_airFriction", "_time", "_relativeDensity"];

    if (isNull _shell || {!alive _shell}) exitWith {
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };

    private _deltaT = CBA_missionTime - _time;
    _args set[2, CBA_missionTime];

    private _bulletVelocity = velocity _shell;
    private _bulletSpeed = vectorMagnitude _bulletVelocity;

    private _trueVelocity = _bulletVelocity vectorDiff wind;
    private _trueSpeed = vectorMagnitude _trueVelocity;

    private _drag = _deltaT * _airFriction * _trueSpeed * _relativeDensity;
    private _accel = _trueVelocity vectorMultiply (_drag);
    private _bulletVelocity = _bulletVelocity vectorAdd _accel;

    _shell setVelocity _bulletVelocity;

}, 0, [_projectile, MK6_82mm_AIR_FRICTION, CBA_missionTime, _relativeDensity]] call CBA_fnc_addPerFrameHandler;
