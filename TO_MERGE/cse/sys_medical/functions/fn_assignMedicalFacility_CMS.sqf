/**
 * fn_assignMedicalFacility_CMS.sqf
 * @Descr: Register synchronized objects from passed object as a medical facility for CMS.
 * @Author: Glowbal
 *
 * @Arguments: [logic OBJECT]
 * @Return: BOOL
 * @PublicAPI: true
 */

private ["_logic","_setting","_objects"];
_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (!isNull _logic) then {
	_setting = _logic getvariable ["class",0];
    _objects = synchronizedObjects _logic;
    {
    	if (local _x) then {
    		_x setvariable["cse_medical_facility", true, true];
    	};
	}foreach _objects;
 };

true