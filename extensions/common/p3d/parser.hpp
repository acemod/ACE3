#pragma once

#include "shared.hpp"
#include "p3d/model.hpp"


namespace ace {
    namespace p3d {
        class parser {
        public:
            parser();
            ~parser();

            model_p load(const std::string &);
        };
    }
}
