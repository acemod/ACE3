// PabstMirror
// ["fcs"] call ace_common_fnc_runTests;
// execVM "z\ace\addons\fcs\dev\test_debugConfigs.sqf;

private _testPass = true;

diag_log text format ["[ACE_FCS] ---------------"];
private _vehicles = configProperties [configFile >> "CfgVehicles", "(isClass _x) && {2 == getNumber (_x >> 'scope')}", true];
private _problemUIs = [];
{
    private _vehicleType = configName _x;
    {
        private _turret = _x;
        private _config = [_vehicleType, _turret] call CBA_fnc_getTurret;
        if (!isNull _config) then {
            private _aceFCS = (getNumber (_config >> "ACE_FCS_Enabled")) == 1;

            private _vanillaFCS = false;
            private _weapons = getArray (_config >> "weapons");
            {
                private _weapon = _x;
                private _ballisticComputer = getNumber (configFile >> "CfgWeapons" >> _weapon >> "ballisticsComputer");
                _ballisticComputer = [_ballisticComputer, 5] call ace_common_fnc_toBin;
                if ((_ballisticComputer select [(count _ballisticComputer) - 5, 1]) == "1") then {
                    _vanillaFCS = true;
                    if (_aceFCS) then {
                        _testPass = false;
                        diag_log text format ["%1 -> %2:  ACE FCS Enabled CONFLICTS with vanilla FCS [%3]", _vehicleType, _weapon, _ballisticComputer];
                    };
                };
            } forEach _weapons;

            if (!(_weapons isEqualTo [])) then {
                private _fcsMsg = switch (true) do {
                // case ((!_vanillaFCS) && {!_aceFCS}): {"No FCS"};
                // case ((_vanillaFCS) && {_aceFCS}): {"CONFLICT FCS"};
                // case (_vanillaFCS): {"Vanilla FCS"};
                // case (_aceFCS): {"ACE FCS"};
                default {""};
                };
                if (_fcsMsg != "") then {diag_log text format ["%1: %2", _vehicleType, _fcsMsg];};
            };

            if (_vanillaFCS) then {
                private _dd = getArray (_config >> "discreteDistance");
                if (_dd isEqualTo []) exitWith {diag_log format ["%1->%2: discreteDistance with vanillaFCS [%3]", _vehicleType, _turret, _config];};
            };

            if (true) then {
                private _turretInfo = getText (_config >> "turretInfoType");
                private _infoConfig = configFile >> "RscInGameUI" >> _turretInfo;
                if (!isNull _infoConfig) then {
                    private _idcList = [];

                    private _fncGetIDCS = {
                        params ["_subConfig"];
                        if (!isClass _subConfig) exitWith {diag_log "err";};
                        private _controlsArray = getArray (_subConfig >> "controls");
                        {
                            [_subConfig >> _x] call _fncGetIDCS;
                        } forEach _controlsArray;
                        private _controlsConfig = configProperties [(_subConfig >> "controls"), "isClass _x", true];
                        {
                            [_x] call _fncGetIDCS;
                        } forEach _controlsConfig;
                        _idcList pushBack getNumber (_subConfig >> "idc");
                    };
                    [_infoConfig] call _fncGetIDCS;

                    if (_aceFCS && {!(1713151 in _idcList)}) then {
                        _problemUIs pushBackUnique format ["%1: ACE_FCS, but missing ACE_CA_DIST", _turretInfo];
                    };
                    if (_aceFCS && {(198 in _idcList)}) then {
                        _problemUIs pushBackUnique format ["%1: ACE_FCS, but NEW Lazr CA_DIST", _turretInfo, _vehicleType];
                    };
                    if ((!_aceFCS) && {(1713151 in _idcList)}) then {
                        _problemUIs pushBackUnique format ["%1: Not ACE but has ACE_CA_DIST", _turretInfo, _vehicleType];
                    };
                    if (_vanillaFCS && {!(198 in _idcList)}) then {
                        _problemUIs pushBackUnique format ["%1: vanillaFCS but missing NEW Lazr CA_DIST [just a warning]", _turretInfo, _vehicleType];
                    };
                };
            };
        };
    // } forEach [[0],[0,0]];
    } forEach [[0],[0,0], [1], [2]];
} forEach _vehicles;

_problemUIs sort true;

diag_log text format ["[ACE_FCS] ------- Problem UIs --------"];
{
    diag_log text format ["- %1", _x];
} forEach _problemUIs;
diag_log text format ["[ACE_FCS] ---------------"];

_testPass
