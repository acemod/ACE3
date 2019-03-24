class RscInGameUI {
    class RscWeaponRangeArtillery {
        class CA_IGUI_elements_group: RscControlsGroup {};
    };
    class ACE_Mk6_RscWeaponRangeArtillery: RscWeaponRangeArtillery {
        onLoad = QUOTE(uiNamespace setVariable [ARR_2('ACE_Mk6_RscWeaponRangeArtillery', _this select 0)]; [ARR_2('ace_infoDisplayChanged', [ARR_2(_this select 0, 'Mk6Mortar')])]   call CBA_fnc_localEvent;);
        controls[] = {"ACE_ChargeDisplay", "ACE_MILS_GROUP", "CA_IGUI_elements_group","CA_RangeElements_group"};
        class ACE_ChargeDisplay: RscStructuredText {
            idc = 80085;
            colorText[] = {1, 1, 1, 1};
            colorBackground[] = {0, 0, 0, 0.1};
            x = "3.8 * (((safezoneW / safezoneH) min 1.2) / 40) + (profilenamespace getvariable [""IGUI_GRID_WEAPON_X"",((safezoneX + safezoneW) - (10 * (((safezoneW / safezoneH) min 1.2) / 40)) - 4.3 * (((safezoneW / safezoneH) min 1.2) / 40))])";
            y = "2.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (profilenamespace getVariable ['IGUI_GRID_WEAPON_Y', (safezoneY + 0.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))])";
            w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class ACE_MILS_GROUP: CA_IGUI_elements_group {
            idc = 80170;
            class controls {
                class CA_Heading_MILS: RscText {
                    idc = 80156;
                    style = 2;
                    colorText[] = {0.706,0.0745,0.0196,1};
                    sizeEx = "0.028*SafezoneH";
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    text = "015";
                    x = "25.0 * (0.01875 * SafezoneH)";
                    y = "6.3 * (0.025 * SafezoneH)";
                    w = "3.3333 * (0.01875 * SafezoneH)";
                    h = "1 * (0.025 * SafezoneH)";
                };
                class CA_Elev_MILS: RscText {
                    idc = 80175;
                    style = 1;
                    sizeEx = "0.038*SafezoneH";
                    colorText[] = {0.706,0.0745,0.0196,1};
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    text = "80.5";
                    x = "36.8 * (0.01875 * SafezoneH)";
                    y = "29.3 * (0.025 * SafezoneH)";
                    w = "5.2 * (0.01875 * SafezoneH)";
                    h = "1.2 * (0.025 * SafezoneH)";
                };
                class CA_Elev_Need_MILS: CA_Elev_MILS {
                    idc = 80176;
                    y = "30.8 * (0.025 * SafezoneH)";
                };
            };
        };
    };
};
