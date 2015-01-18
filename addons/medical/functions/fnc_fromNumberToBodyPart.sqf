/**
 * fn_fromNumberToBodyPart.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_selectionName","_part"];
_part = _this select 0;
_selectionName = "";
_selectionName = switch (_part) do {
    case 0: {
        "head"
    };
    case 1: {
        "body"
    };
    case 2: {
        "hand_l"
    };
    case 3: {
        "hand_r"
    };
    case 4: {
        "leg_l"
    };
    case 5: {
        "leg_r"
    };
    default {
        ""
    };
};
_selectionName