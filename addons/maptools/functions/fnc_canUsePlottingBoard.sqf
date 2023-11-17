#include "..\script_component.hpp"
/*
 * Author: LorenLuke
 * Returns if the plotting board can be used.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Boolean <BOOL>
 *
 * Example:
 * call ACE_maptools_fnc_canUsePlottingBoard
 *
 * Public: No
 */

visibleMap &&
{alive ACE_player} &&
{"ACE_PlottingBoard" in (ACE_player call EFUNC(common,uniqueItems))} &&
{!GVAR(plottingBoard_isDragging)} &&
{GVAR(plottingBoard_isRotating) == -1} &&
{getUnitLoadout ACE_player param [9, []] param [0, ""] != ""}
