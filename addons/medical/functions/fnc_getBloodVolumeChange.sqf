/**
 * fn_getBloodVolumeChange.sqf
 * @Descr: Calculates the blood volume change and decreases the IVs given to the unit.
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return: NUMBER Bloodvolume change
 * @PublicAPI: false
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
_bloodVolumeChange = -(_unit call FUNC(getBloodLoss));

if (_bloodVolume < 100.0) then {
    if ((_unit getvariable [QGVAR(salineIVVolume), 0]) > 0) then {
        _bloodVolumeChange = _bloodVolumeChange + BLOOD_CHANGE_PER_SECOND;
        _ivVolume = (_unit getvariable [QGVAR(salineIVVolume), 0]) + IV_CHANGE_PER_SECOND;
        _unit setvariable [QGVAR(salineIVVolume),_ivVolume];
        if ([QEGVAR(fieldRations,module)] call EFUNC(common,isModuleEnabled)) then {
            if ([_unit] call EFUNC(fieldRations,canDrink)) then {
                _unit setvariable [QEGVAR(fieldRations,drinkStatus), (_unit getvariable [QEGVAR(fieldRations,drinkStatus), 100]) + 0.2];
            };
        };
    };
    if ((_unit getvariable [QGVAR(plasmaIVVolume), 0]) > 0) then {
        _bloodVolumeChange = _bloodVolumeChange + BLOOD_CHANGE_PER_SECOND;
        _ivVolume = (_unit getvariable [QGVAR(plasmaIVVolume), 0]) + IV_CHANGE_PER_SECOND;
        _unit setvariable [QGVAR(plasmaIVVolume),_ivVolume];
    };
    if ((_unit getvariable [QGVAR(bloodIVVolume), 0]) > 0) then {
        _bloodVolumeChange = _bloodVolumeChange + BLOOD_CHANGE_PER_SECOND;
        _ivVolume = (_unit getvariable [QGVAR(bloodIVVolume), 0]) + IV_CHANGE_PER_SECOND;
        _unit setvariable [QGVAR(bloodIVVolume),_ivVolume];
    };
};

_bloodVolumeChange
