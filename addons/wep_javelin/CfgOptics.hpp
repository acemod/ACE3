class RscControlsGroup;
class RscPicture;
class RscMapControl;
class VScrollbar;
class HScrollbar;


// Taken from AGM for optics management.

class RscInGameUI {
    class RscOptics_titan {
        idd = 300;
        controls[] = {"ACE_Titan_elements_group"};
        class ACE_Titan_elements_group: RscControlsGroup
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
                
                class ACE_Titan_Day_mode_off: RscPicture {
                    idc = 1001;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (0.03/4)*3*SafezoneH    - SafezoneX";
                    y = "SafezoneY+SafezoneH*0.031 - SafezoneY";
                    w = "0.1045752* (((SafezoneW*3)/4)/SafezoneW)/(1/SafezoneH)";
                    h = "SafezoneH*0.1045752";
                    colorText[] = {0.2941,0.2941,0.2941,1.0};
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\day_co.paa";
                };
                
                class ACE_Titan_Day_mode: ACE_Titan_Day_mode_off {
                    idc = 160;
                    colorText[] = {0.2941,0.8745,0.2157,1.0};
                };
                class ACE_Titan_WFOV_mode_off: ACE_Titan_Day_mode_off {
                    idc = 1004;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (0.307/4)*3*SafezoneH - SafezoneX";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\wfov_co.paa";
                };
                
                class ACE_Titan_WFOV_mode_group: RscControlsGroup {
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
                        class ACE_Titan_WFOV_mode: ACE_Titan_WFOV_mode_off {
                            idc = -1;
                            y = "0.031*SafeZoneH - SafezoneY";
                            x = "((SafezoneW -SafezoneH*3/4)/2)+ (0.307/4)*3*SafezoneH - SafezoneX";
                            colorText[] = {0.2941,0.8745,0.2157,1.0};
                        };
                    };
                };
                class ACE_Titan_NFOV_mode_off: ACE_Titan_Day_mode_off {
                    idc = 1003;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (0.586/4)*3*SafezoneH - SafezoneX";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\nfov_co.paa";
                };
                class ACE_Titan_NFOV_mode_group: RscControlsGroup {
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
                        class ACE_Titan_NFOV_mode: ACE_Titan_NFOV_mode_off {
                            idc = -1;
                            x = "((SafezoneW -SafezoneH*3/4)/2)+ (0.586/4)*3*SafezoneH - SafezoneX";
                            y = "0.031*SafeZoneH - SafezoneY";
                            colorText[] = {0.2941,0.8745,0.2157,1.0};
                        };
                    };
                };
                class ACE_Titan_SEEK_off: ACE_Titan_Day_mode_off {
                    idc = 1005;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (0.863/4)*3*SafezoneH - SafezoneX";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\seek_co.paa";
                };
                class ACE_Titan_SEEK: ACE_Titan_SEEK_off {
                    idc = 166;
                    colorText[] = {0.2941,0.8745,0.2157,1.0};
                };
                class ACE_Titan_Missle_off: ACE_Titan_Day_mode_off {
                    idc = 1032;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (-0.134/4)*3*SafezoneH - SafezoneX";
                    y = "(SafezoneY + 0.208*SafezoneH) - SafezoneY";
                    colorText[] = {0.2941,0.2941,0.2941,1.0};
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\missle_co.paa";
                };
                class ACE_Titan_Missle: ACE_Titan_Missle_off {
                    idc = 167;
                    colorText[] = {0.9255,0.5216,0.1216,1.0};
                };
                class ACE_Titan_CLU_off: ACE_Titan_Missle_off {
                    idc = 1027;
                    y = "(SafezoneY + 0.436*SafezoneH) - SafezoneY";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\clu_co.paa";
                };
                class ACE_Titan_HangFire_off: ACE_Titan_Missle_off {
                    idc = 1028;
                    y = "(SafezoneY + 0.669*SafezoneH) - SafezoneY";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\hangfire_co.paa";
                };
                class ACE_Titan_TOP_off: ACE_Titan_Day_mode_off {
                    idc = 1006;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (1.023/4)*3*SafezoneH - SafezoneX";
                    y = "(SafezoneY + 0.208*SafezoneH) - SafezoneY";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\top_co.paa";
                };
                class ACE_Titan_DIR: ACE_Titan_Day_mode {
                    idc = 1007;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (1.023/4)*3*SafezoneH - SafezoneX";
                    y = "(SafezoneY + 0.436*SafezoneH)    - SafezoneY";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\dir_co.paa";
                };
                class ACE_Titan_FLTR_mode_off: ACE_Titan_Day_mode_off {
                    idc = 1002;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (1.023/4)*3*SafezoneH - SafezoneX";
                    y = "(SafezoneY + 0.669*SafezoneH)    - SafezoneY";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\fltr_co.paa";
                };
                class ACE_Titan_FLTR_mode: ACE_Titan_FLTR_mode_off {
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
ACE_Titan_elements_group:     170
ACE_Titan_Day_mode_off:     1001
ACE_Titan_Day_mode:         160
ACE_Titan_WFOV_mode_off:     1004
ACE_Titan_WFOV_mode_group: 163
ACE_Titan_NFOV_mode_off:     1003
ACE_Titan_NFOV_mode_group: 162
ACE_Titan_SEEK_off:         1005 //1001
ACE_Titan_SEEK:             166
ACE_Titan_Missle_off:         1032
ACE_Titan_Missle:             167
ACE_Titan_CLU_off:         1027
ACE_Titan_HangFire_off:     1028
ACE_Titan_TOP_off:         1006
ACE_Titan_DIR:             1007
ACE_Titan_FLTR_mode_off:     1002
ACE_Titan_FLTR_mode:         161
*/