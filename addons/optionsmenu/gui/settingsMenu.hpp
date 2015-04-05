class ACE_settingsMenu {
  idd = 145246;
  movingEnable = false;
  onLoad = QUOTE(uiNamespace setVariable [ARR_2('ACE_settingsMenu', _this select 0)]; [] call FUNC(onSettingsMenuOpen););
  onUnload = QUOTE(uiNamespace setVariable [ARR_2('ACE_settingsMenu', nil)]; saveProfileNamespace;);

  #define SIZEX (((safezoneW / safezoneH) min 1.2))
  #define SIZEY (SIZEX / 1.2)
  #define UNITX (SIZEX / 40)
  #define UNITY (SIZEY / 25)
  #define OFFSETX (safezoneX + (safezoneW - SIZEX)/2)
  #define OFFSETY (safezoneY + (safezoneH - (SIZEX / 1.2))/2)

  class controlsBackground {
    class HeaderBackground: ACE_gui_backgroundBase {
      idc = -1;
      type = CT_STATIC;
      x = 1 * UNITX + OFFSETX;
      y = 1 * UNITY + OFFSETY;
      w = 38 * UNITX;
      h = 1 * UNITY;
      style = ST_LEFT + ST_SHADOW;
      font = "PuristaMedium";
      SizeEx = (UNITY * 1);
      colorText[] = {0.95, 0.95, 0.95, 0.75};
      colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.9])"};
      text = "";
    };
    class CenterBackground: HeaderBackground {
      y = 2.1 * UNITY + OFFSETY;
      h = 2.5 * UNITY;
      text = "";
      colorText[] = {0, 0, 0, "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.9])"};
      colorBackground[] = {0,0,0,"(profilenamespace getvariable ['GUI_BCG_RGB_A',0.9])"};
    };
    class LeftBackground: CenterBackground {
      y = 4.8 * UNITY + OFFSETY;
      h = 17.4 * UNITY;
      w = 25 * UNITX;
    };
    class RightBackground: LeftBackground {
      x = 26.1 * UNITX + OFFSETX;
      w = 12.9 * UNITX;
    };
    class RightBackgroundHeader: RightBackground {
      h = 1.4 * UNITY;
      colorBackground[] = {0,0,0,1};
    };
  };

  class controls {
    class HeaderName {
      idc = 1;
      type = CT_STATIC;
      x = 1 * UNITX + OFFSETX;
      y = 1 * UNITY + OFFSETY;
      w = 38 * UNITX;
      h = 1 * UNITY;
      style = ST_LEFT + ST_SHADOW;
      font = "PuristaMedium";
      SizeEx = (UNITY * 1);
      colorText[] = {0.95, 0.95, 0.95, 0.75};
      colorBackground[] = {0,0,0,0};
      text = "$STR_ACE_OptionsMenu_OpenConfigMenu";
    };
    class labelSubHeader: ACE_gui_staticBase {
      idc = 13;
      x = 2 * UNITX + OFFSETX;
      y = 3.4 * UNITY + OFFSETY;
      w = 30 * UNITX;
      h = 1 * UNITY;
      text = "";
    };
    class selectionAction_1: ACE_gui_buttonBase {
      idc = 1000;
      text = "$STR_ACE_OptionsMenu_TabOptions";
      x = 1 * UNITX + OFFSETX;
      y = 2.1 * UNITY + OFFSETY;
      w = 9.5 * UNITX;
      h = 1 * UNITY;
      animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.9)";
      animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.8)";
      animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
      animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
      animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
      animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
      color[] = {1, 1, 1, 1};
      color2[] = {0,0,0, 1};
      colorBackgroundFocused[] = {1,1,1,1};
      colorBackground[] = {1,1,1,1};
      colorbackground2[] = {1,1,1,1};
      colorDisabled[] = {1,1,1,1};
      colorFocused[] = {0,0,0,1};
      periodFocus = 1;
      periodOver = 1;
      action = QUOTE([MENU_TAB_OPTIONS] call FUNC(onListBoxShowSelectionChanged););
    };
    class selectionAction_2: selectionAction_1 {
      idc = 1001;
      text = "$STR_ACE_OptionsMenu_TabColors";
      x = 10.5 * UNITX + OFFSETX;
      action = QUOTE([MENU_TAB_COLORS] call FUNC(onListBoxShowSelectionChanged););
    };
    class selectionAction_3: selectionAction_1 {
      idc = 1002;
      text = "";
      x = 20 * UNITX + OFFSETX;
      action = "";
    };
    class selectionAction_4: selectionAction_1 {
      idc = 1003;
      text = "";
      x = 29.5 * UNITX + OFFSETX;
      action = "";
    };
    class listBoxSettingsList: ACE_gui_listNBox {
      idc = 200;
      x = 2 * UNITX + OFFSETX;
      y = 5.5 * UNITY + OFFSETY;
      w = 23 * UNITX;
      h = 15 * UNITY;
      SizeEx = (UNITY * 0.8);
      colorBackground[] = {0, 0, 0, 0.9};
      colorSelectBackground[] = {0, 0, 0, 0.9};
      columns[] = {0.0, 0.6};
      onLBSelChanged = QUOTE(_this call FUNC(settingsMenuUpdateKeyView));
    };
    class labelTitle: ACE_gui_staticBase {
      idc = 250;
      x = 27.1 * UNITX + OFFSETX;
      y = 5.1 * UNITY + OFFSETY;
      w = 11 * UNITX;
      h = 1 * UNITY;
      text = "";
      SizeEx = (UNITY *1);
    };
    class labelKey: ACE_gui_staticBase {  //Variable Name
      idc = 300;
      x = 27.1 * UNITX + OFFSETX;
      y = 6.2 * UNITY + OFFSETY;
      w = 11 * UNITX;
      h = 1 * UNITY;
      text = "";
      SizeEx = (UNITY * 0.65);
    };
    class Label2: labelKey {
      idc = 301;
      y = 7.3 * UNITY + OFFSETY;
      text = "$STR_ACE_OptionsMenu_Setting";
      SizeEx = (UNITY * 1);
    };
    class comboBox1: ACE_gui_comboBoxBase {
      idc = 400;
      x = 31.1 * UNITX + OFFSETX;
      y = 7.3 * UNITY + OFFSETY;
      w = 7 * UNITX;
      h = 1 * UNITY;
      onLBSelChanged = QUOTE( call FUNC(onListBoxSettingsChanged));
      SizeEx = (UNITY * 0.9);
    };
    class sliderBar1: RscXSliderH {
      idc = 410;
      x = 27.1 * UNITX + OFFSETX;
      y = 7.3 * UNITY + OFFSETY;
      w = 11 * UNITX;
      h = 0.75 * UNITY;
      onSliderPosChanged = QUOTE(_this call FUNC(onSliderPosChanged));
      color[] = {1,0,0,0.4};
      colorActive[] = {1,0,0,1};
    };
    class sliderBar2: sliderBar1 {
      idc = 411;
      y = 8.2 * UNITY + OFFSETY;
      color[] = {0,1,0,0.4};
      colorActive[] = {0,1,0,1};
    };
    class sliderBar3: sliderBar1 {
      idc = 412;
      y = 9.1 * UNITY + OFFSETY;
      color[] = {0,0,1,0.4};
      colorActive[] = {0,0,1,1};
    };
    class sliderBar4: sliderBar1 {
      idc = 413;
      y = 10 * UNITY + OFFSETY;
      color[] = {1,1,1,0.4};
      colorActive[] = {1,1,1,1};
    };
    class labelDesc: ACE_gui_staticBase {
      idc = 251;
      x = 27.1 * UNITX + OFFSETX;
      y = 11 * UNITY + OFFSETY;
      w = 11 * UNITX;
      h = 11 * UNITY;
      text = "";
      style = ST_LEFT + ST_MULTI;
      lineSpacing = 1;
      SizeEx = (UNITY * 0.8);
    };
    class actionClose: ACE_gui_buttonBase {
      idc = 10;
      text = "$STR_DISP_CLOSE";
      x = 1 * UNITX + OFFSETX;
      y = 22.3 * UNITY + OFFSETY;
      w = 7.5 * UNITX;
      h = 1 * UNITY;
      style = ST_LEFT;
      animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.8)";
      animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.5)";
      animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
      animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
      animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
      animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
      color[] = {1, 1, 1, 1};
      color2[] = {0,0,0, 1};
      colorBackgroundFocused[] = {1,1,1,1};
      colorBackground[] = {1,1,1,1};
      colorbackground2[] = {1,1,1,1};
      colorDisabled[] = {0.5,0.5,0.5,0.8};
      colorFocused[] = {0,0,0,1};
      periodFocus = 1;
      periodOver = 1;
      action = "closedialog 0;";
    };
    class action_reset: actionClose {
      idc = 1100;
      text = "$STR_ACE_OptionsMenu_ResetAll";
      x = 26.1 * (SIZEX / 40) + OFFSETX;
      action = QUOTE([] call FUNC(resetSettings));
    };
    class action_exportServerConfig: actionClose {
      idc = 1102;
      text = "$STR_ACE_OptionsMenu_OpenExport";
      x = 1 * (SIZEX / 40) + OFFSETX;
      action = QUOTE(if (GVAR(serverConfigGeneration) > 0) then {createDialog 'ACE_serverSettingsMenu'; });
    };
  };
};
class ACE_serverSettingsMenu: ACE_settingsMenu {
    onLoad = QUOTE(uiNamespace setVariable [ARR_2('ACE_serverSettingsMenu', _this select 0)]; [] call FUNC(onServerSettingsMenuOpen); GVAR(serverConfigGeneration) = true;);
    onUnload = QUOTE(uiNamespace setVariable [ARR_2('ACE_serverSettingsMenu', nil)]; GVAR(serverConfigGeneration) = false;);
  class controls: controls {
    class HeaderName {
      idc = 1;
      type = CT_STATIC;
      x = 1 * UNITX + OFFSETX;
      y = 1 * UNITY + OFFSETY;
      w = 38 * UNITX;
      h = 1 * UNITY;
      style = ST_LEFT + ST_SHADOW;
      font = "PuristaMedium";
      SizeEx = (UNITY * 1);
      colorText[] = {0.95, 0.95, 0.95, 0.75};
      colorBackground[] = {0,0,0,0};
      text = "$STR_ACE_OptionsMenu_OpenConfigMenu";
    };
    class labelSubHeader: ACE_gui_staticBase {
      idc = 13;
      x = 2 * UNITX + OFFSETX;
      y = 3.4 * UNITY + OFFSETY;
      w = 30 * UNITX;
      h = 1 * UNITY;
      text = "";
    };
    class selectionAction_1: ACE_gui_buttonBase {
      idc = 1000;
      text = "$STR_ACE_OptionsMenu_TabOptions";
      x = 1 * UNITX + OFFSETX;
      y = 2.1 * UNITY + OFFSETY;
      w = 9.5 * UNITX;
      h = 1 * UNITY;
      animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.9)";
      animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.8)";
      animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
      animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
      animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
      animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
      color[] = {1, 1, 1, 1};
      color2[] = {0,0,0, 1};
      colorBackgroundFocused[] = {1,1,1,1};
      colorBackground[] = {1,1,1,1};
      colorbackground2[] = {1,1,1,1};
      colorDisabled[] = {1,1,1,1};
      colorFocused[] = {0,0,0,1};
      periodFocus = 1;
      periodOver = 1;
      action = QUOTE([MENU_TAB_SERVER_OPTIONS] call FUNC(onServerListBoxShowSelectionChanged););
    };
    class selectionAction_2: selectionAction_1 {
      idc = 1001;
      text = "$STR_ACE_OptionsMenu_TabColors";
      x = 10.5 * UNITX + OFFSETX;
      action = QUOTE([MENU_TAB_SERVER_COLORS] call FUNC(onServerListBoxShowSelectionChanged););
    };
    class selectionAction_3: selectionAction_1 {
      idc = 1002;
      text = "$STR_ACE_OptionsMenu_TabValues";
      x = 20 * UNITX + OFFSETX;
      action = QUOTE([MENU_TAB_SERVER_VALUES] call FUNC(onServerListBoxShowSelectionChanged););
    };
    class selectionAction_4: selectionAction_1 {
      idc = 1003;
      text = "";
      x = 29.5 * UNITX + OFFSETX;
      action = "";
    };
    class listBoxSettingsList: ACE_gui_listNBox {
      idc = 200;
      x = 2 * UNITX + OFFSETX;
      y = 5.5 * UNITY + OFFSETY;
      w = 23 * UNITX;
      h = 15 * UNITY;
      SizeEx = (UNITY * 0.8);
      colorBackground[] = {0, 0, 0, 0.9};
      colorSelectBackground[] = {0, 0, 0, 0.9};
      columns[] = {0.0, 0.6};
      onLBSelChanged = QUOTE(_this call FUNC(serverSettingsMenuUpdateKeyView));
    };
    class labelTitle: ACE_gui_staticBase {
      idc = 250;
      x = 27.1 * UNITX + OFFSETX;
      y = 5.1 * UNITY + OFFSETY;
      w = 11 * UNITX;
      h = 1 * UNITY;
      text = "";
      SizeEx = (UNITY *1);
    };
    class labelKey: ACE_gui_staticBase {  //Variable Name
      idc = 300;
      x = 27.1 * UNITX + OFFSETX;
      y = 6.2 * UNITY + OFFSETY;
      w = 11 * UNITX;
      h = 1 * UNITY;
      text = "";
      SizeEx = (UNITY * 0.65);
    };
    class Label2: labelKey {
      idc = 301;
      y = 7.3 * UNITY + OFFSETY;
      text = "$STR_ACE_OptionsMenu_Setting";
      SizeEx = (UNITY * 1);
    };
    class comboBox1: ACE_gui_comboBoxBase {
      idc = 400;
      x = 31.1 * UNITX + OFFSETX;
      y = 7.3 * UNITY + OFFSETY;
      w = 7 * UNITX;
      h = 1 * UNITY;
      onLBSelChanged = QUOTE( call FUNC(onListBoxSettingsChanged));
      SizeEx = (UNITY * 0.9);
    };
    class sliderBar1: RscXSliderH {
      idc = 410;
      x = 27.1 * UNITX + OFFSETX;
      y = 7.3 * UNITY + OFFSETY;
      w = 11 * UNITX;
      h = 0.75 * UNITY;
      onSliderPosChanged = QUOTE(_this call FUNC(onSliderPosChanged));
      color[] = {1,0,0,0.4};
      colorActive[] = {1,0,0,1};
    };
    class sliderBar2: sliderBar1 {
      idc = 411;
      y = 8.2 * UNITY + OFFSETY;
      color[] = {0,1,0,0.4};
      colorActive[] = {0,1,0,1};
    };
    class sliderBar3: sliderBar1 {
      idc = 412;
      y = 9.1 * UNITY + OFFSETY;
      color[] = {0,0,1,0.4};
      colorActive[] = {0,0,1,1};
    };
    class sliderBar4: sliderBar1 {
      idc = 413;
      y = 10 * UNITY + OFFSETY;
      color[] = {1,1,1,0.4};
      colorActive[] = {1,1,1,1};
    };
    class inputField1: ACE_gui_editBase {
      idc = 414;
      x = 27.1 * UNITX + OFFSETX;
      y = 7.3 * UNITY + OFFSETY;
      w = 11 * UNITX;
      h = 0.75 * UNITY;
    };
    class inputFieldTypeLabel: ACE_gui_staticBase {
      idc = 415;
      x = 27.1 * UNITX + OFFSETX;
      y = 8.2 * UNITY + OFFSETY;
      w = 11 * UNITX;
      h = 0.75 * UNITY;
      text = "";
      style = ST_LEFT + ST_MULTI;
      lineSpacing = 1;
      SizeEx = (UNITY * 0.8);
    };
    class saveInputButton: selectionAction_1 {
      idc = 416;
      text = "$STR_ACE_OptionsMenu_SaveInput";
      x = 27.1 * UNITX + OFFSETX;
      y = 9.1 * UNITY + OFFSETY;
      w = 11 * UNITX;
      h = 1 * UNITY;
      action = QUOTE([] call FUNC(onServerSaveInputField););
    };
    class labelDesc: ACE_gui_staticBase {
      idc = 251;
      x = 27.1 * UNITX + OFFSETX;
      y = 11 * UNITY + OFFSETY;
      w = 11 * UNITX;
      h = 11 * UNITY;
      text = "";
      style = ST_LEFT + ST_MULTI;
      lineSpacing = 1;
      SizeEx = (UNITY * 0.8);
    };
    class actionClose;
    class action_reset: actionClose {
      idc = 1100;
      text = "$STR_ACE_OptionsMenu_ResetAll";
      x = 26.1 * (SIZEX / 40) + OFFSETX;
      action = QUOTE([] call FUNC(serverResetSettings));
    };
    class action_exportServerConfig: actionClose {
      idc = 1101;
      text = "$STR_ACE_OptionsMenu_Export";
      x = 1 * (SIZEX / 40) + OFFSETX;
      action = QUOTE([] call FUNC(exportSettings));
    };
    class action_toggleIncludeClientSettings: actionClose {
      idc = 1102;
      text = "$STR_ACE_OptionsMenu_inClientSettings";
      x = 9 * (SIZEX / 40) + OFFSETX;
      action = QUOTE([] call FUNC(toggleIncludeClientSettings));
    };
  };
};
