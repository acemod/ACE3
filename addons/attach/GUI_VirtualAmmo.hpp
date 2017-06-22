class RscTitles {
    class GVAR(virtualAmmo) {
        idd = -1;
        movingEnable = 1;
        duration = 9999999;
        fadein = 0;
        fadeout = 0;
        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(virtualAmmoDisplay), _this select 0)]);
        class controls {};
        class objects {
            class TheObject {
                idc = 800851;
                type = 82;
                model = "\a3\weapons_f\Ammo\Handgrenade.p3d";
                scale = 1;
                direction[] = {0, 0, 1};
                up[] = {0, 1, 0};
                x = 0.5;
                y = 0.5;
                z = 1;
                xBack = 0.5;
                yBack = 0.5;
                zBack = 0.5;
                inBack = 0;
                enableZoom = 0;
                zoomDuration = 1;
            };
        };
    };
};
