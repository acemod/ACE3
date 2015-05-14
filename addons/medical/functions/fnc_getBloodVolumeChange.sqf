/*
 * Author: Glowbal
 * Calculates the blood volume change and decreases the IVs given to the unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * Current cardiac output <NUMBER>
 *
 * Public: No
 */

#include "script_component.hpp"

/*
    IV Change per second calculation:
    250ml should take 60 seconds to fill. 250/60 = 4.166.
*/
#define IV_CHANGE_PER_SECOND         -4.166

/*
    Blood Change per second calculation for IVs:
    250ml should take 60 seconds to fill in. Total blood volume is 7000ml = 100%.
    7000/100 = 70 = 1%
    250 / 70 = 3.571428571%
    3.571428571 / 60 = 0.0595% per second.
*/
#define BLOOD_CHANGE_PER_SECOND        0.0595



private ["_unit","_bloodVolume","_bloodVolumeChange", "_ivVolume"];
_unit = _this select 0;

_bloodVolume = _unit getvariable [QGVAR(bloodVolume), 100];
_bloodVolumeChange = -([_unit] call FUNC(getBloodLoss));

if (_bloodVolume < 100.0) then {
    {
        if ((_unit getvariable [_x, 0]) > 0) then {
            _bloodVolumeChange = _bloodVolumeChange + BLOOD_CHANGE_PER_SECOND;
            _ivVolume = (_unit getvariable [_x, 0]) + IV_CHANGE_PER_SECOND;
            _unit setvariable [_x,_ivVolume];
        };
    }foreach GVAR(IVBags);
} else {
    {
        if ((_unit getvariable [_x, 0]) > 0) then {
            _unit setvariable [_x, 0]; // lets get rid of exessive IV volume
        };
    }foreach GVAR(IVBags);
};

_bloodVolumeChange;
