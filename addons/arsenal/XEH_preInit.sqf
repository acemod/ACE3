#include "script_component.hpp"
#include "defines.hpp"

#define TOOLS_TAB_ICON "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

[QGVAR(statsToggle), {
    params ["_display", "_showStats"];

    private _statsCtrlGroupCtrl = _display displayCtrl IDC_statsBox;
    private _statsPreviousPageCtrl = _display displayCtrl IDC_statsPreviousPage;
    private _statsNextPageCtrl = _display displayCtrl IDC_statsNextPage;
    private _statsCurrentPageCtrl = _display displayCtrl IDC_statsCurrentPage;

    private _statsButtonCtrl = _display displayCtrl IDC_statsButton;
    private _statsButtonCloseCtrl = _display displayCtrl IDC_statsButtonClose;

    {
        _x ctrlShow (GVAR(showStats) && {_showStats});
    } forEach [
        _statsCtrlGroupCtrl,
        _statsPreviousPageCtrl,
        _statsNextPageCtrl,
        _statsCurrentPageCtrl,
        _statsButtonCloseCtrl
    ];

    _statsButtonCtrl ctrlShow (!GVAR(showStats) && {_showStats})
}] call CBA_fnc_addEventHandler;

[QGVAR(statsButton), {
    _this call FUNC(buttonStats);
}] call CBA_fnc_addEventHandler;

[QGVAR(statsChangePage), {
    _this call FUNC(buttonStatsPage);
}] call CBA_fnc_addEventHandler;


[QGVAR(displayStats), {
    _this call FUNC(handleStats);
}] call CBA_fnc_addEventHandler;

call FUNC(compileStats);
call FUNC(compileSorts);

[QUOTE(ADDON), {!isNil QGVAR(camera)}] call CBA_fnc_registerFeatureCamera;

// Compatibility with CBA scripted optics and dispoable framework
[QGVAR(displayOpened), {
    "cba_optics_arsenalOpened" call CBA_fnc_localEvent;
    "cba_disposable_arsenalOpened" call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

[QGVAR(displayClosed), {
    "cba_optics_arsenalClosed" call CBA_fnc_localEvent;
    "cba_disposable_arsenalClosed" call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

// Setup Tools tab
[uiNamespace getVariable [QGVAR(configItemsTools), []], localize LSTRING(toolsTab), TOOLS_TAB_ICON] call FUNC(addRightPanelButton);


ADDON = true;
