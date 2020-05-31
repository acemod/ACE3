class CfgUIGrids {
    class IGUI {
        class Presets {
            class Arma3 {
                class Variables {
                    GVAR(patientInfo)[] = {
                        {
                            safeZoneX + POS_W(2),
                            safeZoneY + POS_H(1),
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
                displayName = COMPONENT_NAME;
                description = CSTRING(IGUI_PatientInfo);
                preview = QPATHTOF(ui\patient_info_preview_ca.paa);
                saveToProfile[] = {0, 1, 2, 3};
                canResize = 0;
            };
        };
    };
};
