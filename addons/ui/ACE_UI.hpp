class ACE_UI {
    class devWatermark {
        idd = IDD_MISSION;
        elements[] = {11400};
        location = ANYWHERE;
        class conditions {
            isDevelopmentBranch = QUOTE(productVersion select 4 == 'Development');
        };
    };
    class weaponName {
        idd = IDD_UNITINFO;
        elements[] = {IDC_IGUI_WEAPON};
        location = GROUND_ONLY;
        class conditions {};
    };
    class weaponNameBackground {
        idd = IDD_UNITINFO;
        elements[] = {1001, 1008};
        location = GROUND_ONLY;
        class conditions {};
    };
    class firingMode {
        idd = IDD_UNITINFO;
        elements[] = {IDC_IGUI_WEAPON_MODE_TEXTURE, 1203};
        location = GROUND_ONLY;
        class conditions {};
    };
    class ammoType {
        idd = IDD_UNITINFO;
        elements[] = {IDC_IGUI_WEAPON_AMMO};
        location = GROUND_ONLY;
        class conditions {};
    };
    class ammoCount {
        idd = IDD_UNITINFO;
        elements[] = {IDC_IGUI_AMMOCOUNT};
        location = GROUND_ONLY;
        class conditions {};
    };
    class magCount {
        idd = IDD_UNITINFO;
        elements[] = {IDC_IGUI_MAGCOUNT};
        location = GROUND_ONLY;
        class conditions {};
    };
    class throwableName {
        idd = IDD_UNITINFO;
        elements[] = {152};
        location = GROUND_ONLY;
        class conditions {};
    };
    class throwableCount {
        idd = IDD_UNITINFO;
        elements[] = {151};
        location = GROUND_ONLY;
        class conditions {};
    };
    class zeroing {
        idd = IDD_UNITINFO;
        elements[] = {IDC_IGUI_WEAPON_ELEVATION};
        location = GROUND_ONLY;
        class conditions {};
    };
    class weaponLowerInfoBackground {
        idd = IDD_UNITINFO;
        elements[] = {1202};
        location = GROUND_ONLY;
        class conditions {};
    };
    class staminaBar {
        idd = IDD_STAMINA_BAR;
        elements[] = {IDC_IGUI_STAMINA_BAR};
        location = GROUND_ONLY;
        class conditions {};
    };
    class stance {
        idd = IDD_STANCEINFO;
        elements[] = {IDC_IGUI_STANCE_INDICATOR, 1201};
        location = GROUND_ONLY;
        class conditions {};
    };
    class gunnerWeaponName {
        idd = IDD_UNITINFO;
        elements[] = {IDC_IGUI_WEAPON};
        location = VEHICLE_ONLY;
        class conditions {};
    };
    class gunnerWeaponNameBackground {
        idd = IDD_UNITINFO;
        elements[] = {1001, 1008};
        location = VEHICLE_ONLY;
        class conditions {};
    };
    class gunnerFiringMode {
        idd = IDD_UNITINFO;
        elements[] = {IDC_IGUI_WEAPON_MODE_TEXTURE, 1203};
        location = VEHICLE_ONLY;
        class conditions {};
    };
    class gunnerAmmoType {
        idd = IDD_UNITINFO;
        elements[] = {IDC_IGUI_WEAPON_AMMO};
        location = VEHICLE_ONLY;
        class conditions {};
    };
    class gunnerAmmoCount {
        idd = IDD_UNITINFO;
        elements[] = {IDC_IGUI_AMMOCOUNT};
        location = VEHICLE_ONLY;
        class conditions {};
    };
    class gunnerMagCount {
        idd = IDD_UNITINFO;
        elements[] = {IDC_IGUI_MAGCOUNT};
        location = VEHICLE_ONLY;
        class conditions {};
    };
    class gunnerLaunchableName {
        idd = IDD_UNITINFO;
        elements[] = {152};
        location = VEHICLE_ONLY;
        class conditions {};
    };
    class gunnerLaunchableCount {
        idd = IDD_UNITINFO;
        elements[] = {151};
        location = VEHICLE_ONLY;
        class conditions {};
    };
    class gunnerZeroing {
        idd = IDD_UNITINFO;
        elements[] = {IDC_IGUI_WEAPON_ELEVATION};
        location = VEHICLE_ONLY;
        class conditions {};
    };
    class gunnerWeaponLowerInfoBackground {
        idd = IDD_UNITINFO;
        elements[] = {1202};
        location = VEHICLE_ONLY;
        class conditions {};
    };
    class vehicleName {
        idd = IDD_UNITINFO;
        elements[] = {IDC_IGUI_VEHICLE};
        location = VEHICLE_ONLY;
        class conditions {};
    };
    class vehicleNameBackground {
        idd = IDD_UNITINFO;
        elements[] = {1000, 1013};
        location = VEHICLE_ONLY;
        class conditions {};
    };
    class vehicleFuelBar {
        idd = IDD_UNITINFO;
        elements[] = {IDC_IGUI_VALUE_FUEL, 1202};
        location = VEHICLE_ONLY;
        class conditions {};
    };
    class vehicleSpeed {
        idd = IDD_UNITINFO;
        elements[] = {IDC_IGUI_SPEED, 1004, 1006};
        location = VEHICLE_ONLY;
        class conditions {};
    };
    class vehicleAltitude {
        idd = IDD_UNITINFO;
        elements[] = {IDC_IGUI_ALT, 1005, 1014};
        location = VEHICLE_ONLY;
        class conditions {};
    };
    class vehicleDamage {
        idd = IDD_UNITINFO;
        elements[] = {IDC_IGUI_HITZONES};
        location = VEHICLE_ONLY;
        class conditions {};
    };
    class vehicleInfoBackground {
        idd = IDD_UNITINFO;
        elements[] = {1200};
        location = VEHICLE_ONLY;
        class conditions {};
    };
};
