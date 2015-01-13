/**
 * fn_setProne.sqf
 * @Descr: Force a unit to go prone
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: void
 * @PublicAPI: true
 */

private ["_unit"];
_unit = [_this,0, ObjNull,[ObjNull]] call BIS_fnc_Param;
switch (currentWeapon _unit) do {
	case (primaryWeapon _unit): {
		[_unit,"amovppnemstpsraswrfldnon"] call cse_fnc_localAnim;
	};
	case (secondaryWeapon _unit): {
		[_unit,"amovppnemstpsraswlnrdnon"] call cse_fnc_localAnim;
	};
	case (handgunWeapon _unit): {
		 [_unit,"AmovPpneMstpSrasWpstDnon"] call cse_fnc_localAnim;
	};
	default {
		[_unit,"amovppnemstpsnonwnondnon"] call cse_fnc_localAnim;
	};
};