// PabstMirror
// ["mapConfigs"] call ace_common_fnc_runTests;
// execVM "z\ace\addons\common\dev\test_mapConfigs.sqf";

#include "\z\ace\addons\common\script_component.hpp"

diag_log text format ["--- Checking Map Configs ---"];

private _testPass = true;

private _maps = configProperties [configFile >> "CfgWorldList", "(isClass _x)", true];
{
    private _mapConfigName = configName _x;
    private _worldConfig = configFile >> "CfgWorlds" >> _mapConfigName;
    private _mapDescription = getText (_worldConfig >> "description");

    // Check if custom latitude/elevation in lookup table (ace_common_fnc_getMapData)
    private _getMapData = [_mapConfigName] call FUNC(getMapData);
    if (_getMapData isEqualTo []) then {
        diag_log text format ["%1 [%2] - Not in getMapData",_mapDescription,_mapConfigName];
        diag_log text format [" - Using map's config [latitude: %1] [elevationOffset: %2]", getNumber (_worldConfig >> "latitude"), getNumber (_worldConfig >> "elevationOffset")];
    };

    // Test MGRS grid step size (from ace_common_fnc_getMapGridData)
    private _zoomMax = 1e99;
    private _formatX = "";
    private _formatY = "";
    private _stepX = 1e10;
    private _stepY = 1e10;
    {
        private _zoom = getnumber (_x >> "zoomMax");
        if (_zoom < _zoomMax) then {
            _zoomMax = _zoom;
            _formatX = getText (_x >> "formatX");
            _formatY = getText (_x >> "formatY");
            _stepX = getNumber (_x >> "stepX");
            _stepY = getNumber (_x >> "stepY");
        };
    } forEach configProperties [(_worldConfig >> "Grid"), "isClass _x", false];
    private _stepXat5 = _stepX * 10 ^ ((count _formatX) - 5);
    private _stepYat5 = -1 * _stepY * 10 ^ ((count _formatY) - 5);
    if (_stepYat5 < 0) then {diag_log text format ["%1 [%2] - Northing is reversed.",_mapDescription,_mapConfigName];};
    if (_stepXat5 != 1) then {diag_log text format ["%1 [%2] - MGRS 10 digit grid does not equal 1 meter: (%3) for x.",_mapDescription,_mapConfigName,_stepXat5];};
    if (_stepYat5 != 1 && {_stepYat5 != -1}) then {diag_log text format ["%1 [%2] - MGRS 10 digit grid does not equal 1 meter: (%3) for y.",_mapDescription,_mapConfigName,_stepXat5];};

} forEach _maps;

// Always return true, these are just warnings
_testPass
