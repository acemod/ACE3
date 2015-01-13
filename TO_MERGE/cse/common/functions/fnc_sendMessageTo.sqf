/**
 * fn_sendMessageTo.sqf
 * @Descr: Sends a chat message to player unit across the network
 * @Author: Glowbal
 *
 * @Arguments: [reciever OBJECT, message STRING]
 * @Return: void
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_reciever","_message"];
_reciever = _this select 0;
_message = _this select 1;


if (isPlayer _reciever) then {
	if (!local _reciever) then {
	[_this, QUOTE(FUNC(sendMessageTo)), _reciever, false] spawn BIS_fnc_MP;
	} else {
		GVAR(LOGIC_OBJECT) globalChat format ["%1",_message];
	};
};
