#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display"];

private _showToggle = !ctrlShown (_display displayCtrl IDC_menuBar);
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
    IDC_menuBar,
    IDC_infoBox,
    IDC_stats,
    IDC_leftTabContent,
    IDC_rightTabContent,
    IDC_sortLeftTab,
    IDC_sortRightTab,
    IDC_leftSearchbar,
    IDC_rightSearchbar,
    IDC_tabLeft,
    IDC_tabRight,
    IDC_tabRight2
];