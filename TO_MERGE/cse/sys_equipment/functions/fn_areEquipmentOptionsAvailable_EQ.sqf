/**
 * fn_areEquipmentOptionsAvailable_EQ.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_return","_equipOpt"];
_return = false;
_equipOpt = ([] call cse_fnc_getAllEquipmentOptions_EQ);
{
	if (_this call (_x select 1)) exitwith {
		_return = true;
	};
}foreach _equipOpt;
_return