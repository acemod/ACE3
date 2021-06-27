class CfgWrapperUI {
    class Cursors {
        class Arrow;
        class GVAR(blank): Arrow {
            // This texture has a single 99% transparent pixel and is otherwise blank
            // The single pixel is necessary, otherwise appears as a black 32 px square
            texture = QPATHTOF(data\blank_cursor_ca.paa);
        };
    };
};
