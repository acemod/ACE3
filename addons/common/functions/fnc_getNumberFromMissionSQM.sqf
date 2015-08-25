/*
 * Author: commy2
 * Get a number from the mission.sqm file. Mission has to be saved in the Editor.
 * On non-existing entries, it might return 0 or the value of an entry with the same name of another calss.
 *
 * Arguments:
 * 0: Path of the entry in the mission.sqm <ARRAY>
 *
 * Return Value:
 * Entry value <NUMBER>
 *
 * Public: No
 */
#include "script_component.hpp"

parseNumber (_this call FUNC(getStringFromMissionSQM));
