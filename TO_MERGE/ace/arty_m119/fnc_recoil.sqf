//fnc_recoil.sqf
private["_gun", "_currentRound", "_elevatePhase", "_recoilLength", "_charge", "_chargeFactor",
		"_elvOff", "_defOff", "_azOff"];
_gun = _this select 0;
_currentRound = _this select 1;
_elevatePhase = (_gun animationPhase "MainGun") max 0;
_recoilLength = 1.07-(((1.07-0.36)/1244)*_elevatePhase);
_charge = _currentRound select 3;
_chargeFactor = _charge/8;
_elvOff = (-1+(random 2))*_chargeFactor;
_defOff = (-0.5+(random 1))*_chargeFactor;
_azOff = (-0.25+(random 0.5))*_chargeFactor;
_recoilLength = _recoilLength*_chargeFactor;
_azimuthPhase = (_gun animationPhase "MainTurret");
_elevationPhase = (_gun animationPhase "MainGun");
_traversePhase = (_gun animationPhase "MainTurretTraverse");
_elvOff = (((_elvOff+_elevationPhase) max -100) min 1244);
_azOff = (_azOff+_azimuthPhase);
_defOff = (((_defOff+_traversePhase) max -100) min 100);

_gun animate ["recoil_source", _recoilLength];
_gun animate ["MainGun", _elvOff];
_gun animate ["MainTurret", _azOff];
_gun animate ["MainTurretTraverse", _defOff];

[_gun, _recoilLength] spawn {
	private ["_gun", "_recoilLength"];
	_gun = _this select 0;
	_recoilLength = _this select 1;
	waitUntil {
		(_gun animationPhase "recoil_source" >= _recoilLength);
	};
	_gun animate ["recoil_source", 0];
};