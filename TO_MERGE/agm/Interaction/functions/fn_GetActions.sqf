/*
	Name: AGM_Interaction_fnc_GetActions
	
	Author:
		commy2
		Garth de Wet (LH)
	
	Description:
	
	Parameters:
		0: OBJECT - target
		1: ARRAY - Parents of the target object
		2: ARRAY - Actions
		3: ARRAY - Patches
		4: CONFIG - Parent config (ConfigFile >> "CfgVehicles"/MissionConfigFile >> "CfgVehicles")
		5: BOOL - Is mission config file?
		6: STRING - Classname ("AGM_Actions"/"AGM_SelfActions")
		7: STRING - Sub-class
	
	Returns:
		Nothing
	
	Example:
		[player, [configfile >> "CfgVehicles" >> typeOf player, true] call BIS_fnc_returnParents, [], [],configfile >> "CfgVehicles", false, "AGM_Actions"] call AGM_Interaction_fnc_GetActions;
		
		[player, [configfile >> "CfgVehicles" >> typeOf player, true] call BIS_fnc_returnParents, [], [],configfile >> "CfgVehicles", false, "AGM_SelfActions"] call AGM_Interaction_fnc_GetActions;
*/
#define DEFAULT_ICON "\AGM_Interaction\UI\dot_ca.paa"
private ["_target", "_parents", "_actions", "_patches", "_baseConfig", "_actionType", "_i","_index", "_missionConfig", "_stdConfig"];
_target = _this select 0;
_parents = _this select 1;
_actions = _this select 2;
_patches = _this select 3;
_baseConfig = _this select 4;
_missionConfig = _this select 5;
_actionType = _this select 6;
_subClass = _this select 7;

_stdConfig = (configFile >> "CfgVehicles" >> typeOf _target >> _actionType);
if (_subClass != "") then {
	_stdConfig = _stdConfig >> _subClass;
};

_count = count _parents;
for "_i" from 0 to (_count - 1) do {
	_config = _baseConfig >> _parents select _i >> _actionType;
	if (_subClass != "") then {
		_config = _config >> _subClass;
	};

	_count = count _config;
	if (_count > 0) then {
		for "_index" from 0 to (_count - 1) do {
			private ["_action", "_displayName", "_distance","_condition","_statement","_showDisabled", "_priority", "_tooltip", "_hotkey",
				"_subMenu", "_conditionShow", "_exceptions", "_icon", "_actionToCache", "_cacheActions", "_cache", "_indexCache", "_configName"];
			_action = if (_missionConfig) then {_config select _index} else {_stdConfig >> configName (_config select _index)};
			_cache = missionNamespace getVariable ["AGM_Interaction_MenuCache", [[], [], []]];

			if (count _action > 0) then {
				_configName = configName _action;

				_cacheConfigs = _cache select 0;
				_cacheActions = _cache select 1;
				_cacheIndices = _cache select 2;

				_indexCache = _cacheConfigs find _action;
				if (_indexCache == -1) then {
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

					_actionToCache = [_displayName, _statement, _condition, _priority, _subMenu, _icon, _tooltip, _conditionShow, _exceptions, _distance, _hotkey];

					if (!(_configName in _patches) && {_showDisabled || {[_object, _player] call _condition}} && {_distance == 0 || {[_object, _distance] call AGM_Interaction_fnc_isInRange}}) then {
						_actions pushBack _actionToCache;
						_patches pushBack _configName;
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

					_cachedAction = _cacheActions select (_cacheIndices select _indexCache);

					_showDisabled = getNumber (_action >> "showDisabled") == 1;
					if (isText (_action >> "conditionShow")) then {
						_showDisabled = [_object, _player] call (_cachedAction select 7);
					};

					if (!(_configName in _patches) && {_showDisabled || {[_object, _player] call (_cachedAction select 2)}} && {[_object, (_cachedAction select 9)] call AGM_Interaction_fnc_isInRange || {(_cachedAction select 9) == 0}}) then {
						_actions pushBack _cachedAction;
						_patches pushBack _configName;
					};
				};
			};

			AGM_Interaction_MenuCache = _cache;
		};
	};
};
[_actions, _patches]
