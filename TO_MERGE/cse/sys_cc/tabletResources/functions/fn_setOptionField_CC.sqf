/**
 * fn_setOptionField_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName","_settings","_display","_pos","_ctrl","_options","_buttonHeightwithSpacing","_sideBarHeight","_buttonHeight","_buttonSpacing"];
_deviceName = _this select 0;
_pos = round(_this select 1);
_options = _this select 2;
_settings = [_deviceName] call cse_fnc_getDeviceSettings_CC;
_sideBarRatio = [_deviceName] call cse_fnc_getSideBarRatio_CC;
_navBarRatio = [_deviceName] call cse_fnc_getNavBarRatio_CC;
_maxPositions = (_settings select 3) / 0.05;
_maxPositions = 12;

_sideBarHeight = _sideBarRatio select 3;
_buttonHeightwithSpacing = _sideBarHeight / _maxPositions;
_buttonSpacing = _buttonHeightwithSpacing / 20;
_buttonHeight = _buttonHeightwithSpacing - _buttonSpacing;

_type = _options select 1;

if (((_pos < 0) || _pos >= _maxPositions) && !(_type == "map")) exitwith {};

	disableSerialization;
	_display = uiNamespace getvariable _deviceName;
	_ctrlPosition = [(_sideBarRatio select 0) + 0.001, (_sideBarRatio select 1) + (_navBarRatio select 3)/ 1.5, (_sideBarRatio select 2) - 0.002, _buttonHeight];
	_ctrlPosition set[1, (_ctrlPosition select 1) + (_pos * (_buttonHeight + _buttonSpacing))+ 0.002];
	//_ctrlPosition set[2, 0.2];
	//_ctrlPosition set[3,0.04];

	_labelText = _options select 0;

	[_deviceName,_pos] call cse_fnc_removeOptionField_CC;
	_ctrl = [_deviceName,_type] call cse_fnc_getFirstAvailableOptionField_CC;
	_ctrl ctrlSetPosition _ctrlPosition;
	//_ctrl ctrlSetFontHeight _buttonHeight;

	switch (_type) do {
		case "label": {
				_ctrl ctrlSetText _labelText;
			};
		case "edit": {
				_ctrl ctrlSetText "";
			};
		case "drop": {
				private ["_index","_availableSelection"];
				_availableSelection = _options select 3;
				lbClear _ctrl;
				if (count _availableSelection > 0) then {
					_index = 0;
					{
						_ctrl lbadd (_x select 0);
	    				_ctrl lbSetData [_index, (_x select 1)];
	    				_index = _index + 1;
	    			}foreach _availableSelection;
				} else {
					//private ["_refill"];
					//_refill = getText ((_cfg select _i) >> "refill");
					//[_deviceName, _ctrl] call compile _refill;
    			};
    			_ctrl ctrlSetEventHandler ["LBSelChanged", format["['%1',_this] call %2;",_deviceName,compile (_options select 2)]];
			};
		case "button": {
				_ctrl ctrlSetText _labelText;
				_ctrl ctrlSetEventHandler ["ButtonClick", format["['%1',_this] call %2;",_deviceName,compile (_options select 2)]];
			};
		case "map": {
			[_deviceName,"sidebar","bottom"] call cse_fnc_setMap_CC;
		};
		default {};
	};
	_ctrl ctrlCommit 0;
_ctrl