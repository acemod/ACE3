#pragma once

#include "shared.hpp"

#include <string>
#include <vector>
#include <map>

#include "p3d\model.hpp"

namespace ace {
    namespace simulation {

        class vertex;
        typedef std::shared_ptr<vertex> vertex_p;

        class lod;
        typedef std::shared_ptr<lod> lod_p;

        class vertex_table {
        public:
            vertex_table() {};
            vertex_table(const ace::p3d::vertex_table_p, const ace::p3d::lod_p, const ace::p3d::model_p);
            ~vertex_table();
            vertex_p operator[] (const int index) { return vertices[index]; }
            bool is_animated() { return animated; };
            std::vector<vertex_p> vertices;
        private:
            bool animated;
        };

        class face {
        public:
            face() {};
            face(const ace::p3d::face_p, const ace::p3d::lod_p, const ace::p3d::model_p, ace::simulation::lod *);
            ~face();
            uint8_t type;
            std::vector<vertex_p> vertices;
        };
        typedef std::shared_ptr<face> face_p;

        class named_selection {
        public:
            named_selection() {};
            named_selection(const ace::p3d::named_selection_p, const ace::p3d::lod_p, const ace::p3d::model_p, ace::simulation::lod *);
            ~named_selection();

            std::string name;
            std::vector<face_p> faces;
            std::vector<vertex_p> vertices;
        };
        typedef std::shared_ptr<named_selection> named_selection_p;

        class vertex {
        public:
            vertex(vertex_table &, ace::vector3<float>, uint32_t);
            ~vertex();

            ace::vector3<float> operator * (const float &v) { return this->vertex_coordinates() * v; }
            ace::vector3<float> operator / (const float &v) { return this->vertex_coordinates() / v; }

            ace::vector3<float> operator * (const ace::vector3<float> &v) { return this->vertex_coordinates() * v; }
            ace::vector3<float> operator / (const ace::vector3<float> &v) { return this->vertex_coordinates() / v; }
            ace::vector3<float> operator + (const ace::vector3<float> &v) { return this->vertex_coordinates() + v; }
            ace::vector3<float> operator - (const ace::vector3<float> &v) { return this->vertex_coordinates() - v; }
            ace::vector3<float> operator - () { return -(this->vertex_coordinates()); }

            bool operator == (const ace::vector3<float> &r) { return (this->vertex_coordinates() == r); }
            bool operator >  (const ace::vector3<float> &r) const { throw 1; }
            bool operator <  (const ace::vector3<float> &r) const { throw 1; }
            bool operator <= (const ace::vector3<float> &r) const { throw 1; }
            bool operator >= (const ace::vector3<float> &r) const { throw 1; }

            float x() { return this->vertex_coordinates().x(); }
            float y() { return this->vertex_coordinates().y(); }
            float z() { return this->vertex_coordinates().z(); }
            uint16_t id() { return this->vertex_id; }

            operator ace::vector3<float>() { return vertex_coordinates();  }

            std::vector<face *> faces;
            std::vector<named_selection *> selections;

        private:
            ace::vector3<float> original_vertex;
            ace::vector3<float> animated_vertex;
            vertex_table &table;
            uint16_t vertex_id;
            ace::vector3<float> & vertex_coordinates() {
                if (table.is_animated()) {
                    return animated_vertex;
                }
                return original_vertex;
            };
        };
        

        

        class lod {
        public:
            lod() {};
            lod(const ace::p3d::lod_p, const ace::p3d::model_p);
            ~lod();
            uint32_t id;
            vertex_table vertices;
            std::map<std::string, named_selection_p> selections;
            std::vector<face_p> faces;
        };
        

        class lod_animation_info {
        public:
            lod_animation_info() {};
            lod_animation_info(const ace::p3d::animate_bone_p, const ace::p3d::animation_p, const ace::p3d::model_p);
            ~lod_animation_info();
            int32_t index;
            uint32_t lod;
            ace::vector3<float> axis_direction;
            ace::vector3<float> axis_position;
        };
        typedef std::shared_ptr<lod_animation_info> lod_animation_info_p;

        class animation {
        public:
            animation() {};
            animation(const ace::p3d::animation_p, const ace::p3d::model_p);
            ~animation();

            uint32_t        type;
            std::string     name;  // "RightDoor"
            std::string     source;     // "rotor"
            float           minmax_value[2];
            float           minmax_phase[2];
            uint32_t        source_address;

            std::vector<float> transforms;
            std::map<uint32_t, lod_animation_info_p> lod_info;
        };
        typedef std::shared_ptr<animation> animation_p;

        class bone;
        typedef std::shared_ptr<bone> bone_p;

        class bone {
        public:
            bone();
            ~bone() {};
            std::string name;
            bone_p parent;
            std::vector<bone_p> children;
            animation_p animation;
        };
        

        class object {
        public:
            object();
            object(const ace::p3d::model_p);
            ~object();

            std::map<uint32_t, lod_p> lods;
            std::vector<uint32_t> available_lods;

            std::vector<animation_p> animations;

            void animate(const std::map<std::string, float> &);

            std::vector<bone_p> all_bones;


        };
        typedef std::shared_ptr<object> object_p;
    }
}