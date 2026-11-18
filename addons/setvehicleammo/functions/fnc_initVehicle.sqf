#include "..\script_component.hpp"

params ["_vehicle", "_loadoutValue"];
TRACE_2("params",_vehicle,_loadoutValue);

if (!(_loadoutValue isEqualType "")) exitWith {TRACE_1("not string",_loadoutValue)};
if (_loadoutValue == "") exitWith {TRACE_1("default",_loadoutValue);};
_loadoutValue = call compile _loadoutValue;
if (!(_loadoutValue isEqualType [])) exitWith {TRACE_1("not array",_loadoutValue)};

TRACE_1("",_loadoutValue);
TRACE_3("veh",typeOf _vehicle,local _vehicle,magazines _vehicle);

{
    _x params ["_xPath", "_xMag", "_xCount"];
    while {_xCount < 0} do {
        _vehicle removeMagazineTurret [_xMag, _xPath];
        TRACE_2("removing",_xMag,_xPath);
        _xCount = _xCount + 1;
    };
    while {_xCount > 0} do {
        if (_xCount >= 1) then {
            _vehicle addMagazineTurret [_xMag, _xPath];
            TRACE_2("adding full",_xMag,_xPath);
            _xCount = _xCount - 1;
        } else {
            private _rounds = floor (_xCount * getNumber (configFile >> "CfgMagazines" >> _xMag >> "count"));
            _vehicle addMagazineTurret [_xMag, _xPath, _rounds];
            TRACE_3("adding partial",_xMag,_xPath,_rounds);
            _xCount = 0;
        };
    };
} forEach _loadoutValue;

TRACE_1("veh",magazines _vehicle);
