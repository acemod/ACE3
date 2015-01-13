/*
fnc_clickedOnMap.sqf
Usage: Displays CC Pop-up menu selection
Author: Glowbal

Arguments: array [position (ARRAY)]
		0: Position 2D. Format [ X, Y ]
Returns: void

Affects: Local
Executes: Local. Default execution when clicked on map in CC App.

Example:
	[0,0] call cse_fnc_clickedOnMap_CC;

*/

private ["_position","_buttonWidth","_nearest","_found","_posTrackerIcon","_text","_ctrlBtn","_lastIDC","_deviceName","_settings","_sideBarRatio","_navBarRatio","_maxPositions","_sideBarHeight","_buttonHeightwithSpacing","_buttonSpacing","_buttonHeight","_display","_optionsPos"];
//_args = _this;
_position = [_this, 0, [0,0], [[]],2] call BIS_fnc_param;

[format["fnc_clickedOnMap %1", _this]] call cse_fnc_debug;
if (typeName _position != typeName []) exitwith {};
disableSerialization;
_deviceName = call cse_fnc_getCurrentDeviceName_CC;
if (_deviceName == "") exitwith {};

if ([_deviceName] call cse_fnc_isSelectMenuOpen_CC) exitwith {
	[_deviceName] call cse_fnc_removeSelectMenu_CC;
};
_optionsPos = [(_position select 0), _position select 1];
_settings = [_deviceName] call cse_fnc_getDeviceSettings_CC;
_sideBarRatio = [_deviceName] call cse_fnc_getSideBarRatio_CC;
_maxPositions = (_settings select 3) / 0.05;
_maxPositions = 12;

_sideBarHeight = _sideBarRatio select 3;
_buttonHeightwithSpacing = _sideBarHeight / _maxPositions;
_buttonSpacing = _buttonHeightwithSpacing / 10;
_buttonHeight = _buttonHeightwithSpacing - _buttonSpacing;
_buttonWidth = (_sideBarRatio select 2) - 0.002;
	_display = uiNamespace getvariable _deviceName;

(_display displayCtrl 10) ctrlEnable false;
_position = (_display displayCtrl 10) ctrlMapScreenToWorld _position;
_position set [2, 0];

if ((_optionsPos select 0) + _buttonWidth > ((_settings select 0) + (_settings select 2))) then {
	_buttonWidth = _buttonWidth - (((_optionsPos select 0) + _buttonWidth -  ((_settings select 0) + (_settings select 2))));
};
_optionsPos set[2, _buttonWidth];
_optionsPos set[3,_buttonHeight];
_lastIDC = 260;
_nearest = 25;
_found = [];
{
	_side  = _x select 6;
	if (([_deviceName] call cse_fnc_getDeviceSide_CC) == _side) then {
		_posTrackerIcon = +(_x select 1);
		_posTrackerIcon set [2, 0];
		if ((_posTrackerIcon distance _position) < _nearest) then {
			_nearest = _posTrackerIcon distance _position;
			_found = _x;
		};
	};
}foreach CSE_TRACKER_ICONS;



_foudIntelMarker = [];
if (CSE_TOGGLE_INTEL_LAYER_CC) then {
	_nearest = 25;
	{
		_side =(_x select 3);
		if (([_deviceName] call cse_fnc_getDeviceSide_CC) == _side) then {
			_pos = (_x select 0);
			if ((_pos distance _position) < _nearest) then {
				_nearest = _pos distance _position;
				_foudIntelMarker = _x;
			};
		};
	}foreach CSE_INTEL_MARKER_COLLECTION_CC;
};

_foudRouteMarker = [];
if (CSE_TOGGLE_ROUTE_LAYER_CC) then {
	_nearest = 25;
	{
		_side =(_x select 3);
		if (([_deviceName] call cse_fnc_getDeviceSide_CC) == _side) then {
			_pos = (_x select 0);
			if ((_pos distance _position) < _nearest) then {
				_nearest = _pos distance _position;
				_foudRouteMarker = _x;
			};
		};
	}foreach CSE_ROUTE_MARKER_COLLECTION_CC;
};
/*
if (isnil "CSE_CLICKED_ON_MAP_OPTIONS_CC") then {
	CSE_CLICKED_ON_MAP_OPTIONS_CC = [];
};

{
	if ([_found, _foudIntelMarker, _foudRouteMarker] call (_x select 0)) then {
		_text =[_found, _foudIntelMarker, _foudRouteMarker] call (_x select 1);
		_formattedCode = [_found, _foudIntelMarker, _foudRouteMarker] call (_x select 2);

		_ctrlBtn = (_display displayCtrl _lastIDC);
		_ctrlBtn ctrlSetPosition _optionsPos;
		_ctrlBtn ctrlSetText _text;
		_CtrlBtn ctrlSetEventHandler ["ButtonClick", format[_formattedCode, _position,_deviceName]];
		_ctrlBtn ctrlCommit 0;
		_lastIDC = _lastIDC + 1;
		_optionsPos set[1, (_optionsPos select 1) + (_buttonHeight)];
	};
}foreach CSE_CLICKED_ON_MAP_OPTIONS_CC;*/

if !(_found isEqualTo []) then {
	_ctrlBtn = (_display displayCtrl _lastIDC);
	_ctrlBtn ctrlSetPosition _optionsPos;
	_text = _found select 2;
	if (_text == "") then {
		_text = "icon";
	};
	CSE_CLICKED_ON_MAP_FOUND_CC = _found;
	_ctrlBtn ctrlSetText format["Select: %1",_text];
	_CtrlBtn ctrlSetEventHandler ["ButtonClick", format["['%2'] call cse_fnc_removeSelectMenu_CC; ['%2',%1] call cse_fnc_openIconSelectMenu_CC;", _position,_deviceName]];
	_ctrlBtn ctrlCommit 0;
	_lastIDC = _lastIDC + 1;
	_optionsPos set[1, (_optionsPos select 1) + (_buttonHeight)];
};

if (true) then {
	_ctrlBtn = (_display displayCtrl _lastIDC);
	_ctrlBtn ctrlSetPosition _optionsPos;
	_ctrlBtn ctrlSetText "SALUTE Report";
	_CtrlBtn ctrlSetEventHandler ["ButtonClick", format["['%2'] call cse_fnc_removeSelectMenu_CC; ['%2',%1] call cse_fnc_openIntelMarkersMenu_CC;", _position,_deviceName]];
	_ctrlBtn ctrlCommit 0;
	_lastIDC = _lastIDC + 1;
	_optionsPos set[1, (_optionsPos select 1) + (_buttonHeight)];
};

if (true) then {
	_ctrlBtn = (_display displayCtrl _lastIDC);
	_ctrlBtn ctrlSetPosition _optionsPos;
	_ctrlBtn ctrlSetText "Route Planning";
	_CtrlBtn ctrlSetEventHandler ["ButtonClick", format["['%2'] call cse_fnc_removeSelectMenu_CC; ['%2',%1] call cse_fnc_openRouteMarkersMenu_CC;", _position,_deviceName]];
	_ctrlBtn ctrlCommit 0;
	_lastIDC = _lastIDC + 1;
	_optionsPos set[1, (_optionsPos select 1) + (_buttonHeight)];
};

if !(_foudIntelMarker isEqualTo []) then {
	CSE_CLICKED_ON_MAP_FOUND_INTELMARKER_CC = _position;
/*
	_ctrlBtn = (_display displayCtrl _lastIDC);
	_ctrlBtn ctrlSetPosition _optionsPos;
	_text = "Edit SALUTE";
	_ctrlBtn ctrlSetText _text;
	_CtrlBtn ctrlSetEventHandler ["ButtonClick", format["['%2'] call cse_fnc_removeSelectMenu_CC;[CSE_CLICKED_ON_MAP_FOUND_INTELMARKER_CC] call cse_fnc_editIntelMarker_CC;", _position,_deviceName,_found]];
	_ctrlBtn ctrlCommit 0;
	_lastIDC = _lastIDC + 1;
	_optionsPos set[1, (_optionsPos select 1) + (_buttonHeight)];
*/
	/*	END		*/

	_ctrlBtn = (_display displayCtrl _lastIDC);
	_ctrlBtn ctrlSetPosition _optionsPos;
	_text = "Remove SALUTE";
	_ctrlBtn ctrlSetText _text;
	_CtrlBtn ctrlSetEventHandler ["ButtonClick", format["['%2'] call cse_fnc_removeSelectMenu_CC;[CSE_CLICKED_ON_MAP_FOUND_INTELMARKER_CC] call cse_fnc_removeIntelMarker_CC;", _position,_deviceName,_found]];
	_ctrlBtn ctrlCommit 0;
	_lastIDC = _lastIDC + 1;
	_optionsPos set[1, (_optionsPos select 1) + (_buttonHeight)];
};
if !(_foudRouteMarker isEqualTo []) then {
	_ctrlBtn = (_display displayCtrl _lastIDC);
	_ctrlBtn ctrlSetPosition _optionsPos;
	_text = "Remove Route";
	CSE_CLICKED_ON_MAP_FOUND_ROUTEMARKER_CC = _position;
	_ctrlBtn ctrlSetText _text;
	_CtrlBtn ctrlSetEventHandler ["ButtonClick", format["['%2'] call cse_fnc_removeSelectMenu_CC;[CSE_CLICKED_ON_MAP_FOUND_ROUTEMARKER_CC] call cse_fnc_removeRouteMarker_CC", _position,_deviceName,_found]];
	_ctrlBtn ctrlCommit 0;
	_lastIDC = _lastIDC + 1;
	_optionsPos set[1, (_optionsPos select 1) + (_buttonHeight)];
};
(_display displayCtrl 10) ctrlEnable true;

[_position,_display,_deviceName] spawn {
	private ["_originalPos","_display","_position"];
	disableSerialization;
	_position = _this select 0;
	_display = _this select 1;
	_originalPos = +((_display displayCtrl 10) ctrlMapWorldToScreen _position);

	waituntil {(((_display displayCtrl 10) ctrlMapWorldToScreen _position) select 0 != (_originalPos select 0))};
	[_this select 2] call cse_fnc_removeSelectMenu_CC;
};


if !(_found isEqualTo []) then {
	if (!CSE_ALLOW_LIVE_FEEDS_CC) exitwith {};
	_ctrlBtn = (_display displayCtrl _lastIDC);
	_ctrlBtn ctrlSetPosition _optionsPos;
	_unit = _found select 5;

	if ([_unit, _deviceName] call cse_fnc_canViewFeed_CC) then {
		_text = "View Feed";
		[_unit] call cse_fnc_setLiveFeedTargetObj_CC;

		_ctrlBtn ctrlSetText _text;
		_CtrlBtn ctrlSetEventHandler ["ButtonClick", format["['%2'] call cse_fnc_removeSelectMenu_CC; ['%2'] call cse_fnc_openScreen_liveFeed_CC;", _position,_deviceName, _unit]];
		_ctrlBtn ctrlCommit 0;
		_lastIDC = _lastIDC + 1;
		_optionsPos set[1, (_optionsPos select 1) + (_buttonHeight)];
	};
};