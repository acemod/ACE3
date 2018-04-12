class Cfg3DEN {
    class Mission {
        class GVAR(DummyCategory) {
            displayName = "Dummy attribute, should never show up";
            class AttributeCategories {
                class ACE3_Arsenal {
                    class Attributes {
                        class GVAR(DefaultLoadoutsListAttribute) {
                            property = QGVAR(DefaultLoadoutsListAttribute);
                            value = 0;
                            expression = "if !(is3DEN) then {ace_arsenal_defaultLoadoutsList = _value};";
                            defaultValue = "[]";
                            validate = "none";
                            wikiType = "[[Array]]";
                        };
                    };
                };
            };
        };
    };
    class Attributes {
        class GVAR(attribute): ctrlControlsGroupNoScrollbars {
            idc = -1;
            x = QUOTE(0);
            y = QUOTE(0);
            w = QUOTE(130 * ATTRIBUTE_W);
            h = QUOTE(106.83 * ATTRIBUTE_H);
            attributeLoad = QUOTE([ARR_2(_this,_value)] call FUNC(attributeLoad));
            attributeSave = "";
            class controls {
                class ModeTitle: ctrlStatic {
                    idc = -1;
                    text = "Mode";
                    x = QUOTE(5 * ATTRIBUTE_W);
                    y = QUOTE(0);
                    w = QUOTE(125 * ATTRIBUTE_W);
                    h = QUOTE(5 * ATTRIBUTE_H);
                };
                class Mode: ctrlToolbox {
                    idc = IDC_ATTRIBUTE_MODE;
                    x = QUOTE(5 * ATTRIBUTE_W);
                    y = QUOTE(5 * ATTRIBUTE_H);
                    w = QUOTE(125 * ATTRIBUTE_W);
                    h = QUOTE(5 * ATTRIBUTE_H);
                    rows = 1;
                    columns = 2;
                    strings[] = {"Whitelist", "Blacklist"};
                };
                class ItemsTitle: ModeTitle {
                    text = "Items";
                    y = QUOTE(10 * ATTRIBUTE_H);
                };
                class Category: ctrlToolboxPictureKeepAspect {
                    idc = IDC_ATTRIBUTE_CATEGORY;
                    x = QUOTE(5 * ATTRIBUTE_W);
                    y = QUOTE(15 * ATTRIBUTE_H);
                    w = QUOTE(125 * ATTRIBUTE_W);
                    h = QUOTE(20.83 * ATTRIBUTE_H);
                    rows = 2;
                    columns = 12;
                    strings[] = {
                        "\a3\Ui_F_Curator\Data\RscCommon\RscAttributeInventory\filter_0_ca.paa",
                        "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\PrimaryWeapon_ca.paa",
                        "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Handgun_ca.paa",
                        "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\SecondaryWeapon_ca.paa",
                        "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa",
                        "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemAcc_ca.paa",
                        "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemMuzzle_ca.paa",
                        "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemBipod_ca.paa",
                        "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMagAll_ca.paa",
                        "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Headgear_ca.paa",
                        "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Uniform_ca.paa",
                        "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Vest_ca.paa",
                        "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Backpack_ca.paa",
                        "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Goggles_ca.paa",
                        "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\NVGs_ca.paa",
                        "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Binoculars_ca.paa",
                        "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Map_ca.paa",
                        "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Compass_ca.paa",
                        "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Radio_ca.paa",
                        "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Watch_ca.paa",
                        "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\GPS_ca.paa",
                        "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoThrow_ca.paa",
                        "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoPut_ca.paa",
                        "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMisc_ca.paa"
                    };
                };
                class ListBackground: ctrlStatic {
                    idc = -1;
                    x = QUOTE(5 * ATTRIBUTE_W);
                    y = QUOTE(35.83 * ATTRIBUTE_H);
                    w = QUOTE(125 * ATTRIBUTE_W);
                    h = QUOTE(65 * ATTRIBUTE_H);
                    colorBackground[] = {1, 1, 1, 0.1};
                };
                class List: ctrlListNBox {
                    idc = IDC_ATTRIBUTE_LIST;
                    idcLeft = IDC_ATTRIBUTE_LIST_LEFT;
                    idcRight = IDC_ATTRIBUTE_LIST_RIGHT;
                    x = QUOTE(5 * ATTRIBUTE_W);
                    y = QUOTE(35.83 * ATTRIBUTE_H);
                    w = QUOTE(125 * ATTRIBUTE_W);
                    h = QUOTE(65 * ATTRIBUTE_H);
                    drawSideArrows = 1;
                    disableOverflow = 1;
                    columns[] = {0.05, 0.15, 0.85};
                };
                class ArrowLeft: ctrlButton {
                    idc = IDC_ATTRIBUTE_LIST_LEFT;
                    text = SYMBOL_ITEM_NONE;
                    font = "RobotoCondensedBold";
                    x = QUOTE(-1);
                    y = QUOTE(-1);
                    w = QUOTE(5 * ATTRIBUTE_W);
                    H = QUOTE(5 * ATTRIBUTE_H);
                };
                class ArrowRight: ArrowLeft {
                    idc = IDC_ATTRIBUTE_LIST_RIGHT;
                    text = SYMBOL_ITEM_VIRTUAL;
                };
                class SearchButton: ctrlButtonPicture {
                    idc = IDC_ATTRIBUTE_SEARCH_BUTTON;
                    text = "\a3\Ui_f\data\GUI\RscCommon\RscButtonSearch\search_start_ca.paa";
                    x = QUOTE(5 * ATTRIBUTE_W);
                    y = QUOTE(101.83 * ATTRIBUTE_H);
                    w = QUOTE(5 * ATTRIBUTE_W);
                    h = QUOTE(5 * ATTRIBUTE_H);
                    colorBackground[] = {0, 0, 0, 0.5};
                };
                class SearchBar: ctrlEdit {
                    idc = IDC_ATTRIBUTE_SEARCHBAR;
                    x = QUOTE(11 * ATTRIBUTE_W);
                    y = QUOTE(101.83 * ATTRIBUTE_H);
                    w = QUOTE(55 * ATTRIBUTE_W);
                    h = QUOTE(5 * ATTRIBUTE_H);
                };
                class ClearButton: ctrlButton {
                    idc = IDC_ATTRIBUTE_CLEAR_BUTTON;
                    text = "Clear";
                    x = QUOTE(105 * ATTRIBUTE_W);
                    y = QUOTE(101.83 * ATTRIBUTE_H);
                    w = QUOTE(25 * ATTRIBUTE_W);
                    h = QUOTE(5 * ATTRIBUTE_H);
                };
            };
        };
    };
    class Object {
        class AttributeCategories {
            class ADDON {
                displayName = CSTRING(Mission);
                collapsed = 1;
                class Attributes {
                    class ADDON {
                        property = QGVAR(attribute);
                        control = QGVAR(attribute);
                        displayName = CSTRING(Mission);
                        tooltip = "";
                        expression = QUOTE(true);
                        defaultValue = "[[], 0]";
                        condition = "1";
                        wikiType = "[[Array]]";
                    };
                };
            };
        };
    };
};
