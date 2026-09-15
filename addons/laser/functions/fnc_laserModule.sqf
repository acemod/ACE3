#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Shoots a test laser down to the module position
 *
 * Arguments:
 * 0: Module <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [m] call ace_laser_fnc_laserModule
 *
 * Public: No
 */

if (!hasInterface) exitWith {};
[{
    params ["_module"];

    private _laserMethod = { 
        params ["_module"];
        private _povPos = (getPosASL _module) vectorAdd [0,0,100]; 
        [_povPos, [0,0,-1]]
    };
    private _waveLength = _module getVariable [QGVAR(waveLength), ACE_DEFAULT_LASER_WAVELENGTH];
    private _laserCode = _module getVariable [QGVAR(code), ACE_DEFAULT_LASER_CODE];
    private _beamSpread = _module getVariable [QGVAR(beamSpread), ACE_DEFAULT_LASER_BEAMSPREAD];

    private _uuid = format["laserModule%1%2", floor random 1000, floor random 10000];
    private _args = [_uuid, [_module, _module, _laserMethod, _waveLength, _laserCode, _beamSpread, []]];

    TRACE_2("Sending Laser On Event",_module,_args);
    ["ace_laserOn", _args] call CBA_fnc_localEvent;
}, _this] call CBA_fnc_execNextFrame;
