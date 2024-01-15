#include "script_component.hpp"
#include "defines.hpp"

#define TOOLS_TAB_ICON "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

// Arsenal events
[QGVAR(statsToggle), {
    params ["_display", "_showStats"];

    _showStats = GVAR(showStats) && _showStats;

    private _statsCtrlGroupCtrl = _display displayCtrl IDC_statsBox;
    private _statsPreviousPageCtrl = _display displayCtrl IDC_statsPreviousPage;
    private _statsNextPageCtrl = _display displayCtrl IDC_statsNextPage;
    private _statsCurrentPageCtrl = _display displayCtrl IDC_statsCurrentPage;

    {
        _x ctrlShow _showStats;
    } forEach [
        _statsCtrlGroupCtrl,
        _statsPreviousPageCtrl,
        _statsNextPageCtrl,
        _statsCurrentPageCtrl
    ];

    if (!_showStats) exitWith {};

    GVAR(statsInfo) params ["", "_control", "_curSel", "_itemCfg"];

    [QGVAR(displayStats), [_display, _control, _curSel, _itemCfg]] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

[QGVAR(statsChangePage), LINKFUNC(buttonStatsPage)] call CBA_fnc_addEventHandler;
[QGVAR(displayStats), LINKFUNC(handleStats)] call CBA_fnc_addEventHandler;

[QGVAR(actionsToggle), {
    params ["_display", "_showActions"];

    _showActions = GVAR(showActions) && _showActions;

    private _actionsCtrlGroupCtrl = _display displayCtrl IDC_actionsBox;
    private _actionsPreviousPageCtrl = _display displayCtrl IDC_actionsPreviousPage;
    private _actionsNextPageCtrl = _display displayCtrl IDC_actionsNextPage;
    private _actionsCurrentPageCtrl = _display displayCtrl IDC_actionsCurrentPage;

    {
        _x ctrlShow _showActions;
    } forEach [
        _actionsCtrlGroupCtrl,
        _actionsPreviousPageCtrl,
        _actionsNextPageCtrl,
        _actionsCurrentPageCtrl
    ];

    if (!_showActions) exitWith {};

    GVAR(actionsInfo) params ["_control", "_curSel", "_itemCfg"];

    [QGVAR(displayActions), [_display, _control, _curSel, _itemCfg]] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

[QGVAR(actionsChangePage), LINKFUNC(buttonActionsPage)] call CBA_fnc_addEventHandler;
[QGVAR(displayActions), LINKFUNC(handleActions)] call CBA_fnc_addEventHandler;

call FUNC(compileActions);
call FUNC(compileSorts);
call FUNC(compileStats);

[QUOTE(ADDON), {!isNil QGVAR(camera)}] call CBA_fnc_registerFeatureCamera;

// Compatibility with CBA scripted optics and disposable framework
[QGVAR(displayOpened), {
    "CBA_optics_arsenalOpened" call CBA_fnc_localEvent;
    "CBA_disposable_arsenalOpened" call CBA_fnc_localEvent;
    EGVAR(common,blockItemReplacement) = true;
}] call CBA_fnc_addEventHandler;

[QGVAR(displayClosed), {
    "CBA_optics_arsenalClosed" call CBA_fnc_localEvent;
    "CBA_disposable_arsenalClosed" call CBA_fnc_localEvent;
    EGVAR(common,blockItemReplacement) = false;
}] call CBA_fnc_addEventHandler;

// Setup Tools tab
[keys (uiNamespace getVariable [QGVAR(configItemsTools), createHashMap]), LLSTRING(toolsTab), TOOLS_TAB_ICON, -1, true] call FUNC(addRightPanelButton);

ADDON = true;
