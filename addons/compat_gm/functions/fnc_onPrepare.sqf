#include "script_component.hpp"
/*
 * Author: nomisum
 * Function for opening doors for most GM helos.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 *
 * Return Value:
 * Amount of time to wait before deploying ropes <NUMBER>
 *
 * Example:
 * [_vehicle] call ace_compat_gm_fnc_onPrepare
 *
 * Public: No
 */
params ["_vehicle"];

switch (true) do {
    case (_vehicle isKindOf "gm_ge_army_bo105p1m_vbh_swooper"): {
        _vehicle setVariable [QEGVAR(fastroping,doorsLocked), true, true];
        _vehicle animateDoor ["door_2_1_source", 1];
        _vehicle animateDoor ["door_2_2_source", 1];
    };
    case (_vehicle isKindOf "gm_ch53_base"): {
        _vehicle setVariable [QEGVAR(fastroping,doorsLocked), true, true];
        _vehicle animateDoor ["cargoramp_source", 1];
        _vehicle animateSource ["slingloadlights_source", 1];
    };
    case (_vehicle isKindOf "gm_mi2_base"): {
        _vehicle setVariable [QEGVAR(fastroping,doorsLocked), true, true];
        _vehicle animate ["door_2_1_anim", 1]; // animateSource/animateDoor didnt work
        _vehicle animateSource ["winch_unhide", 1]; // just in case this wasnt already set
    };
    default {};
};

2
