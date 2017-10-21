// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_HITZONES         17
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102
#define CT_ITEMSLOT         103
#define CT_CHECKBOX         77

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0
#define ST_UPPERCASE      0xC0
#define ST_LOWERCASE      0xD0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// progress bar
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// Default grid
#define GUI_GRID_WAbs           ((safezoneW / safezoneH) min 1.2)
#define GUI_GRID_HAbs           (GUI_GRID_WAbs / 1.2)
#define GUI_GRID_W          (GUI_GRID_WAbs / 40)
#define GUI_GRID_H          (GUI_GRID_HAbs / 25)
#define GUI_GRID_X          (safezoneX)
#define GUI_GRID_Y          (safezoneY + safezoneH - GUI_GRID_HAbs)

// Default text sizes
#define GUI_TEXT_SIZE_SMALL     (GUI_GRID_H * 0.8)
#define GUI_TEXT_SIZE_MEDIUM        (GUI_GRID_H * 1)
#define GUI_TEXT_SIZE_LARGE     (GUI_GRID_H * 1.2)

class ScrollBar;
class RscObject;
class RscText;
class RscTextSmall;
class RscTitle;
class RscProgress;
class RscProgressNotFreeze;
class RscPicture;
class RscLadderPicture;
class RscPictureKeepAspect;
class RscHTML;
class RscButton;
class RscShortcutButton;
class RscButtonSmall;
class RscEdit;
class RscCombo;
class RscListBox;
class RscListNBox;
class RscXListBox;
class RscTree;
class RscSlider;
class RscSliderH;
class RscXSliderH;
class RscActiveText;
class RscStructuredText;
class RscControlsGroup;
class RscToolbox;
class RscMapControl;
class RscCheckBox;
class RscFrame;
class ctrlDefault;
class ctrlControlsGroup;
class ctrlDefaultText;
class ctrlDefaultButton;
class RscBackgroundStripeTop;
class RscBackgroundStripeBottom;
class RscIGText;
class RscIGProgress;
class RscListBoxKeys;
class RscControlsGroupNoScrollbars;
class RscControlsGroupNoHScrollbars;
class RscControlsGroupNoVScrollbars;
class RscLine;
class RscActivePicture;
class RscButtonTextOnly;
class RscShortcutButtonMain;
class RscButtonEditor;
class RscIGUIShortcutButton;
class RscGearShortcutButton;
class RscButtonMenu;
class RscButtonMenuOK;
class RscButtonMenuCancel;
class RscButtonMenuSteam;
class RscLoadingText;
class RscIGUIListBox;
class RscIGUIListNBox;
class RscBackground;
class RscBackgroundGUI;
class RscBackgroundGUILeft;
class RscBackgroundGUIRight;
class RscBackgroundGUIBottom;
class RscBackgroundGUITop;
class RscBackgroundGUIDark;
class RscBackgroundLogo;
class RscMapControlEmpty;
class RscVignette;
class CA_Mainback;
class CA_Back;
class CA_Title_Back;
class CA_Black_Back;
class CA_Title;
class CA_Logo;
class CA_Logo_Small;
class CA_RscButton;
class CA_RscButton_dialog;
class CA_Ok;
class CA_Ok_image;
class CA_Ok_image2;
class CA_Ok_text;
class ctrlCheckbox;
class ctrlCheckboxBaseline;
class ctrlStatic;
class ctrlControlsGroupNoScrollbars;
class ctrlStructuredText;
class RscTextMulti;
class RscTreeSearch;
class RscVideo;
class RscVideoKeepAspect;
class RscActivePictureKeepAspect;
class RscEditMulti;
class RscMapSignalBackground;
class RscMapSignalPicture;
class RscMapSignalText;
class RscColorPicker;
class RscInterlacingScreen;
class RscFeedback;
class RscTrafficLight;
class RscButtonSearch;
class RscIGUIText;
class RscOpticsText;
class RscOpticsValue;
class RscIGUIValue;
class RscButtonMenuMain;
class RscButtonTestCentered;
class RscDisplaySingleMission_ChallengeOverviewGroup;
class RscDisplayDebriefing_RscTextMultiline;
class RscDisplayDebriefing_ListGroup;
class RscButtonArsenal;
class RscTextNoShadow;
class RscButtonNoColor;
class RscToolboxButton;
class ctrlStaticPicture;
class ctrlStaticPictureKeepAspect;
class ctrlStaticPictureTile;
class ctrlStaticFrame;
class ctrlStaticLine;
class ctrlStaticMulti;
class ctrlStaticBackground;
class ctrlStaticOverlay;
class ctrlStaticTitle;
class ctrlStaticFooter;
class ctrlStaticBackgroundDisable;
class ctrlStaticBackgroundDisableTiles;
class ctrlButton;
class ctrlButtonPicture;
class ctrlButtonPictureKeepAspect;
class ctrlButtonOK;
class ctrlButtonCancel;
class ctrlButtonClose;
class ctrlButtonToolbar;
class ctrlButtonSearch;
class ctrlButtonExpandAll;
class ctrlButtonCollapseAll;
class ctrlButtonFilter;
class ctrlEdit;
class ctrlEditMulti;
class ctrlSliderV;
class ctrlSliderH;
class ctrlCombo;
class ctrlComboToolbar;
class ctrlListbox;
class ctrlToolbox;
class ctrlToolboxPicture;
class ctrlToolboxPictureKeepAspect;
class ctrlCheckboxes;
class ctrlCheckboxesCheckbox;
class ctrlProgress;
class ctrlHTML;
class ctrlActiveText;
class ctrlActivePicture;
class ctrlActivePictureKeepAspect;
class ctrlTree;
class ctrlControlsGroupNoHScrollbars;
class ctrlControlsGroupNoVScrollbars;
class ctrlShortcutButton;
class ctrlShortcutButtonOK;
class ctrlShortcutButtonCancel;
class ctrlShortcutButtonSteam;
class ctrlXListbox;
class ctrlXSliderV;
class ctrlXSliderH;
class ctrlMenu;
class ctrlMenuStrip;
class ctrlMap;
class ctrlMapEmpty;
class ctrlMapMain;
class ctrlListNBox;
class ctrlCheckboxToolbar;
