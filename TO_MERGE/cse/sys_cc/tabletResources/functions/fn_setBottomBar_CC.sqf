/**
 * fn_setBottomBar_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName","_settings","_display","_pos","_ctrl","_newBackGround"];
_deviceName = _this select 0;
_pos = _this select 1;
_settings = [_deviceName] call cse_fnc_getDeviceSettings_CC;
_settings set[1,(_settings select 1) + (_settings select 3) - ((_settings select 3) / 13)];
_settings set[3,(_settings select 3) / 13];

disableSerialization;
_display = uiNamespace getvariable _deviceName;
_ctrl = (_display displayCtrl 155);

_newPos = switch (_pos) do {
	case "show": {_settings};
	case "hidden": {[0,0,0,0]};
};
_ctrl ctrlsetPosition _newPos;
_ctrl ctrlCommit 0;

_ctrl = (_display displayCtrl 156);
_ctrl ctrlsetPosition _newPos;
_ctrl ctrlSetText "";
_ctrl ctrlCommit 0;

if (_pos == "Show") then {
	[_deviceName] spawn {
		_deviceName = _this select 0;
		disableSerialization;
		_display = uiNamespace getvariable _deviceName;
		_ctrl = (_display displayCtrl 156);
		_mapCtrl = (_display displayCtrl 10);
		if (isnil "CSE_MOUSE_RELATIVE_POSITION") then {
			CSE_MOUSE_RELATIVE_POSITION = [0,0];
		};

		while {([_deviceName] call cse_fnc_isOpenBottomBar_CC)} do {
			if !([_deviceName, "main"] call cse_fnc_isPiPOpen_CC) then {
				_WorldCoord = _mapCtrl posScreenToWorld CSE_MOUSE_RELATIVE_POSITION;
				_WorldCoord set [2, 0];
				_mousePosition = mapGridPosition _WorldCoord;
				_positionPlayer = mapGridPosition player;
				_playerPos = getPos player;
				_playerPos set [2, 0];
				_ctrl ctrlSetText format["CUR: %1 TAG: %2 DIS: %3",_positionPlayer,_mousePosition, _playerPos distance _WorldCoord];
			} else {
				_targetPos = getPos CSE_LIVEFEED_TARGET_CC;
				_targetPos set [2, 0];
				_mousePosition = mapGridPosition _targetPos;
				_positionPlayer = mapGridPosition player;
				_playerPos = getPos player;
				_playerPos set [2, 0];
				_ctrl ctrlSetText format["CUR: %1 TAG: %2 DIS: %3",_positionPlayer,_mousePosition, _playerPos distance _targetPos];
			};
		};
	};
};