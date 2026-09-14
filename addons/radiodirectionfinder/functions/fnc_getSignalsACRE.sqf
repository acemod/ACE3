#include "script_component.hpp"
/*
 * Author: PabstMirror
 *
 *
 * Arguments:
 * 0: List of signals (Return) <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_radiodirectionfinder_fnc_getSignalsACRE
 *
 * Public: No
 */

params ["_list"];

// not tested
{
    private _object = _x;
    private _radioId = _object getVariable ["acre_sys_data_CurrentSpeakingRadio", ""];
    if (_radioId == "") then {
        TRACE_1("unknown id",_object);
    } else {
        private _transmittingRadioData = [_radioId, "getCurrentChannelData"] call acre_sys_data_fnc_dataEvent; // cba hash
        private _freqMhz = _transmittingRadioData getVariable ["frequencytx", -1];
        private _powerMW = _transmittingRadioData getVariable ["power", -1];
        TRACE_4("",_object,_radioId,_freqMhz,_powerMW);

        _list pushBack [_object, _freqMhz, _powerMW];
    };
} forEach acre_sys_core_keyedMicRadios; // only remote units
