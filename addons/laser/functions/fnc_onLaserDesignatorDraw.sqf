#define DEBUG_MODE_FULL
#include "script_component.hpp"
TRACE_1("", _this);
private["_laserCode"];

_laserCode = ACE_player getVariable[QGVAR(code), ACE_DEFAULT_LASER_CODE];
if(!isNil "_laserCode") then {
    __LaserDesignatorIGUI_LaserCode ctrlSetText format["Code: %1", [_laserCode, 4, 0, false] call CBA_fnc_formatNumber];
};