#include "script_component.hpp"

private ["_gunName", "_gunProfileEntry"];

_gunName = ctrlText 11001;
if (_gunName != "") then {
	_gunProfileEntry = [_gunName, 850, 500, 0.280, -0.0010000, 3.81, 0, 0.338, 0.338, 120, 0, 0, 9.460, "", "", 0.393, 1, "ICAO"];

	cse_ab_ATragMX_gunList = cse_ab_ATragMX_gunList + [_gunProfileEntry];

	lbAdd [6000, _gunProfileEntry select 0];

	profileNamespace setVariable ["cse_ab_ATragMX_gunList", cse_ab_ATragMX_gunList];
};
