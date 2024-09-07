#include "\a3\ui_f_curator\ui\defineResinclDesign.inc"

_mode = _this select 0;
_params = _this select 1;
_class = _this select 2;

switch _mode do {
	case "onLoad": {

		_display = _params select 0;
		_displayConfig = configFile >> _class;

		_ctrlBackground = _display displayCtrl IDC_RSCDISPLAYATTRIBUTES_BACKGROUND;
		_ctrlTitle = _display displayCtrl IDC_RSCDISPLAYATTRIBUTES_TITLE;
		_ctrlContent = _display displayCtrl IDC_RSCDISPLAYATTRIBUTES_CONTENT;
		_ctrlButtonOK = _display displayCtrl IDC_OK;
		_ctrlButtonCancel = _display displayCtrl IDC_CANCEL;
		_ctrlButtonCustom = _display displayCtrl IDC_RSCDISPLAYATTRIBUTES_BUTTONCUSTOM;

		_ctrlBackgroundPos = ctrlPosition _ctrlBackground;
		_ctrlTitlePos = ctrlPosition _ctrlTitle;
		_ctrlContentPos = ctrlPosition _ctrlContent;
		_ctrlButtonOKPos = ctrlPosition _ctrlButtonOK;
		_ctrlButtonCancelPos = ctrlPosition _ctrlButtonCancel;
		_ctrlButtonCustomPos = ctrlPosition _ctrlButtonCustom;

		_ctrlTitleOffsetY = (_ctrlBackgroundPos select 1) - (_ctrlTitlePos select 1) - (_ctrlTitlePos select 3);
		_ctrlContentOffsetY = (_ctrlContentPos select 1) - (_ctrlBackgroundPos select 1);

		//--- Show fake map in the background
		_ctrlMap = _display displayCtrl IDC_RSCDISPLAYCURATOR_MAINMAP;
		_ctrlMap ctrlEnable false;
		if (visibleMap) then {
			_ctrlCuratorMap = (findDisplay IDD_RSCDISPLAYCURATOR) displayCtrl IDC_RSCDISPLAYCURATOR_MAINMAP;
			_ctrlMap ctrlMapAnimAdd [0,ctrlMapScale _ctrlCuratorMap,_ctrlCuratorMap ctrlMapScreenToWorld [0.5,0.5]];
			ctrlMapAnimCommit _ctrlMap;
		} else {
			_ctrlMap ctrlShow false;
		};

		//--- Load default attributes
		_attributes = if (getNumber (_displayConfig >> "filterAttributes") > 0) then {missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_attributes",[]]} else {["%ALL"]};
		_allAttributes = "%ALL" in _attributes;

		//--- Initialize attributes
		_posY = _ctrlContentOffsetY;
		_contentControls = _displayConfig >> "Controls" >> "Content" >> "Controls";
		_enableDebugConsole = ["DebugConsole",getNumber (missionConfigFile >> "enableDebugConsole")] call bis_fnc_getParamValue;
		_enableAdmin = (_enableDebugConsole == 1 && (isServer || serverCommandAvailable "#shutdown")) || _enableDebugConsole == 2;
		for "_i" from 0 to (count _contentControls - 1) do {
			_cfgControl = _contentControls select _i;
			if (isClass _cfgControl) then {
				_idc = getNumber (_cfgControl >> "idc");
				_control = _display displayCtrl _idc;

				//--- Admin specific attribute
				_show = [true, _enableAdmin] select (getNumber (_cfgControl >> "adminOnly") > 0);

				if ((_allAttributes || {_x == configName _cfgControl} count _attributes > 0) && _show) then {
					_controlPos = ctrlPosition _control;
					_controlPos set [0,0];
					_controlPos set [1,_posY];
					_control ctrlSetPosition _controlPos;
					_control ctrlCommit 0;
					_posY = _posY + (_controlPos select 3) + 0.005;
					ctrlSetFocus _control;
				} else {
					_control ctrlSetPosition [0,0,0,0];
					_control ctrlCommit 0;
					_control ctrlShow false;
				};
			};
		};
		_posH = ((_posY + _ctrlContentOffsetY) min 0.9) * 0.5;

		_target = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target",objNull];
		_name = switch (typeName _target) do {
			case ("OBJECT"): {getText (configFile >> "cfgvehicles" >> typeOf _target >> "displayname")};
			case ("GROUP"): {groupId _target};
			case ("ARRAY"): {format ["%1: %3 #%2",groupId (_target select 0),_target select 1,localize "str_a3_cfgmarkers_waypoint_0"]};
			case ("STRING"): {markerText _target};
		};
		_ctrlTitle ctrlSetText format [ctrlText _ctrlTitle,toUpper _name];

		_ctrlTitlePos set [1,(0.5 - _posH) - (_ctrlTitlePos select 3) - _ctrlTitleOffsetY];
		_ctrlTitle ctrlSetPosition _ctrlTitlePos;
		_ctrlTitle ctrlCommit 0;

		_ctrlContentPos set [1,0.5 - _posH];
		_ctrlContentPos set [3,_posH * 2];
		_ctrlContent ctrlSetPosition _ctrlContentPos;
		_ctrlContent ctrlCommit 0;

		_ctrlBackgroundPos set [1,0.5 - _posH];
		_ctrlBackgroundPos set [3,_posH * 2];
		_ctrlBackground ctrlSetPosition _ctrlBackgroundPos;
		_ctrlBackground ctrlCommit 0;

		_ctrlButtonOKPos set [1,0.5 + _posH + _ctrlTitleOffsetY];
		_ctrlButtonOK ctrlSetPosition _ctrlButtonOKPos;
		_ctrlButtonOK ctrlCommit 0;
		ctrlSetFocus _ctrlButtonOK;

		_ctrlButtonCancelPos set [1,0.5 + _posH + _ctrlTitleOffsetY];
		_ctrlButtonCancel ctrlSetPosition _ctrlButtonCancelPos;
		_ctrlButtonCancel ctrlCommit 0;

		_ctrlButtonCustomPos set [1,0.5 + _posH + _ctrlTitleOffsetY];
		_ctrlButtonCustom ctrlSetPosition _ctrlButtonCustomPos;
		_ctrlButtonCustom ctrlCommit 0;

		//--- Close the display when entity is altered
		[_display] spawn {
			disableSerialization;
			_display = _this select 0;
			_target = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target",objNull];
			switch (typeName _target) do {
				case ("OBJECT"): {
					_isAlive = alive _target;
					waitUntil {isNull _display || (_isAlive && !alive _target)};
				};
				case ("GROUP"): {
					waitUntil {isNull _display || isNull _target};
				};
				case ("ARRAY"): {
					_grp = _target select 0;
					_wpCount = count waypoints _grp;
					waitUntil {isNull _display || (count waypoints _grp != _wpCount)};
				};
				case ("STRING"): {
					waitUntil {isNull _display || markerType _target == ""};
				};
			};
			_display closeDisplay 2;
		};
	};
	case "onUnload": {

	};
};
