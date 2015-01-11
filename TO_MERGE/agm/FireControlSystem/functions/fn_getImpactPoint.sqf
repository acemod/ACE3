/*
 * Author: KoffeinFlummi
 *
 * Gets the impact point if the given bomb were to be dropped at the
 * the current time from the given vehicle.
 *
 * !!! Experimental !!!
 *
 * Arguments:
 * 0: Vehicle
 * 1: Classname of bomb
 *
 * Return Value:
 * Coordinates of hit in ATL
 */

_vehicle = _this select 0;
_projectile = _this select 1;

_velocity = velocity (_vehicle);
_position = getPosASL _vehicle;

_airFriction = getNumber (configFile >> "CfgAmmo" >> _projectile >> "airFriction");
_simulationStep = getNumber (configFile >> "CfgAmmo" >> _projectile >> "simulationStep");
_timeToLive = getNumber (configFile >> "CfgAmmo" >> _projectile >> "timeToLive");

_time = 0;
while {_time < _timeToLive and (ASLToATL _position) select 2 > 0} do {
  _position = _position vectorAdd (_velocity vectorMultiply _simulationStep);
  _velMag = vectorMagnitude _velocity;
  _velocity = _velocity vectorAdd (_velocity vectorMultiply (_simulationStep * _velMag * _airFriction));
  _velocity set [2, (_velocity select 2) - 9.81 * _simulationStep];
  _time = _time + _simulationStep;
};

_position
