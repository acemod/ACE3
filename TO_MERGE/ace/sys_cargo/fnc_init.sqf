/* ace_sys_cargo | (c) 2014 by rocko */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

if (productVersion select 2 <= 110) exitWith {}; 

PARAMS_1(_vehicle);

_m = getMass _vehicle;
_com = getCenterOfMass _vehicle;
_currentcontent = _vehicle getVariable [QGVAR(content), []];
if (count _currentcontent > 0) then {
	_vehicle setVariable [QGVAR(content), []];
	_error = format["You cannot bypass the loading function for (%1) - ",_vehicle]; TRACE_1("Content hack detected","");
	WARNING(_error);
};

_vehicle setVariable [QGVAR(mass),_m];
_vehicle setVariable [QGVAR(comass),_com];

_vehicle setVariable [QGVAR(ready),true];

