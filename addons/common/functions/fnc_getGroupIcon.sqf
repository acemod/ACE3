/*
 * Author: SilentSpike
 * Function used to get an appropriate icon for provided group. Approximate.
 *
 * Arguments:
 * 0: Group to get the icon of <GROUP>
 * 1: Allow leader's squad.xml logo <BOOL> (Default: false)
 *
 * Return Value:
 * Icon of group <STRING>
 *
 * Examples:
 * [group player] call ace_common_fnc_getGroupIcon;
 *
 * Public: Yes
 */

#include "script_component.hpp"

// Military icons
#define ICON_UNKNOWN "a3\ui_f\data\Map\Markers\NATO\data\b_unknown.paa"
#define ICON_UAV "a3\ui_f\data\Map\Markers\NATO\data\b_uav.paa"
#define ICON_SUPPORT "a3\ui_f\data\Map\Markers\NATO\data\b_support.paa"
#define ICON_SERVICE "a3\ui_f\data\Map\Markers\NATO\data\b_service.paa"
#define ICON_RECON "a3\ui_f\data\Map\Markers\NATO\data\b_recon.paa"
#define ICON_PLANE "a3\ui_f\data\Map\Markers\NATO\data\b_plane.paa"
#define ICON_NAVAL "a3\ui_f\data\Map\Markers\NATO\data\b_naval.paa"
#define ICON_MOTOR_INF "a3\ui_f\data\Map\Markers\NATO\data\b_motor_inf.paa"
#define ICON_MORTAR "a3\ui_f\data\Map\Markers\NATO\data\b_mortar.paa"
#define ICON_MED "a3\ui_f\data\Map\Markers\NATO\data\b_med.paa"
#define ICON_MECH_INF "a3\ui_f\data\Map\Markers\NATO\data\b_mech_inf.paa"
#define ICON_MAINT "a3\ui_f\data\Map\Markers\NATO\data\b_maint.paa"
#define ICON_INSTALLATION "a3\ui_f\data\Map\Markers\NATO\data\b_installation.paa"
#define ICON_INF "a3\ui_f\data\Map\Markers\NATO\data\b_inf.paa"
#define ICON_ART "a3\ui_f\data\Map\Markers\NATO\data\b_art.paa"
#define ICON_ARMOR "a3\ui_f\data\Map\Markers\NATO\data\b_armor.paa"
#define ICON_AIR "a3\ui_f\data\Map\Markers\NATO\data\b_air.paa"

// Civilian icons
#define CIV_ICON_UNKNOWN "a3\ui_f\data\Map\Markers\NATO\data\c_unknown.paa"
#define CIV_ICON_AIR "a3\ui_f\data\Map\Markers\NATO\data\c_air.paa"
#define CIV_ICON_CAR "a3\ui_f\data\Map\Markers\NATO\data\c_car.paa"
#define CIV_ICON_PLANE "a3\ui_f\data\Map\Markers\NATO\data\c_plane.paa"
#define CIV_ICON_SHIP "a3\ui_f\data\Map\Markers\NATO\data\c_ship.paa"

params [["_group", grpNull, [grpNull]], ["_useXML", false, [true]]];

// Handle empty or null group
private _leader = leader _group;
if (isNull _leader) exitWith { [ICON_UNKNOWN, CIV_ICON_UNKNOWN] select (side _group == civilian) };

// Handle cases where player has a valid squad.xml logo
if (_useXML && {(((squadParams _leader) param [0,[]]) param [4,""]) != ""}) exitWith {
    ((squadParams _leader) select 0) select 4
};

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
private _medic = [_leader] call FUNC(isMedic);
private _engineer = [_leader] call FUNC(isMedic);

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
