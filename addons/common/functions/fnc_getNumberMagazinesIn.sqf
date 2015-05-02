/**
 * fn_getNumberMagazinesIn.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_unit", "_magazine", "_return"];
_unit = _this select 0;
_magazine = _this select 1;

_return = 0;
if (_unit isKindOf "CAManBase") then {
    _return = {_x == _magazine} count magazines _unit;
} else {
    {
        _return = _return + {_x == _magazine} count magazines _x;
    }foreach (crew _unit);

    _return = _return + ({_x == _magazine} count getMagazineCargo _unit);
};

_return