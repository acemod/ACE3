#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * For performance, we load a bunch of vanilla materials preemptively into the spall material cache.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_frag_fnc_initMaterialCache
 *
 * Public: No
 */

uiNamespace setVariable [QGVAR(spallMaterialCache), createHashMapFromArray [
    ["a3\data_f\penetration\armour.bisurf","metal"],
    ["a3\data_f\penetration\armour_plate.bisurf","metal"],
    ["a3\data_f\penetration\armour_plate_100mm.bisurf","metal"],
    ["a3\data_f\penetration\armour_plate_12mm.bisurf","metal"],
    ["a3\data_f\penetration\armour_plate_16mm.bisurf","metal"],
    ["a3\data_f\penetration\armour_plate_1mm.bisurf","metal"],
    ["a3\data_f\penetration\armour_plate_20mm.bisurf","metal"],
    ["a3\data_f\penetration\armour_plate_23mm.bisurf","metal"],
    ["a3\data_f\penetration\armour_plate_250mm.bisurf","metal"],
    ["a3\data_f\penetration\armour_plate_30mm.bisurf","metal"],
    ["a3\data_f\penetration\armour_plate_3mm.bisurf","metal"],
    ["a3\data_f\penetration\armour_plate_40mm.bisurf","metal"],
    ["a3\data_f\penetration\armour_plate_5mm.bisurf","metal"],
    ["a3\data_f\penetration\armour_plate_60mm.bisurf","metal"],
    ["a3\data_f\penetration\armour_plate_7mm.bisurf","metal"],
    ["a3\data_f\penetration\armour_plate_80mm.bisurf","metal"],
    ["a3\data_f\penetration\armour_plate_heavy.bisurf","metal"],
    ["a3\data_f\penetration\armour_plate_medium.bisurf","metal"],
    ["a3\data_f\penetration\armour_plate_thin.bisurf","metal"],
    ["a3\data_f\penetration\bell.bisurf","ground"],
    ["a3\data_f\penetration\body.bisurf","ground"],
    ["a3\data_f\penetration\building.bisurf","concrete"],
    ["a3\data_f\penetration\building_dust_particle.bisurf","concrete"],
    ["a3\data_f\penetration\building_dust_soft.bisurf","concrete"],
    ["a3\data_f\penetration\building_plate.bisurf","concrete"],
    ["a3\data_f\penetration\building_wood_particle.bisurf","wood"],
    ["a3\data_f\penetration\cactus.bisurf","ground"],
    ["a3\data_f\penetration\cloth.bisurf","ground"],
    ["a3\data_f\penetration\cloth_plate.bisurf","ground"],
    ["a3\data_f\penetration\concrete.bisurf","concrete"],
    ["a3\data_f\penetration\concrete_plate.bisurf","concrete"],
    ["a3\data_f\penetration\default.bisurf","ground"],
    ["a3\data_f\penetration\engine.bisurf","metal"],
    ["a3\data_f\penetration\foliage.bisurf","ground"],
    ["a3\data_f\penetration\foliage_dead.bisurf","ground"],
    ["a3\data_f\penetration\foliage_dead_plate.bisurf","ground"],
    ["a3\data_f\penetration\foliage_green.bisurf","ground"],
    ["a3\data_f\penetration\foliage_green_big.bisurf","ground"],
    ["a3\data_f\penetration\foliage_green_big_plate.bisurf","ground"],
    ["a3\data_f\penetration\foliage_green_plate.bisurf","ground"],
    ["a3\data_f\penetration\foliage_palm.bisurf","ground"],
    ["a3\data_f\penetration\foliage_palm_plate.bisurf","ground"],
    ["a3\data_f\penetration\foliage_pine.bisurf","ground"],
    ["a3\data_f\penetration\foliage_pine_plate.bisurf","ground"],
    ["a3\data_f\penetration\foliage_plate.bisurf","ground"],
    ["a3\data_f\penetration\fueltank.bisurf","metal"],
    ["a3\data_f\penetration\glass.bisurf","ground"],
    ["a3\data_f\penetration\glass_armored.bisurf","ground"],
    ["a3\data_f\penetration\glass_armored_plate.bisurf","ground"],
    ["a3\data_f\penetration\glass_plate.bisurf","ground"],
    ["a3\data_f\penetration\granite.bisurf","ground"],
    ["a3\data_f\penetration\granite_plate.bisurf","ground"],
    ["a3\data_f\penetration\hard_ground.bisurf","ground"],
    ["a3\data_f\penetration\hay.bisurf","ground"],
    ["a3\data_f\penetration\iron_cast.bisurf","metal"],
    ["a3\data_f\penetration\iron_cast_plate.bisurf","metal"],
    ["a3\data_f\penetration\leather.bisurf","ground"],
    ["a3\data_f\penetration\meat.bisurf","ground"],
    ["a3\data_f\penetration\meatbones.bisurf","ground"],
    ["a3\data_f\penetration\medium_ground.bisurf","ground"],
    ["a3\data_f\penetration\metal.bisurf","metal"],
    ["a3\data_f\penetration\metal_plate.bisurf","metal"],
    ["a3\data_f\penetration\metal_plate_thin.bisurf","metal"],
    ["a3\data_f\penetration\plastic.bisurf","ground"],
    ["a3\data_f\penetration\plastic_plate.bisurf","ground"],
    ["a3\data_f\penetration\plexiglass.bisurf","ground"],
    ["a3\data_f\penetration\plexiglass_plate.bisurf","ground"],
    ["a3\data_f\penetration\rubber.bisurf","ground"],
    ["a3\data_f\penetration\soft_ground.bisurf","ground"],
    ["a3\data_f\penetration\tyre.bisurf","ground"],
    ["a3\data_f\penetration\tyre_armored.bisurf","ground"],
    ["a3\data_f\penetration\vehicle_interior.bisurf","metal"],
    ["a3\data_f\penetration\void.bisurf","ground"],
    ["a3\data_f\penetration\water.bisurf","ground"],
    ["a3\data_f\penetration\weapon_plate.bisurf","metal"],
    ["a3\data_f\penetration\wood.bisurf","wood"],
    ["a3\data_f\penetration\wood_plate.bisurf","wood"]
]];
