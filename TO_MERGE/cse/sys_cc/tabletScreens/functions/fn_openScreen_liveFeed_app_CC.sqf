/**
 * fn_openScreen_liveFeed_app_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName", "_allAvailableFeeds"];
_deviceName = _this select 0;

disableSerialization;
_settings = [_deviceName] call cse_fnc_getDeviceSettings_CC;
_display = uiNamespace getvariable _deviceName;

_background = _display displayCtrl 602;
_listBox = _display displayCtrl 601;

_sideBarRatio = [_deviceName] call cse_fnc_getSideBarRatio_CC;
_navBarRatio = [_deviceName] call cse_fnc_getNavBarRatio_CC;
_navBarHeight = _navBarRatio select 3;
_sideBarWidth = _sideBarRatio select 2;
_heightOfLB = (_settings select 3) - (_navBarHeight*2)/2;

_fullBackground = [_settings select 0,(_settings select 1) + _navBarHeight,  (_settings select 2), (_heightOfLB/4)*1.01];
_background ctrlSetPosition _fullBackground;
_background ctrlSetBackgroundColor [0.9,0.9,0.9,1];
_background ctrlCommit 0;

_listBoxPosition = [_settings select 0,(_settings select 1) + _navBarHeight + (_heightOfLB/4),  (_settings select 2), ((_heightOfLB)/4)*3];
_listBox ctrlSetPosition _listBoxPosition;
_listBox ctrlEnable false;
_listBox ctrlEnable true;
_listBox ctrlCommit 0;

_listBox ctrlSetEventHandler ["MouseButtonDblClick", "
	[_this] call cse_fnc_debug;
	_lb = _this select 0;
	_currentSelection = lbCurSel _lb;
	if (_currentSelection >= 0) then {
		_targetArray = CSE_ALL_AVAILABLE_LIVE_FEEDS_AT_MOMENT_CC select _currentSelection;
		_target = _targetArray select 1 select 0;
		[_target] call cse_fnc_setLiveFeedTargetObj_CC;

		_lb ctrlSetPosition [0,0,0,0];
		_lb ctrlCommit 0;
		_lb ctrlEnable false;
		[[] call cse_fnc_getCurrentDeviceName_CC] call cse_fnc_openScreen_liveFeed_CC;
	};
"];

lbclear 601;
_allAvailableFeeds = [_deviceName] call cse_fnc_getAllViewableFeeds_CC;
CSE_ALL_AVAILABLE_LIVE_FEEDS_AT_MOMENT_CC = _allAvailableFeeds;
{
	lbadd [601, (_x select 0)];
	//lbSetData [601, _foreachIndex, str ((_x select 1) select 0)];
}foreach _allAvailableFeeds;

ctrlSetFocus _listBox;
_listBox lbSetCurSel 0;
(_display displayCtrl 603) ctrlSetPosition [_settings select 0,(_settings select 1) + _navBarHeight,  (_settings select 2), _navBarHeight];
(_display displayCtrl 604) ctrlSetPosition [_settings select 0,(_settings select 1) + _navBarHeight + _navBarHeight,  (_settings select 2), (_heightOfLB/4)*1.01 - _navBarHeight];

(_display displayCtrl 603) ctrlSetText "TACNET";
(_display displayCtrl 604) ctrlSetText "Select an feed in the list below. To view the feed, double click on the item.";


(_display displayCtrl 603) ctrlCommit 0;
(_display displayCtrl 604) ctrlCommit 0;
(_display displayCtrl 604) ctrlEnable false;