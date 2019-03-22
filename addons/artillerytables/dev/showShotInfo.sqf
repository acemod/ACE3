// #include "\z\ace\addons\artillerytables\script_component.hpp"

INFO("showing shot info");

["LandVehicle", "fired", {
    params ["_shooter", "", "", "", "_ammo", "", "_proj"];
    ((velocity _proj) call CBA_fnc_vect2Polar) params ["_mag", "_dir", "_elev"];
    private _shootPos = getPosASL _shooter;
    if (_dir < 0) then {_dir = _dir + 360;};

    private _offsetElev = _elev - (missionNamespace getVariable [QGVAR(predictedElevation), -999]);
    private _offsetAz = _dir - (missionNamespace getVariable [QGVAR(predictedAzimuth), -999]);

    hintSilent format ["%1 m/s\nAz: %2 [%3]\nEl: %4 [%5]\nError Az: %6\nError EL: %7",_mag toFixed 1, _dir toFixed 2, ((6400 / 360) * _dir) toFixed 0, _elev toFixed 2, ((6400 / 360) * _elev) toFixed 0,
    _offsetAz toFixed 3, _offsetElev toFixed 3];
    TRACE_2("",_offsetAz,_offsetElev);
    private _submunitionAmmo = getText (configFile >> "CfgAmmo" >> _ammo >> "submunitionAmmo");

    [{
        params ["_proj", "_shootPos", "_lastPos", "_submunitionAmmo"];
        if ((isNull _proj) && {_submunitionAmmo != ""}) then {
            _proj = nearestObject [_lastPos, _submunitionAmmo];
            _this set [0, _proj];
        };
        if (isNull _proj) exitWith {true};
        _this set [2, getPosASL _proj];
        false
    }, {
        params ["", "_shootPos", "_lastPos"];
        private _mkrB = createMarker [format ["shotInfo-%1-%2",_shootPos,_lastPos], _lastPos];
        _mkrB setMarkerType "mil_dot";
        _mkrB setMarkerColor "ColorGreen";
        _mkrB setMarkerSize [0.5,0.5];
        private _diff = _lastPos vectorDiff _shootPos;
        _mkrB setMarkerText format ["%1", _diff apply {round _x}];

        private _dist2d = _shootPos distance2d _lastPos;
        private _dir = _shootPos getDir _lastPos;
        private _height = (_lastPos select 2) - (_shootPos select 2);
        _mkrB setMarkerText format ["Dist: %1m Az: %2[%3] Height:%4", _dist2d toFixed 0, _dir toFixed 2, ((6400 / 360) * _dir) toFixed 0, _height toFixed 0];
    }, [_proj, _shootPos, [0,0,0], _submunitionAmmo]] call CBA_fnc_waitUntilAndExecute;

    private _mkrA = createMarker [format ["shotInfo-%1",_shootPos], _shootPos];
    _mkrA setMarkerType "mil_dot";
    _mkrA setMarkerColor "ColorRed";
    _mkrA setMarkerSize [0.5,0.5];
}] call CBA_fnc_addClassEventHandler;
