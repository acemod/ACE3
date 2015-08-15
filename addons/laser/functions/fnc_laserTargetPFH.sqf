/*
 * Author: ?
 * ?
 *
 * Arguments:
 * 0: ? <?>
 *
 * Return Value:
 * ? <?>
 *
 * Example:
 * [?] call ace_laser_fnc_laserTargetPFH
 *
 * Public: No
 */
#include "script_component.hpp"
TRACE_1("enter", _this);

params ["_args", "_idPFH"];
_args params ["_laserTarget", "_shooter", "_uuid"];

if(isNull _laserTarget || !alive _shooter) exitWith {
    [_idPFH] call cba_fnc_removePerFrameHandler;
    REM(GVAR(VanillaLasers), _laserTarget);

    // Remove laseron
    [_uuid] call FUNC(laserOff);
};

#ifdef DEBUG_MODE_FULL
// Iconize the location of the actual laserTarget
_pos = getPosASL _laserTarget;
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,0,0,1], (ASLtoATL _pos), 0.75, 0.75, 0, "", 0.5, 0.025, "TahomaB"];

{
    _x params ["_posX", "_posY", "_posZ"];
    drawLine3D [ASLtoATL _posX, ASLtoATL _posY, _posZ];
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", _posZ, ASLtoATL _posY, 0.75, 0.75, 0, "", 0.5, 0.025, "TahomaB"];
} forEach DRAW_LINES;
DRAW_LINES = [];
#endif
