/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: side <SIDE>
 * 1: type <STRING>
 *
 * Return Value:
 * icon path <STRING>
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_2(_side,_type);

if (isClass (configFile >> "ACE_BFT" >> "Types" >> _type)) exitwith {
    getText (configFile >> "ACE_BFT" >> "Types" >> _type >> "iconPath");
};

"\A3\ui_f\data\map\markers\nato\b_inf.paa"
