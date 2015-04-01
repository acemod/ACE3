//fnc_fired.sqf
#include "script_component.hpp"
#define DRAGON_VELOCITY	100
#define SERVICE_INTERVAL	0.3
#define DRAGON_SERVICE_COUNT	60
#define DRAGON_TRIM 1
#define TRACKINTERVAL 0.025

if ((_this select 0) == player || {(gunner (_this select 0)) == player}) then {
	if ((typeOf (_this select 6)) == "M_47_AT_EP1") then {
		_missile = (_this select 6);
		_vel = velocity _missile;
		_ppos = getPosASL _missile;
		_missile setPosATL [_ppos select 0, _ppos select 1, 5000];
		_unitVec = _vel call ACE_fnc_unitVector;
		_spawnPos = [(_ppos select 0) + (_unitVec select 0), (_ppos select 1) + (_unitVec select 1), (_ppos select 2) + (_unitVec select 2)];
		_shell = "ace_missile_dragon" createVehicle _spawnPos;
		_this set[6, _shell];
		_shell setPosASL _spawnPos;
		
		_newVel = [_unitVec, DRAGON_VELOCITY*1.25] call ACE_fnc_vectorMultiply;
		_shell setVelocity _newVel;
		_shell setVectorDir _unitVec;
		_gunner = _this select 0;
		//setAccTime 0.2;
		
		[
			{
				_unitVec = (velocity _shell) call ACE_fnc_unitVector;
				_polar = _unitVec call CBA_fnc_vect2polar;
				_spos = getPosATL _shell;
				_ppos = getPosASL _shell;
				_screenPos = if (_spos select 2 > _ppos select 2) then {worldToScreen _ppos} else {worldToScreen _spos};
				
				if (count _screenPos > 0 && {alive _gunner}) then {
					_x = (((_screenPos select 0) - 0.5) max -1) min 1;
					_y = (((_screenPos select 1) - 0.45) max -1) min 1;
					_m = ((_shell distance _gunner)*0.009);
					
					//player sideChat format["x: %1, y: %2 m: %3 di: %4 spd: %5", _x*_m, _y*_m*-1, _m, (_shell distance _gunner), (speed _shell)];
					
					_yDeg = 2.1;
					_xDeg = 1.6;
					_difEl = _yDeg*(_y*_m);
					_difEl = ((_difEl min _yDeg) max (_yDeg*-1));
					if(_difEl < 0) then {
						_difEl = _difEl / 2;
					};
					_dir = _xDeg*(_x*_m)*-1;
					_dir = ((_dir min _xDeg) max (_xDeg*-1));
					_difDir = (_polar select 1) + _dir;
					if (_difDir < 0) then {_difDir = _difDir + 360};
					if (_difDir > 360) then {_difDir = _difDir - 360};
					//drop ["\Ca\Data\Cl_basic","","Billboard",1,5,(getPos _shell),[0,0,0],1,1.275,1.0,0.0,[1],[[1,0,0,0.25]],[0],0.0,2.0,"","",""];
					_firedAdjust = false;
					_shellVelocity = velocity _shell;
					_speed = (3.6*sqrt((_shellVelocity select 0)^2 + (_shellVelocity select 1)^2 + (_shellVelocity select 2)^2))*0.278;
					//hint format["speed: %1\ndistance: %2\ntime: %3", _speed, (_gunner distance _shell), diag_tickTime-_startTime];
					if (diag_tickTime >= _timerCorrect && {_chargeCount > 0}) then {
						if ((abs _dir) >= _xDeg/2) then {
							_firedAdjust = true;
							_difDir = (_polar select 1) + (_dir*0.25);
							if (_difDir < 0) then {_difDir = _difDir + 360};
							if (_difDir > 360) then {_difDir = _difDir - 360};
							//player sideChat "CORRECT!";
							_timerCorrect = diag_tickTime+(SERVICE_INTERVAL*2);
							_newVel = [DRAGON_VELOCITY, (_difDir), (_polar select 2)+(_difEl*0.25)+DRAGON_TRIM] call CBA_fnc_polar2vect;
							_shell setVelocity _newVel;
							_shell setVectorDir  (_newVel call ACE_fnc_unitVector);
							"ace_m47_dragon_serviceCharge" createVehicle (getPos _shell);
							_chargeCount = _chargeCount - 1;
						};
					};
					
					if (!_firedAdjust && {diag_tickTime >= _timer} && {_chargeCount > 0}) then {
						_timer = diag_tickTime+SERVICE_INTERVAL;
						
						_newVel = [DRAGON_VELOCITY, _difDir, (_polar select 2)+(_difEl)+DRAGON_TRIM] call CBA_fnc_polar2vect;
						//_newVel = [(velocity _shell), _newVel] call ACE_fnc_vectorAdd;
						// if(_difEl > 0) then {
							// drop ["\Ca\Data\Cl_basic","","Billboard",1,5,(getPos _shell),[0,0,0],1,1.275,1.0,0.0,[0.5],[[0,1,0,1]],[0],0.0,2.0,"","",""];
						// } else {
							// drop ["\Ca\Data\Cl_basic","","Billboard",1,5,(getPos _shell),[0,0,0],1,1.275,1.0,0.0,[0.5],[[0,0,1,1]],[0],0.0,2.0,"","",""];
						// };
						_shell setVelocity _newVel;
						_shell setVectorDir (_newVel call ACE_fnc_unitVector);
						
						// charge FX
						_shellCharge = "ace_m47_dragon_serviceCharge" createVehicle _ppos;
						_shellCharge setPosASL _ppos;
						_chargeCount = _chargeCount - 1;
					};
				};
				_missile setPosATL [_ppos select 0, _ppos select 1, 5000];
				_prevTime = diag_tickTime;
			},
			[_shell,_gunner,_unitVec,_missile],
			0.0, // delay
			{
				//init
				_shell = _this select 0;
				_gunner = _this select 1;
				_chargeCount = DRAGON_SERVICE_COUNT;
				_timer = diag_tickTime+SERVICE_INTERVAL;
				_timerCorrect = _timer;
				_originalVec = _this select 2;
				_originalPolar = _originalVec call CBA_fnc_vect2polar;
				_targetPolar = +_originalPolar;
				_startTime = diag_tickTime;
				_lastX = 1000;
				_lastY = 1000;
				// Return original missile at explosion
				_missile = _this select 3;
				// start from beginning
				_prevTime = diag_tickTime - TRACKINTERVAL;
			},
			{
				// exit
				if !(isNull _missile) then {
					_missile setVelocity _newVel;
					_missile setVectorDir (_newVel call ACE_fnc_unitVector);
					_missile setPosASL _ppos;
				};
			},
			{
				diag_tickTime - _prevTime > TRACKINTERVAL
			},
			{!alive _shell},
			[ 
				"_shell", "_gunner", "_chargeCount", "_timer", "_originalVec", "_originalPolar", "_timerCorrect", "_startTime", "_lastX", "_lastY",
				"_missile", "_ppos", "_newVel", "_prevTime"
			]
		] call cba_common_fnc_addPerFrameHandlerLogic;
	};
};