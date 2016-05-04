class CfgVehicles {
  class Man;
  class CAManBase: Man {
    class ACE_Actions {
      class ACE_MainActions {
        class GVAR(WeapontoGunbag) {
          displayName = CSTRING(toGunbag);
          condition = QUOTE([ARR_2(_player,_target)] call FUNC(canInteract) == 0);
          statement = QUOTE([ARR_2(_player,_target)] call FUNC(toGunbag));
          showDisabled = 0;
          priority = 1;
          icon = PATHTOF(ui\gunbag_icon_ca.paa);
        };
        class GVAR(WeaponoffGunbag) {
          displayName = CSTRING(offGunbag);
          condition = QUOTE([ARR_2(_player,_target)] call FUNC(canInteract) == 1);
          statement = QUOTE([ARR_2(_player,_target)] call FUNC(offGunbag));
          showDisabled = 0;
          priority = 1;
          icon = PATHTOF(ui\gunbag_icon_ca.paa);
        };
        class GVAR(StatusGunbag) {
          displayName = CSTRING(Status);
          condition = QUOTE([_target] call FUNC(isGunbag));
          statement = QUOTE([_target] call FUNC(status));
          showDisabled = 0;
          priority = 2;
          icon = PATHTOF(ui\gunbag_icon_ca.paa);
        };
      };
    };

    class ACE_SelfActions {
      class ACE_Equipment {
        class GVAR(actions) {
          displayName = CSTRING(displayname);
          condition = QUOTE([_player] call FUNC(isGunbag));
          showDisabled = 0;
          priority = 0.1;
          icon = PATHTOF(ui\gunbag_icon_ca.paa);

          class GVAR(WeapontoGunbag) {
            displayName = CSTRING(toGunbag);
            condition = QUOTE([ARR_2(_player,_player)] call FUNC(canInteract) == 0);
            statement = QUOTE([ARR_2(_player,_player)] call FUNC(toGunbag));
            showDisabled = 0;
            priority = 1;
            icon = PATHTOF(ui\gunbag_icon_ca.paa);
          };
          class GVAR(WeaponoffGunbag) {
            displayName = CSTRING(offGunbag);
            condition = QUOTE([ARR_2(_player,_player)] call FUNC(canInteract) == 1);
            statement = QUOTE([ARR_2(_player,_player)] call FUNC(offGunbag));
            showDisabled = 0;
            priority = 1;
            icon = PATHTOF(ui\gunbag_icon_ca.paa);
          };
          class GVAR(StatusGunbag) {
            displayName = CSTRING(Status);
            condition = QUOTE([_player] call FUNC(isGunbag));
            statement = QUOTE([_player] call FUNC(status));
            showDisabled = 0;
            priority = 2;
            icon = PATHTOF(ui\gunbag_icon_ca.paa);
          };
        };
      };
    };
  };

  class Bag_Base;
  class CLASSNAME: Bag_Base {
    _generalMacro = QUOTE(CLASSNAME);
    author = "Ir0n1E";
    scope = 2;
    displayName = CSTRING(Displayname);
    model = PATHTOF(data\gunbag.p3d);
    picture = PATHTOF(ui\gunbag_ca.paa);
    icon = PATHTOF(ui\gunbag_icon_ca.paa);
    hiddenSelections[] = {QUOTE(Camo),QUOTE(insignia)};
    hiddenSelectionsTextures[] = {PATHTOF(data\gunbag_co.paa)};
    maximumLoad = 80;
    mass = 11;
  };

  class DOUBLES(CLASSNAME,Tan): CLASSNAME {
    displayName = CSTRING(Displayname_Tan);
    picture = PATHTOF(ui\gunbag_tan_ca.paa);
    hiddenSelectionsTextures[] = {PATHTOF(data\gunbag_tan_co.paa)};
  };
};
