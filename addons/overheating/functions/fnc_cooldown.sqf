/*
 * Author: esteldunedain
 * Calculate cooling down of the weapon.
 *
 * Argument:
 * 0: Last temperature <NUMBER>
 * 1: Barrel mass <NUMBER>
 * 2: Time <NUMBER>
 *
 * Return value:
 * New temperature <NUMBER>
 *
 * Public: No
 */
#include "\z\ace\addons\overheating\script_component.hpp"

EXPLODE_3_PVT(_this,_temperature,_barrelMass,_totalTime);

// If a long ACE_time passed since the last shot, there's no need to calculate anything; the weapon should be cool
if (_totalTime > 1800) exitWith {0};

private ["_barrelSurface", "_time", "_deltaTime"];
_barrelSurface = _barrelMass / 7850 / 0.003;

_time = 0;
while {true} do {
  _deltaTime = (_totalTime - _time) min 20;

  _temperature = _temperature - (
                  // Convective cooling
                  25 * _barrelSurface * _temperature
                  // Radiative cooling
                  + 0.4 * 5.67e-8 * _barrelSurface *
                  ( (_temperature + 273.15)*(_temperature + 273.15)
                  * (_temperature + 273.15)*(_temperature + 273.15)
                  - 273.15 * 273.15 * 273.15 *273.15 )
                  ) * _deltaTime / (_barrelMass * 466);

  if (_temperature < 1) exitWith {0};

  if (isNil "_temperature") exitWith {
    ACE_LOGERROR_3("_totalTime = %1; _time = %2; _deltaTime = %3;",_totalTime,_time,_deltaTime);
    0
  };

  _time = _time + _deltaTime;
  if (_time >= _totalTime) exitWith { _temperature max 0 };
};
