#include "script_component.hpp"
/*
 * Author: PabstMirror
 *
 *
 * Arguments:
 * 0: <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_radiodirectionfinder_fnc_getSignals
 *
 * Public: No
 */
params ["_positionASL", "_targetFreq", "_maxSignals"];
// TRACE_3("getSignals",_positionASL,_targetFreq,_maxSignals);

// semi-cached (Run though only a single source func each tick, then process all at end)
if (GVAR(signalStage) < count GVAR(signalSourceFuncs)) then {
    [GVAR(signalsAccumulator)] call (GVAR(signalSourceFuncs) select GVAR(signalStage));
    // TRACE_2("tick",GVAR(signalsAccumulator),GVAR(signalStage));
    GVAR(signalStage) = GVAR(signalStage) + 1;
} else {
    GVAR(signalStage) = 0;
    GVAR(signalsLast) = [];
    {
        _x params ["_object", "_freqMhz", "_powerMW"];
        if ((_targetFreq == 0) || {(abs (_targetFreq - _freqMhz)) < 9}) then {

            private _xPosASL = if (_object isEqualType []) then { _object } else { getPosASL _object };
            private _distance = (_positionASL vectorDistance _xPosASL) max 5;

            // for meters/MHz/miliwatts (ignoring antenna gain, terrain.....)
            private _rtx = (10 * log _powerMW) - (-27.55 + 20 * log _freqMhz + 20 * log _distance);
            private _bearing = (_positionASL getDir _xPosASL) + 2 * sin (time * 6) + 2 * sin (time * 20); // add some drift

            GVAR(signalsLast) pushBack [_rtx, _freqMhz, _bearing];
            #ifdef DEBUG_MODE_FULL
            systemChat format ["%1: %2dbm %3mhz %4 deg", _object, _rtx toFixed 1, _freqMhz toFixed 0, _bearing toFixed 1];
            #endif
        };
    } forEach GVAR(signalsAccumulator);

    GVAR(signalsAccumulator) = [];
    GVAR(signalsLast) sort true; // sort by recieved power
    if ((count GVAR(signalsLast)) > _maxSignals) then { GVAR(signalsLast) resize _maxSignals };
};

// return
GVAR(signalsLast)
