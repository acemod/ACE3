/**
 * fn_bandageOpening_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define CFG_DEFAULT_WAITING_TIME 900 + random(120)
#define WAITINGTIME 1
#define RATIO 2
#define CHANCE 3

private ["_person","_amount","_bodyPart","_woundClass","_item","_config","_found"];
_person = _this select 0;
_amount = _this select 1;
_bodyPart = _this select 2;
_woundClass = _this select 3;
_item = _this select 4;

// classname, waiting time until wound opens, ratio in which it start bleeding again, chance of the wound ever opening up //
_config = [
	["cse_bandage_basic", 900 + random (120), 0.75, 0.4],
	["cse_packing_bandage", 1200 + random (120), 0.5, 0.6],
	["cse_bandageElastic", 900 + random (900), 0.75, 0.2],
	["cse_quikclot", 1, 0.1, 0]
];
_found = false;
{
	if (_item == _x select 0) exitwith {
		if (random(1)> (1 - (_x select CHANCE))) then {
			_found = true;
			sleep (_x select WAITINGTIME);
			_bandagedWounds = [_person,QGVAR(bandagedWounds)] call EFUNC(common,getDefinedVariable);
			_bandagedBodyPart = _bandagedWounds select _bodyPart;
			_bandagedWoundClass = _bandagedBodyPart select _woundClass;
			if (_bandagedWoundClass >= _amount) then {
				_openWounds =[_person,QGVAR(openWounds)] call EFUNC(common,getDefinedVariable);
				_openWoundsBodyPart = _openWounds select _bodyPart;
				_openWoundClass = _openWoundsBodyPart select _woundClass;

				_bandagedBodyPart set [_woundClass,_bandagedWoundClass - (_amount * (_x select RATIO))];
				_openWoundsBodyPart set [_woundClass,_openWoundClass + (_amount * (_x select RATIO))];

				_bandagedWounds set[_bodyPart,_bandagedBodyPart];
				_openWounds set[_bodyPart,_openWoundsBodyPart];
				[_person,QGVAR(openWounds),_openWounds] call EFUNC(common,setDefinedVariable);
				[_person,QGVAR(bandagedWounds),_bandagedWounds] call EFUNC(common,setDefinedVariable);
			};
		};
	};
}foreach _config;

if (!_found && (random(1)>0.2)) then {
	sleep CFG_DEFAULT_WAITING_TIME;
	_bandagedWounds = [_person,QGVAR(bandagedWounds)] call EFUNC(common,getDefinedVariable);
	_bandagedBodyPart = _bandagedWounds select _bodyPart;
	_bandagedWoundClass = _bandagedBodyPart select _woundClass;

	if (_bandagedWoundClass >= _amount) then {
		_openWounds =[_person,QGVAR(openWounds)] call EFUNC(common,getDefinedVariable);
		_openWoundsBodyPart = _openWounds select _bodyPart;
		_openWoundClass = _openWoundsBodyPart select _woundClass;

		_bandagedBodyPart set [_woundClass,_bandagedWoundClass - _amount];
		_openWoundsBodyPart set [_woundClass,_openWoundClass + _amount];

		_bandagedWounds set[_bodyPart,_bandagedBodyPart];
		_openWounds set[_bodyPart,_openWoundsBodyPart];
		[_person,QGVAR(openWounds),_openWounds] call EFUNC(common,setDefinedVariable);
		[_person,QGVAR(bandagedWounds),_bandagedWounds] call EFUNC(common,setDefinedVariable);
	};
};

