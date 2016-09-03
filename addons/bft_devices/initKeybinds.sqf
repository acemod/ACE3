#include "\a3\editor_f\Data\Scripts\dikCodes.h"

["ACE3 BFT Devices", QGVAR(IfPrimaryKey), [localize LSTRING(IfPrimaryKey_Name), localize LSTRING(IfPrimaryKey_ToolTip)], {0 call FUNC(onIfToggleKey)}, "", [DIK_H, [false, false, false]], false] call CBA_fnc_addKeybind;
["ACE3 BFT Devices", QGVAR(IfSecondaryKey), [localize LSTRING(IfSecondaryKey_Name), localize LSTRING(IfSecondaryKey_ToolTip)], {1 call FUNC(onIfToggleKey)}, "", [DIK_H, [false, true, false]], false] call CBA_fnc_addKeybind;
["ACE3 BFT Devices", QGVAR(IfTertiaryKey), [localize LSTRING(IfTertiaryKey_Name), localize LSTRING(IfTertiaryKey_ToolTip)], {2 call FUNC(onIfToggleKey)}, "", [DIK_H, [false, false, true]], false] call CBA_fnc_addKeybind;
["ACE3 BFT Devices", QGVAR(IfZoomInKey), [localize LSTRING(IfZoomInKey_Name), localize LSTRING(IfZoomInKey_ToolTip)], {0 call FUNC(onIfZoomKey)}, "", [DIK_PGUP, [true, true, false]], false] call CBA_fnc_addKeybind;
["ACE3 BFT Devices", QGVAR(IfZoomOutKey), [localize LSTRING(IfZoomOutKey_Name), localize LSTRING(IfZoomOutKey_ToolTip)], {1 call FUNC(onIfZoomKey)}, "", [DIK_PGDN, [true, true, false]], false] call CBA_fnc_addKeybind;
["ACE3 BFT Devices", QGVAR(IfTogglePositionKey), [localize LSTRING(IfTogglePositionKey_Name), localize LSTRING(IfTogglePositionKey_ToolTip)], {[] call FUNC(onIfTogglePositionKey)}, "", [DIK_HOME, [true, true, false]], false] call CBA_fnc_addKeybind;