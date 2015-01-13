/**
 * fn_removeEventhandler_f.sqf
 * @Descr: Removes an eventhandler with the specified ID
 * @Author: Glowbal
 *
 * @Arguments: [object OBJECT, handler STRING, id STRING]
 * @Return: nil
 * @PublicAPI: true
 */

private ["_obj", "_handler", "_id", "_varName", "_handlers", "_newHandlers"];
_obj = _this select 0;
_handler = _this select 1;
_id = _this select 2;

_varName = "cse_f_setEventhandler_" + _handler;
_handlers = _obj getvariable [_varName, []];

_newHandlers = [];
{
	if (_x select 0 != _id) then {
		_newHandlers pushback _x;
	};
}foreach _handlers;

if (count _newHandlers > 0) then {
	_obj setvariable [_varName, _newHandlers];
} else {
	// remove and default to original CSE handlers
	_obj setvariable [_varName, nil];
};

true;