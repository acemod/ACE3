/*
 * Author: commy2
 * Get door animations
 *
 * Arguments:
 * 0: House <OBJECT>
 * 1: Door <STRING>
 *
 * Return value:
 * Animation and Locked variable <ARRAY>
 * 0: Animation <STRING>
 * 1: Locked variable <STRING>
 *
 * Example:
 * array = [target, "door"] call ace_interaction_fnc_getDoorAnimations
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_house,_door);

private ["_index", "_animations", "_lockedVariable"];

_index = [
    "door_1",
    "door_2",
    "door_3",
    "door_4",
    "door_5",
    "door_6",
    "door_7",
    "door_8",
    "door_9",
    "door_10",
    "door_11",
    "door_12",
    "door_13",
    "Door_14",
    "door_15",
    "door_16",
    "door_17",
    "door_18",
    "door_19",
    "door_20",
    "door_21",
    "door_22",

    "hatch_1",
    "hatch_2",
    "hatch_3",
    "hatch_4",
    "hatch_5",
    "hatch_6"
] find toLower _door;

if (_index == -1) exitWith {[[],""]};

_animations = [
    ["Door_1_rot",  "Door_Handle_1_rot_1",  "Door_Handle_1_rot_2"],
    ["Door_2_rot",  "Door_Handle_2_rot_1",  "Door_Handle_2_rot_2"],
    ["Door_3_rot",  "Door_Handle_3_rot_1",  "Door_Handle_3_rot_2"],
    ["Door_4_rot",  "Door_Handle_4_rot_1",  "Door_Handle_4_rot_2"],
    ["Door_5_rot",  "Door_Handle_5_rot_1",  "Door_Handle_5_rot_2"],
    ["Door_6_rot",  "Door_Handle_6_rot_1",  "Door_Handle_6_rot_2"],
    ["Door_7_rot",  "Door_Handle_7_rot_1",  "Door_Handle_7_rot_2"],
    ["Door_8_rot",  "Door_Handle_8_rot_1",  "Door_Handle_8_rot_2"],
    ["Door_9_rot",  "Door_Handle_9_rot_1",  "Door_Handle_9_rot_2"],
    ["Door_10_rot", "Door_Handle_10_rot_1", "Door_Handle_10_rot_2"],
    ["Door_11_rot", "Door_Handle_11_rot_1", "Door_Handle_11_rot_2"],
    ["Door_12_rot", "Door_Handle_12_rot_1", "Door_Handle_12_rot_2"],
    ["Door_13_rot", "Door_Handle_13_rot_1", "Door_Handle_13_rot_2"],
    ["Door_14_rot", "Door_Handle_14_rot_1", "Door_Handle_14_rot_2"],
    ["Door_15_rot", "Door_Handle_15_rot_1", "Door_Handle_15_rot_2"],
    ["Door_16_rot", "Door_Handle_16_rot_1", "Door_Handle_16_rot_2"],
    ["Door_17_rot", "Door_Handle_17_rot_1", "Door_Handle_17_rot_2"],
    ["Door_18_rot", "Door_Handle_18_rot_1", "Door_Handle_18_rot_2"],
    ["Door_19_rot", "Door_Handle_19_rot_1", "Door_Handle_19_rot_2"],
    ["Door_20_rot", "Door_Handle_20_rot_1", "Door_Handle_20_rot_2"],
    ["Door_21_rot", "Door_Handle_21_rot_1", "Door_Handle_21_rot_2"],
    ["Door_22_rot", "Door_Handle_22_rot_1", "Door_Handle_22_rot_2"],

    ["Hatch_1_rot"],
    ["Hatch_2_rot"],
    ["Hatch_3_rot"],
    ["Hatch_4_rot"],
    ["Hatch_5_rot"],
    ["Hatch_6_rot"]
] select _index;

_lockedVariable = [
    ["BIS_Disabled_Door_1",  "Door_Handle_1_rot_1",  "Door_Locked_1_rot"],
    ["BIS_Disabled_Door_2",  "Door_Handle_2_rot_1",  "Door_Locked_2_rot"],
    ["BIS_Disabled_Door_3",  "Door_Handle_3_rot_1",  "Door_Locked_3_rot"],
    ["BIS_Disabled_Door_4",  "Door_Handle_4_rot_1",  "Door_Locked_4_rot"],
    ["BIS_Disabled_Door_5",  "Door_Handle_5_rot_1",  "Door_Locked_5_rot"],
    ["BIS_Disabled_Door_6",  "Door_Handle_6_rot_1",  "Door_Locked_6_rot"],
    ["BIS_Disabled_Door_7",  "Door_Handle_7_rot_1",  "Door_Locked_7_rot"],
    ["BIS_Disabled_Door_8",  "Door_Handle_8_rot_1",  "Door_Locked_8_rot"],
    ["BIS_Disabled_Door_9",  "Door_Handle_9_rot_1",  "Door_Locked_9_rot"],
    ["BIS_Disabled_Door_10", "Door_Handle_10_rot_1", "Door_Locked_10_rot"],
    ["BIS_Disabled_Door_11", "Door_Handle_11_rot_1", "Door_Locked_11_rot"],
    ["BIS_Disabled_Door_12", "Door_Handle_12_rot_1", "Door_Locked_12_rot"],
    ["BIS_Disabled_Door_13", "Door_Handle_13_rot_1", "Door_Locked_13_rot"],
    ["BIS_Disabled_Door_14", "Door_Handle_14_rot_1", "Door_Locked_14_rot"],
    ["BIS_Disabled_Door_15", "Door_Handle_15_rot_1", "Door_Locked_15_rot"],
    ["BIS_Disabled_Door_16", "Door_Handle_16_rot_1", "Door_Locked_16_rot"],
    ["BIS_Disabled_Door_17", "Door_Handle_17_rot_1", "Door_Locked_17_rot"],
    ["BIS_Disabled_Door_18", "Door_Handle_18_rot_1", "Door_Locked_18_rot"],
    ["BIS_Disabled_Door_19", "Door_Handle_19_rot_1", "Door_Locked_19_rot"],
    ["BIS_Disabled_Door_20", "Door_Handle_20_rot_1", "Door_Locked_20_rot"],
    ["BIS_Disabled_Door_21", "Door_Handle_21_rot_1", "Door_Locked_21_rot"],
    ["BIS_Disabled_Door_22", "Door_Handle_22_rot_1", "Door_Locked_22_rot"],

    ["", ""],
    ["", ""],
    ["", ""],
    ["", ""],
    ["", ""],
    ["", ""]
] select _index;

[_animations, _lockedVariable]
