#include "script_component.hpp"

_batteryData = GVAR(currentComputer) getVariable QGVAR(batteryData);
_batteryType = [_batteryData, IDC_Main_BatteryType] call CBA_fnc_hashGet;
_ammunitionTypes = getArray(configFile >> "CfgAceArtyBatteryType" >> (_batteryType select 2) >> "ammunition");
lbClear IDC_Mission_EngageAmmunitionTypeSelect;

{
	_displayName = getText(configFile >> "CfgMagazines" >> _x >> "ACE_ARTY_INEFFECT");
	_index = lbAdd [IDC_Mission_EngageAmmunitionTypeSelect, _displayName];
	lbSetData [IDC_Mission_EngageAmmunitionTypeSelect, _index, _x];
} forEach _ammunitionTypes;

lbSetCurSel [IDC_Mission_EngageAmmunitionTypeSelect, 0];
[(_ammunitionTypes select 0), ""] call FUNC(setFuzeSelectionMission);

_sheafs = ["Parallel"];
lbClear IDC_Mission_EngageSheafTypeSelect;
{
	_index = lbAdd [IDC_Mission_EngageSheafTypeSelect, _x];
	lbSetData [IDC_Mission_EngageSheafTypeSelect, _index, _x];
} forEach _sheafs;
lbSetCurSel [IDC_Mission_EngageSheafTypeSelect, 0];
_moc = [
		["Fire When Ready", "ready"], 
		["At My Command", "amc"],
		["ToT From Now", "totn"],
		["ToT From Clock", "totc"]
	];
lbClear IDC_Mission_ControlMethodOfControlSelect;
{
	_index = lbAdd [IDC_Mission_ControlMethodOfControlSelect, _x select 0];
	lbSetData [IDC_Mission_ControlMethodOfControlSelect, _index, _x select 1];
} forEach _moc;
lbSetCurSel [IDC_Mission_ControlMethodOfControlSelect, 0];
_types = [MAIN_ID_GRID, MAIN_ID_POLAR, MAIN_ID_SHIFT];
{
	ctrlShow [_x, false];
} forEach _types;
_missionType = _this;
switch(_missionType) do {
	case "grid": {
		ctrlShow [MAIN_ID_GRID, true];
	};
	case "polar": {
		ctrlShow [MAIN_ID_POLAR, true];
		IDC_Mission_MissionPolarObserverSelect call FUNC(populateObserverList);
	};
	case "shift": {
		ctrlShow [MAIN_ID_SHIFT, true];
		IDC_Mission_MissionShiftKnowPointSelect call FUNC(populateKnownPointList);
	};
};

GVAR(adjustCount) = 0;
GVAR(currentComputer) setVariable[QGVAR(adjustCount), GVAR(adjustCount), true];
GVAR(currentComputer) setVariable [QGVAR(currentAdjustments), [], true];
GVAR(currentComputer) setVariable [QGVAR(currentSolutions), []];
GVAR(currentComputer) setVariable [QGVAR(currentSolutionsIndex), 0];