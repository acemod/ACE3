/**
 * fn_clearDeviceScreen_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName","_cfg","_display","_excludeIDCs"];
_deviceName = _this select 0;
_cfg = (MissionconfigFile >> _deviceName >> "controls");
if (!isClass _cfg) then {
	_cfg = (configFile >> _deviceName >> "controls");
};
disableSerialization;
_display = uiNamespace getvariable _deviceName;

(_display displayCtrl 10) ctrlEnable true;

_excludeIDCs = [-1,0,1,2,3,4,5,6, 606, 607, 608];
if (isClass _cfg) then {
	for [{_i=0},{_i < count _cfg},{_i=_i+1}] do {
		if (isClass (_cfg select _i)) then {
			private ["_idc","_ctrl"];
			_idc = getNumber ((_cfg select _i) >> "idc");
			if (!(_idc in _excludeIDCs)) then {
				_ctrl = (_display displayCtrl _idc);

				//_Ctrl ctrlShow false;
				if (_idc == 601) then {
					_Ctrl ctrlSetPosition [100,100,0.1,0.1]; // lb cannot go for wierd dimensions?
				} else {
					if (_idc > 269  && _idc < 280) then {
						_Ctrl ctrlSetPosition [100,100,0.1,0.1];
					} else {
						_ctrl ctrlSetPosition [0,0,0,0];
					};
				};
				_ctrl ctrlCommit 0;
			};

		};
	};
};

