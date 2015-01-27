#include "script_component.hpp"

ctrlSetText [200, Str(Round((cse_ab_ATragMX_temperature select cse_ab_ATragMX_currentTarget) * 10) / 10)];
if (cse_ab_ATragMX_currentUnit == 1) then {
	ctrlSetText [210, Str(Round((cse_ab_ATragMX_barometricPressure select cse_ab_ATragMX_currentTarget) * 100) / 100)];
} else {
	ctrlSetText [210, Str(Round(cse_ab_ATragMX_barometricPressure select cse_ab_ATragMX_currentTarget))];
};
ctrlSetText [220, Str(Round((cse_ab_ATragMX_relativeHumidity select cse_ab_ATragMX_currentTarget) * 100 * 10) / 10)];
