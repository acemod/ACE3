#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display"];

private _showToggle = !ctrlShown (_display displayCtrl IDC_menuBar);

if (_showToggle) then {
    [_display, _display displayCtrl GVAR(currentLeftPanel)] call FUNC(populatePanel)
};

{
    private _ctrl = _display displayctrl _x;
    _ctrl ctrlshow _showToggle;
    _ctrl ctrlcommit 0.15;
} foreach [
    IDC_blockLeftFrame,
    IDC_blockLeftBackground,
    IDC_blockRightFrame,
    IDC_blockRighttBackground,
    IDC_loadIndicator,
    IDC_totalWeight,
    IDC_menuBar,
    IDC_infoBox,
    IDC_stats,
    IDC_leftTabContent,
    IDC_rightTabContent,
    IDC_rightTabContentListnBox,
    IDC_sortLeftTab,
    IDC_sortRightTab,
    IDC_leftSearchbar,
    IDC_rightSearchbar,
    IDC_tabLeft,
    RIGHT_PANEL_ACC_BACKGROUND_IDCS,
    RIGHT_PANEL_ACC_IDCS,
    RIGHT_PANEL_ITEMS_BACKGROUND_IDCS,
    RIGHT_PANEL_ITEMS_IDCS,
    RIGHT_PANEL_REMOVE_IDCS
];