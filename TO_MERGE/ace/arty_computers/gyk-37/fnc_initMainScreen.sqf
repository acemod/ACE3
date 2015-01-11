#include "script_component.hpp"

_batteryTypes = (configFile >> "CfgAceArtyBatteryType");
lbClear IDC_Main_BatteryType;
for "_i" from 0 to (count _batteryTypes)-1 do {
	_type = _batteryTypes select _i;
	_index = lbAdd [IDC_Main_BatteryType, (getText(_type >> "name"))];
	lbSetData [IDC_Main_BatteryType, _index, configName(_type)];
};
lbSetCurSel [IDC_Main_BatteryType, 0];
GVAR(missionComputed) = false;
IDC_Main_ObserverSelect call FUNC(populateObserverList);
IDC_Main_KnownPointSelect call FUNC(populateKnownPointList);
GVAR(currentComputer) setVariable [QGVAR(currentMission), [], true];
