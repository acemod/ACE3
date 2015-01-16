/**
 * fn_setProgramIcons_CC.sqf
 * @Descr: Set the program or Application icons on the desktop of a cC device.
 * @Author: Glowbal
 *
 * @Arguments: [deviceName STRING (the classname of the device)]
 * @Return: nil
 * @PublicAPI: false
 */

#define 	AVAILABLE_ICONS		[100,101,102,103,104,105,106,107,108,109,110,111,112]
#define		ICON_WIDTH			0.05
#define		ICON_HEIGHT			ICON_WIDTH

private ["_deviceName","_settings","_display","_pos","_ctrl","_newPos","_cfg","_availablePrograms","_displayName","_iconWidth","_startingPos","_maxIconsOnWidth","_currentIconN","_ctrlButton","_ctrlLabel", "_devices"];
_deviceName = _this select 0;
_settings = [_deviceName] call cse_fnc_getDeviceSettings_CC;

_availablePrograms = [];
if (isnil 'CSE_REGISTERED_APPLICATIONS_CC') then {
	CSE_REGISTERED_APPLICATIONS_CC = [];
};

// Collect all applications that will be displayed on the Desktop and are available for the device.
{
	// Check if application is hidden (such as main). 0 = show, 1 = hidden.
	if ((_x select 3) == 0) then {
		_devices = _x select 7;

		// Check if the device Classname matches any entry in the devices list, to ensure the application is registered for this device.
		if (_deviceName in _devices || "All" in _devices) then {
			// store the: Name, Icon, displayName.
			_option = [_x select 0,_x select 2,_x select 1];
			_availablePrograms pushback _option;
		} else {
			[format["Application %1 is not registered on device %2 | %3", (_x select 0), _deviceName, _devices],3] call cse_fnc_debug;
		};
	};
}foreach CSE_REGISTERED_APPLICATIONS_CC;

disableSerialization;
_display = uiNamespace getvariable _deviceName;
if (isnil "_display") exitwith {}; // error
if (isNull _display) exitwith {}; // error

// Set all desktop icons in normal state
{
	(_display displayCtrl _x) ctrlSetPosition [0,0,0,0];
	(_display displayCtrl _x) ctrlCommit 0;
	(_display displayCtrl (_x + 20)) ctrlSetPosition [0,0,0,0];
	(_display displayCtrl (_x + 20)) ctrlCommit 0;
}foreach AVAILABLE_ICONS;

// Calculate height width and placement for icons.
_iconWidth = (_settings select 3) / 10;
_iconHeight = _iconWidth;
_startingPos = [(_settings select 0) + (_iconWidth / 4),(_settings select 1) + ((_settings select 3) / 13) + (_iconHeight / 2),_iconHeight,_iconWidth];
_maxIconsOnWidth = round(((_settings select 2) / _iconWidth) - 1);
_currentIconN = 1;

{
	// To ensure that we won't accidently try to place down more icons as available.
	if (_foreachIndex < count AVAILABLE_ICONS) then {
		_name = _x select 0;
		_icon = _x select 1;
		_displayName = _x select 2;

		// Set icon on correct position.
		_ctrl = (_display displayCtrl (AVAILABLE_ICONS select _foreachIndex));
		_ctrl ctrlSetPosition _startingPos;
		_ctrl ctrlSetText _icon;
		_ctrl ctrlCommit 0;

		// Set the button on the correct position with ButtonClick eventhandler.
		_ctrlButton = (_display displayCtrl ((AVAILABLE_ICONS select _foreachIndex) + 20));
		_ctrlButton ctrlSetPosition _startingPos;
		_ctrlButton ctrlCommit 0;
		_ctrlButton ctrlSetEventHandler ["ButtonClick", format["['%1','%2'] call cse_fnc_openScreen_CC",_deviceName,_name]];

		// Setting the label underneat the button/icon.
		_ctrlLabel = (_display displayCtrl ((AVAILABLE_ICONS select _foreachIndex) + 40));
		_ctrlLabel ctrlSetPosition [_startingPos select 0, (_startingPos select 1) + (_iconHeight / 1.31), _iconHeight, 0.03];
		_ctrlLabel ctrlSetText format["%1",_displayName];
		_ctrlLabel ctrlSetFontHeight (_iconHeight * 0.35);
		_ctrlLabel ctrlCommit 0;

		// calculate position for next icon.
		_startingPos set[0,(_startingPos select 0) + _iconWidth + 0.005];

		// Start next row of icons.
		if ((_foreachIndex+1) % _maxIconsOnWidth == 0) then {
			_startingPos set[0,(_startingPos select 0) - (_iconWidth + 0.005) * _maxIconsOnWidth];
			_startingPos set[1,(_startingPos select 1) + (_iconWidth * 1.1)];
		};
	};
}foreach _availablePrograms;

nil;