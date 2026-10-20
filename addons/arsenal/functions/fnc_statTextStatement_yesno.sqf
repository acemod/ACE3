#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Generic Yes/No/None Text statement for boolean stats.
 *
 * Arguments:
 * 0: Stat <STRING>
 * 1: Item config path <CONFIG>
 *
 * Return Value:
 * Stat Text <STRING>
 *
 * Example:
 * ["ACE_hasEHP", _config] call ace_arsenal_fnc_statTextStatement_yesno
 *
 * Public: Yes
*/

params ["_stat", "_config"];
TRACE_2("statTextStatement_yesno",_stat,_config);

private _statConfig = _config >> _stat;
if (isNull _statConfig) exitWith { LELSTRING(common,none) };

localize ([ELSTRING(common,No), ELSTRING(common,Yes)] select (getNumber _statConfig > 0))
