/**
 * fn_getTriageStatus_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit","_return","_status"];
_unit = _this select 0;
_status = _unit getvariable [QGVAR(triageLevel), -1];
_return = switch (_status) do {
	case 0: {["None",0,[0,0,0,0.7]]}; // none
	case 1: {["Minor",1,[0,0.5,0,0.7]]};
	case 2: {["Delayed",2,[0.77,0.51,0.08,0.7]]};
	case 3: {["Immediate",3,[1,0.2,0.2,0.7]]};
	case 4: {["Deceased",4,[0,0,0,0.7]]};
	default {["None",0,[0,0,0,0.7]]};
};
_return