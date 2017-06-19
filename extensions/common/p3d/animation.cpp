#pragma once

#include "p3d/animation.hpp"
#include "read_helpers.hpp"

namespace ace {
    namespace p3d {
        animation::animation() {}
        animation::animation(std::istream &stream_, uint32_t version = 68) {
            float tvalue = 0;
         
            stream_.read((char *)&type, sizeof(uint32_t));

            READ_STRING(name);
            READ_STRING(source);

			stream_.read((char *)&min_value, sizeof(float));
			stream_.read((char *)&max_value, sizeof(float));
			stream_.read((char *)&min_phase, sizeof(float));
			stream_.read((char *)&max_phase, sizeof(float));

			stream_.read((char *)&junk, sizeof(uint32_t));
			stream_.read((char *)&junk2, sizeof(uint32_t));
			stream_.read((char *)&source_address, sizeof(uint32_t));

            // This always adds up to 2*4 more bytes unless its direct apparently
			switch (type) {
				// rotations
			case 0:
			case 1:
			case 2:
			case 3:
				stream_.read((char *)&angle0, sizeof(float));
				stream_.read((char *)&angle1, sizeof(float));
				break;
				// translations
			case 4:
			case 5:
			case 6:
			case 7: // also do the hide here, it'll always be 0
				stream_.read((char *)&offset0, sizeof(float));
				stream_.read((char *)&offset1, sizeof(float));
				break;
			case 8:
				float pos[3];
				stream_.read((char *)&pos, sizeof(float) * 3);
				direct_axis_pos = ace::vector3<float>(pos);
				float dir[3];
				stream_.read((char *)&dir, sizeof(float) * 3);
				direct_axis_dir = ace::vector3<float>(dir);
				stream_.read((char *)&direct_angle, sizeof(float));
				stream_.read((char *)&direct_axis_offset, sizeof(float));
				break;
			case 9: // fucking hides...
				stream_.read((char *)&hide_value, sizeof(float));
				stream_.read((char *)&offset1, sizeof(float)); // this is junk throw it in offset1 for hides
                break;
			default:
				stream_.read((char *)&offset0, sizeof(float));
				stream_.read((char *)&offset1, sizeof(float));
                break;
			}
           

            LOG(DEBUG) << "Animation loaded: " << name << ", source=" << source;
        }
        
                animation::~animation() {
        }
    }
}
