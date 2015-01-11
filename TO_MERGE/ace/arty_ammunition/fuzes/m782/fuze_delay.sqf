//fuze_delay.sqf
_shell = _this select 6;
[
	{
		if(alive _shell) then {
			_pvel = _lastVel;
			_ppos = _lastPos;
			_lastPos = getPosASL _shell;
			_lastVel = velocity _shell;
		};
		
	},
	[_shell,_gun],
	0, // delay
	{
		//init
		_shell = _this select 0;
		_lastPos = [];
		_lastVel = [];
		_pvel = [];
		_ppos = [];
	},
	{
		//player sideChat format["lastPos: %1 lastVel: %2", _lastPos, _lastVel];
		_v = "ace_arty_105mm_m1_delay_action" createVehicle [0,0,10000];
		_v setPosASL _lastPos;
		[_v] call ace_sys_frag_fnc_addManualTrack;
		//STARTPOS = _lastPos;
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
		// STARTTIME = diag_tickTime;
		// setAccTime 0.01;
		// _func = {
			// _shell = (_this select 0) select 0;
			// drop ["\Ca\Data\Cl_basic","","Billboard",1,20,(getPos _shell),[0,0,0],1,1.275,1.0,0.0,[0.25],[[1,0,0,0.5]],[0],0.0,2.0,"","",""];
			// if(alive _shell) then {
				// FINALPOS = getPosASL _shell;
				// player sideChat format["p: %1 %2 %3", FINALPOS, (velocity _shell)];
			// };
			// if(!(alive _shell)) then {
				// [(_this select 1)] call cba_fnc_removePerFrameHandler;
				// setAccTime 1;
				// player sideChat format["d: %1 t: %2 v: %3", (STARTPOS distance FINALPOS), diag_tickTime-STARTTIME, (velocity _shell)];
			// };
		// };
		// [_func, 0, [_v]] call CBA_fnc_addPerFrameHandler;
	},
	{
		true
	},
	{!alive _shell},
	[ 
		"_shell", "_lastPos", "_lastVel", "_pvel", "_ppos"
	]
] call cba_common_fnc_addPerFrameHandlerLogic;