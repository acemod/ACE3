#include "script_component.hpp"
/*
 * Author: Nou
 * Turn a laser designator on.
 *
 * Arguments:
 * 0: Emitter <OBJECT>
 * 1: Owner <OBJECT>
 * 2: Method, can be code, which emitter and owner are passed to, a string function name, an array with a position memory point and weapon name, or an array with a position memory point, a vector begining memory point, and vector ending memory point. <STRING><CODE><ARRAY>
 * 3: Wavelength (1550nm is common eye safe) <NUMBER>
 * 4: Laser code <NUMBER>
 * 5: Beam divergence (in mils off beam center) <NUMBER>
 * 6: Method Args <ANY> (default: nil)
 *
 * Return Value:
 * UUID for sending to laserOff function <STRING>
 *
 * Example:
 * [hmg, hmg, [[0,0,1], "HMG_static"], 1550, 1111, 1] call ace_laser_fnc_laserOn
 * [player, player, "ace_laser_fnc_findLaserSource", 1550, 1111, 1, ["pilot"]] call ace_laser_fnc_laserOn
 *
 * Public: No
 */

// params [["_emitter", objNull, [objNull]],["_owner", objNull, [objNull]],["_method", "", ["", {}, []]],["_wavelength", 0, [0]],["_code", 0, [0]],["_beamSpread", 0, [0]],"_methodArgs"];

private _uuid = format["%1%2%3", floor diag_tickTime, floor random 1000, floor random 10000];
private _args = [_uuid, _this];

TRACE_2("Sending Global Laser On Event",_uuid,_this);

["ace_laserOn", _args] call CBA_fnc_globalEvent;

_uuid;
