#include "script_component.hpp"
/*
 * Author: nomisum
 * Function for closing doors for GM helos.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 *
 * Return Value:
 * Amount of time to wait before cutting ropes <NUMBER>
 *
 * Example:
 * [_vehicle] call ace_compat_gm_fnc_onCut
 *
 * Public: No
 */
params ["_vehicle"];

switch (true) do {
    case (_vehicle isKindOf "gm_ge_army_bo105p1m_vbh_swooper"): {
        _vehicle setVariable [QEGVAR(fastroping,doorsLocked), false, true];
        _vehicle animateDoor ["door_2_1_source", 0];
        _vehicle animateDoor ["door_2_2_source", 0];
    };
    case (_vehicle isKindOf "gm_ch53_base"): {
        _vehicle setVariable [QEGVAR(fastroping,doorsLocked), false, true];
        _vehicle animateDoor ["cargoramp_source", 0];
        _vehicle animateSource ["slingloadlights_source", 0];
    };
    case (_vehicle isKindOf "gm_mi2_base"): {
        _vehicle setVariable [QEGVAR(fastroping,doorsLocked), false, true];
        _vehicle animate ["door_2_1_anim", 0]; // animateSource/animateDoor didnt work
    };
    default {};
};

2
