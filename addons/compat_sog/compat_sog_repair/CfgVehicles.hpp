class CfgVehicles {
    // Vehicle animation interactions
    // M39 / M54 / M49
    class vn_wheeled_truck_base;
    class vn_wheeled_m54_base: vn_wheeled_truck_base {
        class EGVAR(interaction,anims) {
            class user_sparewheel_hide {
                positions[] = {"_target selectionPosition ['hide_spare_wheel', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };
    class vn_wheeled_m54_mg_01_base: vn_wheeled_m54_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class user_sparewheel_hide: user_sparewheel_hide {
                items[] = {"ACE_Wheel", "ACE_Wheel", "ACE_Wheel", "ACE_Wheel"};
            };
        };
    };

    // M151
    class vn_wheeled_car_base;
    class vn_wheeled_m151_base: vn_wheeled_car_base {
        class EGVAR(interaction,anims) {
            class user_sparewheel_hide {
                positions[] = {"_target selectionPosition ['hide_sparewheel', 'ViewGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };

    // Dirt Ranger
    class vn_wheeled_lr2a_base: vn_wheeled_car_base {
        class EGVAR(interaction,anims) {
            class hide_sparewheel {
                positions[] = {"_target selectionPosition ['hide_sparewheel', 'ViewGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };

    // BTR-40
    class vn_wheeled_btr40_base: vn_wheeled_car_base {
        class EGVAR(interaction,anims) {
            class sparewheel_hide {
                positions[] = {"_target selectionPosition ['hide_sparewheel', 'ViewGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };

    // M48
    class vn_armor_tank_base;
    class vn_armor_m48_base: vn_armor_tank_base {
        class EGVAR(interaction,anims) {
            class hide_mainturret_tracks {
                // Rotate interactions with turret rotation
                positions[] = {
                    "[[1.3, 0.2, -0.5], [0, 0, 1], deg (_target animationPhase 'MainTurret')] call CBA_fnc_vectRotate3D",
                    "[[-1.3, 0.2, -0.5], [0, 0, 1], deg (_target animationPhase 'MainTurret')] call CBA_fnc_vectRotate3D"
                };
                items[] = {"ACE_Track", "ACE_Track", "ACE_Track", "ACE_Track", "ACE_Track"};
                name = ECSTRING(repair,RemoveTrack);
                text = ECSTRING(repair,RemovingTrack);
            };
        };
    };

    // BTR-50PK
    class vn_armor_btr50pk_base: vn_armor_tank_base {
        class EGVAR(interaction,anims) {
            class hide_tracks {
                positions[] = {{1.35, 2.5, -0.5}};
                items[] = {"ACE_Track"};
                name = ECSTRING(repair,RemoveTrack);
                text = ECSTRING(repair,RemovingTrack);
            };
        };
    };
    class vn_armor_btr50pk_01_base: vn_armor_btr50pk_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_tracks: hide_tracks {
                positions[] = {{1.35, 2.5, -0.8}};
            };
        };
    };

    class vn_armor_btr50pk_02_base: vn_armor_btr50pk_01_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_tracks: hide_tracks {
                positions[] = {{1.35, 2.9, -0.8}};
            };
        };
    };

    // T-54
    class vn_armor_t54_base: vn_armor_tank_base {
        class EGVAR(interaction,anims) {
            class hide_tracks {
                positions[] = {{1.4, 2.1, -1.7}};
                items[] = {"ACE_Track"};
                name = ECSTRING(repair,RemoveTrack);
                text = ECSTRING(repair,RemovingTrack);
            };
        };
    };

    // PT-76
    class vn_armor_pt76_base: vn_armor_tank_base {
        class EGVAR(interaction,anims) {
            class hide_tracks {
                // Rotate interactions with turret rotation
                positions[] = {"[0, 0.9, 0] vectorAdd ([[-0.6, -0.9, -0.3], [0, 0, 1], deg (_target animationPhase 'MainTurret')] call CBA_fnc_vectRotate3D)"};
                items[] = {"ACE_Track"};
                name = ECSTRING(repair,RemoveTrack);
                text = ECSTRING(repair,RemovingTrack);
            };
        };
    };

    // Type 63
    class vn_armor_type63_base: vn_armor_tank_base {
        class EGVAR(interaction,anims) {
            class hide_tracks {
                // Rotate interactions with turret rotation
                positions[] = {"[0, 0.7, 0] vectorAdd ([[0.4, -1.1, -0.4], [0, 0, 1], deg (_target animationPhase 'MainTurret')] call CBA_fnc_vectRotate3D)"};
                items[] = {"ACE_Track"};
                name = ECSTRING(repair,RemoveTrack);
                text = ECSTRING(repair,RemovingTrack);
            };
        };
    };
};
