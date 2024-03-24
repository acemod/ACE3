#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: john681611
 * Runs a Quick time Event.
 *
 * Arguments:
 * 0: Object QTE is attached to <OBJECT>
 * 1: Arguments, passed to condition, fail and finish <ARRAY>
 * 2: On Finish: Code called or STRING raised as event. <CODE, STRING>
 * 3: On Failure: Code called or STRING raised as event. <CODE, STRING>
 * 4: QTE Seqence <ARRAY>
 * 5: max interaction distance from attached object <NUMBER> (default: 10) 
 * 6: timout <NUMBER> (default: 30) 
 *
 * Return Value:
 * None
 *
 * Example:
 * [car, [], { hint "Finished!" }, { hint "Failure!" }, ["↑", "↓", "→", "←"]] call ace_common_fnc_runQTE
 *
 * Public: Yes
 */

params ["_object", "_args", "_onFinish", "_onFail", "_qte_seqence", ["_max_distance", 10], ["_timeout", 30]];

if (!GVAR(settingsInitFinished)) exitWith {
    // only run this after the settings are initialized
    GVAR(runAtSettingsInitialized) pushBack [FUNC(runQTE), _this];
};

if (GVAR(QTERunning)) exitWith {
    TRACE_1("QTE already running qeueing up",GVAR(QTERunning));
    [{
        !GVAR(QTERunning)
    }, {
        _this call FUNC(runQTE);
    }, _this] call CBA_fnc_waitUntilAndExecute;
};

private _display = findDisplay 46;

if (isNull _display) exitWith {
    TRACE_1("Waiting for main display to be ready",isNull (_display));
    [{
        !isNull (findDisplay 46)
    }, {
        _this call FUNC(runQTE);
    }, _this] call CBA_fnc_waitUntilAndExecute;
};

hint format ["%1: \n %2", LLSTRING(QTEInput), [_qte_seqence] call FUNC(getFormattedQTESequence)];

GVAR(QTEHistory) = [];
GVAR(QTERunning) = true;
private _start_time = CBA_missionTime;

[_display, "KeyUp", {
    params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
    _thisArgs params ["_object", "_args", "_onFinish", "_onFail", "_max_distance", "_qte_seqence", "_start_time", "_timeout", "_display"];
    private _elapsedTime = CBA_missionTime - _start_time;

    if (ACE_player distance _object > _max_distance || _elapsedTime > _timeout) exitWith {
        hint (LLSTRING(QTECancelled));
        _display displayRemoveEventHandler ["KeyUp", _thisID];
        GVAR(QTERunning) = false;
        if (_onFail isEqualType "") then {
            [_onFail, [_args, _elapsedTime]] call CBA_fnc_localEvent;
        } else {
            [_args, _elapsedTime] call _onFail;
        };
    };

    private _inputKeys = [DIK_UP, DIK_DOWN, DIK_LEFT, DIK_RIGHT];
    switch (GVAR(QTEInputKeys)) do {
        case 1: {
            _inputKeys = [DIK_W, DIK_S, DIK_A, DIK_D];
        };
        case 2: {
            _inputKeys = [DIK_I, DIK_K, DIK_J, DIK_L];
        };
        case 3: {
            _inputKeys = [DIK_NUMPAD8, DIK_NUMPAD2, DIK_NUMPAD4, DIK_NUMPAD6];
        };
        default {
            _inputKeys = [DIK_UP, DIK_DOWN, DIK_LEFT, DIK_RIGHT];
        };
    };

    if !(_key in _inputKeys) exitWith {};

    if ((GVAR(QTEHoldKey) == 0 && !_ctrl) ||
    (GVAR(QTEHoldKey) == 1 &&!_alt) ||
    (GVAR(QTEHoldKey) == 2 &&!_shift)) exitWith {
        GVAR(QTEHistory) = [];
        hintSilent format ["%1: \n %2 \n %3", LLSTRING(QTEInput), [_qte_seqence] call FUNC(getFormattedQTESequence), [GVAR(QTEHistory)] call FUNC(getFormattedQTESequence)];
    };
    _override = true;

    if (_key == (_inputKeys select 0)) then {
        GVAR(QTEHistory) pushBack "↑";
    };

    if (_key == (_inputKeys select 1)) then {
        GVAR(QTEHistory) pushBack "↓";
    };

    if (_key == (_inputKeys select 2)) then {
        GVAR(QTEHistory) pushBack "←";
    };

    if (_key == (_inputKeys select 3)) then {
        GVAR(QTEHistory) pushBack "→";
    };
    if (GVAR(QTEHistory) isEqualTo _qte_seqence) exitWith {
        hint (LLSTRING(QTEAccepted));
        GVAR(QTEHistory) = [];
        _display displayRemoveEventHandler ["KeyUp", _thisID];
        GVAR(QTERunning) = false;
        if (_onFinish isEqualType "") then {
            [_onFinish, [_args, _elapsedTime]] call CBA_fnc_localEvent;
        } else {
            [_args, _elapsedTime] call _onFinish;
        };
    };

    if !(GVAR(QTEHistory) isEqualTo (_qte_seqence select [0, count GVAR(QTEHistory)])) then {
        GVAR(QTEHistory) = [];
    };

    hintSilent format ["%1: \n %2 \n %3", LLSTRING(QTEInput), [_qte_seqence] call FUNC(getFormattedQTESequence), [GVAR(QTEHistory)] call FUNC(getFormattedQTESequence)];
    true;
    }, [
        _object,
        _args,
        _onFinish,
        _onFail,
        _max_distance,
        _qte_seqence,
        _start_time,
        _timeout,
        _display
    ]] call CBA_fnc_addBISEventHandler;
