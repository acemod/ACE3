/*
 * Author: Ruthberg
 * Updates the Kestrel 4500 dialog text boxes.
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 *
 * Public: No
 */
#include "script_component.hpp"

#define __dsp (uiNamespace getVariable "Kestrel4500_Display")
#define __ctrlCenterLine3 (__dsp displayCtrl 74602)
#define __ctrlCenterLine4 (__dsp displayCtrl 74603)

private ["_outputData"];

_outputData = [] call FUNC(generateOutputData);

ctrlSetText [74100, _outputData select 0];
ctrlSetText [74200, _outputData select 1];
ctrlSetText [74201, _outputData select 2];

ctrlSetText [74300, _outputData select 3];
ctrlSetText [74301, _outputData select 4];
ctrlSetText [74302, _outputData select 5];

ctrlSetText [74303, _outputData select 6];
ctrlSetText [74304, _outputData select 7];
ctrlSetText [74305, _outputData select 8];

ctrlSetText [74400, _outputData select 9];
ctrlSetText [74401, _outputData select 10];

ctrlSetText [74500, _outputData select 11];

ctrlSetText [74600, _outputData select 12];
ctrlSetText [74601, _outputData select 13];
ctrlSetText [74602, _outputData select 14];
ctrlSetText [74603, _outputData select 15];
ctrlSetText [74604, _outputData select 16];
ctrlSetText [74605, _outputData select 17];

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
