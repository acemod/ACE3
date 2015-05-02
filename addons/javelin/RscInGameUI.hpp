class RscOpticsValue;
class RscControlsGroup;
class RscPicture;
class RscMapControl;
class VScrollbar;
class HScrollbar;
class RscLine;


// Taken from AGM for optics management.

class RscInGameUI {
    class ACE_RscOptics_javelin {
        idd = 300;
        controls[] = { "ACE_javelin_elements_group", "ACE_Targeting" }; //, "ACE_TargetingConstrains", "ACE_TargetingGate", "ACE_TargetingLines"};
        onLoad = QUOTE(_this call FUNC(onOpticLoad));
        onUnload = QUOTE(_this call FUNC(onOpticUnload));
        
        class ACE_javelin_elements_group: RscControlsGroup
        {
            x = "SafezoneX";
            y = "SafezoneY";
            w = "SafezoneW";
            h = "SafezoneH";
            idc = 170;
            class VScrollbar {
                autoScrollSpeed = -1;
                autoScrollDelay = 5;
                autoScrollRewind = 0;
                color[] = {1,1,1,0};
                width = 0.001;
            };
            class HScrollbar {
                color[] = {1,1,1,0};
                height = 0.001;
            };
            class Controls {
                class CA_Distance: RscOpticsValue {
                    idc = 151;
                    sizeEx = "0";
                    colorText[] = {0,0,0,0};
                    x = 0;
                    y = 0;
                    w = 0;
                    h = 0;
                };
        
                class ACE_javelin_Day_mode_off: RscPicture {
                    idc = 1001;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (0.03/4)*3*SafezoneH    - SafezoneX";
                    y = "SafezoneY+SafezoneH*0.031 - SafezoneY";
                    w = "0.1045752* (((SafezoneW*3)/4)/SafezoneW)/(1/SafezoneH)";
                    h = "SafezoneH*0.1045752";
                    colorText[] = {0.2941,0.2941,0.2941,1};
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\day_co.paa";
                };
                class ACE_javelin_Day_mode: ACE_javelin_Day_mode_off {
                    idc = 160;
                    colorText[] = {0.2941,0.8745,0.2157,1};
                };
                class CA_Javelin_WFOV_mode_off : ACE_javelin_Day_mode_off {
                    idc = 1004;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (0.307/4)*3*SafezoneH - SafezoneX";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\wfov_co.paa";
                };
                class ACE_javelin_WFOV_mode_group: RscControlsGroup {
                    x = "SafezoneX";
                    y = "SafezoneY";
                    w = "SafezoneW";
                    h = "SafezoneH";
                    idc = 163;
                    class VScrollbar {
                        autoScrollSpeed = -1;
                        autoScrollDelay = 5;
                        autoScrollRewind = 0;
                        color[] = {1,1,1,0};
                        width = 0.001;
                    };
                    class HScrollbar {
                        color[] = {1,1,1,0};
                        height = 0.001;
                    };
                    class Controls {
                        class StadiaL: RscLine {
                            x = "0.4899*SafezoneW - SafezoneX";
                            y = "0.171*SafezoneH - SafezoneY";
                            w = 0;
                            h = "0.049*SafezoneH";
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        class StadiaR: RscLine {
                            x = "0.5109*SafezoneW- SafezoneX";
                            y = "0.171*SafezoneH - SafezoneY";
                            w = 0;
                            h = "0.049*SafezoneH";
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        class BracketL: RscLine {
                            x = "((SafezoneW -SafezoneH*3/4)/2)+ (0.293/4)*3*SafezoneH - SafezoneX";
                            y = "0.4677*SafezoneH - SafezoneY";
                            w = 0;
                            h = "0.0646*SafezoneH";
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        class BracketR: RscLine {
                            x = "((SafezoneW -SafezoneH*3/4)/2)+ (0.70/4)*3*SafezoneH - SafezoneX";
                            y = "0.4677*SafezoneH - SafezoneY";
                            w = 0;
                            h = "0.0646*SafezoneH";
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        class BracketT: RscLine {
                            x = "((SafezoneW -SafezoneH*3/4)/2)+ (0.467/4)*3*SafezoneH - SafezoneX";
                            y = "0.3535*SafezoneH - SafezoneY";
                            w = "0.065* (((SafezoneW*3)/4)/SafezoneW)/(1/SafezoneH)";
                            h = 0;
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        class BracketB: RscLine {
                            x = "((SafezoneW -SafezoneH*3/4)/2)+ (0.467/4)*3*SafezoneH - SafezoneX";
                            y = "0.6465*SafezoneH - SafezoneY";
                            w = "0.065* (((SafezoneW*3)/4)/SafezoneW)/(1/SafezoneH)";
                            h = 0;
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        
                    };
                };
                class CA_Javelin_NFOV_mode_off: ACE_javelin_Day_mode_off {
                    idc = 1003;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (0.586/4)*3*SafezoneH - SafezoneX";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\nfov_co.paa";
                };
                class ACE_javelin_NFOV_mode_group: RscControlsGroup {
                    x = "SafezoneX";
                    y = "SafezoneY";
                    w = "SafezoneW-SafezoneX";
                    h = "SafezoneH-SafezoneY";
                    idc = 162;
                    class VScrollbar {
                        autoScrollSpeed = -1;
                        autoScrollDelay = 5;
                        autoScrollRewind = 0;
                        color[] = {1,1,1,0};
                        width = 0.001;
                    };
                    class HScrollbar {
                        color[] = {1,1,1,0};
                        height = 0.001;
                    };
                    class Controls {
                        class StadiaL: RscLine {
                            x = "0.4788*SafezoneW - SafezoneX";
                            y = "0.171*SafezoneH - SafezoneY";
                            w = 0;
                            h = "0.049*SafezoneH";
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        class StadiaR: RscLine {
                            x = "0.5212*SafezoneW - SafezoneX";
                            y = "0.171*SafezoneH - SafezoneY";
                            w = 0;
                            h = "0.049*SafezoneH";
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        class LineHL: RscLine {
                            x = "((SafezoneW -SafezoneH*3/4)/2)+ (0.01/4)*3*SafezoneH - SafezoneX";
                            y = "SafezoneH*0.5 - SafezoneY";
                            w = "0.29* (((SafezoneW*3)/4)/SafezoneW)/(1/SafezoneH)";
                            h = "SafezoneH*0.0";
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        class LineHR: RscLine {
                            x = "((SafezoneW -SafezoneH*3/4)/2)+ (0.695/4)*3*SafezoneH - SafezoneX";
                            y = "SafezoneH*0.5 - SafezoneY";
                            w = "0.29* (((SafezoneW*3)/4)/SafezoneW)/(1/SafezoneH)";
                            h = "SafezoneH*0.0";
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        class LineVT: RscLine {
                            x = "0.5*SafezoneW - SafezoneX";
                            y = "0.171*SafezoneH - SafezoneY";
                            w = 0;
                            h = "0.1825*SafezoneH";
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        class LineVB: RscLine {
                            x = "0.5*SafezoneW - SafezoneX";
                            y = "0.6465*SafezoneH - SafezoneY";
                            w = 0;
                            h = "0.1895*SafezoneH";
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        
                    };
                };

                class ACE_javelin_SEEK_off: ACE_javelin_Day_mode_off {
                    idc = 699000;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (0.863/4)*3*SafezoneH - SafezoneX";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\seek_co.paa";
                };
                class ACE_javelin_SEEK: ACE_javelin_SEEK_off {
                    idc = 166;
                    colorText[] = {0.2941,0.8745,0.2157,0};
                };
                class ACE_javelin_Missle_off: ACE_javelin_Day_mode_off {
                    idc = 1032;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (-0.134/4)*3*SafezoneH - SafezoneX";
                    y = "(SafezoneY + 0.208*SafezoneH) - SafezoneY";
                    colorText[] = {0.2941,0.2941,0.2941,1};
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\missle_co.paa";
                };
                class ACE_javelin_Missle: ACE_javelin_Missle_off {
                    idc = 167;
                    colorText[] = {0.9255,0.5216,0.1216,0};
                };
                class ACE_javelin_CLU_off: ACE_javelin_Missle_off {
                    idc = 1027;
                    y = "(SafezoneY + 0.436*SafezoneH) - SafezoneY";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\clu_co.paa";
                };
                class ACE_javelin_HangFire_off: ACE_javelin_Missle_off {
                    idc = 1028;
                    y = "(SafezoneY + 0.669*SafezoneH) - SafezoneY";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\hangfire_co.paa";
                };
                class ACE_javelin_TOP_off: ACE_javelin_Day_mode_off {
                    idc = 699001;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (1.023/4)*3*SafezoneH - SafezoneX";
                    y = "(SafezoneY + 0.208*SafezoneH) - SafezoneY";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\top_co.paa";
                    colorText[] = {0.2941,0.8745,0.2157,1};
                };
                class ACE_javelin_DIR: ACE_javelin_Day_mode {
                    idc = 699002;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (1.023/4)*3*SafezoneH - SafezoneX";
                    y = "(SafezoneY + 0.436*SafezoneH)    - SafezoneY";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\dir_co.paa";
                    colorText[] = {0.2941,0.2941,0.2941,1};
                };
                class ACE_javelin_FLTR_mode_off: ACE_javelin_Day_mode_off {
                    idc = 1002;
                    x = "(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (1.023/4)*3*SafezoneH - SafezoneX";
                    y = "(SafezoneY + 0.669*SafezoneH)    - SafezoneY";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\fltr_co.paa";
                };
                class ACE_javelin_FLTR_mode: ACE_javelin_FLTR_mode_off {
                    idc = 161;
                    colorText[] = {0.2941,0.8745,0.2157,1};
                };
            };
        };
        class ACE_Targeting : RscControlsGroup {
            idc = 6999;
            
            x = "SafezoneX";
            y = "SafezoneY";
            w = "SafezoneW";
            h = "SafezoneH";
            
            enabled = 0;
            class Controls {
                class ACE_TargetingConstrains: RscControlsGroup {
                    x = "SafezoneX";
                    y = "SafezoneY";
                    w = "SafezoneW-SafezoneX";
                    h = "SafezoneH-SafezoneY";
                    
                    enabled = 0;
                    class VScrollbar {
                        autoScrollSpeed = -1;
                        autoScrollDelay = 5;
                        autoScrollRewind = 0;
                        color[] = {1,1,1,0};
                        width = 0.001;
                    };
                    class HScrollbar {
                        color[] = {1,1,1,0};
                        height = 0.001;
                    };
                    class Controls {
                        class Top: RscPicture {
                            idc = 699101;
                            text = "#(argb,8,8,3)color(1,1,1,1)";
                            colorText[] = {0.2941,0.2941,0.2941,1};
                            x = "((SafezoneW -(3/4)*SafezoneH)/2) - SafezoneX";
                            y = "0.15*SafezoneH-SafezoneY";
                            w = "(3/4)*SafezoneH";
                            h = "0.21*SafezoneH";
                        };
                        class Bottom: Top {
                            idc = 699102;
                            y = "0.64*SafezoneH-SafezoneY";
                        };
                        class Left: Top {
                            idc = 699103;
                            x = "((SafezoneW -(3/4)*SafezoneH)/2) - SafezoneX";
                            y = "0.36*SafezoneH-SafezoneY";
                            w = "0.31*(3/4)*SafezoneH";
                            h = "0.28*SafezoneH";
                        };
                        class Right: Left {
                            idc = 699104;
                            x = "((SafezoneW -(3/4)*SafezoneH)/2)+ 0.69*(3/4)*SafezoneH - SafezoneX";
                        };
                        class OpticsBorders: RscPicture {
                            idc = 699105;
                            text = PATHTOF(data\javelin_ui_border_ca.paa);
                            colorText[] = {0,0,0,1};
                            x = "((SafezoneW -(3.1/4)*SafezoneH)/2) - SafezoneX";
                            y = "0.15*SafezoneH-SafezoneY";
                            w = "(3.1/4)*SafezoneH";
                            h = "0.7*SafezoneH";
                        };
                    };
                };
                
                class ACE_TargetingGate : ACE_TargetingConstrains {
                    idc = 699200;
                    class Controls {
                        class TargetingGateTL: ACE_TargetingConstrains {
                            x = "((SafezoneW -(3/4)*SafezoneH)/2) - SafezoneX";
                            y = "0.15*SafezoneH - SafezoneY";
                            idc = 699201;
                            class Controls {
                                class LineH: RscLine {
                                    idc = 699210;
                                    x = "0";
                                    y = "0";
                                    w = "0.025*(3/4)*SafezoneH";
                                    h = "0";
                                    colorText[] = {0.8745,0.8745,0.8745,1};
                                };
                                class LineV: LineH {
                                    idc = 699211;
                                    w = "0";
                                    h = "0.025*SafezoneH";
                                };
                            };
                        };
                        class TargetingGateTR: TargetingGateTL {
                            x = "((SafezoneW -(3/4)*SafezoneH)/2) - SafezoneX + 0.975*(3/4)*SafezoneH";
                            y = "0.15*SafezoneH - SafezoneY";
                            idc = 699202;
                            class Controls {
                                class LineH: RscLine {
                                    idc = 699220;
                                    x = "0";
                                    y = "0";
                                    w = "0.025*(3/4)*SafezoneH";
                                    h = "0";
                                    colorText[] = {0.8745,0.8745,0.8745,1};
                                };
                                class LineV: LineH {
                                    idc = 699221;
                                    x = "0.025*(3/4)*SafezoneH";
                                    w = "0";
                                    h = "0.025*SafezoneH";
                                };
                            };
                        };
                        class TargetingGateBL: TargetingGateTL {
                            x = "((SafezoneW -(3/4)*SafezoneH)/2) - SafezoneX";
                            y = "0.825*SafezoneH - SafezoneY";
                            idc = 699203;
                            class Controls {
                                class LineH: RscLine {
                                    x = "0";
                                    y = "0.025*SafezoneH";
                                    w = "0.025*(3/4)*SafezoneH";
                                    h = "0";
                                    colorText[] = {0.8745,0.8745,0.8745,1};
                                };
                                class LineV: LineH {
                                    y = "0";
                                    w = "0";
                                    h = "0.025*SafezoneH";
                                };
                            };
                        };
                        class TargetingGateBR: TargetingGateBL {
                            x = "((SafezoneW -(3/4)*SafezoneH)/2) - SafezoneX + 0.975*(3/4)*SafezoneH";
                            y = "0.825*SafezoneH - SafezoneY";
                            idc = 699204;
                            class Controls {
                                class LineH: RscLine {
                                    x = "0";
                                    y = "0.025*SafezoneH";
                                    w = "0.025*(3/4)*SafezoneH";
                                    h = "0";
                                    colorText[] = {0.8745,0.8745,0.8745,1};
                                };
                                class LineV: LineH {
                                    x = "0.025*(3/4)*SafezoneH";
                                    y = "0";
                                    w = "0";
                                    h = "0.025*SafezoneH";
                                };
                            };
                        };
                    };
                };
            
            
                class ACE_TargetingLines: ACE_TargetingConstrains {
                    idc = 699300;
                    class Controls {
                        class LineH: RscLine {
                            idc = 699301;
                            x = "((SafezoneW -(3/4)*SafezoneH)/2) - SafezoneX";
                            y = "0.5*SafezoneH - SafezoneY";
                            w = "(3/4)*SafezoneH";
                            h = "0";
                            colorText[] = {0.8745,0.8745,0.8745,1};
                        };
                        class LineV: RscLine {
                            idc = 699302;
                            x = "0.5*SafezoneW - SafezoneX";
                            y = "0.15*SafezoneH - SafezoneY";
                            w = "0";
                            h = "0.7*SafezoneH";
                            colorText[] = {0.8745,0.8745,0.8745,1};
                        };
                    };
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