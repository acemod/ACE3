
class MFD {
  class AirplaneHUD {
    class Pos10Vector {
      type = "vector";
      pos0[] = {0.5,0.5};
      pos10[] = {0.85,0.85};
    };

    topLeft = "HUD_top_left";
    topRight = "HUD_top_right";
    bottomLeft = "HUD_bottom_left";
    borderLeft = 0;
    borderRight = 0;
    borderTop = 0;
    borderBottom = 0;
    color[] = {0.15,1,0.15,1};
    enableParallax = 0;
    class Bones {
      class PlaneOrientation {
        type = "fixed";
        pos[] = {0.5,0.54};
      };

      class GunnerAim {
        type = "vector";
        source = "weapon";
        pos0[] = {0,0};
        pos10[] = {0.011,0.0027};
      };

      class Target {
        type = "vector";
        source = "target";
        pos0[] = {0.5,0.5};
        pos10[] = {0.85,0.85};
      };

      class Velocity {
        type = "vector";
        source = "velocity";
        pos0[] = {0.5,0.5};
        pos10[] = {0.65,0.65};
      };

      class VspeedBone {
        type = "linear";
        source = "vspeed";
        sourceScale = 1;
        min = -10;
        max = 10;
        minPos[] = {0.93,0.2};
        maxPos[] = {0.93,0.8};
      };

      class RadarAltitudeBone {
        type = "linear";
        source = "altitudeAGL";
        sourceScale = 1;
        min = 0;
        max = 60;
        minPos[] = {0.965,0.2};
        maxPos[] = {0.965,0.8};
      };

      class HorizonBankRot {
        type = "rotational";
        source = "horizonBank";
        center[] = {0.5,0.5};
        min = -3.1416;
        max = 3.1416;
        minAngle = -180;
        maxAngle = 180;
        aspectRatio = 1;
      };

      class ForwardVec {
        type = "vector";
        source = "forward";
        pos0[] = {0,0};
        pos10[] = {0.25,0.25};
      };

      class WeaponAim {
        type = "vector";
        source = "weapon";
        pos0[] = {0.5,0.5};
        pos10[] = {0.75,0.75};
      };

      class Level0 {
        type = "horizon";
        pos0[] = {0.5,0.5};
        pos10[] = {0.78,0.78};
        angle = 0;
      };

      class LevelP5: Level0 {
        angle = 5;
      };

      class LevelM5: Level0 {
        angle = -5;
      };

      class LevelP10: Level0 {
        angle = 10;
      };

      class LevelM10: Level0 {
        angle = -10;
      };

      class LevelP15: Level0 {
        angle = 15;
      };

      class LevelM15: Level0 {
        angle = -15;
      };

      class LevelP20: Level0 {
        angle = 20;
      };

      class LevelM20: Level0 {
        angle = -20;
      };

      class LevelP25: Level0 {
        angle = 25;
      };

      class LevelM25: Level0 {
        angle = -25;
      };

      class LevelP30: Level0 {
        angle = 30;
      };

      class LevelM30: Level0 {
        angle = -30;
      };

      class LevelP35: Level0 {
        angle = 35;
      };

      class LevelM35: Level0 {
        angle = -35;
      };

      class LevelP40: Level0 {
        angle = 40;
      };

      class LevelM40: Level0 {
        angle = -40;
      };

      class LevelP45: Level0 {
        angle = 45;
      };

      class LevelM45: Level0 {
        angle = -45;
      };

      class LevelP50: Level0 {
        angle = 50;
      };

      class LevelM50: Level0 {
        angle = -50;
      };

      class LevelP55: Level0 {
        angle = 55;
      };

      class LevelM55: Level0 {
        angle = -55;
      };

      class LevelP60: Level0 {
        angle = 60;
      };

      class LevelM60: Level0 {
        angle = -60;
      };

      class LevelP65: Level0 {
        angle = 65;
      };

      class LevelM65: Level0 {
        angle = -65;
      };

      class LevelP70: Level0 {
        angle = 70;
      };

      class LevelM70: Level0 {
        angle = -70;
      };

      class LevelP75: Level0 {
        angle = 75;
      };

      class LevelM75: Level0 {
        angle = -75;
      };

      class LevelP80: Level0 {
        angle = 80;
      };

      class LevelM80: Level0 {
        angle = -80;
      };

      class LevelP85: Level0 {
        angle = 85;
      };

      class LevelM85: Level0 {
        angle = -85;
      };

      class LevelP90: Level0 {
        angle = 90;
      };

      class LevelM90: Level0 {
        angle = -90;
      };
    };

    class Draw {
      color[] = {0.18,1,0.18};
      alpha = 1;
      condition = "on";
      class Horizont {
        clipTL[] = {0.15,0.15};
        clipBR[] = {0.85,0.85};
        class Dimmed {
          class Level0 {
            type = "line";
            points[] = {
              {"Level0",{-0.42,0},1},
              {"Level0",{-0.08,0},1},{},
              {"Level0",{0.42,0},1},
              {"Level0",{0.08,0},1},{}
            };
          };

        /*class VALM_1_0 {
            type = "text";
            source = "static";
            text = 0;
            align = "left";
            scale = 1;
            sourceScale = 1;
            pos[] = {"Level0",{-0.23,-0.025},1};
            right[] = {"Level0",{-0.13,-0.025},1};
            down[] = {"Level0",{-0.23,0.025},1};
          };

          class VALM_2_0: VALM_1_0 {
            align = "right";
            pos[] = {"Level0",{0.22,-0.025},1};
            right[] = {"Level0",{0.31999999,-0.025},1};
            down[] = {"Level0",{0.22,0.025},1};
          };

          class LevelM5: Level0 {
            type = "line";
            width = 3.0;
            points[] = {
              {"LevelM5",{-0.2,-0.029999999},1},
              {"LevelM5",{-0.2,0},1},
              {"LevelM5",{-0.15000001,0},1},{},
              {"LevelM5",{-0.1,0},1},
              {"LevelM5",{-0.050000001,0},1},{},
              {"LevelM5",{0.050000001,0},1},
              {"LevelM5",{0.1,0},1},{},
              {"LevelM5",{0.15000001,0},1},
              {"LevelM5",{0.2,0},1},
              {"LevelM5",{0.2,-0.029999999},1}
            };
          };

          class VALM_1_5 {
            type = "text";
            source = "static";
            text = -5;
            align = "left";
            scale = 1;
            sourceScale = 1;
            pos[] = {"LevelM5",{-0.22,-0.085000001},1};
            right[] = {"LevelM5",{-0.17,-0.085000001},1};
            down[] = {"LevelM5",{-0.22,-0.035},1};
          };

          class VALM_2_5: VALM_1_5 {
            align = "right";
            pos[] = {"LevelM5",{0.22,-0.085000001},1};
            right[] = {"LevelM5",{0.27,-0.085000001},1};
            down[] = {"LevelM5",{0.22,-0.035},1};
          };

          class LevelP5: Level0 {
            type = "line";
            width = 3.0;
            points[] = {
              {"LevelP5",{-0.2,0.029999999},1},
              {"LevelP5",{-0.2,0},1},
              {"LevelP5",{-0.050000001,0},1},{},
              {"LevelP5",{0.050000001,0},1},
              {"LevelP5",{0.2,0},1},
              {"LevelP5",{0.2,0.029999999},1}
            };
          };

          class VALP_1_5 {
            type = "text";
            source = "static";
            text = "5";
            align = "left";
            scale = 1;
            sourceScale = 1;
            pos[] = {"LevelP5",{-0.22,0.035},1};
            right[] = {"LevelP5",{-0.17,0.035},1};
            down[] = {"LevelP5",{-0.22,0.085000001},1};
          };

          class VALP_2_5: VALP_1_5 {
            align = "right";
            pos[] = {"LevelP5",{0.22,0.035},1};
            right[] = {"LevelP5",{0.27,0.035},1};
            down[] = {"LevelP5",{0.22,0.085000001},1};
          };*/

          class LevelM10: Level0 {
            type = "line";
            width = 3;
            points[] = {
              {"LevelM10",{-0.2,-0.03},1},
              {"LevelM10",{-0.2,0},1},
              {"LevelM10",{-0.15,0},1},{},
              {"LevelM10",{-0.1,0},1},
              {"LevelM10",{-0.05,0},1},{},
              {"LevelM10",{0.05,0},1},
              {"LevelM10",{0.1,0},1},{},
              {"LevelM10",{0.15,0},1},
              {"LevelM10",{0.2,0},1},
              {"LevelM10",{0.2,-0.03},1}
            };
          };

          class VALM_1_10 {
            type = "text";
            source = "static";
            text = -10;
            align = "left";
            scale = 1;
            sourceScale = 1;
            pos[] = {"LevelM10",{-0.22,-0.085},1};
            right[] = {"LevelM10",{-0.17,-0.085},1};
            down[] = {"LevelM10",{-0.22,-0.035},1};
          };

          class VALM_2_10: VALM_1_10 {
            align = "right";
            pos[] = {"LevelM10",{0.22,-0.085},1};
            right[] = {"LevelM10",{0.27,-0.085},1};
            down[] = {"LevelM10",{0.22,-0.035},1};
          };

          class LevelP10: Level0 {
            type = "line";
            width = 3;
            points[] = {
              {"LevelP10",{-0.2,0.03},1},
              {"LevelP10",{-0.2,0},1},
              {"LevelP10",{-0.05,0},1},{},
              {"LevelP10",{0.05,0},1},
              {"LevelP10",{0.2,0},1},
              {"LevelP10",{0.2,0.03},1}
            };
          };

          class VALP_1_10 {
            type = "text";
            source = "static";
            text = "10";
            align = "left";
            scale = 1;
            sourceScale = 1;
            pos[] = {"LevelP10",{-0.22,0.035},1};
            right[] = {"LevelP10",{-0.17,0.035},1};
            down[] = {"LevelP10",{-0.22,0.085},1};
          };

          class VALP_2_10: VALP_1_10 {
            align = "right";
            pos[] = {"LevelP10",{0.22,0.035},1};
            right[] = {"LevelP10",{0.27,0.035},1};
            down[] = {"LevelP10",{0.22,0.085},1};
          };

        /*class LevelM15: Level0 {
            type = "line";
            width = 3.0;
            points[] = {
              {"LevelM15",{-0.2,-0.029999999},1},
              {"LevelM15",{-0.2,0},1},
              {"LevelM15",{-0.15000001,0},1},{},
              {"LevelM15",{-0.1,0},1},
              {"LevelM15",{-0.050000001,0},1},{},
              {"LevelM15",{0.050000001,0},1},
              {"LevelM15",{0.1,0},1},{},
              {"LevelM15",{0.15000001,0},1},
              {"LevelM15",{0.2,0},1},
              {"LevelM15",{0.2,-0.029999999},1}
            };
          };

          class VALM_1_15 {
            type = "text";
            source = "static";
            text = -15;
            align = "left";
            scale = 1;
            sourceScale = 1;
            pos[] = {"LevelM15",{-0.22,-0.085000001},1};
            right[] = {"LevelM15",{-0.17,-0.085000001},1};
            down[] = {"LevelM15",{-0.22,-0.035},1};
          };

          class VALM_2_15: VALM_1_15 {
            align = "right";
            pos[] = {"LevelM15",{0.22,-0.085000001},1};
            right[] = {"LevelM15",{0.27,-0.085000001},1};
            down[] = {"LevelM15",{0.22,-0.035},1};
          };

          class LevelP15: Level0 {
            type = "line";
            width = 3.0;
            points[] = {
              {"LevelP15",{-0.2,0.029999999},1},
              {"LevelP15",{-0.2,0},1},
              {"LevelP15",{-0.050000001,0},1},{},
              {"LevelP15",{0.050000001,0},1},
              {"LevelP15",{0.2,0},1},
              {"LevelP15",{0.2,0.029999999},1}
            };
          };

          class VALP_1_15 {
            type = "text";
            source = "static";
            text = "15";
            align = "left";
            scale = 1;
            sourceScale = 1;
            pos[] = {"LevelP15",{-0.22,0.035},1};
            right[] = {"LevelP15",{-0.17,0.035},1};
            down[] = {"LevelP15",{-0.22,0.085000001},1};
          };

          class VALP_2_15: VALP_1_15 {
            align = "right";
            pos[] = {"LevelP15",{0.22,0.035},1};
            right[] = {"LevelP15",{0.27,0.035},1};
            down[] = {"LevelP15",{0.22,0.085000001},1};
          };*/

          class LevelM20: Level0 {
            type = "line";
            width = 3;
            points[] = {
              {"LevelM20",{-0.2,-0.03},1},
              {"LevelM20",{-0.2,0},1},
              {"LevelM20",{-0.15,0},1},{},
              {"LevelM20",{-0.1,0},1},
              {"LevelM20",{-0.05,0},1},{},
              {"LevelM20",{0.05,0},1},
              {"LevelM20",{0.1,0},1},{},
              {"LevelM20",{0.15,0},1},
              {"LevelM20",{0.2,0},1},
              {"LevelM20",{0.2,-0.03},1}
            };
          };

          class VALM_1_20 {
            type = "text";
            source = "static";
            text = -20;
            align = "left";
            scale = 1;
            sourceScale = 1;
            pos[] = {"LevelM20",{-0.22,-0.085},1};
            right[] = {"LevelM20",{-0.17,-0.085},1};
            down[] = {"LevelM20",{-0.22,-0.035},1};
          };

          class VALM_2_20: VALM_1_20 {
            align = "right";
            pos[] = {"LevelM20",{0.22,-0.085},1};
            right[] = {"LevelM20",{0.27,-0.085},1};
            down[] = {"LevelM20",{0.22,-0.035},1};
          };

          class LevelP20: Level0 {
            type = "line";
            width = 3;
            points[] = {
              {"LevelP20",{-0.2,0.03},1},
              {"LevelP20",{-0.2,0},1},
              {"LevelP20",{-0.05,0},1},{},
              {"LevelP20",{0.05,0},1},
              {"LevelP20",{0.2,0},1},
              {"LevelP20",{0.2,0.03},1}
            };
          };

          class VALP_1_20 {
            type = "text";
            source = "static";
            text = "20";
            align = "left";
            scale = 1;
            sourceScale = 1;
            pos[] = {"LevelP20",{-0.22,0.035},1};
            right[] = {"LevelP20",{-0.17,0.035},1};
            down[] = {"LevelP20",{-0.22,0.085},1};
          };

          class VALP_2_20: VALP_1_20 {
            align = "right";
            pos[] = {"LevelP20",{0.22,0.035},1};
            right[] = {"LevelP20",{0.27,0.035},1};
            down[] = {"LevelP20",{0.22,0.085},1};
          };

        /*class LevelM25: Level0 {
            type = "line";
            width = 3.0;
            points[] = {
              {"LevelM25",{-0.2,-0.029999999},1},
              {"LevelM25",{-0.2,0},1},
              {"LevelM25",{-0.15000001,0},1},{},
              {"LevelM25",{-0.1,0},1},
              {"LevelM25",{-0.050000001,0},1},{},
              {"LevelM25",{0.050000001,0},1},
              {"LevelM25",{0.1,0},1},{},
              {"LevelM25",{0.15000001,0},1},
              {"LevelM25",{0.2,0},1},
              {"LevelM25",{0.2,-0.029999999},1}
            };
          };

          class VALM_1_25 {
            type = "text";
            source = "static";
            text = -25;
            align = "left";
            scale = 1;
            sourceScale = 1;
            pos[] = {"LevelM25",{-0.22,-0.085000001},1};
            right[] = {"LevelM25",{-0.17,-0.085000001},1};
            down[] = {"LevelM25",{-0.22,-0.035},1};
          };

          class VALM_2_25: VALM_1_25 {
            align = "right";
            pos[] = {"LevelM25",{0.22,-0.085000001},1};
            right[] = {"LevelM25",{0.27,-0.085000001},1};
            down[] = {"LevelM25",{0.22,-0.035},1};
          };

          class LevelP25: Level0 {
            type = "line";
            width = 3.0;
            points[] = {
              {"LevelP25",{-0.2,0.029999999},1},
              {"LevelP25",{-0.2,0},1},
              {"LevelP25",{-0.050000001,0},1},{},
              {"LevelP25",{0.050000001,0},1},
              {"LevelP25",{0.2,0},1},
              {"LevelP25",{0.2,0.029999999},1}
            };
          };

          class VALP_1_25 {
            type = "text";
            source = "static";
            text = "25";
            align = "left";
            scale = 1;
            sourceScale = 1;
            pos[] = {"LevelP25",{-0.22,0.035},1};
            right[] = {"LevelP25",{-0.17,0.035},1};
            down[] = {"LevelP25",{-0.22,0.085000001},1};
          };

          class VALP_2_25: VALP_1_25 {
            align = "right";
            pos[] = {"LevelP25",{0.22,0.035},1};
            right[] = {"LevelP25",{0.27,0.035},1};
            down[] = {"LevelP25",{0.22,0.085000001},1};
          };*/

          class LevelM30: Level0 {
            type = "line";
            width = 3;
            points[] = {
              {"LevelM30",{-0.2,-0.03},1},
              {"LevelM30",{-0.2,0},1},
              {"LevelM30",{-0.15,0},1},{},
              {"LevelM30",{-0.1,0},1},
              {"LevelM30",{-0.05,0},1},{},
              {"LevelM30",{0.05,0},1},
              {"LevelM30",{0.1,0},1},{},
              {"LevelM30",{0.15,0},1},
              {"LevelM30",{0.2,0},1},
              {"LevelM30",{0.2,-0.03},1}
            };
          };

          class VALM_1_30 {
            type = "text";
            source = "static";
            text = -30;
            align = "left";
            scale = 1;
            sourceScale = 1;
            pos[] = {"LevelM30",{-0.22,-0.085},1};
            right[] = {"LevelM30",{-0.17,-0.085},1};
            down[] = {"LevelM30",{-0.22,-0.035},1};
          };

          class VALM_2_30: VALM_1_30 {
            align = "right";
            pos[] = {"LevelM30",{0.22,-0.085},1};
            right[] = {"LevelM30",{0.27,-0.085},1};
            down[] = {"LevelM30",{0.22,-0.035},1};
          };

          class LevelP30: Level0 {
            type = "line";
            width = 3;
            points[] = {
              {"LevelP30",{-0.2,0.03},1},
              {"LevelP30",{-0.2,0},1},
              {"LevelP30",{-0.05,0},1},{},
              {"LevelP30",{0.05,0},1},
              {"LevelP30",{0.2,0},1},
              {"LevelP30",{0.2,0.03},1}
            };
          };

          class VALP_1_30 {
            type = "text";
            source = "static";
            text = "30";
            align = "left";
            scale = 1;
            sourceScale = 1;
            pos[] = {"LevelP30",{-0.22,0.035},1};
            right[] = {"LevelP30",{-0.17,0.035},1};
            down[] = {"LevelP30",{-0.22,0.085},1};
          };

          class VALP_2_30: VALP_1_30 {
            align = "right";
            pos[] = {"LevelP30",{0.22,0.035},1};
            right[] = {"LevelP30",{0.27,0.035},1};
            down[] = {"LevelP30",{0.22,0.085},1};
          };

        /*class LevelM35: Level0 {
            type = "line";
            width = 3.0;
            points[] = {
              {"LevelM35",{-0.2,-0.029999999},1},
              {"LevelM35",{-0.2,0},1},
              {"LevelM35",{-0.15000001,0},1},{},
              {"LevelM35",{-0.1,0},1},
              {"LevelM35",{-0.050000001,0},1},{},
              {"LevelM35",{0.050000001,0},1},
              {"LevelM35",{0.1,0},1},{},
              {"LevelM35",{0.15000001,0},1},
              {"LevelM35",{0.2,0},1},
              {"LevelM35",{0.2,-0.029999999},1}
            };
          };

          class VALM_1_35 {
            type = "text";
            source = "static";
            text = -35;
            align = "left";
            scale = 1;
            sourceScale = 1;
            pos[] = {"LevelM35",{-0.22,-0.085000001},1};
            right[] = {"LevelM35",{-0.17,-0.085000001},1};
            down[] = {"LevelM35",{-0.22,-0.035},1};
          };

          class VALM_2_35: VALM_1_35 {
            align = "right";
            pos[] = {"LevelM35",{0.22,-0.085000001},1};
            right[] = {"LevelM35",{0.27,-0.085000001},1};
            down[] = {"LevelM35",{0.22,-0.035},1};
          };

          class LevelP35: Level0 {
            type = "line";
            width = 3.0;
            points[] = {
              {"LevelP35",{-0.2,0.029999999},1},
              {"LevelP35",{-0.2,0},1},
              {"LevelP35",{-0.050000001,0},1},{},
              {"LevelP35",{0.050000001,0},1},
              {"LevelP35",{0.2,0},1},
              {"LevelP35",{0.2,0.029999999},1}
            };
          };

          class VALP_1_35 {
            type = "text";
            source = "static";
            text = "35";
            align = "left";
            scale = 1;
            sourceScale = 1;
            pos[] = {"LevelP35",{-0.22,0.035},1};
            right[] = {"LevelP35",{-0.17,0.035},1};
            down[] = {"LevelP35",{-0.22,0.085000001},1};
          };

          class VALP_2_35: VALP_1_35 {
            align = "right";
            pos[] = {"LevelP35",{0.22,0.035},1};
            right[] = {"LevelP35",{0.27,0.035},1};
            down[] = {"LevelP35",{0.22,0.085000001},1};
          };*/

          class LevelM40: Level0 {
            type = "line";
            width = 3;
            points[] = {
              {"LevelM40",{-0.2,-0.03},1},
              {"LevelM40",{-0.2,0},1},
              {"LevelM40",{-0.15,0},1},{},
              {"LevelM40",{-0.1,0},1},
              {"LevelM40",{-0.05,0},1},{},
              {"LevelM40",{0.05,0},1},
              {"LevelM40",{0.1,0},1},{},
              {"LevelM40",{0.15,0},1},
              {"LevelM40",{0.2,0},1},
              {"LevelM40",{0.2,-0.03},1}
            };
          };

          class VALM_1_40 {
            type = "text";
            source = "static";
            text = -40;
            align = "left";
            scale = 1;
            sourceScale = 1;
            pos[] = {"LevelM40",{-0.22,-0.085},1};
            right[] = {"LevelM40",{-0.17,-0.085},1};
            down[] = {"LevelM40",{-0.22,-0.035},1};
          };

          class VALM_2_40: VALM_1_40 {
            align = "right";
            pos[] = {"LevelM40",{0.22,-0.085},1};
            right[] = {"LevelM40",{0.27,-0.085},1};
            down[] = {"LevelM40",{0.22,-0.035},1};
          };

          class LevelP40: Level0 {
            type = "line";
            width = 3;
            points[] = {
              {"LevelP40",{-0.2,0.03},1},
              {"LevelP40",{-0.2,0},1},
              {"LevelP40",{-0.05,0},1},{},
              {"LevelP40",{0.05,0},1},
              {"LevelP40",{0.2,0},1},
              {"LevelP40",{0.2,0.03},1}
            };
          };

          class VALP_1_40 {
            type = "text";
            source = "static";
            text = "40";
            align = "left";
            scale = 1;
            sourceScale = 1;
            pos[] = {"LevelP40",{-0.22,0.035},1};
            right[] = {"LevelP40",{-0.17,0.035},1};
            down[] = {"LevelP40",{-0.22,0.085},1};
          };

          class VALP_2_40: VALP_1_40 {
            align = "right";
            pos[] = {"LevelP40",{0.22,0.035},1};
            right[] = {"LevelP40",{0.27,0.035},1};
            down[] = {"LevelP40",{0.22,0.085},1};
          };

        /*class LevelM45: Level0 {
            type = "line";
            width = 3.0;
            points[] = {
              {"LevelM45",{-0.2,-0.029999999},1},
              {"LevelM45",{-0.2,0},1},
              {"LevelM45",{-0.15000001,0},1},{},
              {"LevelM45",{-0.1,0},1},
              {"LevelM45",{-0.050000001,0},1},{},
              {"LevelM45",{0.050000001,0},1},
              {"LevelM45",{0.1,0},1},{},
              {"LevelM45",{0.15000001,0},1},
              {"LevelM45",{0.2,0},1},
              {"LevelM45",{0.2,-0.029999999},1}
            };
          };

          class VALM_1_45 {
            type = "text";
            source = "static";
            text = -45;
            align = "left";
            scale = 1;
            sourceScale = 1;
            pos[] = {"LevelM45",{-0.22,-0.085000001},1};
            right[] = {"LevelM45",{-0.17,-0.085000001},1};
            down[] = {"LevelM45",{-0.22,-0.035},1};
          };

          class VALM_2_45: VALM_1_45 {
            align = "right";
            pos[] = {"LevelM45",{0.22,-0.085000001},1};
            right[] = {"LevelM45",{0.27,-0.085000001},1};
            down[] = {"LevelM45",{0.22,-0.035},1};
          };

          class LevelP45: Level0 {
            type = "line";
            width = 3.0;
            points[] = {
              {"LevelP45",{-0.2,0.029999999},1},
              {"LevelP45",{-0.2,0},1},
              {"LevelP45",{-0.050000001,0},1},{},
              {"LevelP45",{0.050000001,0},1},
              {"LevelP45",{0.2,0},1},
              {"LevelP45",{0.2,0.029999999},1}
            };
          };

          class VALP_1_45 {
            type = "text";
            source = "static";
            text = "45";
            align = "left";
            scale = 1;
            sourceScale = 1;
            pos[] = {"LevelP45",{-0.22,0.035},1};
            right[] = {"LevelP45",{-0.17,0.035},1};
            down[] = {"LevelP45",{-0.22,0.085000001},1};
          };

          class VALP_2_45: VALP_1_45 {
            align = "right";
            pos[] = {"LevelP45",{0.22,0.035},1};
            right[] = {"LevelP45",{0.27,0.035},1};
            down[] = {"LevelP45",{0.22,0.085000001},1};
          };*/

          class LevelM50: Level0 {
            type = "line";
            width = 3;
            points[] = {
              {"LevelM50",{-0.2,-0.03},1},
              {"LevelM50",{-0.2,0},1},
              {"LevelM50",{-0.15,0},1},{},
              {"LevelM50",{-0.1,0},1},
              {"LevelM50",{-0.05,0},1},{},
              {"LevelM50",{0.05,0},1},
              {"LevelM50",{0.1,0},1},{},
              {"LevelM50",{0.15,0},1},
              {"LevelM50",{0.2,0},1},
              {"LevelM50",{0.2,-0.03},1}
            };
          };

          class VALM_1_50 {
            type = "text";
            source = "static";
            text = -50;
            align = "left";
            scale = 1;
            sourceScale = 1;
            pos[] = {"LevelM50",{-0.22,-0.085},1};
            right[] = {"LevelM50",{-0.17,-0.085},1};
            down[] = {"LevelM50",{-0.22,-0.035},1};
          };

          class VALM_2_50: VALM_1_50 {
            align = "right";
            pos[] = {"LevelM50",{0.22,-0.085},1};
            right[] = {"LevelM50",{0.27,-0.085},1};
            down[] = {"LevelM50",{0.22,-0.035},1};
          };

          class LevelP50: Level0 {
            type = "line";
            width = 3;
            points[] = {
              {"LevelP50",{-0.2,0.03},1},
              {"LevelP50",{-0.2,0},1},
              {"LevelP50",{-0.05,0},1},{},
              {"LevelP50",{0.05,0},1},
              {"LevelP50",{0.2,0},1},
              {"LevelP50",{0.2,0.03},1}
            };
          };

          class VALP_1_50 {
            type = "text";
            source = "static";
            text = "50";
            align = "left";
            scale = 1;
            sourceScale = 1;
            pos[] = {"LevelP50",{-0.22,0.035},1};
            right[] = {"LevelP50",{-0.17,0.035},1};
            down[] = {"LevelP50",{-0.22,0.085},1};
          };

          class VALP_2_50: VALP_1_50 {
            align = "right";
            pos[] = {"LevelP50",{0.22,0.035},1};
            right[] = {"LevelP50",{0.27,0.035},1};
            down[] = {"LevelP50",{0.22,0.085},1};
          };
        };
      };

      class StaticBank {
        type = "line";
        width = 3;
        points[] = {
          {{0.4782,0.251},1},
          {{0.4773,0.241},1},{},
          {{0.4566,0.2538},1},
          {{0.4549,0.2439},1},{},
          {{0.4353,0.2585},1},
          {{0.4301,0.2392},1},{},
          {{0.4145,0.2651},1},
          {{0.4111,0.2557},1},{},
          {{0.3943,0.2734},1},
          {{0.3901,0.2644},1},{},
          {{0.375,0.2835},1},
          {{0.365,0.2662},1},{},
          {{0.3232,0.3232},1},
          {{0.3091,0.3091},1},{},
          {{0.2835,0.375},1},
          {{0.2662,0.365},1},{},
          {{"0.5 + (0.5- 0.4782)",0.251},1},
          {{"0.5 + (0.5- 0.4773)",0.241},1},{},
          {{"0.5 + (0.5- 0.4566)",0.2538},1},
          {{"0.5 + (0.5- 0.4549)",0.2439},1},{},
          {{"0.5 + (0.5- 0.4353)",0.2585},1},
          {{"0.5 + (0.5- 0.4301)",0.2392},1},{},
          {{"0.5 + (0.5- 0.4145)",0.2651},1},
          {{"0.5 + (0.5- 0.4111)",0.2557},1},{},
          {{"0.5 + (0.5- 0.3943)",0.2734},1},
          {{"0.5 + (0.5- 0.3901)",0.2644},1},{},
          {{"0.5 + (0.5- 0.3750)",0.2835},1},
          {{"0.5 + (0.5- 0.3650)",0.2662},1},{},
          {{"0.5 + (0.5- 0.3232)",0.3232},1},
          {{"0.5 + (0.5- 0.3091)",0.3091},1},{},
          {{"0.5 + (0.5- 0.2835)",0.375},1},
          {{"0.5 + (0.5- 0.2662)",0.365},1},{},
          {{0.5,"0.5 - 0.25"},1},
          {{0.5,"0.5 - 0.28"},1}
        };
      };

      class HorizonBankRot {
        type = "line";
        width = 3;
        points[] = {
          {"HorizonBankRot",{0,0.25},1},
          {"HorizonBankRot",{-0.01,0.23},1},
          {"HorizonBankRot",{0.01,0.23},1},
          {"HorizonBankRot",{0,0.25},1}
        };
      };

      class Centerline {
        type = "line";
        width = 7;
        points[] = {
          {{0.45,0.5},1},
          {{0.48,0.5},1},
          {{0.49,0.525},1},
          {{0.5,0.5},1},
          {{0.51,0.525},1},
          {{0.52,0.5},1},
          {{0.55,0.5},1}
        };
      };

    /*class WeaponName {
        type = "text";
        source = "weapon";
        sourceScale = 1;
        align = "right";
        scale = 1;
        pos[] = {{0.03,0.86},1};
        right[] = {{0.07,0.86},1};
        down[] = {{0.03,0.90},1};
      };

      class AmmoCount {
        type = "text";
        source = "ammo";
        sourceScale = 1;
        align = "right";
        scale = 1;
        pos[] = {{0.03,0.89},1};
        right[] = {{0.07,0.89},1};
        down[] = {{0.03,0.93},1};
      };*/

      class LightsGroup {
        type = "group";
        condition = "lights";
        class LightsText {
          type = "text";
          source = "static";
          text = "LIGHTS";
          align = "right";
          scale = 1;
          pos[] = {{0.03,"0.53 + 0.055"},1};
          right[] = {{0.07,"0.53 + 0.055"},1};
          down[] = {{0.03,"0.53 + 0.095"},1};
        };
      };

      class CollisionLightsGroup {
        type = "group";
        condition = "collisionlights";
        class CollisionLightsText {
          type = "text";
          source = "static";
          text = "A-COL";
          align = "right";
          scale = 1;
          pos[] = {{0.03,"0.53 + 0.105"},1};
          right[] = {{0.07,"0.53 + 0.105"},1};
          down[] = {{0.03,"0.53 + 0.145"},1};
        };
      };

      class GearGroup {
        type = "group";
        condition = "ils";
        class GearText {
          type = "text";
          source = "static";
          text = "GEAR";
          align = "right";
          scale = 1;
          pos[] = {{0.03,"0.53 + 0.155"},1};
          right[] = {{0.07,"0.53 + 0.155"},1};
          down[] = {{0.03,"0.53 + 0.195"},1};
        };
      };

      class SpeedNumber {
        type = "text";
        align = "right";
        scale = 1;
        source = "speed";
        sourceScale = 3.6;
        pos[] = {{0.03,0.475},1};
        right[] = {{0.08,0.475},1};
        down[] = {{0.03,0.525},1};
      };

      class TorqueNumber {
        type = "text";
        align = "left";
        scale = 1;
        source = "rtdRotorTorque";
        sourceScale = 318;
        pos[] = {{0.065,0.175},1};
        right[] = {{0.115,0.175},1};
        down[] = {{0.065,0.225},1};
      };

      class Torquetext {
        type = "text";
        source = "static";
        text = "%";
        align = "right";
        scale = 1;
        pos[] = {{0.07,0.175},1};
        right[] = {{0.12,0.175},1};
        down[] = {{0.07,0.225},1};
      };

      class AltNumber {
        type = "text";
        align = "right";
        scale = 1;
        source = "altitudeAGL";
        sourceScale = 1;
        pos[] = {{0.83,0.475},1};
        right[] = {{0.88,0.475},1};
        down[] = {{0.83,0.525},1};
      };

      class ASLNumber {
        type = "text";
        source = "altitudeASL";
        sourceScale = 1;
        align = "right";
        scale = 1;
        pos[] = {{0.835,0.18},1};
        right[] = {{0.875,0.18},1};
        down[] = {{0.835,0.22},1};
      };

      class VspeedScalePosta {
        type = "line";
        width = 5;
        points[] = {
          {{0.98,0.2},1},
          {{1,0.2},1},{},
          {{0.93,0.2},1},
          {{0.95,0.2},1},{},
          {{0.98,0.35},1},
          {{1,0.35},1},{},
          {{0.93,0.35},1},
          {{0.95,0.35},1},{},
          {{0.94,0.38},1},
          {{0.95,0.38},1},{},
          {{0.94,0.41},1},
          {{0.95,0.41},1},{},
          {{0.94,0.44},1},
          {{0.95,0.44},1},{},
          {{0.94,0.47},1},
          {{0.95,0.47},1},{},
          {{0.98,0.5},1},
          {{1,0.5},1},{},
          {{0.93,0.5},1},
          {{0.95,0.5},1},{},
          {{0.94,0.53},1},
          {{0.95,0.53},1},{},
          {{0.94,0.56},1},
          {{0.95,0.56},1},{},
          {{0.94,0.59},1},
          {{0.95,0.59},1},{},
          {{0.94,0.62},1},
          {{0.95,0.62},1},{},
          {{0.98,0.65},1},
          {{1,0.65},1},{},
          {{0.93,0.65},1},
          {{0.95,0.65},1},{},
          {{0.99,0.68},1},
          {{0.98,0.68},1},{},
          {{0.99,0.71},1},
          {{0.98,0.71},1},{},
          {{0.99,0.74},1},
          {{0.98,0.74},1},{},
          {{0.99,0.77},1},
          {{0.98,0.77},1},{},
          {{0.98,0.8},1},
          {{1,0.8},1},{},
          {{0.93,0.8},1},
          {{0.95,0.8},1},{}
        };
      };

      class RadarAltitudeBand {
        clipTL[] = {0,0.2};
        clipBR[] = {1,0.8};
        class radarbanda {
          type = "line";
          width = 17;
          points[] = {
            {"RadarAltitudeBone",{0,0},1},
            {"RadarAltitudeBone",{0,0.6},1}
          };
        };
      };

      class VspeedBand {
        type = "line";
        width = 3;
        points[] = {
          {"VspeedBone",{-0.01,0},1},
          {"VspeedBone",{-0.025,-0.015},1},
          {"VspeedBone",{-0.025,0.015},1},
          {"VspeedBone",{-0.01,0},1},{}
        };
      };

      class HeadingNumber: SpeedNumber {
        source = "heading";
        sourceScale = 1;
        align = "center";
        pos[] = {{0.5,0.01},1};
        right[] = {{0.56,0.01},1};
        down[] = {{0.5,0.06},1};
      };

      class Center_box {
        type = "line";
        width = 3;
        points[] = {
          {{0.44,0.005},1},
          {{"0.44 + 0.12",0.005},1},
          {{"0.44 + 0.12","0.005 + 0.06"},1},
          {{0.44,"0.005 + 0.06"},1},
          {{0.44,0.005},1}
        };
      };

      class HeadingArrow {
        type = "line";
        width = 7;
        points[] = {
          {{"0.5","0.128 + 0.03"},1},
          {{0.5,0.128},1}
        };
      };

      class HeadingScale {
        type = "scale";
        horizontal = 1;
        source = "heading";
        sourceScale = 1;
        width = 5;
        top = 0.12;
        center = 0.5;
        bottom = 0.88;
        lineXleft = "0.03 + 0.085";
        lineYright = "0.02 + 0.085";
        lineXleftMajor = "0.04 + 0.085";
        lineYrightMajor = "0.02 + 0.085";
        majorLineEach = 3;
        numberEach = 3;
        step = 10;
        stepSize = "0.05";
        align = "center";
        scale = 1;
        pos[] = {0.119,"0.0 + 0.065"};
        right[] = {0.159,"0.0 + 0.065"};
        down[] = {0.119,"0.04 + 0.065"};
      };

      class Fuel_Text {
        type = "text";
        source = "static";
        text = "Fuel";
        align = "right";
        scale = 1;
        pos[] = {{0.85,0.86},1};
        right[] = {{0.89,0.86},1};
        down[] = {{0.85,0.9},1};
      };

      class Fuel_Number {
        type = "text";
        source = "fuel";
        sourceScale = 100;
        align = "right";
        scale = 1;
        pos[] = {{0.92,0.86},1};
        right[] = {{0.96,0.86},1};
        down[] = {{0.92,0.9},1};
      };
    };

    helmetMountedDisplay = 1;
    helmetPosition[] = {-0.04,0.04,0.1};
    helmetRight[] = {0.08,0,0};
    helmetDown[] = {0,-0.08,0};
  };

  class LittleHUD {
    class Pos10Vector {
      type = "vector";
      pos0[] = {0.5,0.5};
      pos10[] = {0.722,0.722};
    };

    topLeft = "HUD_top_left";
    topRight = "HUD_top_right";
    bottomLeft = "HUD_bottom_left";
    borderLeft = 0;
    borderRight = 0;
    borderTop = 0;
    borderBottom = 0;
    color[] = {0.15,1,0.15,1};
    enableParallax = 0;
    class Bones {
      class Velocity {
        type = "vector";
        source = "velocity";
        pos0[] = {0.5,0.5};
        pos10[] = {0.75,0.75};
      };

      class ForwardVec1 {
        type = "vector";
        source = "forward";
        pos0[] = {0,0};
        pos10[] = {0.25,0.25};
      };

      class ForwardVec {
        type = "vector";
        source = "forward";
        pos0[] = {0,0};
        pos10[] = {0.253,0.253};
      };

      class WeaponAim {
        type = "vector";
        source = "weapon";
        pos0[] = {0.5,0.5};
        pos10[] = {0.753,0.753};
      };

      class WeaponAim1 {
        type = "vector";
        source = "weapon";
        pos0[] = {0,0};
        pos10[] = {0.253,0.23};
      };

      class Target {
        type = "vector";
        source = "target";
        pos0[] = {0.5,0.5};
        pos10[] = {0.753,0.753};
      };

      class RadarContact {
        type = "fixed";
        pos[] = {0,0};
      };
    };

    class Draw {
      color[] = {0.18,1,0.18};
      alpha = 1;
      condition = "on";
      class PlaneMovementCrosshair {
        type = "line";
        width = 7;
        points[] = {
          {"ForwardVec1",1,"Velocity",1,{0,-0.02},1},
          {"ForwardVec1",1,"Velocity",1,{0.01,-0.01732},1},
          {"ForwardVec1",1,"Velocity",1,{0.01732,-0.01},1},
          {"ForwardVec1",1,"Velocity",1,{0.02,0},1},
          {"ForwardVec1",1,"Velocity",1,{0.01732,0.01},1},
          {"ForwardVec1",1,"Velocity",1,{0.01,0.01732},1},
          {"ForwardVec1",1,"Velocity",1,{0,0.02},1},
          {"ForwardVec1",1,"Velocity",1,{-0.01,0.01732},1},
          {"ForwardVec1",1,"Velocity",1,{-0.01732,0.01},1},
          {"ForwardVec1",1,"Velocity",1,{-0.02,0},1},
          {"ForwardVec1",1,"Velocity",1,{-0.01732,-0.01},1},
          {"ForwardVec1",1,"Velocity",1,{-0.01,-0.01732},1},
          {"ForwardVec1",1,"Velocity",1,{0,-0.02},1},{},
          {"ForwardVec1",1,"Velocity",1,{0.04,0},1},
          {"ForwardVec1",1,"Velocity",1,{0.02,0},1},{},
          {"ForwardVec1",1,"Velocity",1,{-0.04,0},1},
          {"ForwardVec1",1,"Velocity",1,{-0.02,0},1},{},
          {"ForwardVec1",1,"Velocity",1,{0,-0.04},1},
          {"ForwardVec1",1,"Velocity",1,{0,-0.02},1}
        };
      };
    };

    helmetMountedDisplay = 1;
    helmetPosition[] = {-0.035,0.035,0.1};
    helmetRight[] = {0.07,0,0};
    helmetDown[] = {0,-0.07,0};
  };
};
