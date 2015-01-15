      class controls {
        class ButtonPlayer: RscActiveText {
          text = "";
          w = 0;
          h = 0;
          sizeEx = 0;
          onButtonClick = "";
        };
        class CA_PlayerName: RscText {
          x = "2 *    ( ((safezoneW / safezoneH) min 1.2) / 40)";
        };
        class ProfilePicture: RscPicture {
          x = "13.5 * ( ((safezoneW / safezoneH) min 1.2) / 40)";
        };
        class ProfileBackground: RscText {
          x = "13.3 * ( ((safezoneW / safezoneH) min 1.2) / 40)";
        };
        class Separator1: RscPicture {
          x = "14.5 * ( ((safezoneW / safezoneH) min 1.2) / 40)";
        };
        class ColorBlack: RscButton {
          idc = 36732;
          x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
          y = "0.25 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
          w = "0.3 * (((safezoneW / safezoneH) min 1.2) / 40)";
          h = "1.00 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
          colorBackground[] = {0.2,0.2,0.2,1};
          colorBackgroundActive[] = {0,0,0,1};
          colorFocused[] = {0,0,0,1};
          onButtonClick = "missionNamespace setVariable [""AGM_Map_drawColor"", ""ColorBlack""]";
        };
        class ColorRed: RscButton {
          idc = 36733;
          x = "0.3 * (((safezoneW / safezoneH) min 1.2) / 40)";
          y = "0.25 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
          w = "0.3 * (((safezoneW / safezoneH) min 1.2) / 40)";
          h = "1.00 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
          colorBackground[] = {0.8,0.2,0.2,1};
          colorBackgroundActive[] = {1,0,0,1};
          colorFocused[] = {1,0,0,1};
          onButtonClick = "missionNamespace setVariable [""AGM_Map_drawColor"", ""ColorRed""]";
        };
        class ColorGreen: RscButton {
          idc = 36734;
          x = "0.6 * (((safezoneW / safezoneH) min 1.2) / 40)";
          y = "0.25 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
          w = "0.3 * (((safezoneW / safezoneH) min 1.2) / 40)";
          h = "1.00 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
          colorBackground[] = {0.2,0.8,0.2,1};
          colorBackgroundActive[] = {0,1,0,1};
          colorFocused[] = {0,1,0,1};
          onButtonClick = "missionNamespace setVariable [""AGM_Map_drawColor"", ""ColorGreen""]";
        };
        class ColorBlue: RscButton {
          idc = 36735;
          x = "0.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
          y = "0.25 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
          w = "0.3 * (((safezoneW / safezoneH) min 1.2) / 40)";
          h = "1.00 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
          colorBackground[] = {0.2,0.2,0.8,1};
          colorBackgroundActive[] = {0,0,1,1};
          colorFocused[] = {0,0,1,1};
          onButtonClick = "missionNamespace setVariable [""AGM_Map_drawColor"", ""ColorBlue""]";
        };
        class ColorYellow: RscButton {
          idc = 36736;
          x = "1.2 * (((safezoneW / safezoneH) min 1.2) / 40)";
          y = "0.25 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
          w = "0.3 * (((safezoneW / safezoneH) min 1.2) / 40)";
          h = "1.00 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
          colorBackground[] = {0.8,0.8,0.2,1};
          colorBackgroundActive[] = {1,1,0,1};
          colorFocused[] = {1,1,0,1};
          onButtonClick = "missionNamespace setVariable [""AGM_Map_drawColor"", ""ColorYellow""]";
        };
        class ColorWhite: RscButton {
          idc = 36737;
          x = "1.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
          y = "0.25 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
          w = "0.3 * (((safezoneW / safezoneH) min 1.2) / 40)";
          h = "1.00 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
          colorBackground[] = {0.8,0.8,0.8,1};
          colorBackgroundActive[] = {1,1,1,1};
          colorFocused[] = {1,1,1,1};
          onButtonClick = "missionNamespace setVariable [""AGM_Map_drawColor"", ""ColorWhite""]";
        };
      };
