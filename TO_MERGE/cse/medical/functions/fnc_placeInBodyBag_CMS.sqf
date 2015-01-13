/**
 * fn_placeInBodyBag_CMS.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: true
 */

private ["_unit","_caller"];
_unit = _this select 0;
_caller = _this select 1;

if !([_caller, "cse_itemBodyBag"] call cse_fnc_hasItem) exitwith {};

[_caller, "cse_itemBodyBag"] call cse_fnc_useItem;

_nameOfUnit = [_unit] call EFUNC(common,getName);
if (alive _unit) then {
	// force kill the unit.
	[_unit, true] call EFUNC(common,setDead);
};
_onPosition = getPos _unit;
_allVariables = [_unit] call EFUNC(common,getAllDefinedSetVariables);
deleteVehicle _unit;

_bodyBagCreated = createVehicle ["cse_bodyBag", _onPosition, [], 0, "NONE"];
_bodyBagCreated setvariable ["cse_nameOfBody", _nameOfUnit, true];

{
//	[_bodyBagCreated,_x select 0, _x select 2] call EFUNC(common,setDefinedVariable);
}foreach _allVariables;
// reset the position to ensure it is on the correct one.
_bodyBagCreated setPos _onPosition;

[[_bodyBagCreated], "cse_fnc_revealObject_f", true] spawn bis_fnc_MP;

_bodyBagCreated setvariable ["CSE_Logistics_Enable_drag", true, true];

_bodyBagCreated;