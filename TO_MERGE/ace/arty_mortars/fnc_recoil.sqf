//fnc_recoil.sqf
//#define DEBUG_MODE_FULL
#include "script_component.hpp"
private ["_recoilLength", "_charge", "_chargeFactor","_elvOff", "_defOff", "_azOff"];

PARAMS_1(_gun);

_currentRound = _gun getVariable ["ace_sys_arty_currentRound",[]];
TRACE_1("",_currentRound);

_charge = if (count _currentRound == 0) then { 1 } else { _currentRound select 3 };

_chargeFactor = _charge/4;
_elvOff = (-1+(random 2))*_chargeFactor;
_defOff = (-0.5+(random 1))*_chargeFactor;
_azOff = (-0.25+(random 0.5))*_chargeFactor;

_azimuthPhase = _gun animationPhase "MainTurret";
_elevationPhase = _gun animationPhase "MainGun";
_traversePhase = _gun animationPhase "MainTurretTraverse";
_elvOff = ((_elvOff+_elevationPhase) max 800) min 1511; TRACE_1("Elevation RECOIL",_elvOff);
_azOff = _azOff + _azimuthPhase; TRACE_1("Azimuth RECOIL",_azOff);
_defOff = ((_defOff+_traversePhase) max -200) min 200; TRACE_1("Deflection RECOIL",_defOff);

_gun animate ["MainGun", _elvOff];
_gun animate ["MainTurret", _azOff];
_gun animate ["MainTurretTraverse", _defOff];

