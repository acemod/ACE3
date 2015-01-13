/**
 * fn_isPopUpOpen_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName"];
_deviceName = _this select 0;

	disableSerialization;
	_display = uiNamespace getvariable _deviceName;
	_backGroundCtrl = (_display displayCtrl 150);
	_return = false;
	{
		if (_x != 0) then {
			_return = true;
		};
	}foreach (ctrlPosition _backGroundCtrl);

_return