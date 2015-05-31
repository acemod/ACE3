class ACE_BFT {
    class Devices {
        // Infantry
        class DK10_b {
            deviceSide = "NATO";
            refreshRate = 5;
            reportingModes[] = {"FBCB2"};
            defaultInformation[] = {"Inf", 0, "", 0};

            GVAR(dialogName) = QGVAR(DK10_dlg);
        };
        class DK10_o: DK10_b {
            deviceSide = "EAST";
        };
        class DK10_i: DK10_b {
            deviceSide = "IND";
        };

        class GD300_b: DK10_b {
            GVAR(displayName) = QGVAR(GD300_dsp);
            GVAR(dialogName) = QGVAR(GD300_dlg);
        };
        class GD300_o: GD300_b {
            deviceSide = "EAST";
        };
        class GD300_i: GD300_b {
            deviceSide = "IND";
        };

        // Motorized
        class JV5_Mot_b: DK10_b {
            defaultInformation[] = {"Motorized", 0, "", 0};

            GVAR(dialogName) = QGVAR(JV5_dlg);
        };
        class JV5_Mot_o: JV5_Mot_b {
            deviceSide = "EAST";
        };
        class JV5_Mot_i: JV5_Mot_b {
            deviceSide = "IND";
        };

        // Armor
        class JV5_Armor_b: JV5_Mot_b {
            defaultInformation[] = {"Motorized", 0, "", 0};
        };
        class JV5_Armor_o: JV5_Armor_b {
            deviceSide = "EAST";
        };
        class JV5_Armor_i: JV5_Armor_b {
            deviceSide = "IND";
        };

        // Helicopter
        class TAD_Heli_b {
            deviceSide = "NATO";
            reportingModes[] = {"MFD"};
            refreshRate = 0;
            defaultInformation[] = {"Helicopter", 0, "", 0};

            GVAR(displayName) = QGVAR(TAD_dsp);
            GVAR(dialogName) = QGVAR(TAD_dlg);
        };
        class TAD_Heli_o: TAD_Heli_b {
            deviceSide = "EAST";
        };
        class TAD_Heli_i: TAD_Heli_b {
            deviceSide = "IND";
        };

        // Plane
        class TAD_Plane_b: TAD_Heli_b {
            defaultInformation[] = {"Plane", 0, "", 0};
        };
        class TAD_Plane_o: TAD_Plane_b {
            deviceSide = "EAST";
        };
        class TAD_Plane_i: TAD_Plane_b {
            deviceSide = "IND";
        };
    };
};