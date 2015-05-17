/*
 * Author: Gundy
 *
 * Description:
 *   Called whenever a interface toggle (open/close) key is pressed. Based on situation will open or close the interface for a BFT device
 *
 * Arguments:
 *   0: 0 = Primary, 1 = Secondary, 3 = Tertiary <INTEGER>
 *
 * Return Value:
 *   Handled <BOOL>
 *
 * Example:
 *   0 call ace_bft_devices_fnc_onIfToggleKey;
 *
 * Public: No
 */

#include "script_component.hpp"

private [];

// exit if we have already an interface starting up
if (GVAR(ifOpenStart)) exitWith {false};

_previousInterface = "";

// close interface and exit if there is an interface open of the same type
if (!isNil QGVAR(ifOpen) && {GVAR(ifOpen) select 0 == _this}) exitWith {
    [] call FUNC(ifClose);
    true
};

// close interface if there is one open
if !(isNil QGVAR(ifOpen)) then {
    _previousInterface = GVAR(ifOpen) select 1;
    [] call FUNC(ifClose);
};

_displayName = switch (_this) do {
    case 0: {QGVAR(GD300_dsp)};
    case 1: {QGVAR(GD300_dlg)};
    default {QGVAR(DK10_dlg)}; // JV5_dlg
};

if (_displayName != "") then {
    // queue the start up of the interface as we might still have one closing down
    [{
        if (isNil QGVAR(ifOpen)) then {
            ((_this select 0) + [ACE_player,vehicle ACE_player]) call FUNC(ifOpen);
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    }, 0, [_this,_displayName] ] call CBA_fnc_addPerFrameHandler;
};

true