#include "script_component.hpp"
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


params ["_side", "_type"];

private _config = configFile >> "ACE_BFT" >> "Types" >> _type;
if (isClass _config) exitwith {
    getText (_config >> "iconPath");
};

"\A3\ui_f\data\map\markers\nato\b_inf.paa"
