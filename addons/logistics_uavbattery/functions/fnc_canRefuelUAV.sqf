/* fnc_refuel.sqf
*
* Author: marc_book (modified by PabstMirror)
*
* Tests if unit can refuel the target UAV 
*
* Argument:
* 0: OBJECT - Player unit
* 1: OBJECT - UAV to test
*
* Return value:
* BOOL
*/

#include "script_component.hpp"

PARAMS_2(_caller,_target);

("ACE_UAVBattery" in (items _caller)) && {(fuel _target) < 1} && {(speed _target) < 1} && {!(isEngineOn _target)} && {(_target distance _caller) <= 4}
