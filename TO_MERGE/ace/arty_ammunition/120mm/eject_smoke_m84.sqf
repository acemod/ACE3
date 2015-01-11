//eject_dpicm.sqf
#define PRNG(number) (random (number))
#define SMOKE_SPREAD 40

private["_roundSettings", "_roundData", "_seed", "_seedSeq", "_velocity", "_gVel", "_rv", "_pos"];
private["_p", "_vP", "_vH", "_vA", "_sMin", "_sMax", "_az", "_el", "_g", "_grenades", "_v"];

_shell = _this select 6;

_roundSettings = [];
_roundData = (_fireEHParams select 0) getVariable "ace_sys_arty_roundData"; // ERRRRROORR: _fireEHParams is not defined !!!!!!
{
	if((_x select 0) == _shell) exitWith {
		_roundSettings = _x;
	};
} forEach _roundData;

_seed = 101;
if((count _roundSettings) > 0) then {
	_seed = _roundSettings select 3;
};

_seedSeq = _seed call ace_sys_arty_fnc_randomSequence;

_velocity = velocity _shell;
_pos = getPos _shell;
_p = [0,0,0];
if (!((_velocity select 0) == 0 && {(_velocity select 1) == 0} && {(_velocity select 2) == 0})) then { // velocity not 0
  _gVel = [_velocity,0.125] call ACE_fnc_vectorMultiply;
  _p = (_gVel call CBA_fnc_vect2Polar);
};
//setAccTime 0.25;
_vP = (abs(_p select 2)/90);
_vH = ((abs(_p select 2)/45) min 1);
_vA = 360*_vH*_vP;
_vA = (SMOKE_SPREAD + _vA) mod 360;

_sMin = ((_vA)/2)*-1;
_sMax = (_vA);
////player sideChat format["p: %4 va: %1 vP: %2 vH: %3", _sMax, _vP, _vH, (_p select 2)];
_grenades = [];
for "_i" from 1 to 3 do {
	_az = (_p select 1);

	_az = _az + (_sMin + (PRNG(_sMax)));
	
	if(_az < 0) then {
		_az = _az + 360;
	} else {
		if(_az >= 360) then {
			_az = _az - 360;
		};
	};
	
	_el = (_p select 2);
	
	_el = _el + (-20*1.5 + (PRNG(40)));
	
	if(_el > 90) then {
		_el = abs(_el - 180);
		_az = (_az + 180) mod 360;
	};
	
	if(_el < -90) then {
		_el = (_el + 180)*-1;
		_az = (_az + 180) mod 360;
	};
	
	_v = [(_p select 0) + (-5 + (PRNG(10))), _az, _el] call CBA_fnc_polar2vect;
	
	_g = "ace_arty_105mm_m84a1_m782_smokeCanisterHC" createVehicle [((_pos select 0) + PRNG(0.5)), ((_pos select 1) + PRNG(0.5)), ((_pos select 2) + PRNG(0.5))];
	//_g setVelocity _v;
	_grenades set[(count _grenades), [_g, _v]];
};

["ace_arty_ammo_105mmSmokeEvent", [_grenades]] call CBA_fnc_globalEvent;

false