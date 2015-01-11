#include "script_component.hpp"

if (isServer) then {
	_this spawn {
		waitUntil { time > 0 };
		private["_mortar", "_pitchBank", "_dir", "_rd", "_wpos", "_offset", "_stake1pos", "_rdDeg", "_stake1", "_stake2"];

		_mortar = _this;

		_pitchBank = _mortar call BIS_fnc_getPitchBank;
		_pitchBank = _mortar call BIS_fnc_getPitchBank;
		
		_mortar setVectorUp [0,0,0.0001];

		_dir = getDir _mortar;
		_stakesInfo = if (time < 30) then { [400,25] } else { [] };
		_colInfo = _mortar getVariable ["ace_arty_collimator_setup", []];
		_offsetPos = getArray(configFile >> "CfgVehicles" >> (typeOf _mortar) >> "ACE_ARTY_SETUP_OFFSETPOS");
		_offsetAngle = 0.37;//getNumber(configFile >> "CfgVehicles" >> (typeOf _mortar) >> "ACE_ARTY_SETUP_OFFSET_STAKEANGLE");
		if (count _stakesInfo == 2) then {
			_stakesDeflection = _stakesInfo select 0;
			_stakesDistance = _stakesInfo select 1;
			_rd = DEG2MIL(_dir) - (_stakesDeflection-0.4);
			if (_rd < 0) then {
				_rd = _rd + 6400;
			};
			_rdDeg = MIL2DEG(_rd);
			_wpos = _mortar modelToWorld _offsetPos;
			_wpos set[2, 0];

			_offset = (_rdDeg + MIL2DEG(_offsetAngle)) mod 360;
			if(_offset < 360) then {
				_offset = _offset + 360;
			};
			_stake1pos = [_wpos, _stakesDistance, _offset] call BIS_fnc_relPos;
			_stake2pos = [_wpos, (_stakesDistance*2), _offset] call BIS_fnc_relPos;

			_stake1pos set[2, -0.75];
			_stake1 = "ACE_Arty_AimingPost_M1A2_M58" createVehicle _wpos;
			
			_stake1 setDir _rdDeg+180 mod 360;
			_stake1 setPos _stake1pos;
			_stake1 setVectorUp [0,0,0.0001];
			
			_stake2 = "ACE_Arty_AimingPost_M1A2_M59" createVehicle _wpos;
			
			_stake2 setDir _rdDeg + 180 mod 360;
			_stake2pos set[2, -0.5];
			_stake2 setPosATL _stake2pos;
			
			_stake2 setVectorUp [0,0,0.0001];
			if (count _colInfo != 5) then {
				_mortar animate ["OpticRevolve", _stakesDeflection];
				_mortar setVariable [QGVAR(resetCounter), 3200-_stakesDeflection, true];
				_mortar animate ["OpticElevate", 1100];
			};
		};
		//_mortar setVariable [QGVAR(resetCounter), 3200+(_m119 getVariable QUOTE(GVAR(resetPhase))), true];
	};
};
