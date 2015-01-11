//fuze_delay.sqf
_shell = _this select 6;
[
	{
		if (alive _shell) then {
			_pvel = _lastVel;
			_ppos = _lastPos;
			_lastPos = getPosASL _shell;
			_lastVel = velocity _shell;
		};
		
	},
	[_shell,_gun],
	0, // delay
	{
		_shell = _this select 0;
		_lastPos = [];
		_lastVel = [];
		_pvel = [];
		_ppos = [];
	},
	{
		_v = "ace_arty_81mm_m821a2_delay_action" createVehicle [0,0,10000];
		_v setPosASL _lastPos;
		[_v] call ace_sys_frag_fnc_addManualTrack;
		_vel = [_pvel,0.75] call ACE_fnc_vectorMultiply;
		_unitVec = _vel call ACE_fnc_unitVector;
		_minPen = 0.01;
		_maxPen = 0.100;
		_pen = ((random 1)*_maxPen) max _minPen;
		_vadd = [_unitVec,_pen] call ACE_fnc_vectorMultiply;
		_pos = [_lastPos,_vadd] call ACE_fnc_vectorAdd;
		_pos set[2, (_pos select 2) max 0];
		_v setPosASL _pos;
		_vel set[0, (_vel select 0) + random (0.5)];
		_vel set[1, (_vel select 1) + random (0.5)];
		_vel set[2, (_vel select 2) + random (0.5)];
		_v setVelocity _vel;
	},
	{
		true
	},
	{!alive _shell},
	[ 
		"_shell", "_lastPos", "_lastVel", "_pvel", "_ppos"
	]
] call cba_common_fnc_addPerFrameHandlerLogic;