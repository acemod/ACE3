#pragma once

enum lod_types {
    LOD_TYPE_VIEWGUNNER = 0x447a0000, //1.0e3    1,000    View Gunner
    LOD_TYPE_VIEWPILOT = 0x44898000, //1.1e3    1,100    View Pilot
    LOD_TYPE_VIEWCARGO = 0x44960000, //1.2e3    1,200    View Cargo
    LOD_TYPE_SHADOWSTENCILE = 0x461c4000, //1.0e4    10,000    Stencil Shadow
    LOD_TYPE_SHADOWSTENCILE_2 = 0x461c6800,//    1.001e4    10, 010    Stencil Shadow 2
    LOD_TYPE_SHADOWVOLUME = 0x462be000,//    1.1e4    11000    Shadow Volume
    LOD_TYPE_SHADOWVOLUME_2 = 0x462c0800,//    1.101e4    11010    Shadow Volume 2
    LOD_TYPE_GEOMETRY = 0x551184e7,    // 1.0e13    10, 000, 000, 000, 000    Geometry
    LOD_TYPE_MEMORY = 0x58635fa9,    // 1.0e15    1, 000, 000, 000, 000, 000    Memory
    LOD_TYPE_LANDCONTACT = 0x58e35fa9,    // 2.0e15    2, 000, 000, 000, 000, 000    Land Contact
    LOD_TYPE_ROADWAY = 0x592a87bf,    // 3.0e15    3, 000, 000, 000, 000, 000    Roadway
    LOD_TYPE_PATHS = 0x59635fa9,    // 4.0e15    4, 000, 000, 000, 000, 000    Paths
    LOD_TYPE_HITPOINTS = 0x598e1bca,    // 5.0e15    5, 000, 000, 000, 000, 000    HitPoints
    LOD_TYPE_GEOMETRY_VIEW = 0x59aa87bf,    // 6.0e15    6, 000, 000, 000, 000, 000    View Geometry
    LOD_TYPE_GEOMETRY_FIRE = 0x59c6f3b4,    // 7.0e15    7, 000, 000, 000, 000, 000    Fire Geometry
    LOD_TYPE_GEOMETRY_VIEWCARGO = 0x59e35fa9,    // 8.0e15    8, 000, 000, 000, 000, 000    View Cargo Geometry
    LOD_TYPE_GEOMETRY_VIEWCARGO_FIRE = 0x59ffcb9e,    // 9.0e15    9, 000, 000, 000, 000, 000    View Cargo Fire Geometry
    LOD_TYPE_VIEWCOMMANDER = 0x5a0e1bca,    // 1.0e16    10, 000, 000, 000, 000, 000    View Commander
    LOD_TYPE_GEOMETRY_VIEWCOMMANDER = 0x5a1c51c4,    // 1.1e16    11, 000, 000, 000, 000, 000    View Commander Geometry
    LOD_TYPE_GEOMETRY_VIEWCOMMANDER_FIRE = 0x5a2a87bf,    // 1.2e16    12, 000, 000, 000, 000, 000    View Commander Fire Geometry
    LOD_TYPE_VIEWPILOT_GEOMETRY = 0x5a38bdb9,    // 1.3e16    13, 000, 000, 000, 000, 000    View Pilot Geometry
    LOD_TYPE_GEOMETRY_VIEWPILOT_FIRE = 0x5a46f3b4,    // 1.4e16    14, 000, 000, 000, 000, 000    View Pilot Fire Geometry
    LOD_TYPE_VIEWGUNNER_GEOMETRY = 0x5a5529af,    // 1.5e16    15, 000, 000, 000, 000, 000    View Gunner Geometry
    LOD_TYPE_GEOMETRY_VIEWGUNNER_FIRE = 0x5a635fa9,    // 1.6e16    16, 000, 000, 000, 000, 000    View Gunner Fire Geometry
    LOD_TYPE_SUBPARTS = 0x5a7195a4,    // 1.7e16    17, 000, 000, 000, 000, 000    Sub Parts
    LOD_TYPE_SHADOWVOLUME_VIEWCARGO = 0x5a7fcb9e,    // 1.8e16    18, 000, 000, 000, 000, 000    SHADOW_VOLUME_VIEW_CARGO
    LOD_TYPE_SHADOWVOLUME_VIEWPILOT = 0x5a8700cc,    // 1.9e16    19, 000, 000, 000, 000, 000    SHADOW_VOLUME_VIEW_PILOT
    LOD_TYPE_SHADOWVOLUME_VIEWGUNNER = 0x5a8e1bca,    // 2.0e16    20, 000, 000, 000, 000, 000    SHADOW_VOLUME_VIEW_GUNNER
    LOD_TYPE_WRECK = 0x5a9536c7    // 2.1e16    21, 000, 000, 000, 000, 000    WRECK
};