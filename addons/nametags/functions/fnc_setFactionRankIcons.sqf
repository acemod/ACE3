#include "script_component.hpp"
/*
 * Author: commy2
 * Sets a custom set of icons for a specified faction.
 *
 * Arguments:
 * 0: Faction <STRING>
 * 1: Rank Icons <ARRAY>
 *
 * Return Value:
 * Successful? <BOOLEAN>
 *
 * Example:
 * ["BLU_F", [
 *     "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa",
 *     "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa",
 *     "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa",
 *     "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa",
 *     "\A3\Ui_f\data\GUI\Cfg\Ranks\captain_gs.paa",
 *     "\A3\Ui_f\data\GUI\Cfg\Ranks\major_gs.paa",
 *     "\A3\Ui_f\data\GUI\Cfg\Ranks\colonel_gs.paa"
 * ]] call ace_nametags_fnc_setFactionRankIcons
 *
 * Public: Yes
 */

if (isNil QGVAR(factionRanks)) then {
    GVAR(factionRanks) = [] call CBA_fnc_createNamespace;
};

params [["_faction", "", [""]], ["_icons", [], [[]], [7]]];
TRACE_2("setFactionRankIcons",_faction,_icons);

if !(_faction != "" && {_icons isEqualTypeAll ""}) exitWith {false};

GVAR(factionRanks) setVariable [_faction, _icons];

true
