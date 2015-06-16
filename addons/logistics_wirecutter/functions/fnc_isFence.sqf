/*
 * Author: PabstMirror
 * Checks if object is a fence.  Should work on any fence type, even (typeof == "").
 * Call is fairly expensive because of all of the string checking.
 *
 * Arguments:
 * 0: An Object To Test <OBJECT>
 *
 * Return Value:
 * Is it a fence <BOOL>
 *
 * Example:
 * [aFence] call ace_logistics_wirecutter_fnc_isFence
 *
 * Public: No
 */
#include "script_component.hpp"

//find is case sensitive, so keep everything lowercase
#define FENCE_TYPENAMES ["land_net_fence_4m_f", "land_net_fence_8m_f", "land_net_fenced_8m_f", "land_new_wiredfence_5m_f", "land_new_wiredfence_10m_dam_f", "land_new_wiredfence_10m_f", "land_pipe_fence_4m_f", "land_pipe_fence_4mnolc_f", "land_sportground_fence_f", "land_wired_fence_4m_f", "land_wired_fence_4md_f", "land_wired_fence_8m_f", "land_wired_fence_8md_f", "land_razorwire_f", "ace_concertinawire"]

#define FENCE_P3DS ["mil_wiredfence_f.p3d","wall_indfnc_3.p3d", "wall_indfnc_9.p3d", "wall_indfnc_corner.p3d", "pletivo_wired.p3d", "wall_fen1_5.p3d"]

private ["_typeOf", "_returnValue"];
PARAMS_1(_object);

_typeOf = toLower (typeOf _object);
_returnValue = false;

if (_typeOf != "") then {
    //If the fence has configEntry we can check it directly
    _returnValue = _typeOf in FENCE_TYPENAMES;
} else {
    _typeOf = toLower (str _object);  //something like "123201: wall_indfnc_9.p3d"
    {
        if ((_typeOf find _x) != -1) exitWith {
            _returnValue = true;
        };
    } forEach FENCE_P3DS;
};

_returnValue
