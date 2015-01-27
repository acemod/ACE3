/**
 * fn_getBodyPartNumber.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_selectionName","_part"];
_selectionName = _this select 0;

    _part = -1;
    _part = switch (_selectionName) do {
        case "head": {
            0
        };
        case "body": {
            1
        };
        case "hands": {
            if (random(1)>=0.5) then {
                2
            } else {
                 3
            };
        };
        case "hand_l": {
            2
        };
        case "hand_r": {
            3
        };
        case "legs": {
            if (random(1)>=0.5) then {
                4
            } else {
                 5
            };
        };
        case "leg_l": {
            4
        };
        case "leg_r": {
            5
        };
        default {
            -1
        };
    };
_part