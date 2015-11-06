/*
 * Author: Glowbal
 * Translate selection names into medical usable hit selection names.
 * Aims to deal with the new hitpoint system introduced in Arma3 v1.50 and later.
 *
 * Arguments:
 * 0: selection name <STRING>
 *
 * Return Value:
 * translated selection name <STRING>
 *
 * Example:
 * ["pelvis"] call ace_medical_fnc_translateSelections
 * Returns "body"
 *
 * Public: No
 */

#define HEAD_SELECTIONS ["face_hub", "neck", "head"]
#define TORSO_SELECTIONS ["pelvis", "spine1", "spine2", "spine3", "body"]
#define L_ARM_SELECTIONS ["hand_l"]
#define R_ARM_SELECTIONS ["hand_r"]
#define L_LEG_SELECTIONS ["leg_l"]
#define R_LEG_SELECTIONS ["leg_r"]

params ["_selection"];

if (_selection in HEAD_SELECTIONS) exitwith {"head"};
if (_selection in TORSO_SELECTIONS) exitwith {"body"};

// Not necessary unless we get more hitpoints variants in an next arma update
/*if (_selection in L_ARM_SELECTIONS) exitwith {"hand_l"};
if (_selection in R_ARM_SELECTIONS) exitwith {"hand_r"};
if (_selection in L_LEG_SELECTIONS) exitwith {"leg_l"};
if (_selection in R_LEG_SELECTIONS) exitwith {"leg_r"};*/

_selection;
