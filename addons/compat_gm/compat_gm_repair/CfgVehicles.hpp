class CfgVehicles {
    class gm_wheeled_car_base;
    class gm_uaz469_base: gm_wheeled_car_base {
        class EGVAR(interaction,anims) {
            class spare_wheel_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['spare_wheel', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };

    class gm_wheeled_APC_base;
    class gm_brdm2_base: gm_wheeled_APC_base {
        class EGVAR(interaction,anims) {
            class SpareWheel_01_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['sparewheel_01', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
                distance = 2.5;
            };
            class SpareWheel_02_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['sparewheel_02', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };
    class gm_brdm2um_base: gm_brdm2_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class SpareWheel_01_unhide: SpareWheel_01_unhide {
                positions[] = {{0.2, -0.7, -0.25}};
                distance = 2;
            };
            class SpareWheel_02_unhide: SpareWheel_02_unhide {
                positions[] = {{0, -1.6, -0.4}};
            };
        };
    };

    class gm_btr60_base: gm_wheeled_APC_base {
        class EGVAR(interaction,anims) {
            class SpareWheel_01_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['sparewheel_01', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
                distance = 3;
            };
            class SpareWheel_02_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['sparewheel_02', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
            class SpareWheel_03_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['sparewheel_03', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };

    class gm_bmp1_base;
    class gm_bmp1sp2_base: gm_bmp1_base {
        class EGVAR(interaction,anims) {
            class spareTracks_1_1_unhide {
                phase = 0;
                positions[] = {"(_target selectionPosition ['door_1_1', 'FireGeometry', 'AveragePoint']) vectorAdd [0, 0, -0.15]"};
                items[] = {"ACE_Track"};
                name = ECSTRING(repair,RemoveTrack);
                text = ECSTRING(repair,RemovingTrack);
            };
            class spareTracks_1_2_unhide {
                phase = 0;
                positions[] = {"(_target selectionPosition ['door_1_2', 'FireGeometry', 'AveragePoint']) vectorAdd [0, 0, -0.15]"};
                items[] = {"ACE_Track"};
                name = ECSTRING(repair,RemoveTrack);
                text = ECSTRING(repair,RemovingTrack);
            };
            class spareTracks_2_1_unhide {
                phase = 0;
                positions[] = {{-1.1, -2.7, -1.3}, {1.1, -2.7, -1.3}};
                items[] = {"ACE_Track", "ACE_Track"};
                name = ECSTRING(repair,RemoveTrack);
                text = ECSTRING(repair,RemovingTrack);
            };
        };
    };
};
