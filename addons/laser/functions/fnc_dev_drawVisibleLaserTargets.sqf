#include "..\script_component.hpp"

/*
 * Author: ACE-Team
 *
 *
 * Argument:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_laser_fnc_dev_drawVisibleLaserTargets
 *
 * Public: No
 */


// Dev Debug Function
// Displays lasers and attempts to lock on to codes 1111 and 1688 from a target vehicle's view
// On Screen Debug:
//     Red - Vanilla Laser Targets
//     Yellow - Array (vehicle pos/weapon) Laser Targets
//     Green - Rays
//     Blue - Seeker Locks

// Try searching for lasers from a given vehicle position [BLUE]:
private _seekerVehicle = vehicle ace_player;
private _testSeekerPosASL = _seekerVehicle modelToWorldVisualWorld [0,0,1];
private _testSeekerDir = vectorDirVisual _seekerVehicle;
{
    private _code = _x;
    private _results = [_testSeekerPosASL, _testSeekerDir, 45, 10000, [ACE_DEFAULT_LASER_WAVELENGTH, ACE_DEFAULT_LASER_WAVELENGTH], _code, _seekerVehicle] call FUNC(seekerFindLaserSpot);
    private _resultPos = _results select 0;
    if (!isNil "_resultPos") then {
        // Draw lock results
        drawLine3D [ASLToAGL _testSeekerPosASL, ASLToAGL _resultPos, [0,0,1,1]];
        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [0,0,1,1], (ASLToAGL _resultPos), 1.5, 1.5, 45, format ["%1 from %2", _code, _results select 1], 0.5, 0.025, "TahomaB"];
    };
} forEach [ACE_DEFAULT_LASER_CODE, 1688]; // Scan at codes 1111 and 1688


// Draw all lasers
{
    // TRACE_2("",_x,_y);
    _y params ["_obj", "_owner", "_laserMethod", "_waveLength", "_laserCode", "_beamSpread"];

    // Draw vanila lasers [RED]
    if (_laserMethod isEqualTo QFUNC(findLaserSource)) then { // Normal vanilla laserTarget func
        private _targetObject = _obj getVariable [QGVAR(targetObject), objNull];
        private _targetPosASL = getPosASL _targetObject;
        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,0,0,1], (ASLToAGL _targetPosASL), 0.5, 0.5, 0, "", 0.5, 0.025, "TahomaB"];

        (_y call FUNC(findLaserSource)) params ["_laserPosASL", "_laserDir"];    
            
        if (([_laserPosASL,_laserDir] isEqualTo []) || {[_laserPosASL,_laserDir] isEqualTo [-1,-1]}) then {
            WARNING_2("Bad Laser Return [%1,%2]",_laserPosASL,_laserDir); 
            continue;
        };

        private _resultsRay = [_laserPosASL, _laserDir, _obj] call FUNC(shootRay);

        private _rayPos = _resultsRay select 0;
        if (isNil "_rayPos") then {
            drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,0,0,1], (ASLToAGL _targetPosASL), 2, 2, 0, "Nil Ray", 0.5, 0.025, "TahomaB"];
        } else {
            private _diff = _rayPos vectorDistance (getPosASL _targetObject); // Diff from ray position compared to actual
            drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,0,0,1], (ASLToAGL _rayPos), 2, 2, 0, format ["Diff %1",_diff], 0.5, 0.025, "TahomaB"];
        };
    };
    // Draw array weapon lasers [YELLOW]
    if ((_laserMethod isEqualType []) && {(count _laserMethod) == 2}) then {
        _laserMethod params ["_modelPosition", "_weaponName"];
        private _laserPosASL = _obj modelToWorldVisualWorld _modelPosition;
        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,1,0,1], (ASLToAGL _laserPosASL), 0.5, 0.5, 0, _weaponName, 0.5, 0.025, "TahomaB"];
        private _laserDir = _obj weaponDirection _weaponName;
        private _resultsRay = [_laserPosASL, _laserDir, _obj] call FUNC(shootRay);
        private _rayPos = _resultsRay select 0;
        if (!isNil "_rayPos") then {
            drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,1,0,1], (ASLToAGL _rayPos), 2, 2, 0, _weaponName, 0.5, 0.025, "TahomaB"];
        };
    };
} forEach GVAR(laserEmitters);
