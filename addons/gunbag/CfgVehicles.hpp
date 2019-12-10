class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(weaponTo) {
                    displayName = CSTRING(ToGunbag);
                    condition = QUOTE(([_target] call FUNC(hasGunbag)) && {[ARR_2(_player,_target)] call FUNC(canInteract) == 0});
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(toGunbag));
                    showDisabled = 0;
                    icon = QPATHTOF(ui\gunbag_icon_ca.paa);
                };
                class GVAR(weaponOff) {
                    displayName = CSTRING(OffGunbag);
                    condition = QUOTE(([_target] call FUNC(hasGunbag)) && {[ARR_2(_player,_target)] call FUNC(canInteract) == 1});
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(offGunbag));
                    showDisabled = 0;
                    icon = QPATHTOF(ui\gunbag_icon_ca.paa);
                };
                class GVAR(status) {
                    displayName = CSTRING(Status);
                    condition = QUOTE([_target] call FUNC(hasGunbag));
                    statement = QUOTE([_target] call FUNC(status));
                    showDisabled = 0;
                    icon = QPATHTOF(ui\gunbag_icon_ca.paa);
                };
            };
        };

        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(actions) {
                    displayName = CSTRING(Displayname);
                    condition = QUOTE([_player] call FUNC(hasGunbag));
                    showDisabled = 0;
                    icon = QPATHTOF(ui\gunbag_icon_ca.paa);
                    class GVAR(weaponTo) {
                        displayName = CSTRING(ToGunbag);
                        condition = QUOTE([ARR_2(_player,_player)] call FUNC(canInteract) == 0);
                        statement = QUOTE([ARR_2(_player,_player)] call FUNC(toGunbag));
                        showDisabled = 0;
                        icon = QPATHTOF(ui\gunbag_icon_ca.paa);
                    };
                    class GVAR(weaponOff) {
                        displayName = CSTRING(OffGunbag);
                        condition = QUOTE([ARR_2(_player,_player)] call FUNC(canInteract) == 1);
                        statement = QUOTE([ARR_2(_player,_player)] call FUNC(offGunbag));
                        showDisabled = 0;
                        icon = QPATHTOF(ui\gunbag_icon_ca.paa);
                    };
                    class GVAR(status) {
                        displayName = CSTRING(Status);
                        condition = QUOTE([_player] call FUNC(hasGunbag));
                        statement = QUOTE([_player] call FUNC(status));
                        showDisabled = 0;
                        icon = QPATHTOF(ui\gunbag_icon_ca.paa);
                    };
                };
            };
        };
    };

    class Bag_Base;
    class ADDON: Bag_Base {
        _generalMacro = QUOTE(ADDON);
        author = "Ir0n1E";
        scope = 2;
        displayName = CSTRING(Displayname);
        model = QPATHTOF(data\ace_gunbag.p3d);
        picture = QPATHTOF(ui\gunbag_ca.paa);
        icon = QPATHTOF(ui\gunbag_icon_ca.paa);
        hiddenSelections[] = {"Camo", "insignia"};
        hiddenSelectionsTextures[] = {QPATHTOF(data\gunbag_co.paa)};
        maximumLoad = 80;
        mass = 11;
        ADDON = 1;
    };

    class GVAR(Tan): ADDON {
        _generalMacro = QGVAR(Tan);
        author = "Ir0n1E";
        displayName = CSTRING(Displayname_Tan);
        picture = QPATHTOF(ui\gunbag_tan_ca.paa);
        hiddenSelectionsTextures[] = {QPATHTOF(data\gunbag_tan_co.paa)};
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportBackpacks {
            MACRO_ADDBACKPACK(ADDON,3);
            MACRO_ADDBACKPACK(GVAR(Tan),3);
        };
    };
};
