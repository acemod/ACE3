/*
 * Author: Gundy
 *
 * Description:
 *   Handles drawing on the BFT screens, called by onDraw event
 *
 * Arguments:
 *   0: Mode, 0 = draw normal, 1 = draw for TAD, 2 = draw for MicroDAGR <INTEGER>
 *   1: _this variable from the onDraw event <ARRAY>
 *     0: Map control <OBJECT>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   ["textIncrease",_this] call ace_bft_devices_fnc_ifOnDrawBFT;
 *
 * Public: No
 */

#include "script_component.hpp"

#include "\z\ace\addons\bft_devices\UI\defines\shared_defines.hpp"

private [];

_mode = _this select 0;
_ctrlScreen = _this select 1 select 0;
_display = ctrlParent _ctrlScreen;

_vehicle = vehicle ACE_player;
_position = getPosASL _vehicle;
_heading = direction _vehicle;

// temporary bodge
_isDialog = [GVAR(ifOpen) select 1] call FUNC(isDialog);

if (_isDialog) then {
    GVAR(mapWorldPos) = [_ctrlScreen] call FUNC(ctrlMapCenter);
    GVAR(mapScale) = ctrlMapScale _ctrlScreen;
} else {
    // change scale of map and centre to player position
    _ctrlScreen ctrlMapAnimAdd [0,GVAR(mapScale),_position];
    ctrlMapAnimCommit _ctrlScreen;
};

// draw vehicle icon at own location
_ctrlScreen drawIcon [GVAR(playerVehicleIcon),COLOR_NEON_GREEN_ARR,_position,GVAR(ownIconScaledSize),GVAR(ownIconScaledSize),_heading,"",1,GVAR(textSize),"TahomaB"];

if (_mode == 1 && !GVAR(drawMapTools)) then {
    // draw TAD overlay (two circles, one at full scale, the other at half scale + current heading)
    _ctrlScreen drawIcon [QUOTE(PATHTOF(UI\images\TAD_overlay_ca.paa)),COLOR_NEON_GREEN_ARR,_position,250,250,_heading,"",1,GVAR(textSize),"TahomaB"];
};

if (GVAR(drawMapTools)) then {
    _dirToSecondPos = call {
        if (GVAR(mapToolsArrowToCursor)) exitWith {
            _ctrlScreen drawArrow [_position,GVAR(mapCursorPos),COLOR_NEON_YELLOW_ARR];
            [_position,GVAR(mapCursorPos)] call FUNC(dirTo)
        };
        _ctrlScreen drawArrow [GVAR(mapCursorPos),_position,COLOR_NEON_YELLOW_ARR];
        [GVAR(mapCursorPos),_position] call FUNC(dirTo)
    };
    _dstToSecondPos = [_position,GVAR(mapCursorPos)] call FUNC(distance2D);
    call {
        // Call this if we are drawing for a TAD
        if (_mode == 1) exitWith {
            (_display displayCtrl IDC_OSD_HOOK_GRID) ctrlSetText format ["%1",mapGridPosition GVAR(mapCursorPos)];
            (_display displayCtrl IDC_OSD_HOOK_ELEVATION) ctrlSetText format ["%1m",[round getTerrainHeightASL GVAR(mapCursorPos),3] call CBA_fnc_formatNumber];
            (_display displayCtrl IDC_OSD_HOOK_DIR) ctrlSetText format ["%1°/%2",[_dirToSecondPos,3] call CBA_fnc_formatNumber,[_dstToSecondPos / 1000,2,1] call CBA_fnc_formatNumber];
        };
        (_display displayCtrl IDC_OSD_HOOK_GRID) ctrlSetText format ["%1",mapGridPosition GVAR(mapCursorPos)];
        (_display displayCtrl IDC_OSD_HOOK_ELEVATION) ctrlSetText format ["%1m",round getTerrainHeightASL GVAR(mapCursorPos)];
        (_display displayCtrl IDC_OSD_HOOK_DIR) ctrlSetText format ["%1° %2",[_dirToSecondPos,3] call CBA_fnc_formatNumber,[_dirToSecondPos] call FUNC(degreeToOctant)];
        (_display displayCtrl IDC_OSD_HOOK_DST) ctrlSetText format ["%1km",[_dstToSecondPos / 1000,1,2] call CBA_fnc_formatNumber];
    };
} else {
    if (_mode == 1) then {
        // draw TAD overlay (two circles, one at full scale, the other at half scale + current heading)
        _ctrlScreen drawIcon [QUOTE(PATHTOF(UI\images\TAD_overlay_ca.paa)),COLOR_NEON_GREEN_ARR,_position,250,250,_heading,"",1,GVAR(textSize),"TahomaB"];
    };
};

true