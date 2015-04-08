#include "script_component.hpp"

ctrlSetText [200, Str(Round((GVAR(temperature) select GVAR(currentTarget)) * 10) / 10)];
if (GVAR(currentUnit) == 1) then {
    ctrlSetText [210, Str(Round((GVAR(barometricPressure) select GVAR(currentTarget)) * 100) / 100)];
} else {
    ctrlSetText [210, Str(Round(GVAR(barometricPressure) select GVAR(currentTarget)))];
};
ctrlSetText [220, Str(Round((GVAR(relativeHumidity) select GVAR(currentTarget)) * 100 * 10) / 10)];
