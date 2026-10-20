class CfgVehicles {
    // Vehicle animation interactions
    class SPE_Car_base;
    class SPE_G503_MB_base: SPE_Car_base {
        class EGVAR(interaction,anims) {
            class hide_spare_wheel_source {
                positions[] = {"_target selectionPosition ['hide_spare_wheel', 'ViewGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };

    class SPE_Truck_base;
    class SPE_CCKW_353_Base: SPE_Truck_base {
        class EGVAR(interaction,anims) {
            class spare_wheel_hide_source {
                positions[] = {{-0.9, 0.35, -0.95}};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };
    class SPE_CCKW_353_Ammo: SPE_CCKW_353_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class spare_wheel_hide_source: spare_wheel_hide_source {
                positions[] = {{-0.9, 0.35, -0.8}};
            };
        };
    };
    class SPE_CCKW_353_Repair: SPE_CCKW_353_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class spare_wheel_hide_source: spare_wheel_hide_source {
                positions[] = {{-0.9, 0.43, -0.75}};
            };
        };
    };
    class SPE_CCKW_353_Fuel: SPE_CCKW_353_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class spare_wheel_hide_source: spare_wheel_hide_source {
                positions[] = {{-0.9, -0.2, -0.7}};
            };
        };
    };

    class SPE_R200_base: SPE_Car_base {
        class EGVAR(interaction,anims) {
            class hide_spare_wheel_source {
                positions[] = {"_target selectionPosition ['hide_sparetire', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };

    class SPE_Tank_base;
    class SPE_M18_Hellcat_Base: SPE_Tank_base {
        class EGVAR(interaction,anims) {
            class hull_armour_hide_source {
                positions[] = {"_target selectionPosition ['spare_track_hull', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_Track", "ACE_Track", "ACE_Track"};
                name = ECSTRING(repair,RemoveTrack);
                text = ECSTRING(repair,RemovingTrack);
            };
        };
    };

    class SPE_PzKpfwV_base: SPE_Tank_base {
        class EGVAR(interaction,anims) {
            class spare_tracks_hide_source {
                selections[] = {"spare_tracks"};
                positions[] = {"private _pos = _target selectionPosition 'spare_tracks'; _pos set [0, -(_pos select 0)]; _pos"}; // Mirror position to other side of vehicle
                items[] = {"ACE_Track", "ACE_Track", "ACE_Track"};
                name = ECSTRING(repair,RemoveTrack);
                text = ECSTRING(repair,RemovingTrack);
            };
        };
    };

    class SPE_PzKpfwVI_H1_base: SPE_Tank_base {
        class EGVAR(interaction,anims) {
            class hull_armour_hide_source {
                positions[] = {{-1.3, 1.7, -0.75}, {1.1, 1.7, -0.75}, {-0.05, 2.35, -1.5}};
                items[] = {"ACE_Track", "ACE_Track", "ACE_Track", "ACE_Track", "ACE_Track"};
                name = ECSTRING(repair,RemoveTrack);
                text = ECSTRING(repair,RemovingTrack);
            };
            class turret_armour_hide_source {
                // Rotate interactions with turret rotation
                positions[] = {
                    "[0, -0.6, 0] vectorAdd ([[1.2, 0, -0.2], [0, 0, 1], deg (_target animationPhase 'MainTurret')] call CBA_fnc_vectRotate3D)",
                    "[0, -0.6, 0] vectorAdd ([[-1.3, -0.3, -0.2], [0, 0, 1], deg (_target animationPhase 'MainTurret')] call CBA_fnc_vectRotate3D)"
                };
                items[] = {"ACE_Track", "ACE_Track"};
                name = ECSTRING(repair,RemoveTrack);
                text = ECSTRING(repair,RemovingTrack);
            };
        };
    };

    class SPE_Jagdpanther_G1_base: SPE_Tank_base {
        class EGVAR(interaction,anims) {
            class hide_spare_tracks_left_source {
                positions[] = {"private _pos = _target selectionPosition ['hide_spare_tracks_right', 'FireGeometry', 'AveragePoint']; _pos set [0, -(_pos select 0)]; _pos vectorAdd [0, 0.335, 0]"};
                items[] = {"ACE_Track"};
                name = ECSTRING(repair,RemoveTrack);
                text = ECSTRING(repair,RemovingTrack);
            };
            class hide_spare_tracks_right_source {
                positions[] = {"_target selectionPosition ['hide_spare_tracks_right', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_Track", "ACE_Track"};
                name = ECSTRING(repair,RemoveTrack);
                text = ECSTRING(repair,RemovingTrack);
            };
        };
    };
};
