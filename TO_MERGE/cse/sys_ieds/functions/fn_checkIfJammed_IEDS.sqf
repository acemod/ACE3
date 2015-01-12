/**
 * fn_checkIfJammed_IEDS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_ied", "_radioBlock", "_personsAround"];
_ied = _this select 0;
_radioBlock = false;
_personsAround = (position _ied) nearEntities [["CaManBase"], 50];
{
	if ((backpack _x == "cse_thorIII_backpack") && {(_x getvariable ["CSE_THOR_III_PACK_ENABLED_IEDS",false])}) exitwith {
		_radioBlock = true;
	};
	false;
}count _personsAround;

_radioBlock