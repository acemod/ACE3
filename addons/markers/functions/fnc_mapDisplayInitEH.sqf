#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Handles XEH DisplayLoad for the various map displays (RscDiary)
 *
 * Arguments:
 * 0: Map Display (idd 12,37,52,53) <Display>
 *
 * Return Value:
 * None
 *
 * Example:
 * [display] call ace_markers_fnc_mapDisplayInitEH
 *
 * Public: No
 */

params ["_display"];
TRACE_1("params",_display);

private _bisShapeLB = _display displayctrl 1091;
private _curSelShape = missionNamespace getVariable [QGVAR(curSelMarkerShape), 0];
TRACE_2("shape",_bisShapeLB,_curSelShape);
_bisShapeLB ctrlAddEventHandler ["LBSelChanged", {_this call FUNC(onLBSelChangedShape)}];
_bisShapeLB lbSetCurSel _curSelShape;


private _bisColorLB = _display displayctrl 1090;
private _curSelColor = missionNamespace getVariable [QGVAR(curSelMarkerColor), 0];
TRACE_2("color",_bisColorLB,_curSelColor);
_bisColorLB ctrlAddEventHandler ["LBSelChanged", {_this call FUNC(onLBSelChangedColor)}];
_bisColorLB lbSetCurSel _curSelColor;

// movable markers
private _ctrlMap = _display displayCtrl 51;
_ctrlMap ctrlAddEventHandler ["MouseButtonDown", {_this call FUNC(onMouseButtonDown)}];
_ctrlMap ctrlAddEventHandler ["MouseButtonUp", {_this call FUNC(onMouseButtonUp)}];
