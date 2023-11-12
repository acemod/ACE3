#include "..\script_component.hpp"
// call compileScript ["z\ace\addons\explosives\dev\test_magazines.sqf"];

INFO("--- Checking Explosive Mags ---");

private _explosivesMags = compatibleMagazines "Put";
private _setupHash = createHashMap;
{
    private _mag = _x;
    private _cfg = configFile >> "CfgMagazines" >> _mag;
    private _scope = getNumber (_cfg >> "scope");

    private _setupObject = getText (_cfg >> QGVAR(SetupObject));
    if (_setupObject == "") then {
        WARNING_2("[%1](scope %2) has no setupObject",_mag,_scope);
        continue
    };
    if (!isClass (configFile >> "CfgVehicles" >> _setupObject)) then {
        ERROR_2("[%1](scope %2) has invalid setup object",_mag,_scope);
    };
    if ((((_setupHash getOrDefault [_setupObject, [], true]) pushBack _mag) > 0)) then {
        INFO_2("[%1] setupObject has multiple mags %2",_setupObject,_setupHash get _setupObject);
    };
} forEach _explosivesMags;
