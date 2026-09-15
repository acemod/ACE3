class RscObject;
class RscControlsGroupNoScrollbars;

class RscText;
class GVAR(text): RscText {
    font = "EtelkaMonospacePro";
    SizeEx = 0.04;
    colorText[]={1,0.1,0.05,0.95};
    shadow = 0;
};
class GVAR(textMenu): GVAR(text) {
    SizeEx = 0.09;
    style = 2+16;
};

class RscInGameUI {
    class CBA_ScriptedOptic_zooming;
    class GVAR(info): CBA_ScriptedOptic_zooming {
        onLoad = QUOTE(call FUNC(weaponInfo_onLoad));
        class objects {
            class Optic: RscObject { // first focal plane
                idc = IDC_SCOPE_OBJECT;
                type = 82;
                model = "\A3\Misc_F\Helpers\UserTexture1m.p3d";
                x = 0;
                y = 0;
                z = 0;
                xBack = 0.9;
                yBack = 0.9;
                zBack = 0.3;
                inBack = 0;
                enableZoom = 1;
                zoomDuration = 0.001;
                class Areas {
                    class usertexture {
                        selection = "usertexture";
                        class controls {
                            class test: RscControlsGroupNoScrollbars {
                                idc = IDC_SCOPE_GROUP;
                                x = 0;
                                y = 0;
                                w = 1;
                                h = 4/3;
                            };
                        };
                    };
                };
            };
            class Screen: RscObject {
                idc = IDC_SCREEN_OBJECT;
                type = 82;
                model = "\A3\Misc_F\Helpers\UserTexture1m.p3d";
                x = 0;
                y = 0;
                z = 0;
                xBack = 0.9;
                yBack = 0.9;
                zBack = 0.3;
                inBack = 1;
                enableZoom = 1;
                zoomDuration = 0.001;
                class Areas {
                    class usertexture {
                        selection = "usertexture";
                        class controls {
                            class test: RscControlsGroupNoScrollbars {
                                idc = IDC_SCREEN_GROUP;
                                x = 0;
                                y = 0;
                                w = 1;
                                h = 4/3;
                            };
                        };
                    };
                };
            };
        };
    };
};
