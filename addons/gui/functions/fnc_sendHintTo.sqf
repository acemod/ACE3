/**
 * fn_sendHintTo.sqf
 * @Descr: Sends a hint to player unit across network
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
		[_this, QUOTE(FUNC(sendHintTo)), _reciever, false] call EFUNC(common,execRemoteFnc);
	} else {
		if (isLocalized _message) then {
			_message = localize _message;
		};
		hintsilent format ["%1",_message];
	};
};