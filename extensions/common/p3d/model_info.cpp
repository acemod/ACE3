#include "p3d/model_info.hpp"
#include "compressed.hpp"
#include "read_helpers.hpp"

namespace ace {
    namespace p3d {
        model_info::model_info() :
            raw_resolutions(nullptr), u_floats_1(nullptr), default_indicators(nullptr)
        { }

        model_info::model_info(std::istream & stream_, const uint32_t lod_count, uint32_t version)
            : raw_resolutions(nullptr), u_floats_1(nullptr), default_indicators(nullptr) {
            
            raw_resolutions = new float[lod_count];
            stream_.read((char *)raw_resolutions, sizeof(float) * lod_count);
            // Get them to parsable int values
            for (int x = 0; x < lod_count; x++) {
                resolutions.push_back(*(int *)&raw_resolutions[x]);
            }

            stream_.read((char *)&index, sizeof(uint32_t));
            stream_.read((char *)&lod_sphere_mem, sizeof(float));
            stream_.read((char *)&lod_sphere_geo, sizeof(float));
            stream_.read((char *)&point_flags, sizeof(uint32_t) * 3);

            offset_1 = ace::vector3<float>(stream_);

            stream_.read((char *)&map_icon_color, sizeof(uint32_t));
            stream_.read((char *)&map_selected_color, sizeof(uint32_t));
            stream_.read((char *)&view_density, sizeof(float));

            bbox_min_pos = ace::vector3<float>(stream_);
            bbox_max_pos = ace::vector3<float>(stream_);

            center_of_gravity = ace::vector3<float>(stream_);
            offset_2 = ace::vector3<float>(stream_);
            cog_offset = ace::vector3<float>(stream_);

            mass_vectors[0] = ace::vector3<float>(stream_);
            mass_vectors[1] = ace::vector3<float>(stream_);
            mass_vectors[2] = ace::vector3<float>(stream_);

            stream_.read((char *)&thermal_profile_2, sizeof(uint8_t) * 24);

            READ_BOOL(autocenter);
            READ_BOOL(lock_autocenter);
            READ_BOOL(allow_occlude);
            READ_BOOL(allow_occluded);
            READ_BOOL(allow_animation);

            stream_.read((char *)&u_bytes_1, sizeof(uint8_t) * 6);
            stream_.read((char *)&thermal_profile, sizeof(uint8_t) * 24);
            stream_.read((char *)&u_long_1, sizeof(uint32_t));

            // Parse the full skeletal structure
            skeleton = std::make_shared<ace::p3d::skeleton>(stream_, lod_count);

            stream_.read((char *)&u_byte_1, sizeof(uint8_t));

            compressed<float> u_floats_1(stream_, true, false, version);

            stream_.read((char *)&mass, sizeof(float));
            stream_.read((char *)&mass_reciprocal, sizeof(float));
            stream_.read((char *)&mass_alt, sizeof(float));
            stream_.read((char *)&mass_alt_reciprocoal, sizeof(float));

            stream_.read((char *)&u_bytes_1, sizeof(uint8_t) * 14);

            //
            stream_.read((char *)&u_long_1, sizeof(uint32_t));
            READ_BOOL(u_bool_1);
            //if (u_bool_1) {

            READ_STRING(class_type);
            READ_STRING(destruct_type);
            READ_BOOL(u_bool_2);
            stream_.read((char *)&u_long_2, sizeof(uint32_t));

            stream_.seekg(sizeof(uint8_t) * 12 * lod_count, stream_.cur);
        }

        model_info::~model_info() {
            if (raw_resolutions)
                delete[] raw_resolutions;
            if (u_floats_1)
                delete[] u_floats_1;
            if (default_indicators)
                delete[] default_indicators;
        }
    }
}
