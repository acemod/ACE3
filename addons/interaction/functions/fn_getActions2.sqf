// commy2

private ["_object", "_config", "_type", "_actions", "_configs"];

_object = _this select 0;
_config = _this select 1;	// configFile, missionConfigFile
_type = _this select 2;		// "AGM_CfgInteractions", "AGM_CfgInteractionsSelf"
_actions = _this select 3;	// [];

_configs = "_object isKindOf configName _x" configClasses (_config >> _type);

// cache
private ["_cache", "_cacheConfigs", "_cacheActions", "_cacheIndices"];

_cache = uiNamespace getVariable ["AGM_Interaction_MenuCache", [[], [], []]];
_cacheConfigs = _cache select 0;
_cacheActions = _cache select 1;
_cacheIndices = _cache select 2;

// get interactions
{
	private "_configActions";

	_configActions = "true" configClasses (_config >> _type >> configName _x);
	{
		private ["_action", "_configName", "_indexCache"];

		_action = _x;
		_configName = configName _action;

		_indexCache = _cacheConfigs find _action;
		if (_indexCache == -1) then {
			private ["_displayName", "_distance", "_priority", "_subMenu", "_tooltip", "_hotkey", "_enableInside", "_condition", "_conditionShow", "_showDisabled", "_exceptions", "_statement", "_icon"];

			_displayName = getText (_action >> "displayName");
			_distance = getNumber (_action >> "distance");
			_priority = getNumber (_action >> "priority");
			_subMenu = getArray (_action >> "subMenu");
			_tooltip = getText (_action >> "tooltip");
			_hotkey = getText (_action >> "hotkey");
			_enableInside = getNumber (_action >> "enableInside");

			// Condition
			_condition = getText (_action >> "condition");
			if (_condition == "") then {_condition = "true"};

			_condition = _condition + format [" && {%1 call AGM_Core_canInteract} && {[AGM_player, AGM_Interaction_Target] call AGM_Core_fnc_canInteractWith}", getArray (_action >> "exceptions")];
			if (_enableInside != 1) then {_condition = _condition + " && {_player == _vehicle}"};

			_condition = compile _condition;

			// Condition to show the action
			_conditionShow = getText (_action >> "conditionShow");
			_conditionShow = if (_conditionShow == "") then {{true}} else {compile _conditionShow};

			_showDisabled = getNumber (_action >> "showDisabled") == 1;
			if (isText (_action >> "conditionShow")) then {
				_showDisabled = [_object, _player] call _conditionShow;
			};

			// Exceptions to the general conditions that have to be true
			_exceptions = getArray (_action >> "exceptions");

			// statement
			_statement = getText (_action >> "statement");
			_statement = compile _statement;

			if (profileNamespace getVariable ["AGM_Interaction_FlowMenu", false]) then {
				_statement = if (getText (_action >> "statement") == "" && {count _subMenu > 1}) then {
					compile format ["call AGM_Interaction_fnc_hideMenu;if(%2 == 1)then{['%1'] call AGM_Interaction_fnc_openSubMenuSelf;}else{['%1'] call AGM_Interaction_fnc_openSubMenu;};", _subMenu select 0, _subMenu select 1];
				} else {
					compile ("call AGM_Interaction_fnc_hideMenu;" + getText (_action >> "statement"));
				};
			};

			// icon
			_icon = getText (_action >> "Icon");
			if (_icon == "") then {
				_icon = DEFAULT_ICON;
			};

			private "_actionToCache";
			_actionToCache = [_displayName, _statement, _condition, _priority, _subMenu, _icon, _tooltip, _conditionShow, _exceptions, _distance, _hotkey];

			if ((_showDisabled || {[_object, _player] call _condition}) && {_distance == 0 || {[_object, _distance] call AGM_Interaction_fnc_isInRange}}) then {
				_actions pushBack _actionToCache;
			};

			_indexCache = _cacheActions find _actionToCache;
			if (_indexCache == -1) then {
				_indexCache = count _cacheActions;
				_cacheActions pushBack _actionToCache;
			};

			_cacheConfigs pushBack _action;
			_cacheIndices pushBack _indexCache;

			_cache = [_cacheConfigs, _cacheActions, _cacheIndices];
			["InteractionMenu", _action, {format ["%1 loaded into cache", _this]}] call AGM_Debug_fnc_log;
		} else {
			["InteractionMenu", _action, {format ["%1 loaded from cache", _this]}] call AGM_Debug_fnc_log;

			private ["_cachedAction", "_showDisabled"];
			_cachedAction = _cacheActions select (_cacheIndices select _indexCache);

			_showDisabled = getNumber (_action >> "showDisabled") == 1;
			if (isText (_action >> "conditionShow")) then {
				_showDisabled = [_object, _player] call (_cachedAction select 7);
			};

			if ((_showDisabled || {[_object, _player] call (_cachedAction select 2)}) && {[_object, (_cachedAction select 9)] call AGM_Interaction_fnc_isInRange || {(_cachedAction select 9) == 0}}) then {
				_actions pushBack _cachedAction;
			};
		};
	} forEach _configActions;	//Actions of this CfgVehicles class
} forEach _configs;	//CfgVehicles class

uiNamespace setVariable ["AGM_Interaction_MenuCache", _cache];

_actions
