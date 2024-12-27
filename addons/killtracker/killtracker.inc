/*
 * Author: Freddo, PabstMirror
 *
 * Creates a killtracker debriefing section, displayed at the end mission debriefing screen.
 * Include this file in description.ext of your mission.
 *
 * Example:
 * class CfgDebriefingSections {
 *     #if __has_include("\z\ace\addons\killtracker\killtracker.inc")
 *         #include "\z\ace\addons\killtracker\killtracker.inc"
 *     #endif
 * };
 *
 * Public: Yes
 */

class acex_killTracker {
    title = "$STR_ACE_KillTracker_Title";
    variable = "acex_killTracker_outputText";
};
