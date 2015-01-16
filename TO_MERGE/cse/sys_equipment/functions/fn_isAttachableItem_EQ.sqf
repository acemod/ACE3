/**
 * fn_isAttachableItem_EQ.sqf
 * @Descr: Check if item is an attachable Item.
 * @Author: Glowbal
 *
 * @Arguments: [item STRING (Classname of item)]
 * @Return: BOOL
 * @PublicAPI: false
 */

private ["_chemlight","_return"];
_chemlight = _this select 0;
_return = switch (_chemlight) do {
	case "Chemlight_blue": {true};
	case "Chemlight_red": {true};
	case "Chemlight_green": {true};
	case "Chemlight_yellow": {true};
	case "B_IR_Grenade": {true};
	case "I_IR_Grenade": {true};
	case "O_IR_Grenade": {true};
	default {false};
};
_return