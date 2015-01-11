//eject_dpicm.sqf
#define PRNG(number) (random (number)) //([_seedSeq, 0, number] call ace_sys_arty_fnc_prng)
#define DPICM_SPREAD 25

private["_roundSettings", "_roundData", "_seed", "_seedSeq", "_velocity", "_gVel", "_rv", "_pos"];
private["_p", "_vP", "_vH", "_vA", "_sMin", "_sMax", "_az", "_el", "_g"];

_shell = _this select 6;

_roundSettings = [];
_roundData = (_fireEHParams select 0) getVariable "ace_sys_arty_roundData";
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

if ((_velocity select 0) != 0 && {(_velocity select 1) != 0} && {(_velocity select 2) != 0}) then { // velocity not 0
 
  _gVel = [_velocity,0.25] call ACE_fnc_vectorMultiply;
  _rv = (3.6*sqrt((_gVel select 0)^2 + (_gVel select 1)^2 + (_gVel select 2)^2))*0.278;
  _pos = getPos _shell;
  
  _p = (_gVel call CBA_fnc_vect2Polar);
  
  _vP = (abs(_p select 2)/90);
  _vH = ((abs(_p select 2)/45) min 1);
  _vA = 360*_vH*_vP;
  _vA = (DPICM_SPREAD + _vA) mod 360;
  
  _sMin = ((_vA)/2)*-1;
  _sMax = (_vA);
  for "_i" from 1 to 42 do {
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
  	
  	_g = "ace_arty_dpicm_m80" createVehicle [((_pos select 0) + PRNG(0.5)), ((_pos select 1) + PRNG(0.5)), ((_pos select 2) + PRNG(0.5))];
  	_g setVelocity _v;
  	//_g setVectorDir _v;
  	_g setPos [((_pos select 0) + PRNG(0.5)), ((_pos select 1) + PRNG(0.5)), ((_pos select 2) + PRNG(0.5))];
  	//_g setVelocity _v;
  	#ifdef DEBUG_MODE_FULL
  		[_g, _marker] spawn {
  			private ["_bbb"];
  			_bbb = _this select 0;
  			_marker = _this select 1;
  			
  			waitUntil {
  				if(alive _bbb) then {
  					drop ["\Ca\Data\Cl_basic","","Billboard",1,5,(getPos _bbb),[0,0,0],1,1.275,1.0,0.0,[1],[[1,0,0,1]],[0],0.0,2.0,"","",""];
  					_marker = createMarkerLocal [format["m%1", random(1000)+time], (getPos _bbb)];
  					_marker setMarkerTypeLocal "Dot";
  					_marker setMarkerColorLocal "ColorRed";
  					
  					_marker setMarkerSizeLocal [0.1, 0.1];
  				};
  				(!alive _bbb)
  			};
  			_marker setMarkerColorLocal "ColorGreen";
  			_marker setMarkerSizeLocal [0.6, 0.6];
  		};
  	#endif
  };
  false

};