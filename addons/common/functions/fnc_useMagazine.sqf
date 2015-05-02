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

private ["_unit","_magazine","_return", "_vehicleUsage"];
_unit = _this select 0;
_magazine = _this select 1;
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
} else
{
    // TODO implement shared magazine functionality
};