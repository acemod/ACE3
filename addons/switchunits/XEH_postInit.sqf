/*
 * Author: bux578
 * Initializes the SwitchUnits pbo.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"


if (missionNamespace getVariable [QGVAR(EnableSwitchUnits), false]) then {
    [player] call FUNC(startSwitchUnits);
} else {
    ["SettingChanged", {
        PARAMS_2(_name,_value);
        if ((_name == QGVAR(EnableSwitchUnits)) && {_value}) then {
            [player] call FUNC(startSwitchUnits);
        };
    }] call EFUNC(common,addEventhandler);
};
