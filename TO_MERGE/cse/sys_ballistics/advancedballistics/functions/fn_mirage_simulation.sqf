#include "defines.h"

private ["_opticsName", "_parallax", "_playerDirection", "_vectorToFocalPoint", "_focusLength", "_focalPoint", "_roughnessLength", "_distCoef", "_focalPlaneAngle", "_windSpeedRef", "_windSpeed",
			"_particleSize", "_particleMoveVelocityRef", "_particleMoveVelocity", "_pASL", "_pATL", "_height"];

while {cse_AB_MirageEnabled} do {
	_opticsName = currentWeapon player;
	if (currentWeapon player == primaryWeapon player && count primaryWeaponItems player > 2) then {
		_opticsName = (primaryWeaponItems player) select 2;
	};
	_parallax = player getVariable [format["cse_AB_Parallax:%1", _opticsName], 0];
	
	while {sunOrMoon == 1 && cameraView == "GUNNER" && _parallax > 0} do {
		_vectorToFocalPoint = (ATLToASL(screenToWorld [0.5,0.5])) vectorDiff (getPosASL player);
		_focusLength = vectorMagnitude _vectorToFocalPoint;
		if (_focusLength > 0) then {
			_vectorToFocalPoint = _vectorToFocalPoint vectorMultiply (_parallax / _focusLength);
		};
		_focusLength = vectorMagnitude _vectorToFocalPoint;
		_focalPoint = (getPosASL player) vectorAdd _vectorToFocalPoint;
		
		_roughnessLength = _focalPoint call cse_ab_ballistics_fnc_calculate_roughness_length;
		_distCoef = (1 max (_focusLength / 100)) ^ 0.5;
		_focalPlaneAngle = (getDir player) + 90;
		_windSpeedRef = vectorMagnitude wind;
		_particleSize = 0.5 * _distCoef;
		_particleMoveVelocityRef = [0, 0, 0.01] vectorAdd ((vectorNormalized wind) vectorMultiply (0.1));
		for "_j" from -10 to 10 do {
			for "_i" from -10 to 10 do {
				_pASL = [(_focalPoint select 0) + _j / 2 * _distCoef * sin(_focalPlaneAngle), (_focalPoint select 1) + _j / 2 * _distCoef * cos(_focalPlaneAngle), (_focalPoint select 2) + _i / 2 * _distCoef];
				_pATL = ASLToATL _pASL;
				_windSpeed = _windSpeedRef;
				_height = _pATL select 2;
				if (_height < 20) then {
					_windSpeed = _windSpeed * ln(_height / _roughnessLength) / ln(20 / _roughnessLength);
				};
				_particleMoveVelocity = _particleMoveVelocityRef vectorMultiply _windSpeed;
				drop ["\A3\data_f\ParticleEffects\Universal\Refract","","Billboard",1,8,_pATL,_particleMoveVelocity,0,1.275,1,0,[_particleSize,_particleSize],[[0,0,0,0.3],[0,0,0,0.15]],[1,0],0,0,"","",""];
			};
		};
		_parallax = player getVariable [format["cse_AB_Parallax:%1", _opticsName], 0];
		sleep 1;
	};
	sleep 1;
};
