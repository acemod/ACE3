#include "script_component.hpp"

ADDON = false;

PREP(KeyBoardHandler);
PREP(ClickHandler);
PREP(IconScaler);
PREP(DragHandler);
PREP(MouseHandler);
PREP(OverObject);
PREP(FreeHandLine);
PREP(EndFreehandLine);
PREP(SelectLine);
PREP(DeSelectLine);
PREP(DeleteLine);
PREP(StraightLine);
PREP(EndStraightLine);
PREP(handleData);
PREP(copymap);

GVAR(Enabled)				= true;
GVAR(MouseDown)             = false;
GVAR(DragOK)                = false;
GVAR(OffDrag)               = false;
GVAR(LastDragPosition)      = [];
GVAR(RulerStartPos)         = [];
GVAR(MouseShift)            = false;
GVAR(LastDragAzimuth)       = -1000;
GVAR(MapLineNumber)         = 0;
GVAR(MapLineSegmentStart)   = [0, 0, 0];
GVAR(MapLineColor)          = 0;
GVAR(MapPreviousDir)        = 0;
GVAR(RulerKeyDown)          = -1000;
GVAR(RemoteLinesCount)      = 0;
GVAR(UpHandlerFnc)          = {};
GVAR(LineSegment)           = 0;
GVAR(LastLineSegment)       = [];
GVAR(FreeHandLines)         = [];
GVAR(LineColors)            = ["ColorBlack", "ColorBlue", "ColorBrown", "ColorGreen", "ColorRed", "ColorKhaki", "ColorPink", "ColorYellow", "ColorWhite"];
GVAR(SelectedLine)          = "";
GVAR(SelectedType)          = -1;
GVAR(RulerLines)            = [];
GVAR(CopyNumber)            = 0;
GVAR(CurrentTarget)         = nil;
GVAR(CopyNumber)            = 0;
GVAR(CopyTotal)             = 0;
GVAR(LocalTransmitChannel)  = -1;
GVAR(DragAction)            = "";
GVAR(IconScalerPID)         = _this spawn {};

["CAManBase", [ace_sys_interaction_key], -2, [QPATHTO_F(fnc_copymap_menuDef), "main"]] call CBA_ui_fnc_add;

ADDON = true;