#include "..\script_component.hpp"
/*
 * Author: LorenLuke
 * Returns if the plotting board can be used.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Plotting board can be used <BOOL>
 *
 * Example:
 * call ace_maptools_fnc_canUsePlottingBoard
 *
 * Public: No
 */

visibleMap &&
{alive ACE_player} &&
{[ACE_player, "ACE_PlottingBoard"] call EFUNC(common,hasItem)} &&
{!GVAR(plottingBoard_isDragging)} &&
{GVAR(plottingBoard_isRotating) == -1}
