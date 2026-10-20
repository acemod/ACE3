#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou, Lambda.Tiger
 * This function returns fragmentation parameters for a specific ammo type.
 *
 * Arguments:
 * 0: Ammo classname <STRING>
 *
 * Return Value:
 * _ammoInfo <ARRAY>
 *  0: Search range for fragments in meters <NUMBER>
 *  1: Gurney equation calculated speed <NUMBER>
 *  2: Array of fragment types <ARRAY>
 *  3: Mass of fragmenting metal modified for frag count <NUMBER>
 *
 * Example:
 * "B_556x45_Ball" call ace_frag_fnc_getFragInfo
 *
 * Public: No
 */

params ["_ammo"];

GVAR(fragInfoCache) getOrDefaultCall [_ammo, {
    private _ammoConfig = configFile >> "CfgAmmo" >> _ammo;
    private _fragTypes = ACE_FRAG_DEFAULT_FRAG_TYPES;
    private _notifyMissingEntries = false;
    if (isArray (_ammoConfig >> QGVAR(classes))) then {
        _fragTypes = getArray (_ammoConfig >> QGVAR(classes));
    } else {
        _notifyMissingEntries = true;
    };

    /************ Gurney equation notes *****************//*
    * see https://en.wikipedia.org/wiki/Gurney_equations
    *
    * gurney_k is the geometry constant added to _metalMass/_chargeMass
    * gurney_c = sqrt(2E)
    *
    * _chargeMass = 185; - grams of comp-b
    * _metalMass = 210; - grams of metal are accelerated by explosion
    * _geometryCoefficient = 3/5; - spherical K factor
    * _gurneyConstant = 2843; - Gurney constant of comp-b in /ms
    *
    * _chargeMass = 429; - grams of tritonal
    * _metalMass = 496; - grams of metal are accelerated by explosion
    * _geometryCoefficient = 1/2; - cylindrical K factor
    * _gurneyConstant = 2320; - Gurney constant of tritonal in m/s
    * Equation - 0.8 for empirical 80% speed
    * 0.8 * (((_metalMass / _chargeMass) + _geometryCoefficient) ^ - (1 / 2)) * _gurneyConstant;
    * or 0.8 * _gurneyConstant * sqrt (_chargeMass /(_metalMass + _chargeMass * _geometryCoefficient)); (slightly faster to compute)
    */

    private _chargeMass = getNumber (_ammoConfig >> QGVAR(charge));
    if (_chargeMass == 0) then {
        _chargeMass = 1;
        _notifyMissingEntries = true;
    };

    private _metalMass = getNumber (_ammoConfig >> QGVAR(metal));
    if (_metalMass == 0) then {
        _metalMass = 2;
        _notifyMissingEntries = true;
    };

    private _geometryCoefficient = getNumber (_ammoConfig >> QGVAR(gurney_k));
    if (_geometryCoefficient == 0) then {
        _geometryCoefficient = 0.5;
        _notifyMissingEntries = true;
    };

    private _gurneyConstant = getNumber (_ammoConfig >> QGVAR(gurney_c));
    if (_gurneyConstant == 0) then {
        _gurneyConstant = 2440;
        _notifyMissingEntries = true;
    };

    if (_notifyMissingEntries) then {
        INFO_1("Ammo class %1 lacks proper explosive properties definitions for frag!",_ammo);
    };

    private _indirectHitRange = getNumber (_ammoConfig >> "indirecthitrange");

    /********************** _ammoInfo format *************************//*
    * 0: _fragRange - search range for fragments
    * 1: _fragVelocity - gurney equation calculated velocity
    * 2: _fragTypes - array of fragment types
    * 3: _metalMassModified - mass of fragmenting metal modified for frag count
    */
    [
        80 * _indirectHitRange,
        ACE_FRAG_IMPERIC_VELOCITY_CONSTANT * _gurneyConstant * sqrt (_chargeMass / (_metalMass + _chargeMass * _geometryCoefficient)),
        _fragTypes,
        sqrt (_metalMass / 1000)
    ] // return
}, true]
