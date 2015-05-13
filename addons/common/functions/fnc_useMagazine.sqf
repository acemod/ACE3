/**
 * fn_useMagazine.sqf
 * @Descr: Use magazine
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECt, magazine STRING]
 * @Return: BOOL True if magazine has been used.
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_return"];
PARAMS_2(_unit,_magazine);
_vehicleUsage = [_this, 2, false, [false]] call BIS_fnc_Param;

if (!_vehicleUsage) then {
    if (_magazine != "") then {
        _unit removeMagazine _magazine;
        _return = true;
    } else {
        _return = false;
    };
    [format["fnc_useMagazine: %1 | %2",_this,_return]] call FUNC(debug);
_return
} else {
    // TODO implement shared magazine functionality
};