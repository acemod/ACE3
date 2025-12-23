#include "..\script_component.hpp"
/*
 * Author: tcvm, PabstMirror
 * Shows dialog to modify LWS settings
 *
 * Arguments:
 * 0: LWS object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player] call ace_laswer_warning_fnc_ui_create;
 *
 * Public: No
 */
[{
    params ["_object"];
    TRACE_1("lws dialog create",_object);

    createDialog QGVAR(box_dialog);
    private _display = uiNamespace getVariable [QGVAR(box_dialog), displayNull];
    if (isNull _display) exitWith { ERROR("Dialog failed to open"); };
    _display setVariable [QGVAR(pfh), -1];
    _display setVariable [QGVAR(object), _object];

    TRACE_3("opened display",_display,ctrlEnabled (_display displayCtrl 100),ctrlEnabled (_display displayCtrl 111));

    private _scale = 1.0 / (getResolution select 5); // keep object the same size for any interface size
    private _base = ["3d", [0,0, 0.3333], _scale] call EFUNC(common,rscObjectHelper);
    (_display displayCtrl 100) ctrlSetPosition _base;
    (_display displayCtrl 100) ctrlSetModelScale _scale;

    [_display] call FUNC(ui_initDisplay);

    _display displayAddEventHandler ["Unload", {
        params ["_display", "_exitCode"];
        private _pfh = _display getVariable [QGVAR(pfh), -1];
        if (_pfh >= 0) then {
            [_pfh] call CBA_fnc_removePerFrameHandler;
        };
    }];

    private _fnc_powerToggle = {
        params ["_control"];
        private _display = ctrlParent _control;
        private _object = _display getVariable [QGVAR(object), objNull];
        if (isNull _object) exitWith {};
        [] call FUNC(ui_togglePower);
    };

    private _fnc_pushButton = {
        params ["_control"];
        private _display = ctrlParent _control;
        private _object = _display getVariable [QGVAR(object), objNull];
        if (isNull _object) exitWith {};
        private _idc = ctrlIDC _control;
        private _pbSource = format ["pb%1", _idc % 10];
        private _box = _display displayCtrl 100;
        _box ctrlAnimateModel [_pbSource, 1.0];

        if ([] call FUNC(isLwsPowered)) then {
            [] call FUNC(ui_pushButton);
        };
    };

    private _fnc_unpushButton = {
        params ["_control"];
        private _display = ctrlParent _control;
        private _object = _display getVariable [QGVAR(object), objNull];
        if (isNull _object) exitWith {};
        private _idc = ctrlIDC _control;
        private _pbSource = format ["pb%1", _idc % 10];
        private _box = _display displayCtrl 100;
        _box ctrlAnimateModel [_pbSource, 0.0];
    };

    (_display displayCtrl 212) ctrlAddEventHandler ["ButtonDown", _fnc_powerToggle];
    {
        (_display displayCtrl _x) ctrlAddEventHandler ["ButtonDown", _fnc_pushButton];
        (_display displayCtrl _x) ctrlAddEventHandler ["ButtonUp", _fnc_unpushButton];
    } forEach [111, 112, 113, 114, 115, 116, 117, 118];

}, _this] call CBA_fnc_execNextFrame;