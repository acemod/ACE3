#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Opens the rangetable and fills the charge listbox.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_mk6mortar_fnc_rangeTableOpen
 *
 * Public: No
 */

TRACE_1("rangeTableOpen - defer to artillerytables",_this);

["mortar_82mm", 45, 88, GVAR(airResistanceEnabled) || EGVAR(artillerytables,advancedCorrections)] call EFUNC(artillerytables,rangeTableOpen);
