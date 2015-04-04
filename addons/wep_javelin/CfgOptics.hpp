class RscControlsGroup;
class RscPicture;
class RscMapControl;

// Taken from AGM for optics management.

class RscInGameUI {
    class RscOptics_titan {
        idd = 300;
        controls[] = {"CA_javelin_elements_group"};
        class CA_javelin_elements_group: RscControlsGroup
        {
            x = "SafezoneX";
            y = "SafezoneY";
            w = "SafezoneW";
            h = "SafezoneH";
            idc = 170;
            class VScrollbar: VScrollbar
            {
                autoScrollSpeed = -1;
                autoScrollDelay = 5;
                autoScrollRewind = 0;
                color[] = {1,1,1,0};
                width = 0.001;
            };
            class HScrollbar: HScrollbar
            {
                color[] = {1,1,1,0};
                height = 0.001;
            };
            class Controls
            {
                class GetLockedTarget: RscMapControl {
                    onDraw = QUOTE(_this call FUNC(onGetLockedTarget));
                    idc = -1;
                    w = 0;
                    h = 0;
                };
                
                class CA_Javelin_Day_mode_off: RscPicture {
                    idc = 1001;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (0.03/4)*3*SafezoneH    - SafezoneX";
                    y = "SafezoneY+SafezoneH*0.031 - SafezoneY";
                    w = "0.1045752* (((SafezoneW*3)/4)/SafezoneW)/(1/SafezoneH)";
                    h = "SafezoneH*0.1045752";
                    colorText[] = {0.2941,0.2941,0.2941,1.0};
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\day_co.paa";
                };
                
                class CA_Javelin_Day_mode: CA_Javelin_Day_mode_off {
                    idc = 160;
                    colorText[] = {0.2941,0.8745,0.2157,1.0};
                };
                class CA_Javelin_WFOV_mode_off: CA_Javelin_Day_mode_off {
                    idc = 1004;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (0.307/4)*3*SafezoneH - SafezoneX";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\wfov_co.paa";
                };
                
                class CA_Javelin_WFOV_mode_group: RscControlsGroup {
                    x = "SafezoneX";
                    y = "SafezoneY";
                    w = "SafezoneW";
                    h = "SafezoneH";
                    idc = 163;
                    class VScrollbar: VScrollbar {
                        autoScrollSpeed = -1;
                        autoScrollDelay = 5;
                        autoScrollRewind = 0;
                        color[] = {1,1,1,0};
                        width = 0.001;
                    };
                    class HScrollbar: HScrollbar {
                        color[] = {1,1,1,0};
                        height = 0.001;
                    };
                    class Controls {
                        class CA_Javelin_WFOV_mode: CA_Javelin_WFOV_mode_off {
                            idc = -1;
                            y = "0.031*SafeZoneH - SafezoneY";
                            x = "((SafezoneW -SafezoneH*3/4)/2)+ (0.307/4)*3*SafezoneH - SafezoneX";
                            colorText[] = {0.2941,0.8745,0.2157,1.0};
                        };
                    };
                };
                class CA_Javelin_NFOV_mode_off: CA_Javelin_Day_mode_off {
                    idc = 1003;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (0.586/4)*3*SafezoneH - SafezoneX";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\nfov_co.paa";
                };
                class CA_Javelin_NFOV_mode_group: RscControlsGroup {
                    x = "SafezoneX";
                    y = "SafezoneY";
                    w = "SafezoneW-SafezoneX";
                    h = "SafezoneH-SafezoneY";
                    idc = 162;
                    class VScrollbar: VScrollbar
                    {
                        autoScrollSpeed = -1;
                        autoScrollDelay = 5;
                        autoScrollRewind = 0;
                        color[] = {1,1,1,0};
                        width = 0.001;
                    };
                    class HScrollbar: HScrollbar {
                        color[] = {1,1,1,0};
                        height = 0.001;
                    };
                    class Controls {
                        class CA_Javelin_NFOV_mode: CA_Javelin_NFOV_mode_off {
                            idc = -1;
                            x = "((SafezoneW -SafezoneH*3/4)/2)+ (0.586/4)*3*SafezoneH - SafezoneX";
                            y = "0.031*SafeZoneH - SafezoneY";
                            colorText[] = {0.2941,0.8745,0.2157,1.0};
                        };
                    };
                };
                class CA_Javelin_SEEK_off: CA_Javelin_Day_mode_off {
                    idc = 1005;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (0.863/4)*3*SafezoneH - SafezoneX";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\seek_co.paa";
                };
                class CA_Javelin_SEEK: CA_Javelin_SEEK_off {
                    idc = 166;
                    colorText[] = {0.2941,0.8745,0.2157,1.0};
                };
                class CA_Javelin_Missle_off: CA_Javelin_Day_mode_off {
                    idc = 1032;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (-0.134/4)*3*SafezoneH - SafezoneX";
                    y = "(SafezoneY + 0.208*SafezoneH) - SafezoneY";
                    colorText[] = {0.2941,0.2941,0.2941,1.0};
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\missle_co.paa";
                };
                class CA_Javelin_Missle: CA_Javelin_Missle_off {
                    idc = 167;
                    colorText[] = {0.9255,0.5216,0.1216,1.0};
                };
                class CA_Javelin_CLU_off: CA_Javelin_Missle_off {
                    idc = 1027;
                    y = "(SafezoneY + 0.436*SafezoneH) - SafezoneY";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\clu_co.paa";
                };
                class CA_Javelin_HangFire_off: CA_Javelin_Missle_off {
                    idc = 1028;
                    y = "(SafezoneY + 0.669*SafezoneH) - SafezoneY";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\hangfire_co.paa";
                };
                class CA_Javelin_TOP_off: CA_Javelin_Day_mode_off {
                    idc = 1006;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (1.023/4)*3*SafezoneH - SafezoneX";
                    y = "(SafezoneY + 0.208*SafezoneH) - SafezoneY";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\top_co.paa";
                };
                class CA_Javelin_DIR: CA_Javelin_Day_mode {
                    idc = 1007;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (1.023/4)*3*SafezoneH - SafezoneX";
                    y = "(SafezoneY + 0.436*SafezoneH)    - SafezoneY";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\dir_co.paa";
                };
                class CA_Javelin_FLTR_mode_off: CA_Javelin_Day_mode_off {
                    idc = 1002;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (1.023/4)*3*SafezoneH - SafezoneX";
                    y = "(SafezoneY + 0.669*SafezoneH)    - SafezoneY";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\fltr_co.paa";
                };
                class CA_Javelin_FLTR_mode: CA_Javelin_FLTR_mode_off {
                    idc = 161;
                    colorText[] = {0.2941,0.8745,0.2157,1.0};
                };
            };
        };
    };
};

// on        colorText[] = {0.2941, 0.8745, 0.2157, 1.0};
// off        colorText[] = {0.2941, 0.2941, 0.2941, 1.0};
// orange    colorText[] = {0.9255, 0.5216, 0.1216, 1.0};

/*
CA_javelin_elements_group:     170
CA_Javelin_Day_mode_off:     1001
CA_Javelin_Day_mode:         160
CA_Javelin_WFOV_mode_off:     1004
CA_Javelin_WFOV_mode_group: 163
CA_Javelin_NFOV_mode_off:     1003
CA_Javelin_NFOV_mode_group: 162
CA_Javelin_SEEK_off:         1005 //1001
CA_Javelin_SEEK:             166
CA_Javelin_Missle_off:         1032
CA_Javelin_Missle:             167
CA_Javelin_CLU_off:         1027
CA_Javelin_HangFire_off:     1028
CA_Javelin_TOP_off:         1006
CA_Javelin_DIR:             1007
CA_Javelin_FLTR_mode_off:     1002
CA_Javelin_FLTR_mode:         161
*/