/*
 * Author: Glowbal
 * Translate selection names into medical usable hit selection names.
 * Aims to deal with the new hitpoint system introduced in Arma3 v1.50 and later.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: selection name <STRING>
 * 2: HitPoint Index <SCALAR>
 *
 * Return Value:
 * translated selection name <STRING>
 *
 * Example:
 * [bob, "pelvis", 4] call ace_medical_fnc_translateSelections
 * Returns "body"
 *
 * Public: No
 */
#include "script_component.hpp"

#define HEAD_SELECTIONS ["face_hub", "neck", "head"]
#define HEAD_HITPOINTS ["hitface", "hitneck", "hithead"]
#define TORSO_SELECTIONS ["pelvis", "spine1", "spine2", "spine3", "body"]
#define TORSO_HITPOINTS ["hitpelvis", "hitabdomen", "hitdiaphragm", "hitchest", "hitbody"]
#define L_ARM_SELECTIONS ["hand_l"]
#define L_ARM_HITPOINTS ["HitLeftArm", "hand_l"]
#define R_ARM_SELECTIONS ["hand_r"]
#define R_ARM_HITPOINTS ["HitRightArm", "hand_r"]
#define L_LEG_SELECTIONS ["leg_l"]
#define L_LEG_HITPOINTS ["HitLeftLeg", "leg_l"]
#define R_LEG_SELECTIONS ["leg_r"]
#define R_LEG_HITPOINTS ["HitRightLeg", "leg_r"]

params ["_unit", "_selection", "_hitPointIndex"];

if (_selection == "") exitWith {""};
if (_selection in HEAD_SELECTIONS) exitWith {"head"};
if (_selection in TORSO_SELECTIONS) exitWith {"body"};

// Not necessary unless we get more hitpoints variants in an next arma update
/*if (_selection in L_ARM_SELECTIONS) exitwith {"hand_l"};
if (_selection in R_ARM_SELECTIONS) exitwith {"hand_r"};
if (_selection in L_LEG_SELECTIONS) exitwith {"leg_l"};
if (_selection in R_LEG_SELECTIONS) exitwith {"leg_r"};*/

//Backup method to detect weird selections/hitpoints
if ((_selection == "?") || {!(_selection in GVAR(SELECTIONS))}) exitWith {
    if (_hitPointIndex < 0) exitWith {_selection};
    local _hitPoint = toLower configName ((configProperties [(configFile >> "CfgVehicles" >> (typeOf _unit) >> "HitPoints")]) select _hitPointIndex);
    TRACE_4("Weird sel/hit", _unit, _selection, _hitPointIndex, _hitPoint);

    if (_hitPoint in HEAD_HITPOINTS) exitWith {"head"};
    if (_hitPoint in TORSO_HITPOINTS) exitWith {"body"};
    if (_hitPoint in L_ARM_HITPOINTS) exitWith {"hand_l"};
    if (_hitPoint in R_ARM_HITPOINTS) exitWith {"hand_r"};
    if (_hitPoint in L_LEG_HITPOINTS) exitWith {"leg_l"};
    if (_hitPoint in R_LEG_HITPOINTS) exitWith {"leg_r"};

    _selection
};

_selection;
