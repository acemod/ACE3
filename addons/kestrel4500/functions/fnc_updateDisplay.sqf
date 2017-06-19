/*
 * Author: Ruthberg
 * Updates the Kestrel 4500 dialog text boxes.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 *
 * Public: No
 */
#include "script_component.hpp"

#define __dsp (uiNamespace getVariable "Kestrel4500_Display")
#define __ctrlCenterLine3 (__dsp displayCtrl 74602)
#define __ctrlCenterLine4 (__dsp displayCtrl 74603)

private _outputData = [] call FUNC(generateOutputData);

{
    ctrlSetText [_x , _outputData select _forEachIndex];
} forEach [74100, 74200, 74201, 74300, 74301, 74302, 74303, 74304, 74305, 74400, 74401, 74500, 74600, 74601, 74602, 74603, 74604, 74605];

if (GVAR(referenceHeadingMenu) == 1) then {
    if (GVAR(referenceHeadingAutoSet)) then {
        __ctrlCenterLine3 ctrlSetTextColor [0, 0, 0, 0.6];
        __ctrlCenterLine4 ctrlSetTextColor [0, 0, 0, 1.0];
    } else {
        __ctrlCenterLine3 ctrlSetTextColor [0, 0, 0, 1.0];
        __ctrlCenterLine4 ctrlSetTextColor [0, 0, 0, 0.6];
    };
} else {
    __ctrlCenterLine3 ctrlSetTextColor [0, 0, 0, 1.0];
    __ctrlCenterLine4 ctrlSetTextColor [0, 0, 0, 1.0];
};
