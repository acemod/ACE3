/**
 * fn_loadPerson_f.sqf
 * @Descr: Loads a specified unit into any nearby vehicle
 * @Author: Glowbal
 *
 * @Arguments: [caller OBJECT, unitToBeLoaded OBJECT]
 * @Return: OBJECT Returns the vehicle that the unitToBeloaded has been loaded in. Returns ObjNull if function failed
 * @PublicAPI: true
 */

#include "script_component.hpp"

#define GROUP_SWITCH_ID QUOTE(FUNC(loadPerson))

private ["_caller", "_unit","_vehicle", "_loadcar", "_loadhelicopter", "_loadtank","_loadboat"];
_caller = [_this, 0, ObjNull,[ObjNull]] call BIS_fnc_Param;
_unit = [_this, 1, ObjNull,[ObjNull]] call BIS_fnc_Param;
_vehicle = ObjNull;

if (!([_caller] call FUNC(canInteract)) || {_caller == _unit}) exitwith {_vehicle};

_loadcar = nearestObject [_unit, "car"];
if (_unit distance _loadcar <= 10) then {
    _vehicle = _loadcar;
} else {
    _loadhelicopter = nearestObject [_unit, "air"];
    if (_unit distance _loadhelicopter <= 10) then {
        _vehicle = _loadhelicopter;
    } else {
        _loadtank = nearestObject [_unit, "tank"];
        if (_unit distance _loadtank <= 10) then {
            _vehicle = _loadtank;
        } else {
            _loadboat = nearestObject [_unit, "ship"];
            if (_unit distance _loadboat <= 10) then {
                _vehicle = _loadboat;
            };
        };
    };
};
if (!isNull _vehicle) then {
    [_unit, true, GROUP_SWITCH_ID, side group _caller] call FUNC(switchToGroupSide);
    [[_unit, _vehicle,_caller], QUOTE(FUNC(loadPersonLocal)), _unit, false] call EFUNC(common,execRemoteFnc);
};
_vehicle
