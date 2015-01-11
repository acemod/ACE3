//fnc_cycleRadio.sqf
#include "script_component.hpp"

private["_direction", "_radios", "_count", "_newRadioIndex", "_activeRadio", "_activateRadio", "_oblix",
"_freq", "_baseConfig", "_realRadio", "_typeName", "_radio", "_radioClass"];
_direction = 1;
_radios = [];
_count = 0;
_newRadioIndex = 0;
_activeRadio = player getVariable "acre_active_radio";
// populate from local radio list
{
	_radioClass = _x;
	_oblix = [_radioClass] call acre_sys_radio_fnc_getRadioState;
	_freq = ((_oblix select 0) select 0);
	_baseConfig = inheritsFrom (configFile >> "CfgWeapons" >> _radioClass);
	_realRadio = configName ( _baseConfig );
	_typeName = getText (configFile >> "CfgAcreRadios" >> _realRadio >> "name");
	_radio = [_typeName, _freq, _radioClass];
	TRACE_2("heh", _radioClass, _activeRadio);
	if(_radioClass == _activeRadio) then {
		TRACE_1("found index", _count);
		_newRadioIndex = _count;
	};
	_radios set [(count _radios), _radio];
	_count = _count + 1;
} foreach acre_sys_radio_currentRadioList;
TRACE_1("index was", _newRadioIndex);
TRACE_1("Active was", _activeRadio);
if((count _radios) > 1) then {
	if(_direction == 1) then {
		if(_newRadioIndex >= (count _radios)-1) then {
			_newRadioIndex = 0;
		} else {
			_newRadioIndex = _newRadioIndex + 1;
		};
	} else {
		if(_newRadioIndex <= 0) then {
			_newRadioIndex = (count _radios) - 1;
		} else {
			_newRadioIndex = _newRadioIndex - 1;
		};
	};
	TRACE_1("radios are", _radios);
	TRACE_1("index is", _newRadioIndex);
	_activateRadio = _radios select _newRadioIndex;
	TRACE_1("Active is now", _activateRadio);
	[(_activateRadio select 2)] call acre_sys_radio_fnc_setActiveRadio;

	[(_activateRadio select 0), format["%1Mhz", (_activateRadio select 1)], "", 1] call acre_sys_list_fnc_displayHint;


	ctrlSetText [IDC_ACRE_RadioName, (_activateRadio select 0)];
	ctrlSetText [IDC_ACRE_RadioNet, format["%1MHz", (_activateRadio select 1)]];
};



