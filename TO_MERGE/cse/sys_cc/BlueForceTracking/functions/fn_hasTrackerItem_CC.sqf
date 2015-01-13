/**
 * fn_hasTrackerItem_CC.sqf
 * @Descr: Check if unit has a BFT enabled item
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return:  BOOL
 * @PublicAPI: true
 */

private["_unit"];
_unit = _this select 0;
if (!isNull _unit && {(_unit iskindof "CaManBase")}) exitwith {
	(({([_x] call cse_fnc_isBFTItem_CC)}count ((items _unit) + (assignedItems _unit))) > 0);
};
false