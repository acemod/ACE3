#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Updates the truing drop input method
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_update_truing_drop_selection
 *
 * Public: No
 */

#define __dsp (uiNamespace getVariable "ATragMX_Display")

(__dsp displayCtrl 18009) ctrlEnable true;
(__dsp displayCtrl 18010) ctrlEnable true;

if (GVAR(truingDropMode) == 0) then {
    (__dsp displayCtrl 18009) ctrlEnable false;
    {
        (__dsp displayCtrl _x) ctrlEnable true;
    } forEach [18011, 18013, 18016];
    {
        (__dsp displayCtrl _x) ctrlEnable false;
    } forEach [18012, 18014, 18017];
    ctrlSetFocus (__dsp displayCtrl 18011);
} else {
    (__dsp displayCtrl 18010) ctrlEnable false;
    {
        (__dsp displayCtrl _x) ctrlEnable true;
    } forEach [18012, 18014, 18017];
    {
        (__dsp displayCtrl _x) ctrlEnable false;
    } forEach [18011, 18013, 18016];
    ctrlSetFocus (__dsp displayCtrl 18012);
};

[] call FUNC(update_truing_drop_data);
