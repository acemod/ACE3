#include "script_component.hpp"

ctrlSetText [200, Str(Round((GVAR(ATragMX_temperature) select GVAR(ATragMX_currentTarget)) * 10) / 10)];
if (GVAR(ATragMX_currentUnit) == 1) then {
	ctrlSetText [210, Str(Round((GVAR(ATragMX_barometricPressure) select GVAR(ATragMX_currentTarget)) * 100) / 100)];
} else {
	ctrlSetText [210, Str(Round(GVAR(ATragMX_barometricPressure) select GVAR(ATragMX_currentTarget)))];
};
ctrlSetText [220, Str(Round((GVAR(ATragMX_relativeHumidity) select GVAR(ATragMX_currentTarget)) * 100 * 10) / 10)];
