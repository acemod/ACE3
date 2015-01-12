/**
 * fn_getSideBarOptionFields_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName","_currentApp","_cfg","_return","_posCounter","_pos"];
_deviceName = _this select 0;
_return = [];
_currentApp = call cse_fnc_getCurrentApplication_CC;
_posCounter = 0;

if (isnil 'CSE_REGISTERED_DEVICES_CC') then {
	CSE_REGISTERED_DEVICES_CC = [];
};

{
	if (_x select 0 == _currentApp) exitwith {
		{
			private ["_text","_type","_action","_newOptionField"];
			_text = _x select 0;
			_type = _x select 1;
			_action = _x select 2;
			_pos = _x select 3;
			_option = [_text,_type,_action];

			if (_pos < _posCounter) then {
				_pos = _posCounter;
			};
			if (_posCounter < _pos) then {
				_posCounter = _pos;
			};


			if (_type == "drop") then {
				private ["_values","_valueCfg"];
				_values = (_x select 4);
				_option set[3,_values];
			};
			_newOptionField = [_pos,_option];
			_return pushback _newOptionField;
			_posCounter = _posCounter + 1;
		}foreach (_x select 4);
	};
}foreach CSE_REGISTERED_APPLICATIONS_CC;
_return