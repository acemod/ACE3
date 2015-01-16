/**
 * fn_hasMagazine.sqf
 * @Descr: Check if given unit has a magazine of given classname
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, magazine STRING]
 * @Return: BOOL  True if unith as given magazine
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_unit","_magazine","_return"];
_unit = _this select 0;
_magazine = _this select 1;

if (_magazine != "") then {
	_return =  (_magazine in magazines _unit);
} else {
	_return = false;
};
_return