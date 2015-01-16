/**
 * fn_setEventhandler_f.sqf
 * @Descr: Set the event handler for a specific object. Stacks. Overwrites the CSE module eventhandlers.
 * @Author: Glowbal
 *
 * @Arguments: [object OBJECT, handler STRING, id STRING, code CODE]
 * @Return: nil
 * @PublicAPI: true
 */

private ["_obj", "_handler", "_id", "_code", "_varName", "_handlers", "_found"];
_obj = _this select 0;
_handler = _this select 1;
_id = _this select 2;
_code = _this select 3;

_varName = "cse_f_setEventhandler_" + _handler;
_handlers = _obj getvariable [_varName, []];

_found = -1;
{
	if (_x select 0 == _id) exitwith {
		_found = _foreachIndex;
	};
}foreach _handlers;

if (_found < 0) then {
	_handlers pushback [_id, _code];
} else {
	_handlers set [_found, [_id, _code]];
};

_obj setvariable [_varName, _handlers];

true;