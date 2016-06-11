#pragma once

#include "shared.hpp"
#include "vector.hpp"

namespace ace {
    namespace p3d {
         
        class animate_bone {
        public:
            animate_bone() : index(-1) {}
            int32_t index;
            uint32_t lod;
            ace::vector3<float> axis_direction;
            ace::vector3<float> axis_position;
        };
        typedef std::shared_ptr<animate_bone> animate_bone_p;

        class animation {
        public:
            animation();
            animation(std::istream &, uint32_t);
            ~animation();

            uint32_t        type;
            std::string     name;  // "RightDoor"
            std::string     source;     // "rotor"
			float			min_value;
			float			max_value;
			float			min_phase;
			float			max_phase;
            uint32_t        junk;

			uint32_t		junk2;

			uint32_t		source_address;

			float			offset0;
			float			offset1;

			float			angle0;
			float			angle1;

			float			hide_value;

			ace::vector3<float> direct_axis_pos;
			ace::vector3<float> direct_axis_dir;

			float direct_angle;
			float direct_axis_offset;


            std::vector<animate_bone_p> bones;
            
            //uint32_t        null;
            //uint32_t        floats_count; //always 2
            //float           *floats;

            //float transforms[4];
            //float angles[2];
            //float offsets[2];
            //float hide;

            //ace::vector3<float> axis_pos;
            //ace::vector3<float> axis_dir;
        };
        typedef std::shared_ptr<animation> animation_p;
    }
}
