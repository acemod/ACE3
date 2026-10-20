#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Add laser drawing to map
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_laser_fnc_addMapHandler
 *
 * Public: No
 */
TRACE_3("addMapHandler",ace_player,typeOf vehicle ace_player,ACE_controlledUAV);

GVAR(mapLaserSource) = call {
    if (GVAR(showLaserOnMap) == 0) exitWith {
        TRACE_1("setting - disabled",GVAR(showLaserOnMap));
        objNull
    };
    if (alive (ACE_controlledUAV # 0)) exitWith {
        TRACE_1("using UAV",objNull);
        ACE_controlledUAV # 0;
    };
    if (GVAR(showLaserOnMap) == 1) exitWith {
        TRACE_1("setting - no UAV",GVAR(showLaserOnMap));
        objNull
    };
    private _player = ace_player;
    private _vehicle = vehicle _player;
    if ((_player != _vehicle) && {_player in [gunner _vehicle, commander _vehicle]}) exitWith {
        TRACE_1("using player's vehicle",_vehicle);
        _vehicle
    };
    if (GVAR(showLaserOnMap) == 2) exitWith {
        TRACE_1("setting - no UAV or vehicle",GVAR(showLaserOnMap));
        objNull
    };
    TRACE_1("using player",_player);
    _player
};

if (!alive GVAR(mapLaserSource)) exitWith {};

[{!isNull findDisplay 12}, // for some reason the display is null for the frame when starting to control drone
{
    private _map = ((findDisplay 12) displayCtrl 51);
    private _ehID = _map getVariable [QGVAR(ehID), -1];
    if (_ehID > -1) exitWith {};
    _ehID = _map ctrlAddEventHandler ["Draw", {
        if (!alive GVAR(mapLaserSource)) exitWith {};
        private _laserTarget = laserTarget GVAR(mapLaserSource);
        if (!alive _laserTarget) exitWith {};

        params ["_map"];
        _map drawLine [getPos _laserTarget, getPos GVAR(mapLaserSource), [1,0,0,0.333]];
        _map drawIcon [
            "\A3\ui_f\data\igui\rscingameui\rscoptics\laser_designator_iconLaserOn.paa",
            [1,0,1,1],
            (getPos _laserTarget),
            16, 16,
            ((getDir _laserTarget) + 90)
        ];
    }];
    TRACE_2("added map drawEH",_map,_ehID);
    _map setVariable [QGVAR(ehID), _ehID];
}, []] call CBA_fnc_waitUntilAndExecute;
