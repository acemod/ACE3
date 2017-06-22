/*
 * Author: Norrin, Rocko, Ruthberg
 *
 * Handles HuntIR camera
 *
 * Arguments:
 * 0: HuntIR <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cam] call ACE_huntir_fnc_cam
 *
 * Public: No
 */
#include "script_component.hpp"

if (!hasInterface) exitWith {};
params ["_huntIR"];

GVAR(huntIR) = _huntIR;
GVAR(pos) = getPosVisual GVAR(huntIR);

GVAR(ZOOM) = 0;
GVAR(NV) = 0;
GVAR(TI) = 0;
GVAR(cur_cam) = 0;
GVAR(ROTATE) = 0;
GVAR(ELEVAT) = 0.01;

HUNTIR_BACKGROUND_LAYER_ID cutText["","PLAIN"];

closedialog 0;
createDialog QGVAR(cam_dialog);
uiNameSpace setVariable [QGVAR(monitor), findDisplay 18880];
(uiNameSpace getVariable QGVAR(monitor)) displaySetEventHandler ["Keydown", QUOTE(_this call FUNC(keyPressed))];

ctrlSetText [4, "0X"];

GVAR(logic) = "Logic" createVehicleLocal [0, 0, 0];
GVAR(logic) setPosATL (GVAR(pos) vectorAdd [0, 0, -5]);
GVAR(logic) setVectorUp [0.001, 0.001, 1];

GVAR(cam) = "camera" camCreate GVAR(pos);
GVAR(cam) camSetTarget GVAR(logic);
GVAR(cam) cameraEffect ["internal", "BACK"];
GVAR(cam) camSetRelPos [0, 0, 2];
GVAR(cam) camCommit 0;
showCinemaBorder false;
camUseNVG false;

GVAR(pphandle) = ppEffectCreate ["colorCorrections", 135522];
GVAR(pphandle) ppEffectAdjust [1, 1, 0, [0.01, 0.02, 0.04, 0.01], [0.87, 1.08, 1.196, 0.3], [0.399, 0.287, 0.014, 0.0]];
GVAR(pphandle) ppEffectCommit 0;
GVAR(pphandle) ppEffectEnable true;

GVAR(stop) = false;
call FUNC(huntirCompass);

GVAR(no_cams) = ACE_player nearEntities ["ACE_HuntIR", HUNTIR_MAX_TRANSMISSION_RANGE];
{
    GVAR(no_cams) set [_forEachIndex, [(getPosVisual ACE_player) vectorDistance (getPosVisual _x), _x]];
} forEach GVAR(no_cams);
GVAR(no_cams) sort true;
{
    GVAR(no_cams) set [_forEachIndex, _x select 1];
} forEach GVAR(no_cams);
[{
    //Close monitor if we no longer have the item:
    if ((!([ACE_player, "ACE_HuntIR_monitor"] call EFUNC(common,hasItem))) && {!isNull (uiNameSpace getVariable [QGVAR(monitor), displayNull])}) then {
        closeDialog 0;
    };

    GVAR(nearHuntIRs) = ACE_player nearEntities ["ACE_HuntIR", HUNTIR_MAX_TRANSMISSION_RANGE];
    {
        if (((getPosVisual _x) select 2) > 20 && {!(_x in GVAR(no_cams))} && {_x getHitPointDamage "HitCamera" < 0.25}) then {
            GVAR(no_cams) pushBack _x;
        };
        true
    } count GVAR(nearHuntIRs);
    {
        if (((getPosVisual _x) select 2) <= 20 || {!(_x in GVAR(nearHuntIRs))} || {_x getHitPointDamage "HitCamera" >= 0.25}) then {
            GVAR(no_cams) deleteAt _forEachIndex;
            if (_forEachIndex < GVAR(cur_cam)) then {
                GVAR(cur_cam) = GVAR(cur_cam) - 1;
            };
        };
    } forEach GVAR(no_cams);

    GVAR(cur_cam) = 0 max GVAR(cur_cam) min ((count GVAR(no_cams)) - 1);
    if (count GVAR(no_cams) > 0) then {
        GVAR(huntIR) = GVAR(no_cams) select GVAR(cur_cam);
    };

    GVAR(pos) = getPosVisual GVAR(huntIR);

    if ((!dialog) || (count GVAR(no_cams) == 0) || ((GVAR(pos) select 2) <= 20)) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;

        GVAR(stop) = true;

        GVAR(pphandle) ppEffectEnable true;
        ppEffectDestroy GVAR(pphandle);

        GVAR(NV) = 0;
        setAperture -1;
        closedialog 0;
        titletext [" ", "BLACK IN", 4];
        ACE_player switchCamera "INTERNAL";
        GVAR(cam) CameraEffect ["Terminate", "Back"];
        CamDestroy GVAR(cam);
        deleteVehicle GVAR(logic);
        if (player != ACE_player) then {
            player remoteControl ACE_player;
        };
    };

    switch (GVAR(ZOOM)) do {
        case 0: {
            GVAR(cam) camsetFOV 0.7;
            GVAR(cam) camSetFocus [GVAR(pos) select 2, 1];
        };
        case 1: {
            GVAR(cam) camsetFOV 0.35;
            GVAR(cam) camSetFocus [(GVAR(pos) select 2)/2, 1];
        };
        case 2: {
            GVAR(cam) camsetFOV 0.17;
            GVAR(cam) camSetFocus [(GVAR(pos) select 2)/4, 1];
        };
        case 3: {
            GVAR(cam) camsetFOV 0.1;
            GVAR(cam) camSetFocus [(GVAR(pos) select 2)/8, 1];
        };
    };

    private ["_cam_coord_y", "_cam_coord_x", "_cam_time", "_cam_pos"];

    GVAR(logic) setPosATL (GVAR(pos) vectorAdd [0, 0, -5]);
    GVAR(logic) setDir GVAR(ROTATE);
    GVAR(logic) setVectorUp [0.0001, 0.0001, 1];
    GVAR(cam) CameraEffect ["internal", "BACK"];
    _cam_coord_y = GVAR(ELEVAT) * cos(GVAR(ROTATE));
    _cam_coord_x = GVAR(ELEVAT) * sin(GVAR(ROTATE));
    GVAR(cam) camSetRelPos [_cam_coord_x, _cam_coord_y, 2];
    GVAR(cam) camCommit 0;

    ctrlSetText [1, format["%1 m", round(GVAR(pos) select 2)]];
    ctrlSetText [2, format["%1", GVAR(cur_cam) + 1]];
    _cam_time = CBA_missionTime - (GVAR(huntIR) getVariable [QGVAR(startTime), CBA_missionTime]);
    ctrlSetText [3, format["%1 s", round(_cam_time)]];
    _cam_pos = getPosVisual GVAR(huntIR);
    _cam_pos = format ["X = %1, Y = %2", round (_cam_pos select 0), round (_cam_pos select 1)];
    ctrlSetText [5, _cam_pos];
    ctrlSetText [6, ""];
}, 0, []] call CBA_fnc_addPerFrameHandler;
