//fnc_generateSolutions.sqf
#include "script_component.hpp"
_targetPos = _this select 0;
_gunPos = _this select 1;
_dof = _this select 2;
_roundType = _this select 3;
_fuzeType = _this select 4;


_roundInfo = (configFile >> "CfgMagazines" >> _roundType);

_btableTemplate = getText(_roundInfo >> "ACE_ARTY_BTABS");
_minCharge = getNumber(_roundInfo >> "ACE_ARTY_MINCHARGE");
_maxCharge = getNumber(_roundInfo >> "ACE_ARTY_MAXCHARGE");
_magazineTemplate = getText(_roundInfo >> "ACE_ARTY_MAGAZINE_FORMAT");

_displayName = getText(_roundInfo >> "displayName");


_highTables = [];
_lowTables = [];
_fastestLow = 100000;
_fastestHigh = 100000;
_bestHigh = [];
_bestLow = [];
_found = false;
_tableCount = 0;
_highSolutions = [];
_lowSolutions = [];
for "_i" from _minCharge to _maxCharge do {
	_magazine = format[_magazineTemplate, _fuzeType, _i];
	_highTable = format[_btableTemplate, "HA", _i];
	_lowTable = format[_btableTemplate, "LA", _i];
	_log = format["Generating %1 solution, charge %2.", _displayName, _i];
	BCSLOG(_log);
	_result = [_gunPos, _targetPos, _dof, _magazine, _lowTable, _highTable] call FUNC(firingSolution);
	_lowTables set[(count _lowTables), [(_result select 0), _i, _targetPos]];
	_highTables set[(count _highTables), [(_result select 1), _i, _targetPos]];
	_resultLog = format["Solution for %1 charge %2; ", _displayName, _i];

	if((count (_result select 1)) > 0) then {
		_found = true;
		_highSolutions set[(count _highSolutions), [(_result select 1), _i, _targetPos]];
		_tableCount = _tableCount + 1;
		_resultLog = _resultLog + "High: Yes; ";
	} else {
		_resultLog = _resultLog + "High: No; ";
	};
	if((count (_result select 0)) > 0) then {
		_lowSolutions set[(count _lowSolutions), [(_result select 0), _i, _targetPos]];
		_found = true;
		_tableCount = _tableCount + 1;
		_resultLog = _resultLog + "Low: Yes";
	} else {
		_resultLog = _resultLog + "Low: No";
	};
	BCSLOG(_resultLog);
};

_lowSolutionsRev = [];

for "_i" from (count _lowSolutions)-1 to 0 step -1 do {
	_lowSolutionsRev set[(count _lowSolutionsRev), _lowSolutions select _i];
};

if(!_found) then {
	BCSERROR("No solution could be found for the current target!");
} else {
	GVAR(solutions) = _lowSolutionsRev + _highSolutions;
	_text = format["%1 valid firing solutions found for %2.", _tableCount, _displayName];
	BCSLOG(_text);
	GVAR(currentComputer) setVariable [QGVAR(currentSolutions), GVAR(solutions), true];
	GVAR(currentComputer) setVariable [QGVAR(currentSolutionsIndex), 0, true];
};


GVAR(generatingMission) = false;