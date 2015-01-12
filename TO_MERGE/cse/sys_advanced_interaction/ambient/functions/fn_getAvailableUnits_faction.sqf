/**
 * fn_getAvailableGroups_faction.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_factionOfEntry", "_faction", "_factionConfig", "_return", "_sideN", "_sideT", "_sideConfig", "_entry", "_scopeOfEntry"];
_faction = _this select 0;
_baseclass = _this select 1;

_factionConfig = (configFile >> "CfgFactionClasses" >> _faction);
_return = [];
_filtered_non_base = [];
if (isclass _factionConfig) then {
		_configCivs = (configFile >> "CfgVehicles");
		_numberOfConfig = count _configCivs;
		for [{_i=0}, {(_i< _numberOfConfig)}, {_i=_i+1}] do {
			_entry = _configCivs select _i;
			if (isClass _entry) then {
				_factionOfEntry = getText(_entry >> "faction");
				_scopeOfEntry = getNumber (_entry >> "scope");
				if (_factionOfEntry == _faction && _scopeOfEntry >= 2) then {
					if ([_entry, _baseclass] call cse_fnc_inheritsFrom) then {
						_return pushback (configName _entry);
					} else {
						_filtered_non_base pushback (configName _entry);
					};
				};
			};
		};
	//};
} else {
	[]
};
[format["Filtered non base config entries: %1", _filtered_non_base]] call cse_fnc_debug;

_return