class RscText;
class RscButton;
class RscPicture;
class RscListBox;
class RscActivePicture;
class RscButtonMenu;
class RscControlsGroup;
class RscControlsGroupNoScrollbars;

class GVAR(BodyImage): RscControlsGroupNoScrollbars {
    idc = IDC_BODY_GROUP;
    x = QUOTE(POS_X(13.83));
    y = QUOTE(POS_Y(2.73));
    w = QUOTE(POS_W(12.33));
    h = QUOTE(POS_H(12.33));
    class controls {
        class Background: RscPicture {
            idc = -1;
            text = QPATHTOF(data\body_image\background.paa);
            x = 0;
            y = 0;
            w = QUOTE(POS_W(12.33));
            h = QUOTE(POS_H(12.33));
        };
        class Head: Background {
            idc = IDC_BODY_HEAD;
            text = QPATHTOF(data\body_image\head.paa);
        };
        class Torso: Background {
            idc = IDC_BODY_TORSO;
            text = QPATHTOF(data\body_image\torso.paa);
        };
        class ArmLeft: Background {
            idc = IDC_BODY_ARMLEFT;
            text = QPATHTOF(data\body_image\arm_left.paa);
        };
        class ArmRight: Background {
            idc = IDC_BODY_ARMRIGHT;
            text = QPATHTOF(data\body_image\arm_right.paa);
        };
        class LegLeft: Background {
            idc = IDC_BODY_LEGLEFT;
            text = QPATHTOF(data\body_image\leg_left.paa);
        };
        class LegRight: Background {
            idc = IDC_BODY_LEGRIGHT;
            text = QPATHTOF(data\body_image\leg_right.paa);
        };
        class ArmLeftB: Background {
            idc = IDC_BODY_ARMLEFT_B;
            text = QPATHTOF(data\body_image\arm_left_b.paa);
            colorText[] = {0, 0, 0.8, 1};
            show = 0;
        };
        class ArmRightB: ArmLeftB {
            idc = IDC_BODY_ARMRIGHT_B;
            text = QPATHTOF(data\body_image\arm_right_b.paa);
        };
        class LegLeftB: ArmLeftB {
            idc = IDC_BODY_LEGLEFT_B;
            text = QPATHTOF(data\body_image\leg_left_b.paa);
        };
        class LegRightB: ArmLeftB {
            idc = IDC_BODY_LEGRIGHT_B;
            text = QPATHTOF(data\body_image\leg_right_b.paa);
        };
        class ArmLeftT: Background {
            idc = IDC_BODY_ARMLEFT_T;
            text = QPATHTOF(data\body_image\arm_left_t.paa);
            colorText[] = {0, 0, 0.8, 1};
            show = 0;
        };
        class ArmRightT: ArmLeftT {
            idc = IDC_BODY_ARMRIGHT_T;
            text = QPATHTOF(data\body_image\arm_right_t.paa);
        };
        class LegLeftT: ArmLeftT {
            idc = IDC_BODY_LEGLEFT_T;
            text = QPATHTOF(data\body_image\leg_left_t.paa);
        };
        class LegRightT: ArmLeftT {
            idc = IDC_BODY_LEGRIGHT_T;
            text = QPATHTOF(data\body_image\leg_right_t.paa);
        };
        class HeadS: Background {
            idc = IDC_BODY_HEAD_S;
            text = QPATHTOF(data\body_image\head_s.paa);
            colorText[] = {1.0, 1.0, 1.0, 1.0};
            show = 0;
        };
        class TorsoS: HeadS {
            idc = IDC_BODY_TORSO_S;
            text = QPATHTOF(data\body_image\torso_s.paa);
        };
        class ArmLeftS: HeadS {
            idc = IDC_BODY_ARMLEFT_S;
            text = QPATHTOF(data\body_image\arm_left_s.paa);
        };
        class ArmRightS: HeadS {
            idc = IDC_BODY_ARMRIGHT_S;
            text = QPATHTOF(data\body_image\arm_right_s.paa);
        };
        class LegLeftS: HeadS {
            idc = IDC_BODY_LEGLEFT_S;
            text = QPATHTOF(data\body_image\leg_left_s.paa);
        };
        class LegRightS: HeadS {
            idc = IDC_BODY_LEGRIGHT_S;
            text = QPATHTOF(data\body_image\leg_right_s.paa);
        };
    };
};

class GVAR(TriageToggle): RscButton {
    idc = -1;
    onButtonClick = QUOTE([ctrlParent (_this select 0)] call FUNC(toggleTriageSelect));
    x = QUOTE(POS_X(13.83));
    y = QUOTE(POS_Y(15.5));
    w = QUOTE(POS_W(12.33));
    h = QUOTE(POS_H(1.1));
    colorFocused[] = {0, 0, 0, 0};
    colorBackground[] = {0, 0, 0, 0};
    colorBackgroundActive[] = {0, 0, 0, 0};
};

class GVAR(TriageSelect): RscControlsGroupNoScrollbars {
    idc = IDC_TRIAGE_SELECT;
    x = QUOTE(POS_X(13.83));
    y = QUOTE(POS_Y(16.6));
    w = QUOTE(POS_W(12.33));
    h = QUOTE(POS_H(5.5));
    class controls {
        class None: RscButton {
            idc = -1;
            onButtonClick = QUOTE([ARR_3(ctrlParent (_this select 0),GVAR(target),0)] call FUNC(handleTriageSelect));
            style = ST_CENTER;
            text = ECSTRING(medical_treatment,Triage_Status_None);
            x = 0;
            y = 0;
            w = QUOTE(POS_W(12.33));
            h = QUOTE(POS_H(1.1));
            shadow = 0;
            colorText[] = {TRIAGE_TEXT_COLOR_NONE};
            colorFocused[] = {TRIAGE_COLOR_NONE};
            colorBackground[] = {TRIAGE_COLOR_NONE};
            colorBackgroundActive[] = {TRIAGE_COLOR_NONE};
        };
        class Minimal: None {
            onButtonClick = QUOTE([ARR_3(ctrlParent (_this select 0),GVAR(target),1)] call FUNC(handleTriageSelect));
            text = ECSTRING(medical_treatment,Triage_Status_Minimal);
            y = QUOTE(POS_H(1.1));
            colorText[] = {TRIAGE_TEXT_COLOR_MINIMAL};
            colorFocused[] = {TRIAGE_COLOR_MINIMAL};
            colorBackground[] = {TRIAGE_COLOR_MINIMAL};
            colorBackgroundActive[] = {TRIAGE_COLOR_MINIMAL};
        };
        class Delayed: None {
            onButtonClick = QUOTE([ARR_3(ctrlParent (_this select 0),GVAR(target),2)] call FUNC(handleTriageSelect));
            text = ECSTRING(medical_treatment,Triage_Status_Delayed);
            y = QUOTE(POS_H(2.2));
            colorText[] = {TRIAGE_TEXT_COLOR_DELAYED};
            colorFocused[] = {TRIAGE_COLOR_DELAYED};
            colorBackground[] = {TRIAGE_COLOR_DELAYED};
            colorBackgroundActive[] = {TRIAGE_COLOR_DELAYED};
        };
        class Immediate: None {
            onButtonClick = QUOTE([ARR_3(ctrlParent (_this select 0),GVAR(target),3)] call FUNC(handleTriageSelect));
            text = ECSTRING(medical_treatment,Triage_Status_Immediate);
            y = QUOTE(POS_H(3.3));
            colorText[] = {TRIAGE_TEXT_COLOR_IMMEDIATE};
            colorFocused[] = {TRIAGE_COLOR_IMMEDIATE};
            colorBackground[] = {TRIAGE_COLOR_IMMEDIATE};
            colorBackgroundActive[] = {TRIAGE_COLOR_IMMEDIATE};
        };
        class Deceased: None {
            onButtonClick = QUOTE([ARR_3(ctrlParent (_this select 0),GVAR(target),4)] call FUNC(handleTriageSelect));
            text = ECSTRING(medical_treatment,Triage_Status_Deceased);
            y = QUOTE(POS_H(4.4));
            colorText[] = {TRIAGE_TEXT_COLOR_DECEASED};
            colorFocused[] = {TRIAGE_COLOR_DECEASED};
            colorBackground[] = {TRIAGE_COLOR_DECEASED};
            colorBackgroundActive[] = {TRIAGE_COLOR_DECEASED};
        };
    };
};

class ACE_Medical_Menu_ActionButton: RscButtonMenu {
    idc = -1;
    style = ST_LEFT;
    x = 0;
    y = 0;
    w = QUOTE(POS_W(12.33));
    h = QUOTE(POS_H(1));
    size = QUOTE(POS_H(0.9));
    class Attributes {
        align = "center";
        color = "#E5E5E5";
        font = "RobotoCondensed";
        shadow = "false";
    };
};

class ACE_Medical_Menu {
    idd = IDD_MEDICAL_MENU;
    movingEnable = 1;
    enableSimulation = 1;
    onLoad = QUOTE(_this call FUNC(onMenuOpen));
    onUnload = QUOTE(_this call FUNC(onMenuClose));
    onKeyDown = QUOTE([ARR_3('onKeyDown',_this,QQGVAR(display))] call FUNC(onKeyDown));
    class controlsBackground {
        class Title: RscText {
            idc = IDC_TITLE;
            text = CSTRING(MedicalMenu);
            x = QUOTE(POS_X(1));
            y = QUOTE(POS_Y(0));
            w = QUOTE(POS_W(38));
            h = QUOTE(POS_H(1));
            colorBackground[] = GUI_BCG_COLOR;
            moving = 1;
        };
        class Center: RscText {
            idc = -1;
            x = QUOTE(POS_X(1));
            y = QUOTE(POS_Y(1.1));
            w = QUOTE(POS_W(38));
            h = QUOTE(POS_H(16));
            colorBackground[] = {0, 0, 0, 0.7};
        };
        class Bottom: Center {
            y = QUOTE(POS_Y(17.6));
            h = QUOTE(POS_H(9));
        };
    };
    class controls {
        class TreatmentHeader: RscText {
            idc = -1;
            style = ST_CENTER;
            text = CSTRING(EXAMINE_TREATMENT);
            x = QUOTE(POS_X(1.5));
            y = QUOTE(POS_Y(1.5));
            w = QUOTE(POS_W(12.33));
            h = QUOTE(POS_H(1));
            sizeEx = QUOTE(POS_H(1.2));
            colorText[] = {1, 1, 1, 0.9};
        };
        class NameHeader: TreatmentHeader {
            idc = IDC_NAME;
            x = QUOTE(POS_X(13.83));
        };
        class OverviewHeader: TreatmentHeader {
            text = CSTRING(OVERVIEW);
            w = QUOTE(POS_W(12.34)); // 12.33 + 12.33 + 12.34 = 37.00
            x = QUOTE(POS_X(26.16));
        };
        class HeaderLine: RscText {
            idc = -1;
            x = QUOTE(POS_X(1.5));
            y = QUOTE(POS_Y(2.6));
            w = QUOTE(POS_W(37));
            h = QUOTE(POS_H(0.03));
            colorBackground[] = {1, 1, 1, 0.5};
        };
        class Triage: RscActivePicture {
            idc = IDC_TRIAGE;
            onButtonClick = QUOTE(GVAR(selectedCategory) = 'triage');
            text = QPATHTOF(data\categories\triage_card.paa);
            tooltip = CSTRING(ViewTriageCard);
            x = QUOTE(POS_X(1.75));
            y = QUOTE(POS_Y(2.75));
            w = QUOTE(POS_W(1.5));
            h = QUOTE(POS_H(1.5));
            color[] = {1, 1, 1, 1};
            colorActive[] = {1, 1, 1, 0.8};
            soundClick[] = {"\a3\ui_f\data\sound\rscbutton\soundClick", 0.09, 1};
            soundEnter[] = {"\a3\ui_f\data\sound\rscbutton\soundEnter", 0.09, 1};
            soundEscape[] = {"\a3\ui_f\data\sound\rscbutton\soundEscape", 0.09, 1};
            soundPush[] = {"\a3\ui_f\data\sound\rscbutton\soundPush", 0.09, 1};
        };
        class Examine: Triage {
            idc = IDC_EXAMINE;
            onButtonClick = QUOTE(GVAR(selectedCategory) = 'examine');
            text = QPATHTOF(data\categories\examine_patient.paa);
            tooltip = CSTRING(ExaminePatient);
            x = QUOTE(POS_X(3.25));
        };
        class Bandage: Triage {
            idc = IDC_BANDAGE;
            onButtonClick = QUOTE(GVAR(selectedCategory) = 'bandage');
            text = QPATHTOF(data\categories\bandage_fracture.paa);
            tooltip = CSTRING(BandageFractures);
            x = QUOTE(POS_X(4.75));
        };
        class Medication: Triage {
            idc = IDC_MEDICATION;
            onButtonClick = QUOTE(GVAR(selectedCategory) = 'medication');
            text = QPATHTOF(data\categories\medication.paa);
            tooltip = CSTRING(Medication);
            x = QUOTE(POS_X(6.25));
        };
        class Airway: Triage {
            idc = IDC_AIRWAY;
            onButtonClick = QUOTE(GVAR(selectedCategory) = 'airway');
            text = QPATHTOF(data\categories\airway_management.paa);
            tooltip = CSTRING(AirwayManagement);
            x = QUOTE(POS_X(7.75));
        };
        class Advanced: Triage {
            idc = IDC_ADVANCED;
            onButtonClick = QUOTE(GVAR(selectedCategory) = 'advanced');
            text = QPATHTOF(data\categories\advanced_treatment.paa);
            tooltip = CSTRING(AdvancedTreatment);
            x = QUOTE(POS_X(9.25));
        };
        class Drag: Triage {
            idc = IDC_DRAG;
            onButtonClick = QUOTE(GVAR(selectedCategory) = 'drag');
            text = QPATHTOF(data\categories\carry.paa);
            tooltip = CSTRING(DragCarry);
            x = QUOTE(POS_X(10.75));
        };
        class Toggle: Triage {
            idc = IDC_TOGGLE;
            onButtonClick = QUOTE(call FUNC(handleToggle));
            text = QPATHTOF(data\categories\toggle_to_other.paa);
            x = QUOTE(POS_X(12));
        };
        class TriageDivider: HeaderLine {
            idc = IDC_TRIAGE_DIVIDER;
            x = QUOTE(POS_X(3.265));
            y = QUOTE(POS_Y(3.0));
            w = QUOTE(POS_W(0.03));
            h = QUOTE(POS_H(1.0));
        };
        class ToggleDivider: TriageDivider {
            idc = IDC_TOGGLE_DIVIDER;
            x = QUOTE(POS_X(3.265));
        };
        class TriageCard: RscListBox {
            idc = IDC_TRIAGE_CARD;
            x = QUOTE(POS_X(1.5));
            y = QUOTE(POS_Y(4.4));
            w = QUOTE(POS_W(12.33));
            h = QUOTE(POS_H(12.2));
            sizeEx = QUOTE(POS_H(0.7));
            colorSelect[] = {1, 1, 1, 1};
            colorSelect2[] = {1, 1, 1, 1};
            colorBackground[] = {0, 0, 0, 0.2};
            colorSelectBackground[] = {0, 0, 0, 0};
            colorSelectBackground2[] = {0, 0, 0, 0};
            colorScrollbar[] = {0.9, 0.9, 0.9, 1};
        };
        class ActionButtonGroup: RscControlsGroup {
            idc = IDC_ACTION_BUTTON_GROUP;
            x = QUOTE(POS_X(1.5));
            y = QUOTE(POS_Y(4.4));
            w = QUOTE(POS_W(12.33));
            h = QUOTE(POS_H(12.2));
        };
        class BodyImage: GVAR(BodyImage) {};
        class SelectHead: RscButton {
            idc = -1;
            onButtonClick = QUOTE(GVAR(selectedBodyPart) = 0);
            tooltip = CSTRING(SelectHead);
            x = QUOTE(POS_X(19.3));
            y = QUOTE(POS_Y(3.2));
            w = QUOTE(POS_W(1.4));
            h = QUOTE(POS_H(1.8));
            colorFocused[] = {0, 0, 0, 0};
            colorBackground[] = {0, 0, 0, 0};
            colorBackgroundActive[] = {0, 0, 0, 0};
        };
        class SelectTorso: SelectHead {
            onButtonClick = QUOTE(GVAR(selectedBodyPart) = 1);
            tooltip = CSTRING(SelectTorso);
            x = QUOTE(POS_X(18.9));
            y = QUOTE(POS_Y(5));
            w = QUOTE(POS_W(2.2));
            h = QUOTE(POS_H(3.8));
        };
        class SelectArmLeft: SelectHead {
            onButtonClick = QUOTE(GVAR(selectedBodyPart) = 2);
            tooltip = CSTRING(SelectLeftArm);
            x = QUOTE(POS_X(21.1));
            y = QUOTE(POS_Y(5.1));
            w = QUOTE(POS_W(1.1));
            h = QUOTE(POS_H(4.6));
        };
        class SelectArmRight: SelectArmLeft {
            onButtonClick = QUOTE(GVAR(selectedBodyPart) = 3);
            tooltip = CSTRING(SelectRightArm);
            x = QUOTE(POS_X(17.8));
        };
        class SelectLegLeft: SelectHead {
            onButtonClick = QUOTE(GVAR(selectedBodyPart) = 4);
            tooltip = CSTRING(SelectLeftLeg);
            x = QUOTE(POS_X(20.0));
            y = QUOTE(POS_Y(8.8));
            w = QUOTE(POS_W(1.1));
            h = QUOTE(POS_H(5.8));
        };
        class SelectLegRight: SelectLegLeft {
            onButtonClick = QUOTE(GVAR(selectedBodyPart) = 5);
            tooltip = CSTRING(SelectRightLeg);
            x = QUOTE(POS_X(18.9));
        };
        class Injuries: TriageCard {
            idc = IDC_INJURIES;
            x = QUOTE(POS_X(26.17));
            y = QUOTE(POS_Y(3.3));
            w = QUOTE(POS_W(12.33));
            h = QUOTE(POS_Y(13.3));
        };
        class ActivityHeader: TreatmentHeader {
            text = CSTRING(ACTIVITY_LOG);
            y = QUOTE(POS_Y(17.6));
            w = QUOTE(POS_W(18.5));
            sizeEx = QUOTE(POS_H(1));
            colorText[] = {0.6, 0.7, 1, 1};
        };
        class QuickViewHeader: ActivityHeader {
            text = CSTRING(QUICK_VIEW);
            x = QUOTE(POS_X(20.0));
        };
        class LowerLine: HeaderLine {
            y = QUOTE(POS_Y(18.5));
        };
        class LowerDivider: HeaderLine {
            x = QUOTE(POS_X(19.985));
            y = QUOTE(POS_Y(18.75));
            w = QUOTE(POS_W(0.03));
            h = QUOTE(POS_H(7.6));
        };
        class Activity: Injuries {
            idc = IDC_ACTIVITY;
            x = QUOTE(POS_X(1.5));
            y = QUOTE(POS_Y(18.5));
            w = QUOTE(POS_W(18.5));
            h = QUOTE(POS_H(7.6));
            colorBackground[] = {0, 0, 0, 0};
        };
        class QuickView: Activity {
            idc = IDC_QUICKVIEW;
            x = QUOTE(POS_X(20.0));
        };
        class TriageStatus: RscText {
            idc = IDC_TRIAGE_STATUS;
            style = ST_CENTER;
            x = QUOTE(POS_X(13.83));
            y = QUOTE(POS_Y(15.5));
            w = QUOTE(POS_W(12.33));
            h = QUOTE(POS_H(1.1));
            shadow = 0;
        };
        class TriageToggle: GVAR(TriageToggle) {};
        class TriageSelect: GVAR(TriageSelect) {};
        class BodyLabelLeft: RscText {
            idc = -1;
            style = ST_RIGHT;
            text = CSTRING(BodyLabelLeft);
            font = "RobotoCondensedBold";
            x = QUOTE(POS_X(17.0));
            y = QUOTE(POS_Y(10.5));
            w = QUOTE(POS_W(6.0));
            h = QUOTE(POS_H(2.0));
            sizeEx = QUOTE(POS_H(1.4));
            colorText[] = {1, 1, 1, 0.33};
            shadow = 0;
        };
        class BodyLabelRight: BodyLabelLeft {
            style = ST_LEFT;
            text = CSTRING(BodyLabelRight);
        };
    };
};

class GVAR(RscTriageCard) {
    idd = -1;
    movingEnable = 1;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(RscTriageCard),_this select 0)]);
    class controls {
        class Background: RscText {
            idc = -1;
            x = QUOTE(POS_X(12.5));
            y = QUOTE(POS_Y(0));
            w = QUOTE(POS_W(15));
            h = QUOTE(POS_H(19));
            colorBackground[] = {1, 1, 1, 1};
            moving = 1;
        };
        class CornerLeft: RscPicture {
            idc = -1;
            text = QPATHTOF(data\triage_card\corner_left.paa);
            x = QUOTE(POS_X(12.5));
            y = QUOTE(POS_Y(0));
            w = QUOTE(POS_W(5));
            h = QUOTE(POS_H(5));
            colorText[] = {1, 1, 0, 1};
        };
        class CornerRight: CornerLeft {
            text = QPATHTOF(data\triage_card\corner_right.paa);
            x = QUOTE(POS_X(22.5));
        };
        class Title: RscText {
            idc = -1;
            style = ST_CENTER;
            text = CSTRING(Actions_TriageCard);
            x = QUOTE(POS_X(12.5));
            y = QUOTE(POS_Y(3));
            w = QUOTE(POS_W(15));
            h = QUOTE(POS_H(0.9));
            sizeEx = QUOTE(POS_H(0.9));
            shadow = 0;
            colorText[] = {0, 0, 0, 1};
        };
        class TriageCard: RscListBox {
            idc = IDC_TRIAGE_CARD;
            x = QUOTE(POS_X(13.5));
            y = QUOTE(POS_Y(5));
            w = QUOTE(POS_W(13));
            h = QUOTE(POS_H(13));
            sizeEx = QUOTE(POS_H(0.7));
            colorText[] = {0, 0, 0, 1};
            colorSelect[] = {0, 0, 0, 1};
            colorSelect2[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0};
            colorSelectBackground[] = {0, 0, 0, 0};
            colorSelectBackground2[] = {0, 0, 0, 0};
            colorScrollbar[] = {0, 0, 0, 1};
        };
        class TriageStatus: RscText {
            idc = IDC_TRIAGE_STATUS;
            style = ST_CENTER;
            x = QUOTE(POS_X(12.5));
            y = QUOTE(POS_Y(19));
            w = QUOTE(POS_W(15));
            h = QUOTE(POS_H(1.1));
            shadow = 0;
        };
        class TriageToggle: GVAR(TriageToggle) {
            x = QUOTE(POS_X(12.5));
            y = QUOTE(POS_Y(19));
            w = QUOTE(POS_W(15));
        };
        class TriageSelect: GVAR(TriageSelect) {
            x = QUOTE(POS_X(12.5));
            y = QUOTE(POS_Y(20));
            w = QUOTE(POS_W(15));
            class controls: controls {
                class None: None {
                    w = QUOTE(POS_W(15));
                };
                class Minimal: Minimal {
                    w = QUOTE(POS_W(15));
                };
                class Delayed: Delayed {
                    w = QUOTE(POS_W(15));
                };
                class Immediate: Immediate {
                    w = QUOTE(POS_W(15));
                };
                class Deceased: Deceased {
                    w = QUOTE(POS_W(15));
                };
            };
        };
    };
};

class RscTitles {
    class GVAR(RscPatientInfo) {
        idd = -1;
        fadeIn = 0.3;
        fadeOut = 0.3;
        duration = 999999;
        movingEnable = 0;
        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(RscPatientInfo),_this select 0)]);
        class controls {
            class PatientInfoContainer: RscControlsGroupNoScrollbars {
                idc = -1;
                x = QUOTE(safeZoneX + PATIENT_INFO_IGUI_OFFSET_X);
                y = QUOTE(safeZoneY + PATIENT_INFO_IGUI_OFFSET_Y);
                w = "safeZoneW";
                h = "safeZoneH";
                class controls {
                    class BodyImage: GVAR(BodyImage) {
                        x = QUOTE(POS_W(2.25));
                        y = QUOTE(POS_H(1.5));
                        w = QUOTE(POS_W(8.5));
                        h = QUOTE(POS_H(8.5));
                        class controls: controls {
                            class Background: Background {
                                w = QUOTE(POS_W(8.5));
                                h = QUOTE(POS_H(8.5));
                            };
                            class Head: Head {
                                w = QUOTE(POS_W(8.5));
                                h = QUOTE(POS_H(8.5));
                            };
                            class Torso: Torso {
                                w = QUOTE(POS_W(8.5));
                                h = QUOTE(POS_H(8.5));
                            };
                            class ArmLeft: ArmLeft {
                                w = QUOTE(POS_W(8.5));
                                h = QUOTE(POS_H(8.5));
                            };
                            class ArmRight: ArmRight {
                                w = QUOTE(POS_W(8.5));
                                h = QUOTE(POS_H(8.5));
                            };
                            class LegLeft: LegLeft {
                                w = QUOTE(POS_W(8.5));
                                h = QUOTE(POS_H(8.5));
                            };
                            class LegRight: LegRight {
                                w = QUOTE(POS_W(8.5));
                                h = QUOTE(POS_H(8.5));
                            };
                            class ArmLeftB: ArmLeftB {
                                w = QUOTE(POS_W(8.5));
                                h = QUOTE(POS_H(8.5));
                            };
                            class ArmRightB: ArmRightB {
                                w = QUOTE(POS_W(8.5));
                                h = QUOTE(POS_H(8.5));
                            };
                            class LegLeftB: LegLeftB {
                                w = QUOTE(POS_W(8.5));
                                h = QUOTE(POS_H(8.5));
                            };
                            class LegRightB: LegRightB {
                                w = QUOTE(POS_W(8.5));
                                h = QUOTE(POS_H(8.5));
                            };
                            class ArmLeftT: ArmLeftT {
                                w = QUOTE(POS_W(8.5));
                                h = QUOTE(POS_H(8.5));
                            };
                            class ArmRightT: ArmRightT {
                                w = QUOTE(POS_W(8.5));
                                h = QUOTE(POS_H(8.5));
                            };
                            class LegLeftT: LegLeftT {
                                w = QUOTE(POS_W(8.5));
                                h = QUOTE(POS_H(8.5));
                            };
                            class LegRightT: LegRightT {
                                w = QUOTE(POS_W(8.5));
                                h = QUOTE(POS_H(8.5));
                            };
                            class HeadS: HeadS {
                                w = QUOTE(POS_W(8.5));
                                h = QUOTE(POS_H(8.5));
                            };
                            class TorsoS: TorsoS {
                                w = QUOTE(POS_W(8.5));
                                h = QUOTE(POS_H(8.5));
                            };
                            class ArmLeftS: ArmLeftS {
                                w = QUOTE(POS_W(8.5));
                                h = QUOTE(POS_H(8.5));
                            };
                            class ArmRightS: ArmRightS {
                                w = QUOTE(POS_W(8.5));
                                h = QUOTE(POS_H(8.5));
                            };
                            class LegLeftS: LegLeftS {
                                w = QUOTE(POS_W(8.5));
                                h = QUOTE(POS_H(8.5));
                            };
                            class LegRightS: LegRightS {
                                w = QUOTE(POS_W(8.5));
                                h = QUOTE(POS_H(8.5));
                            };
                        };
                    };
                    class InjuriesLabel: RscText {
                        idc = -1;
                        text = CSTRING(INJURIES);
                        x = QUOTE(POS_W(2));
                        y = QUOTE(POS_H(10.2));
                        w = QUOTE(POS_W(9));
                        h = QUOTE(POS_H(0.7));
                        sizeEx = QUOTE(POS_H(0.7));
                        colorBackground[] = GUI_BCG_COLOR;
                    };
                    class Injuries: RscListBox {
                        idc = IDC_INJURIES;
                        x = QUOTE(POS_W(2));
                        y = QUOTE(POS_H(11));
                        w = QUOTE(POS_W(9));
                        h = QUOTE(POS_H(9));
                        sizeEx = QUOTE(POS_H(0.7));
                        colorSelect[] = {1, 1, 1, 1};
                        colorSelect2[] = {1, 1, 1, 1};
                        colorBackground[] = {0, 0, 0, 0.2};
                        colorSelectBackground[] = {0, 0, 0, 0};
                        colorSelectBackground2[] = {0, 0, 0, 0};
                        colorScrollbar[] = {0.9, 0.9, 0.9, 1};
                    };
                    class TriageStatus: RscText {
                        idc = IDC_TRIAGE_STATUS;
                        x = QUOTE(POS_W(2));
                        y = QUOTE(POS_H(20.2));
                        w = QUOTE(POS_W(9));
                        h = QUOTE(POS_H(0.7));
                        sizeEx = QUOTE(POS_H(0.7));
                        shadow = 0;
                    };
                    class Activity: Injuries {
                        idc = IDC_ACTIVITY;
                        x = QUOTE(POS_W(1.75));
                        y = QUOTE(POS_H(21));
                        w = QUOTE(POS_W(15));
                        h = QUOTE(POS_H(7));
                        shadow = 2;
                        colorBackground[] = {0, 0, 0, 0};
                    };
                };
            };
        };
    };
};
