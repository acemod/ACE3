#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Add drone laser drawing to map
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_aircraft_fnc_droneAddMapHandler
 * Public: No
 */
 TRACE_1("droneAddMapHandler",_this);

[{!isNull findDisplay 12}, // for some reason the display is null for the frame when starting to control drone
{
    private _map = ((findDisplay 12) displayCtrl 51);
    private _ehID = _map getVariable [QGVAR(ehID), -1];
    if (_ehID > -1) exitWith {};
    _ehID = _map ctrlAddEventHandler ["Draw", {
        if (!GVAR(droneShowLaserOnMap)) exitWith {};
        private _laserTarget = laserTarget (ACE_controlledUAV param [0, objNull]);
        if (!alive _laserTarget) exitWith {};

        params ["_map"];
        _map drawLine [getPos _laserTarget, getPos (ACE_controlledUAV select 0), [1,0,0,0.333]];
        _map drawIcon [
        "\A3\ui_f\data\igui\rscingameui\rscoptics\laser_designator_iconLaserOn.paa",
        [1,0,1,1],
        (getPos _laserTarget),
        16, 16,
        ((getDir _laserTarget) + 90)];
    }];
    TRACE_2("added map drawEH",_map,_ehID);
    _map setVariable [QGVAR(ehID), _ehID];
}, []] call CBA_fnc_waitUntilAndExecute;
