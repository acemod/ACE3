#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Calculates whether or not hit penetrated given armour or not. Only enabled with advanced penetration simulation turned on.
 *
 * Arguments:
 * 0: Source of damage <OBJECT>
 * 1: The vehicle <OBJECT>
 * 2: Projectile that hit <OBJECT>
 * 3: Hitpoint damaged <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [myVehicle, projectile, 5, 0.663] call ace_vehicle_damage_fnc_calculatePenetrationInfo;
 *
 * Public: No
 */

params ["_source", "_vehicle", "_projectileData", "_hitpointConfig"];
_projectileData params ["_projectileType", "_projectileConfig"];
/*
    http://www.longrods.ch/peneq.php
    https://www.scribd.com/doc/267210898/57-mm-APFSDS-2-000-m#download
    Perforation Calculation of APFSDS:
        Tungsten/Depleted Uranium: Rods
            P/Lw = a * (1 / tanh(b0 + b1 * (Lw/D))) * cos^m (theta) * sqrt (Pp / Pt) * e^((-(c0 + c1 * BHNT) * BHNT) / (Pp * Vt^2))
            
        Steel Rods
            P/Lw = a * (1 / tanh(b0 + b1 * (Lw/D))) * cos^m (theta) * sqrt (Pp / Pt) * e^((-c * BHNT^k * BHNP^n) / (Pp * Vt^2))
            
    Penetration Calculation of Tungsten APFSDS (Used for all penetrators):
        P/Lw = a * (1 / tanh(b0 + b1 * (Lw/D))) sqrt (Pp / Pt) * e^((-(c0 + c1 * BHNT) * BHNT) / (Pp * Vt^2))
        
    where:
        Penetrator:
            D = Diameter of penetrator rod (always 22mm)
            L = Total length of penetrator in millimeters (always 950mm)
            Lw = Working length of rod in millimeters
            Vt = impact velocity in Kilometers/Second
            theta = NATO Obliquity angle of Penetration
            Pp = Penetrator Density in kg/m^3
            BHNP = Brinell hardness number of penetrator
            
        Target:
            Pt = target density in kg/m^3 (always 7840kg/m^3)
            d = plate thickness in millimeters
            BHNT = Brinell hardness number of target (always 350)
        
        Material Data:
            Tungsten:
                Pp = 19300
                BHNP = N/A
                
                a = 0.994
                c0 = 134.5
                c1 = -0.148
                
            Depleted Uranium:
                Pp = 18600
                BHNP = N/A
                
                a = 0.825
                c0 = 90.0
                c1 = -0.0849
            
            Steel:
                Pp = 7850
                BHNP = 500
                
                a = 1.104
                c = 9874
                k = 0.3598
                n = -0.2342

        Cofficients:
            m = -0.224
            b0 = 0.283
            b1 = 0.0656
*/

private _enabled = ([_hitpointConfig >> QGVAR(enabled), "NUMBER", 0] call CBA_fnc_getConfigEntry) == 1;
#define MATERIAL_ARRAY ([[0, 0, 0, 0, 0, 0], "steel", [7850, 500, 1.104, 9874, 0.3598, -0.2342], "tungsten", [19300, 0, 0.994, 134.5, -0.148], "depleted_uranium", [18600, 0, 0.825, 90, -0.0849]])
private _rodMaterialStr = [_projectileConfig >> QGVAR(material), "STRING", "tungsten"] call CBA_fnc_getConfigEntry;
private _rodMaterialParams = MATERIAL_ARRAY select (1 + MATERIAL_ARRAY find toLower _rodMaterial);

if !(_enabled) exitWith { [false, 0, 0, 0, 0] };
if (_rodMaterialParams isEqualTo [0, 0, 0, 0, 0, 0]) exitWith { [] };

private _tanX = 2 * (0.283 * 0.0656 * (1));
private _tanh = 1 / (((exp _tanX) - 1) / ((exp _tanX) + 1));
private _cosm = (cos 0) ^ -0.224;
private _lw = 950; // technically this would be something else depending on armour slant but this is a good enough aproximation

private _aproximateVelocity = 0;

private _perf_pLw = 0;
private _pen_pLw = 0;
if (_rodMaterialStr isEqualTo "steel") then {
    _rodMaterialParams params ["_Pp", "_BHNP", "_a", "_c", "_k", "_n"];
    private _exp = (-_c * 350^_k * _BHNP^_n) / (_Pp * _aproximateVelocity * _aproximateVelocity);
    _pen_pLw = _a * _tanh * sqrt (_Pp / 7840) * exp _exp;
    _perf_pLw = _pen_pLw * _cosm;
} else {
    _rodMaterialParams params ["_Pp", "_BHNP", "_a", "_c0", "_c1"];
    private _exp = (-(_c0 + _c1 * 350) * 350) / (_Pp * _aproximateVelocity * _aproximateVelocity);
    _pen_pLw = _a * _tanh * _cosm * sqrt (_Pp / 7840) * exp _exp;
    _perf_pLw = _pen_pLw * _cosm;
};

private _perforationDistance = _lw * _perf_pLw;
private _penetrationDistance = _lw * _pen_pLw;
private _hitpointEffectiveArmour = [_hitpointConfig >> QGVAR(thickness), "NUMBER", 0] call CBA_fnc_getConfigEntry;
private _hitpointEffectiveSlope = [_hitpointConfig >> QGVAR(slope), "NUMBER", 0] call CBA_fnc_getConfigEntry;
_penetrationDistance = _penetrationDistance * cos (_hitpointEffectiveSlope);

[_penetrationDistance > _hitpointEffectiveArmour, _penetrationDistance - _hitpointEffectiveArmour, _penetrationDistance, _perforationDistance, _hitpointEffectiveArmour]
