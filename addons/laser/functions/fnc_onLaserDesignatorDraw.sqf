/*
 * Author: ?
 * ?
 *
 * Arguments:
 * 0: ? <?>
 *
 * Return Value:
 * ? <?>
 *
 * Example:
 * [?] call ace_laser_fnc_onLaserDesignatorDraw
 *
 * Public: No
 */
#include "script_component.hpp"
private["_laserCode"];

_laserCode = ACE_player getVariable[QGVAR(code), ACE_DEFAULT_LASER_CODE];
if(!isNil "_laserCode") then {
    __LaserDesignatorIGUI_LaserCode ctrlSetText format["Code: %1", [_laserCode, 4, 0, false] call CBA_fnc_formatNumber];
};

if(! (ctrlShown __LaserDesignatorIGUI_LaserOn) ) then {
    // TODO: hide distance
    __LaserDesignatorIGUI_ACE_Distance ctrlSetText "----";
} else {
    __LaserDesignatorIGUI_ACE_Distance ctrlSetText (ctrlText __LaserDesignatorIGUI_CA_Distance);
};
