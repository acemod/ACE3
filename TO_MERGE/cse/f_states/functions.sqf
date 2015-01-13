/*

*/


	cse_fnc_setCanSwitchAnim = {
		private ["_unit","_to","_return"];
		_unit = _this select 0;
		_to = _this select 1;
		_return = false;
		if (((typeName _to) == "BOOL")) then {
			_unit setvariable ["cse_canSwitchAnimation",_to,true];
			_return = true;
		};
	_return
	};
	cse_fnc_getCanSwitchAnim = {
	private ["_unit","_return"];
		_unit = _this select 0;
		_return = _unit getvariable "cse_canSwitchAnimation";
	_return
	};

	cse_fnc_setCurrentMenu = {
		_unit = _this select 0;
		_to = _this select 1;
		_return = false;
		if ((typeName _to) == "STRING") then {
			_unit setvariable ["cse_currentMenu",_to,true];
			_return = true;
		};
	_return
	};
	cse_fnc_getCurrentMenu = {
		_unit = _this select 0;
		_return = _unit getvariable ["cse_currentMenu",""];
		_return
	};

	cse_fnc_changeBlurialVisionState = {
		private ["_unit","_to"];
		_unit = _this select 0;
		_to = _this select 1;
		_return = false;
		if (((typeName _to) == "SCALAR")) then {
			if (_to < -1) then {
				_to = -1;
			} else {
				if (_to > 1) then {
					_to = 1;
				};
			};
			_unit setvariable ["cse_blurialVisualState", [_unit] call cse_fnc_getBlurialVisionState + _to,false];
			_return = true;
		};
	_return
	};
	cse_fnc_getBlurialVisionState = {
		private ["_unit"];
		_unit = _this select 0;
		_return = _unit getvariable ["cse_blurialVisualState",0];
	_return
	};

	// EVERYTHING BELOW HERE IS STILL WORK IN PROGRESS

	cse_fnc_setMovementState = {
		private ["_unit","_to"];
		_unit = _this select 0;
		_to = _this select 1;
		_return = false;
		if (((typeName _to) == "SCALAR")) then {
			_unit setvariable ["cse_movementState",_to,false];
			_return = true;
		};
	_return
	};
	cse_fnc_getMovementState = {
		private ["_unit"];
		_unit = _this select 0;
		_return = _unit getvariable ["cse_movementState",0];
		_return
	};

	cse_fnc_setHearingState = {
		private ["_unit","_to"];
		_unit = _this select 0;
		_to = _this select 1;
		_return = false;
		if (((typeName _to) == "SCALAR")) then {
			_unit setvariable ["cse_hearingState",_to,false];
			_return = true;
		};
	_return
	};
	cse_fnc_getHearingState = {
		private ["_unit"];
		_unit = _this select 0;
		_return = _unit getvariable ["cse_hearingState",0];
		_return
	};



