/**
 * fn_handleBackblast_BB.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_unitFired","_firedDistance","_weaponFired","_backblastAngle","_backblastRange","_backblastDamage","_direction","_distance","_relativePosition","_relativeDirection","_relativeAzimuth","_relativeInclination","_return","_handle","_percentage","_doDamage", "_weaponDir", "_positionEndLauncher", "_positionBehindMax", "_positionBehindNoObj"];

_unit = _this select 0;
if (!local _unit) exitwith {};
_unitFired = _this select 1;
_firedDistance = _this select 2;
_weaponFired = _this select 3;

if (!CSE_BACKBLAST_EFFECT_AI_BB && !(IsPlayer _unit)) exitwith {};
if (vehicle _unit != _unit) exitWith {};

_return = false;

_backblastDamage = getNumber (configFile >> "CfgWeapons" >> _weaponFired >> "cse_backblastDamage");
if (_backblastDamage == 0) exitwith {};
if (_unit != _unitFired) then {
	_noObjectDistance = getNumber (configFile >> "CfgWeapons" >> _weaponFired >> "cse_backblast_noObjectDistance");
	_backblastDistance = (getNumber (configFile >> "CfgWeapons" >> _weaponFired >> "cse_backblast_maxDistance"));
	if ((_noObjectDistance + _backblastDistance) < _firedDistance) exitwith {};

	_doDamage = _backblastDamage;
	if (_firedDistance > _noObjectDistance ) then {
		_percentage = (_firedDistance / _backblastDistance);
		if (_percentage < 1) then {
			_doDamage = _backblastDamage * _percentage;
		};
	};
	// _doDamage = _backblastDamage / (_backblastDistance-(_firedDistance^(1/2)));

	_doDamage = _doDamage * CSE_BACKBLAST_DAMAGE_MODIFIER_BB;

	_weaponDir = _unitFired weaponDirection currentWeapon _unitFired;
	_positionEndLauncher = ATLtoASL ((_unitFired modelToWorld (_unitFired selectionPosition "RightHand")) vectorAdd (_weaponDir vectorMultiply (0.5)));
	_positionBehindNoObj = _positionEndLauncher vectorAdd (_weaponDir vectorMultiply _noObjectDistance);
	_positionBehindMax = _positionEndLauncher vectorAdd (_weaponDir vectorMultiply (_noObjectDistance + _backblastDistance));


	_direction = direction _unitFired;

	_backblastAngle = getNumber (configFile >> "CfgWeapons" >> _weaponFired >> "cse_backblastAngle");
	if ([position _unitFired,_direction - 180,_backblastAngle / 2,position _unit] call BIS_fnc_inAngleSector) then {

		_line = [_positionEndLauncher, eyePos _unit, _unit, _unitFired];
		if ((!lineIntersects _line) /*&& {!terrainIntersect [_positionEndLauncher, getPosASL _unit]}*/) then {
			_return = true;

			if (["cse_sys_medical"] call cse_fnc_isModuleEnabled_F) then {
				if (random(1)>0.5) then {
					[_unit,"body",(damage _unit + (random(_doDamage))),_unitFired,_weaponFired,"backblast"] spawn cse_fnc_handleDamage_CMS;
				};
				if (random(1)>0.5) then {
					[_unit,"head",(damage _unit + (random(_doDamage))),_unitFired,_weaponFired,"backblast"] spawn cse_fnc_handleDamage_CMS;
				};
				if (random(1)>0.5) then {
					[_unit,"legs",(damage _unit + (random(_doDamage))),_unitFired,_weaponFired,"backblast"] spawn cse_fnc_handleDamage_CMS;
				};
				if (random(1)>0.5) then {
					[_unit,"arms",(damage _unit + (random(_doDamage))),_unitFired,_weaponFired,"backblast"] spawn cse_fnc_handleDamage_CMS;
				};
				[_unit, _backblastDamage, 0] call cse_fnc_increasePain_CMS;

				if (random(1)>0.1) then {
					[_unit] call cse_fnc_setProne;
					[_unit] call cse_fnc_setUnconsciousState;
				} else {
					[_unit,_doDamage] call cse_fnc_reactionToHit_CMS;
				};
			} else {
				_unit setDamage (damage _unit + _doDamage) min 0.95;
				if (random(1)>0.1) then {
					[_unit] call cse_fnc_setProne;
				};
			};

			if (isPlayer _unit) then {
				playSound "combat_deafness";
				[_doDamage] call BIS_fnc_bloodEffect;
				[_unit,0.5] call BIS_fnc_dirtEffect;
			};
		};
	};
} else {
	_noObjectDistance = getNumber (configFile >> "CfgWeapons" >> _weaponFired >> "cse_backblast_noObjectDistance");
	if (CSE_BACKBLAST_AFFECTS_INBUILDING_BB || CSE_BACKBLAST_AFFECTS_ADVANCED_BB) then {
		if ([_unitFired] call cse_fnc_isInBuilding || CSE_BACKBLAST_AFFECTS_ADVANCED_BB) then {
			private ["_eyePos","_buildingBehind","_obj"];
			_eyePos = eyePos _unit;
			_buildingBehind = false;

			_weaponDir = _unitFired weaponDirection currentWeapon _unitFired;
			_positionEndLauncher = ATLtoASL ((_unitFired modelToWorld (_unitFired selectionPosition "RightHand")) vectorAdd (_weaponDir vectorMultiply (0.5)));
			_positionBehindNoObj = _positionEndLauncher vectorAdd (_weaponDir vectorMultiply _noObjectDistance);
			_positionBehindMax = _positionEndLauncher vectorAdd (_weaponDir vectorMultiply (_noObjectDistance + _backblastDistance));


			_obj = (lineIntersectsWith [_positionEndLauncher, _positionBehindNoObj, _unit]);
			_buildingBehind = ({(_x isKindOf "Building")}count _obj) > 0;

			if (CSE_BACKBLAST_AFFECTS_ADVANCED_BB) then {
				if (!_buildingBehind) then {
					_buildingBehind = (terrainIntersect [_positionEndLauncher, _positionBehindNoObj]);
				};
			};

			if (_buildingBehind) then {
				_return = true;
				//_backblastDamage = _backblastDamage * CSE_BACKBLAST_DAMAGE_MODIFIER_BB;
				if (["cse_sys_medical"] call cse_fnc_isModuleEnabled_F) then {
					if (random(1)>0.5) then {
						_handle = [_unit,"body",(damage _unit + (random(_backblastDamage))),_unitFired,_weaponFired,"backblast"] spawn cse_fnc_handleDamage_CMS;
					};
					if (random(1)>0.5) then {
						_handle = [_unit,"head",(damage _unit + (random(_backblastDamage))),_unitFired,_weaponFired,"backblast"] spawn cse_fnc_handleDamage_CMS;
					};
					if (random(1)>0.5) then {
						_handle = [_unit,"legs",(damage _unit + (random(_backblastDamage))),_unitFired,_weaponFired,"backblast"] spawn cse_fnc_handleDamage_CMS;
					};
					if (random(1)>0.5) then {
						_handle = [_unit,"arms",(damage _unit + (random(_backblastDamage))),_unitFired,_weaponFired,"backblast"] spawn cse_fnc_handleDamage_CMS;
					};
					[_unit,_backblastDamage,0] call cse_fnc_increasePain_CMS;

					if (random(1)>0.1) then {
						[_unit] call cse_fnc_setUnconsciousState;
					} else {
						[_unit,_backblastDamage] call cse_fnc_reactionToHit_CMS;
					};
				} else {
					_unit setDamage (damage _unit + 0.2);
					if (random(1)>0.1) then {
						[_unit] call cse_fnc_setProne;
					};
				};
				if (isPlayer _unit) then {
					playSound "combat_deafness";
					[_backblastDamage] call BIS_fnc_bloodEffect;
					[_unit,0.5] call BIS_fnc_dirtEffect;
				};
			};
		};
	};
};
_return