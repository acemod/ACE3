#include "script_component.hpp"

private["_args", "_laserTarget"];
//TRACE_1("enter", _this);
_args = _this select 0;
_laserTarget = _args select 0;

if(isNull _laserTarget || !alive player) exitWith {
    [(_this select 1)] call cba_fnc_removePerFrameHandler;
    REM(ACE_LASERS, _laserTarget);
};

_end = diag_tickTime;

#ifdef DEBUG_MODE_FULL
// Iconize the location of the actual laserTarget
_pos = [_laserTarget] call FUNC(getPosASL);
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,0,0,1], (ASLtoATL _pos), 0.75, 0.75, 0, "", 0.5, 0.025, "TahomaB"];

{
    drawLine3D [ASLtoATL (_x select 0), ASLtoATL (_x select 1), (_x select 2)];
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", (_x select 2), ASLtoATL (_x select 1), 0.75, 0.75, 0, "", 0.5, 0.025, "TahomaB"];
} forEach DRAW_LINES;
DRAW_LINES = [];
#endif

