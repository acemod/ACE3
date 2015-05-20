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

private ["_return"];
PARAMS_2(_unit,_magazine);

if (_magazine != "") then {
    _return =  (_magazine in magazines _unit);
} else {
    _return = false;
};

_return