/* ace_sys_cargo | (c) 2010,2011 by rocko */

//#define DEBUG_MODE_FULL
#include "script_component.hpp"

private "_var";

PARAMS_3(_component,_unit,_type);

switch (_type) do {
	case "CARRIER": {
		if (_component getVariable [QGVAR(busy),false]) then {
			[localize "STR_ACE_CARGO_ERR_OCC",[1,0,0,1],true,0] spawn ace_fnc_visual;
		} else {
			[_component,_unit,0,["front", "grab"]] execVM QPATHTO_C(ua_carry2.sqf);
		};
	};
	case "HELPER": {
		[_component,_unit,0,["back", "grab"]] execVM QPATHTO_C(ua_carry2.sqf);
	};
};

false
