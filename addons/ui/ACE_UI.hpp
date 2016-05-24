// IDD, elements[]s, Element (must be string to compare to changed setting name), Selective Type (0-both, 1-ground, 2-vehicle)
class ACE_UI {
    class weaponName {
        idd = 300;
        elements[] = {118};
        condition = QUOTE(ACE_player == vehicle ACE_player);
        class conditions {};
    };
    class weaponNameBackground {
        idd = 300;
        elements[] = {1001, 1008};
        condition = QUOTE(ACE_player == vehicle ACE_player);
        class conditions {};
    };
    class firingMode {
        idd = 300;
        elements[] = {187, 1203};
        condition = QUOTE(ACE_player == vehicle ACE_player);
        class conditions {};
    };
    class ammoType {
        idd = 300;
        elements[] = {155};
        condition = QUOTE(ACE_player == vehicle ACE_player);
        class conditions {};
    };
    class ammoCount {
        idd = 300;
        elements[] = {184};
        condition = QUOTE(ACE_player == vehicle ACE_player);
        class conditions {};
    };
    class magCount {
        idd = 300;
        elements[] = {185};
        condition = QUOTE(ACE_player == vehicle ACE_player);
        class conditions {};
    };
    class throwableName {
        idd = 300;
        elements[] = {152};
        condition = QUOTE(ACE_player == vehicle ACE_player);
        class conditions {};
    };
    class throwableCount {
        idd = 300;
        elements[] = {151};
        condition = QUOTE(ACE_player == vehicle ACE_player);
        class conditions {};
    };
    class zeroing {
        idd = 300;
        elements[] = {168};
        condition = QUOTE(ACE_player == vehicle ACE_player);
        class conditions {};
    };
    class weaponLowerInfoBackground {
        idd = 300;
        elements[] = {1202};
        condition = QUOTE(ACE_player == vehicle ACE_player);
        class conditions {};
    };
    class staminaBar {
        idd = 305;
        elements[] = {193};
        condition = QUOTE(ACE_player == vehicle ACE_player);
        class conditions {};
    };
    class stance {
        idd = 303;
        elements[] = {188, 1201};
        condition = QUOTE(ACE_player == vehicle ACE_player);
        class conditions {};
    };
    class gunnerWeaponName {
        idd = 300;
        elements[] = {118};
        condition = QUOTE(ACE_player != vehicle ACE_player);
        class conditions {};
    };
    class gunnerWeaponNameBackground {
        idd = 300;
        elements[] = {1001, 1008};
        condition = QUOTE(ACE_player != vehicle ACE_player);
        class conditions {};
    };
    class gunnerFiringMode {
        idd = 300;
        elements[] = {187, 1203};
        condition = QUOTE(ACE_player != vehicle ACE_player);
        class conditions {};
    };
    class gunnerAmmoType {
        idd = 300;
        elements[] = {155};
        condition = QUOTE(ACE_player != vehicle ACE_player);
        class conditions {};
    };
    class gunnerAmmoCount {
        idd = 300;
        elements[] = {184};
        condition = QUOTE(ACE_player != vehicle ACE_player);
        class conditions {};
    };
    class gunnerMagCount {
        idd = 300;
        elements[] = {185};
        condition = QUOTE(ACE_player != vehicle ACE_player);
        class conditions {};
    };
    class gunnerLaunchableName {
        idd = 300;
        elements[] = {152};
        condition = QUOTE(ACE_player != vehicle ACE_player);
        class conditions {};
    };
    class gunnerLaunchableCount {
        idd = 300;
        elements[] = {151};
        condition = QUOTE(ACE_player != vehicle ACE_player);
        class conditions {};
    };
    class gunnerZeroing {
        idd = 300;
        elements[] = {168};
        condition = QUOTE(ACE_player != vehicle ACE_player);
        class conditions {};
    };
    class gunnerWeaponLowerInfoBackground {
        idd = 300;
        elements[] = {1202};
        condition = QUOTE(ACE_player != vehicle ACE_player);
        class conditions {};
    };
    class vehicleName {
        idd = 300;
        elements[] = {120};
        condition = QUOTE(ACE_player != vehicle ACE_player);
        class conditions {};
    };
    class vehicleNameBackground {
        idd = 300;
        elements[] = {1000, 1013};
        condition = QUOTE(ACE_player != vehicle ACE_player);
        class conditions {};
    };
    class vehicleFuelBar {
        idd = 300;
        elements[] = {113, 1202};
        condition = QUOTE(ACE_player != vehicle ACE_player);
        class conditions {};
    };
    class vehicleSpeed {
        idd = 300;
        elements[] = {121, 1004, 1006};
        condition = QUOTE(ACE_player != vehicle ACE_player);
        class conditions {};
    };
    class vehicleAltitude {
        idd = 300;
        elements[] = {122, 1005, 1014};
        condition = QUOTE(ACE_player != vehicle ACE_player);
        class conditions {};
    };
    class vehicleDamage {
        idd = 300;
        elements[] = {111};
        condition = QUOTE(ACE_player != vehicle ACE_player);
        class conditions {};
    };
    class vehicleInfoBackground {
        idd = 300;
        elements[] = {1200};
        condition = QUOTE(ACE_player != vehicle ACE_player);
        class conditions {};
    };
};
