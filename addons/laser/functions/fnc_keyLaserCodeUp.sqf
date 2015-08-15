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
 * [?] call ace_laser_fnc_keyLaserCodeUp
 *
 * Public: No
 */
#include "script_component.hpp"
private["_oldLaserCode", "_laserCode"];

_oldLaserCode = ACE_player getVariable [QGVAR(code), ACE_DEFAULT_LASER_CODE];
_laserCode = _oldLaserCode + 1;
ACE_player setVariable [QGVAR(code), _laserCode, false];
if(_laserCode != _oldLaserCode) then {
    [format ["%1: %2", localize LSTRING(laserCode), _laserCode]] call EFUNC(common,displayTextStructured);
};
