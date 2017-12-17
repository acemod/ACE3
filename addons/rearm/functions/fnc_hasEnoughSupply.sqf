/*
* Author: GitHawk
* Check whether enough supply is left to take the magazine.
*
* Arguments:
* 0: Ammo Truck <OBJECT>
* 1: Magazine Classname <STRING>
*
* Return Value:
* Enough supply <BOOL>
*
* Example:
* [ammo_truck, "500Rnd_127x99_mag_Tracer_Red"] call ace_rearm_fnc_hasEnoughSupply
*
* Public: No
*/
#include "script_component.hpp"

params ["_truck", "_magazineClass"];

// With infinite supply, there is always enough
if (GVAR(supply) == 0) exitWith {true};


// With limited supply, we need to check supply
if (GVAR(supply) == 1) exitWith {
    private _supply = [_truck] call FUNC(getSupplyCount);
    ([_magazineClass] call FUNC(getCaliber)) params ["_cal", "_idx"];

    // With caliber based rearming, we only need partial supply
    if (GVAR(level) == 2) exitWith {
        // If REARM_COUNT is bigger than the magazine size, we might get a bigger number than 1
        private _magazinePart = ((REARM_COUNT select _idx) / (getNumber (configFile >> "CfgMagazines" >> _magazineClass >> "count"))) min 1;
        (_cal * _magazinePart <= _supply)
    };
    (_cal <= _supply)
};


// With magazine specific supply, we need to check stored magazines
if (GVAR(supply) == 2) exitWith {
    private _magazineSupply = _truck getVariable [QGVAR(magazineSupply), []];
    private _magazinePresent = false;
    {
        _x params ["_magazine", "_rounds"];
        if ((_magazine isEqualTo _magazineClass) && (_rounds > 0)) exitWith {_magazinePresent = true; };
        false
    } count _magazineSupply;
    _magazinePresent
};
