/**
 * fn_sideBarHasMap_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_currentApp","_cfg","_hasMap","_return"];
//_currentApp = call cse_fnc_getCurrentApplication_CC;
_return = false;
/*_cfg = (missionConfigFile >> "Combat_Space_Enhancement" >> "command_and_control" >> "applications" >> _currentApp >> "sideBar");
_hasMap = 0;
if (isClass _cfg) then {
	for [{_i=0},{_i < (count _cfg)},{_i=_i+1}] do {
		if (isClass (_cfg select _i)) then {
			private ["_type"];
			_type = getText ((_cfg select _i) >> "type");
			if (_type == "map") then {
				_hasMap = _hasMap + 1;
			};
		};
	};
};

if (_hasMap > 0) then {
	_return = true;
};*/
_return