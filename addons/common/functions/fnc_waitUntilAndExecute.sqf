/*
 * Author: joko // Jonas
 * Executes a code once with after the Condition is True, using a PFH
 *
 * Argument:
 * 0: Condition <CODE>
 * 1: Code to execute <CODE>
 * 2: Parameters to run the code with <ARRAY,ANY,NIL>
 *
 * Return value:
 * None
 *
 * Example:
 * [{(_this select 0) == vehicle (_this select 0)}, {(_this select 0) setDamage 1;}, [ACE_player]] call ace_common_fnc_waitAndExecute
 *
 * Public: No
 */
#include "script_component.hpp"

TRACE_1("Adding",_this);

GVAR(waitUntilAndExecArray) pushBack _this;
