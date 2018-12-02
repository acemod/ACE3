class RscText;
class RscButton;
class RscPicture;
class RscListBox;
class RscActivePicture;
class RscButtonMenu;
class RscControlsGroupNoScrollbars;

class ACE_Medical_Body: RscControlsGroupNoScrollbars {
    idc = IDC_BODY_GROUP;
    x = POS_X(13.33);
    y = POS_Y(2.73);
    w = POS_W(12.33);
    h = POS_H(12.33);
    class controls {
        class Background: RscPicture {
            idc = -1;
            text = QPATHTOF(data\body_image\background.paa);
            x = 0;
            y = 0;
            w = POS_W(12.33);
            h = POS_H(12.33);
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
        class ArmLeftT: Background {
            idc = IDC_BODY_ARMLEFT_T;
            text = QPATHTOF(data\body_image\arm_left_T.paa);
            colorText[] = {0, 0, 0.8, 1};
        };
        class ArmRightT: ArmLeftT {
            idc = IDC_BODY_ARMRIGHT_T;
            text = QPATHTOF(data\body_image\arm_right_T.paa);
        };
        class LegLeftT: ArmLeftT {
            idc = IDC_BODY_LEGLEFT_T;
            text = QPATHTOF(data\body_image\leg_left_T.paa);
        };
        class LegRightT: ArmLeftT {
            idc = IDC_BODY_LEGRIGHT_T;
            text = QPATHTOF(data\body_image\leg_right_T.paa);
        };
    };
};

class ACE_Medical_Menu {
    idd = IDD_MEDICAL_MENU;
    movingEnable = 1;
    enableSimulation = 1;
    onLoad = QUOTE(_this call FUNC(onMenuOpen));
    onUnload = QUOTE(_this call FUNC(onMenuClose));
    class controlsBackground {
        class Title: RscText {
            idc = IDC_TITLE;
            x = POS_X(1);
            y = POS_Y(0);
            w = POS_W(38);
            h = POS_H(1);
            colorBackground[] = GUI_BCG_COLOR;
            moving = 1;
        };
        class Center: RscText {
            idc = -1;
            x = POS_X(1);
            y = POS_Y(1.1);
            w = POS_W(38);
            h = POS_H(16);
            colorBackground[] = {0, 0, 0, 0.7};
        };
        class Bottom: Center {
            y = POS_Y(17.6);
            h = POS_H(9);
        };
    };
    class controls {
        class TreatmentHeader: RscText {
            idc = -1;
            style = ST_CENTER;
            text = CSTRING(EXAMINE_TREATMENT);
            x = POS_X(1);
            y = POS_Y(1.5);
            w = POS_W(12.33);
            h = POS_H(1);
            sizeEx = POS_H(1.2);
            colorText[] = {1, 1, 1, 0.9};
        };
        class StatusHeader: TreatmentHeader {
            text = CSTRING(STATUS);
            x = POS_X(13.33);
        };
        class OverviewHeader: TreatmentHeader {
            text = CSTRING(OVERVIEW);
            x = POS_X(25.66);
        };
        class HeaderLine: RscText {
            idc = -1;
            x = POS_X(1.5);
            y = POS_Y(2.6);
            w = POS_W(37);
            h = POS_H(0.03);
            colorBackground[] = {1, 1, 1, 0.5};
        };
        class Triage: RscActivePicture {
            idc = IDC_TRIAGE;
            text = QPATHTOF(data\categories\triage_card.paa);
            tooltip = CSTRING(ViewTriageCard);
            x = POS_X(1.5);
            y = POS_Y(2.73);
            w = POS_W(1.5);
            h = POS_H(1.5);
            color[] = {1, 1, 1, 1};
            soundClick[] = {"\a3\ui_f\data\sound\rscbutton\soundClick", 0.09, 1};
            soundEnter[] = {"\a3\ui_f\data\sound\rscbutton\soundEnter", 0.09, 1};
            soundEscape[] = {"\a3\ui_f\data\sound\rscbutton\soundEscape", 0.09, 1};
            soundPush[] = {"\a3\ui_f\data\sound\rscbutton\soundPush", 0.09, 1};
        };
        class Examine: Triage {
            idc = IDC_EXAMINE;
            text = QPATHTOF(data\categories\examine_patient.paa);
            tooltip = CSTRING(ExaminePatient);
            x = POS_X(3);
        };
        class Bandage: Triage {
            idc = IDC_BANDAGE;
            text = QPATHTOF(data\categories\bandage_fracture.paa);
            tooltip = CSTRING(BandageFractures);
            x = POS_X(4.5);
        };
        class Medication: Triage {
            idc = IDC_MEDICATION;
            text = QPATHTOF(data\categories\medication.paa);
            tooltip = CSTRING(Medication);
            x = POS_X(6);
        };
        class Airway: Triage {
            idc = IDC_AIRWAY;
            text = QPATHTOF(data\categories\airway_management.paa);
            tooltip = CSTRING(AirwayManagement);
            x = POS_X(7.5);
        };
        class Advanced: Triage {
            idc = IDC_ADVANCED;
            text = QPATHTOF(data\categories\advanced_treatment.paa);
            tooltip = CSTRING(AdvancedTreatment);
            x = POS_X(9);
        };
        class Drag: Triage {
            idc = IDC_DRAG;
            text = QPATHTOF(data\categories\carry.paa);
            tooltip = CSTRING(DrayCarry);
            x = POS_X(10.5);
        };
        class Toggle: Triage {
            idc = IDC_TOGGLE;
            text = QPATHTOF(data\categories\toggle_self.paa);
            tooltip = CSTRING(ToggleSelf);
            x = POS_X(12);
        };
        class TriageCard: RscListBox {
            idc = IDC_TRIAGE_CARD;
            x = POS_X(1.5);
            y = POS_Y(4.4);
            w = POS_W(12);
            h = POS_H(10);
            sizeEx = POS_H(0.7);
            colorSelect[] = {1, 1, 1, 1};
            colorSelect2[] = {1, 1, 1, 1};
            colorBackground[] = {0, 0, 0, 0.2};
            colorSelectBackground[] = {0, 0, 0, 0};
            colorSelectBackground2[] = {0, 0, 0, 0};
            colorScrollbar[] = {0.9, 0.9, 0.9, 1};
        };
        class Action1: RscButtonMenu {
            idc = IDC_ACTION_1;
            style = ST_LEFT;
            x = POS_X(1.5);
            y = POS_Y(4.4);
            w = POS_W(12);
            h = POS_H(1);
            size = POS_H(0.9);
            class Attributes {
                align = "center";
                color = "#E5E5E5";
                font = "PuristaLight";
                shadow = "false";
            };
        };
        class Action2: Action1 {
            idc = IDC_ACTION_2;
            y = POS_Y(5.5);
        };
        class Action3: Action1 {
            idc = IDC_ACTION_3;
            y = POS_Y(6.6);
        };
        class Action4: Action1 {
            idc = IDC_ACTION_4;
            y = POS_Y(7.7);
        };
        class Action5: Action1 {
            idc = IDC_ACTION_5;
            y = POS_Y(8.8);
        };
        class Action6: Action1 {
            idc = IDC_ACTION_6;
            y = POS_Y(9.9);
        };
        class Action7: Action1 {
            idc = IDC_ACTION_7;
            y = POS_Y(11);
        };
        class Action8: Action1 {
            idc = IDC_ACTION_8;
            y = POS_Y(12.1);
        };
        class Action9: Action1 {
            idc = IDC_ACTION_9;
            y = POS_Y(13.2);
        };
        class BodyImage: ACE_Medical_Body {};
        class SelectHead: RscButton {
            idc = -1;
            onButtonClick = QUOTE(GVAR(selectedBodyPart) = 0);
            tooltip = CSTRING(SelectHead);
            x = POS_X(18.8);
            y = POS_Y(3.2);
            w = POS_W(1.4);
            h = POS_H(1.8);
            colorFocused[] = {0, 0, 0, 0};
            colorBackground[] = {0, 0, 0, 0};
            colorBackgroundActive[] = {0, 0, 0, 0};
        };
        class SelectTorso: SelectHead {
            onButtonClick = QUOTE(GVAR(selectedBodyPart) = 1);
            tooltip = CSTRING(SelectTorso);
            x = POS_X(18.4);
            y = POS_Y(5);
            w = POS_W(2.2);
            h = POS_H(3.8);
        };
        class SelectArmLeft: SelectHead {
            onButtonClick = QUOTE(GVAR(selectedBodyPart) = 2);
            tooltip = CSTRING(SelectArmLeft);
            x = POS_X(20.6);
            y = POS_Y(5.1);
            w = POS_W(1.1);
            h = POS_H(4.6);
        };
        class SelectArmRight: SelectArmLeft {
            onButtonClick = QUOTE(GVAR(selectedBodyPart) = 3);
            tooltip = CSTRING(SelectArmRight);
            x = POS_X(17.4);
        };
        class SelectLegLeft: SelectHead {
            onButtonClick = QUOTE(GVAR(selectedBodyPart) = 4);
            tooltip = CSTRING(SelectLegLeft);
            x = POS_X(19.5);
            y = POS_Y(8.8);
            w = POS_W(1.1);
            h = POS_H(5.8);
        };
        class SelectLegRight: SelectLegLeft {
            onButtonClick = QUOTE(GVAR(selectedBodyPart) = 5);
            tooltip = CSTRING(SelectLegRight);
            x = POS_X(18.4);
        };
        class Injuries: TriageCard {
            idc = IDC_INJURIES;
            x = POS_X(25.66);
            w = POS_W(12.33);
        };
        class ActivityHeader: TreatmentHeader {
            text = CSTRING(ACTIVITY_LOG)
            y = POS_Y(17.6);
            w = POS_W(18.5);
            sizeEx = POS_H(1);
            colorText[] = {0.6, 0.7, 1, 1};
        };
        class QuickViewHeader: ActivityHeader {
            text = CSTRING(QUICK_VIEW);
            x = POS_X(19.5);
        };
        class LowerLine: HeaderLine {
            y = POS_Y(18.5);
        };
        class Activity: Injuries {
            idc = IDC_ACTIVITY;
            x = POS_X(1.5);
            y = POS_Y(18.5);
            w = POS_W(18.5);
            h = POS_H(6.5);
            colorBackground[] = {0, 0, 0, 0};
        };
        class QuickView: Activity {
            idc = IDC_QUICKVIEW;
            x = POS_X(21.5);
        };
        class TriageStatus: RscText {
            idc = IDC_TRIAGE_STATUS;
            style = ST_CENTER;
            x = POS_X(13.33);
            y = POS_Y(15.5);
            w = POS_W(12.33);
            h = POS_H(1.1);
            shadow = 0;
        };
        class SelectTriage: RscControlsGroupNoScrollbars {
            idc = IDC_TRIAGE_GROUP;
            x = POS_X(13.33);
            y = POS_Y(16.6);
            w = POS_W(12.33);
            h = POS_H(5);
            class controls {
                class None: RscButton {
                    idc = IDC_TRIAGE_NONE;
                    style = ST_CENTER;
                    text = ECSTRING(medical_treatment,Triage_Status_None);
                    x = 0;
                    y = 0;
                    w = POS_W(12.33);
                    h = POS_H(1);
                    shadow = 0;
                    colorFocused[] = {0, 0, 0, 0.9};
                    colorBackground[] = {0, 0, 0, 0.9};
                    colorBackgroundActive[] = {0, 0, 0, 0.9};
                };
                class Minor: None {
                    idc = IDC_TRIAGE_MINOR;
                    text = ECSTRING(medical_treatment,Triage_Status_Minor);
                    y = POS_H(1);
                    colorFocused[] = {0, 0.5, 0, 0.9};
                    colorBackground[] = {0, 0.5, 0, 0.9};
                    colorBackgroundActive[] = {0, 0.5, 0, 0.9};
                };
                class Delayed: None {
                    idc = IDC_TRIAGE_DELAYED;
                    text = ECSTRING(medical_treatment,Triage_Status_Delayed);
                    y = POS_H(2);
                    colorText[] = {0, 0, 0, 1};
                    colorFocused[] = {1, 0.84, 0, 0.9};
                    colorBackground[] = {1, 0.84, 0, 0.9};
                    colorBackgroundActive[] = {1, 0.84, 0, 0.9};
                };
                class Immediate: None {
                    idc = IDC_TRIAGE_IMMEDIATE;
                    text = ECSTRING(medical_treatment,Triage_Status_Immediate);
                    y = POS_H(3);
                    colorFocused[] = {1, 0, 0, 0.9};
                    colorBackground[] = {1, 0, 0, 0.9};
                    colorBackgroundActive[] = {1, 0, 0, 0.9};
                };
                class Deceased: None {
                    idc = IDC_TRIAGE_DECEASED;
                    text = ECSTRING(medical_treatment,Triage_Status_Deceased);
                    y = POS_H(4);
                };
            };
        };
    };
};
