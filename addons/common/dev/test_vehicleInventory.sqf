// PabstMirror
// ["vehicleTransportInventory"] call ace_common_fnc_runTests;
// execVM "z\ace\addons\common\dev\test_vehicleInventory.sqf";

private _testPass = true;

private _vehicles = configProperties [configFile >> "CfgVehicles", "(isClass _x)", true];
{
    private _vehType = configName _x;
    {
        private _name = getText (_x >> "name");
        if (_name != "MineDetector") then { // Vanilla mixes up mineDetector alot?
            private _weaponConfig = configFile >> "CfgWeapons" >> _name;
            private _glassesConfig = configFile >> "CfgGlasses" >> _name;
            if (((!isClass _weaponConfig) || {(getNumber (_weaponConfig >> "type")) in [1,2,4]}) && {!isClass _glassesConfig}) then {
                diag_log text format ["%1 -> TransportItems -> %2 = Bad", _vehType, _name];
                _testPass = false;
            };
        };
    } forEach (configProperties [_x >> "TransportItems", "isClass _x", true]);
    {
        private _name = getText (_x >> "weapon");
        private _weaponConfig = configFile >> "CfgWeapons" >> _name;
        if ((!isClass _weaponConfig) || {!((getNumber (_weaponConfig >> "type")) in [1,2,4])}) then {
            diag_log text format ["%1 -> TransportWeapons -> %2 = Bad", _vehType, _name];
            _testPass = false;
        };
    } forEach (configProperties [_x >> "TransportWeapons", "isClass _x", true]);
    {
        private _name = getText (_x >> "magazine");
        private _magConfig = configFile >> "CfgMagazines" >> _name;
        if ((!isClass _magConfig)) then {
            diag_log text format ["%1 -> TransportMagazines -> %2 = Bad", _vehType, _name];
            _testPass = false;
        };
    } forEach (configProperties [_x >> "TransportMagazines", "isClass _x", true]);
    {
        private _name = getText (_x >> "backpack");
        private _vehConfig = configFile >> "CfgVehicles" >> _name;
        if ((!isClass _vehConfig)) then {
            diag_log text format ["%1 -> TransportBackpacks -> %2 = Bad", _vehType, _name];
            _testPass = false;
        };
    } forEach (configProperties [_x >> "TransportBackpacks", "isClass _x", true]);
} forEach _vehicles;

_testPass
