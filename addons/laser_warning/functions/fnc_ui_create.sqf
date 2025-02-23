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

    createDialog QGVAR(dialog);
    private _display = uiNamespace getVariable [QGVAR(dialog), displayNull];
    if (isNull _display) exitWith { ERROR("Dialog failed to open"); };

    TRACE_3("opened display",_display,ctrlEnabled (_display displayCtrl 100),ctrlEnabled (_display displayCtrl 111));

    private _scale = 1.0 / (getResolution select 5); // keep object the same size for any interface size
    private _base = ["3d", [0,0,0.3], _scale] call EFUNC(common,rscObjectHelper);
    (_display displayCtrl 100) ctrlSetPosition _base;
    (_display displayCtrl 100) ctrlSetModelScale _scale;

    {
        (_display displayCtrl _x) ctrlAddEventHandler ["MouseButtonUp", { systemChat str ["push!", _this]; }];
        (_display displayCtrl _x) ctrlAddEventHandler ["MouseEnter", { systemChat str ["enter!", _this]; }];
    } forEach [110, 111, 112, 113, 114, 115, 116, 117, 118];

}, _this] call CBA_fnc_execNextFrame;