#pragma once

#include "p3d/parser.hpp"

namespace ace {
    namespace p3d {
        parser::parser() { }
        parser::~parser() { }

        model_p parser::load(const std::string &filepath) {
            std::fstream filestream;
            model_p _model = nullptr;

            filestream.open(filepath, std::ios::binary | std::ios::in);
            if (!filestream.good()) {
                LOG(ERROR) << "Cannot open file";
                return _model;
            }

            _model = std::make_shared<model>(filestream, filepath);
            
            return _model;
        }
    }
}

