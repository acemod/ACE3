class CfgUIGrids {
    class IGUI {
        class Presets {
            class Arma3 {
                class Variables {
                    GVAR(patientInfo)[] = {
                        {
                            PATIENT_INFO_IGUI_BASE_X,
                            PATIENT_INFO_IGUI_BASE_Y,
                            POS_W(9),
                            POS_H(20)
                        },
                        GUI_GRID_W,
                        GUI_GRID_H
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
