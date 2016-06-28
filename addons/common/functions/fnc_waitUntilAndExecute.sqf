/*
 * Author: joko // Jonas
 * Executes a code once with after the Condition is True, using a PFH
 *
 * Arguments:
 * 0: Condition <CODE>
 * 1: Code to execute <CODE>
 * 2: Parameters to run the code with <ARRAY,ANY,NIL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [{(_this select 0) == vehicle (_this select 0)}, {(_this select 0) setDamage 1;}, [ACE_player]] call ace_common_fnc_waitUntilAndExecute
 *
 * Public: No
 */
#include "script_component.hpp"

ACE_DEPRECATED("ace_common_fnc_waitUntilAndExecute","3.8.0","CBA_fnc_waitUntilAndExecute");

_this call CBA_fnc_waitUntilAndExecute;

nil
