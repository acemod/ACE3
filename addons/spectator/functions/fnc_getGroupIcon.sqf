#include "script_component.hpp"
/*
 * Author: SilentSpike
 * Function used to get an appropriate icon for provided group. Approximate.
 *
 * Arguments:
 * 0: Group to get the icon of <GROUP>
 * 1: Return icons for draw3D use <BOOL> (Default: false)
 *
 * Return Value:
 * Icon of group <STRING>
 *
 * Examples:
 * [group player] call ace_spectator_fnc_getGroupIcon
 *
 * Public: No
 */
#define ICON_PATH(var1) QUOTE(a3\ui_f\data\Map\Markers\NATO\var1)

// Military icons
#define ICON_UNKNOWN [ICON_PATH(b_unknown.paa), QPATHTOF(data\b_unknown.paa)] select _forDraw
#define ICON_UAV [ICON_PATH(b_uav.paa), QPATHTOF(data\b_uav.paa)] select _forDraw
#define ICON_SUPPORT [ICON_PATH(b_support.paa), QPATHTOF(data\b_support.paa)] select _forDraw
#define ICON_SERVICE [ICON_PATH(b_service.paa), QPATHTOF(data\b_service.paa)] select _forDraw
#define ICON_RECON [ICON_PATH(b_recon.paa), QPATHTOF(data\b_recon.paa)] select _forDraw
#define ICON_PLANE [ICON_PATH(b_plane.paa), QPATHTOF(data\b_plane.paa)] select _forDraw
#define ICON_NAVAL [ICON_PATH(b_naval.paa), QPATHTOF(data\b_naval.paa)] select _forDraw
#define ICON_MOTOR_INF [ICON_PATH(b_motor_inf.paa), QPATHTOF(data\b_motor_inf.paa)] select _forDraw
#define ICON_MORTAR [ICON_PATH(b_mortar.paa), QPATHTOF(data\b_mortar.paa)] select _forDraw
#define ICON_MED [ICON_PATH(b_med.paa), QPATHTOF(data\b_med.paa)] select _forDraw
#define ICON_MECH_INF [ICON_PATH(b_mech_inf.paa), QPATHTOF(data\b_mech_inf.paa)] select _forDraw
#define ICON_MAINT [ICON_PATH(b_maint.paa), QPATHTOF(data\b_maint.paa)] select _forDraw
#define ICON_INSTALLATION [ICON_PATH(b_installation.paa), QPATHTOF(data\b_installation.paa)] select _forDraw
#define ICON_INF [ICON_PATH(b_inf.paa), QPATHTOF(data\b_inf.paa)] select _forDraw
#define ICON_ART [ICON_PATH(b_art.paa), QPATHTOF(data\b_art.paa)] select _forDraw
#define ICON_ARMOR [ICON_PATH(b_armor.paa), QPATHTOF(data\b_armor.paa)] select _forDraw
#define ICON_AIR [ICON_PATH(b_air.paa), QPATHTOF(data\b_air.paa)] select _forDraw

// Civilian icons
#define CIV_ICON_UNKNOWN [ICON_PATH(c_unknown.paa), QPATHTOF(data\c_unknown.paa)] select _forDraw
#define CIV_ICON_AIR [ICON_PATH(c_air.paa), QPATHTOF(data\c_air.paa)] select _forDraw
#define CIV_ICON_CAR [ICON_PATH(c_car.paa), QPATHTOF(data\c_car.paa)] select _forDraw
#define CIV_ICON_PLANE [ICON_PATH(c_plane.paa), QPATHTOF(data\c_plane.paa)] select _forDraw
#define CIV_ICON_SHIP [ICON_PATH(c_ship.paa), QPATHTOF(data\c_ship.paa)] select _forDraw

params [["_group", grpNull, [grpNull]], ["_forDraw", false, [true]]];

// Handle empty or null group
private _leader = leader _group;
if (isNull _leader) exitWith { [ICON_UNKNOWN, CIV_ICON_UNKNOWN] select (side _group == civilian) };

// Civilians are easy, just check leader's vehicle (unlikely group is large)
if (side _group == civilian) exitWith {
    if (_leader != vehicle _leader) then {
        // More common cases should be checked first
        (vehicle _leader) call {
            if (_this isKindOf "Car") exitWith {
                CIV_ICON_CAR
            };

            // Plane inherits Air, check first
            if (_this isKindOf "Plane") exitWith {
                CIV_ICON_PLANE
            };

            if (_this isKindOf "Air") exitWith {
                CIV_ICON_AIR
            };

            if (_this isKindOf "Ship") exitWith {
                CIV_ICON_SHIP
            };

            CIV_ICON_UNKNOWN
        };
    } else {
        CIV_ICON_UNKNOWN
    };
};

// Handle military groups
private _units = units _group;
private _vehicles = (_units apply { vehicle _x }) - _units;

// If more than 33% of the group is mounted, use most common vehicle
if (count _vehicles >= 0.33 * count _units) exitWith {
    // Check the most likely cases first
    _vehicles call {
        private _threshold = 0.5 * count _this;

        if ("Car" countType _this >= _threshold) exitWith {
            ICON_MOTOR_INF
        };

        // APC inherits Tank, check first
        if ("APC" countType _this >= _threshold) exitWith {
            ICON_MECH_INF
        };

        // MBT_01_arty_base_F inherits Tank, check first
        // Unfortunately no common arty class to check
        if ("MBT_01_arty_base_F" countType _this >= _threshold) exitWith {
            ICON_ART
        };
        if ("MBT_02_arty_base_F" countType _this >= _threshold) exitWith {
            ICON_ART
        };

        if ("Tank" countType _this >= _threshold) exitWith {
            ICON_ARMOR
        };

        // UAV inherits Plane, check first
        if ("UAV" countType _this >= _threshold) exitWith {
            ICON_UAV
        };

        // Plane inherits Air, check first
        if ("Plane" countType _this >= _threshold) exitWith {
            ICON_PLANE
        };

        if ("Air" countType _this >= _threshold) exitWith {
            ICON_AIR
        };

        if ("Ship" countType _this >= _threshold) exitWith {
            ICON_NAVAL
        };

        // StaticMortar inherits StaticWeapon, check first
        if ("StaticMortar" countType _this >= _threshold) exitWith {
            ICON_MORTAR
        };

        if ("StaticWeapon" countType _this >= _threshold) exitWith {
            ICON_INSTALLATION
        };

        // If it reaches here then it's a mixed group of vehicles
        ICON_UNKNOWN
    };
};

// Check leader for medic/engineer/etc, otherwise just default to infantry
private _medic = [_leader] call EFUNC(common,isMedic);
private _engineer = [_leader] call EFUNC(common,isEngineer);

if (_medic && _engineer) exitWith {
    ICON_SUPPORT
};

if (_medic) exitWith {
    ICON_MED
};

if (_engineer) exitWith {
    ICON_MAINT
};

ICON_INF
