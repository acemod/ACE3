#pragma once

#include "p3d/animation.hpp"
#include "read_helpers.hpp"
#include "..\simulation\object.hpp"

namespace ace {
    namespace p3d {
        animation::animation() {}
        animation::animation(std::istream &stream_, uint32_t version = 68) {
            float tvalue = 0;
         
            stream_.read((char *)&type, sizeof(uint32_t));

            READ_STRING(name);
            READ_STRING(source);

            stream_.read((char *)&minmax_value, sizeof(float) * 2);
            stream_.read((char *)&minmax_phase, sizeof(float) * 2);
            stream_.read((char *)&source_address, sizeof(uint32_t));
           // stream_.read((char *)&null, sizeof(uint32_t));

           // stream_.read((char *)&floats_count, sizeof(uint32_t));
           // LOG(DEBUG) << stream_.tellg();
           // if (floats_count) {
           //     floats = new float[floats_count];
           //     stream_.read((char *)floats, floats_count * sizeof(float));
           // }

            uint32_t transforms_count = 4;
            for (int x = 0; x < transforms_count; x++) {
                float tvalue;
                stream_.read((char *)&tvalue, sizeof(float));
                transforms.push_back(tvalue);
            }

            LOG(DEBUG) << "Animation loaded: " << name << ", source=" << source;
        }
        
                animation::~animation() {
        }
    };
};