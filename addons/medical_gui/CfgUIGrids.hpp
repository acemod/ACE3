class CfgUIGrids {
    class IGUI {
        class Presets {
            class Arma3 {
                class Variables {
                    GVAR(patientInfo)[] = {
                        {
                            QUOTE(PATIENT_INFO_IGUI_BASE_X),
                            QUOTE(PATIENT_INFO_IGUI_BASE_Y),
                            QUOTE(POS_W(9)),
                            QUOTE(POS_H(20))
                        },
                        QUOTE(GUI_GRID_W),
                        QUOTE(GUI_GRID_H)
                    };
                };
            };
        };

        class Variables {
            class GVAR(patientInfo) {
                displayName = ECSTRING(medical,Category);
                description = CSTRING(IGUI_PatientInfo);
                preview = QPATHTOF(ui\patient_info_preview_ca.paa);
                saveToProfile[] = {0, 1};
                canResize = 0;
            };
        };
    };
};
