//#define DEBUG_MODE_FULL
#include "script_component.hpp"
private["_vehicleData", "_animationNames", "_animationResults", "_sendToExtension"];
PARAMS_1(_vehicle);

_sendToExtension = false;
if( (count _this) > 1) then {
    _sendToExtension = true;
};

if((typeName _vehicle) != "OBJECT") then {
    _vehicleData = HASH_GET(GVAR(vehicles),_vehicle);
    TRACE_1("", _vehicleData);
    if(isNil "_vehicleData") exitWith { nil };
    _vehicle = _vehicleData select 0;
};

if(isNull _vehicle) exitWith {
    diag_log text format["[ACE] - ERROR! Vehicle was null!!!"];
};

_animationNames = _vehicle getVariable[QGVAR(animationNames), nil];
if(isNil "_animationNames") exitWith {
    diag_log text format["[ACE] - ERROR: Animations not loaded for vehicle [%1]", _vehicle];
};

_animationResults = [];
{
    _animationResults pushBack [_x, (_vehicle animationPhase _x) ];
} forEach _animationNames;
TRACE_1("Returning", _animationResults);

if(_sendToExtension) then {
    private["_cmd"];
    
    _cmd = format["set_animation_state:%1,", (_vehicle getVariable[QGVAR(id), -1])];
    {
        _cmd = _cmd + format["%1,%2,", (_x select 0), ([(_x select 1)] call CBA_fnc_formatNumber)];
    } forEach _animationResults;
    
    _cmd call FUNC(callExtension);
};


_animationResults