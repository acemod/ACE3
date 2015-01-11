#include "script_component.hpp"

if(isServer) then {
	_this spawn {
		waitUntil { time > 0; };
		private["_m119", "_pitchBank", "_dir", "_rd", "_wpos", "_offset", "_stake1pos", "_rdDeg", "_stake1", "_stake2"];
		//for "_i" from 0 to 360 do {
		_m119 = _this;

		
		_pitchBank = _m119 call BIS_fnc_getPitchBank;
		
		
		_pitchBank = _m119 call BIS_fnc_getPitchBank;
		
		_m119 setVectorUp [0,0,0.0001];

		_dir = getDir _m119;
		//player sideChat format["_dir: %1", _dir];
		_stakesInfo = _m119 getVariable ["ace_arty_stakes_setup", [400, 25]];
		_colInfo = _m119 getVariable ["ace_arty_collimator_setup", [800, 7, 0, -95, 85]];
		diag_log text format["stakesInfo: %1", (count _stakesInfo)];
		if((count _stakesInfo) == 2) then {
			_stakesDeflection = _stakesInfo select 0;
			_stakesDistance = _stakesInfo select 1;
			_rd = (DEG2MIL(_dir)-(_stakesDeflection-0.4));
			if(_rd < 0) then {
				_rd = _rd + 6400;
			};
			_rdDeg = MIL2DEG(_rd);
			_wpos = _m119 modelToWorld [-0.593, -0.668, 0];
			_wpos set[2, 0];


			_offset = ((_rdDeg)+MIL2DEG(0.2)) mod 360;
			if(_offset < 360) then {
				_offset = _offset + 360;
			};
			_stake1pos = [_wpos, _stakesDistance, _offset] call BIS_fnc_relPos;
			_stake2pos = [_wpos, (_stakesDistance*2), _rdDeg] call BIS_fnc_relPos;

			_stake1pos set[2, -0.5];
			_stake1 = "ACE_Arty_AimingPost_M1A2_M58" createVehicle _wpos;
			
			_stake1 setDir _rdDeg+180 mod 360;
			_stake1 setPos _stake1pos;
			_stake1 setVectorUp [0,0,0.0001];
			
			_stake2 = "ACE_Arty_AimingPost_M1A2_M59" createVehicle _wpos;
			
			_stake2 setDir _rdDeg+180 mod 360;
			_stake2 setPosATL _stake2pos;
			_stake2 setVectorUp [0,0,0.0001];
			if((count _colInfo) != 5) then {
				_m119 animate ["M137OpticRevolve", _stakesDeflection];
				_m119 setVariable [QGVAR(resetCounter), 3200-_stakesDeflection, true];
			};
		};
		
		
		if((count _colInfo) == 5) then {
			_colDeflection = _colInfo select 0;
			_colDistance = _colInfo select 1;
			_colHeight = _colInfo select 2;
			_opticElevate = _colInfo select 3;
			_colElevate = _colInfo select 4;
			
			_rd = (DEG2MIL(_dir)-(_colDeflection-0.125));
			if(_rd < 0) then {
				_rd = _rd + 6400;
			};
			_rdDeg = MIL2DEG(_rd);
			_colPos = [_wpos, _colDistance, _rdDeg] call BIS_fnc_relPos;
			_colPos set[2, _colHeight];
			
			_collimator = "ACE_Arty_M1A1_Collimator" createVehicle _wpos;

			_collimator setDir _rdDeg;
			_collimator setPos _colPos;
			_collimator setVectorUp [0,0,0.0001];
			_m119 animate ["M137OpticElevate", _opticElevate];
			_collimator animate ["elevate_optic", _colElevate];
			_m119 animate ["M137OpticRevolve", _colDeflection];
			_m119 setVariable [QGVAR(resetCounter), 3200-_colDeflection, true];
		};
		// _m119 setVariable [QGVAR(resetCounter)), (_m119 getVariable QUOTE(GVAR(resetPhase)), true];
	};
};
