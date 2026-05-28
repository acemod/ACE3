import bpy
import bmesh
import math

def add_vertex_to_vgroup(new_cord, group_name):
    me = obj.data
    # Create a BMesh instance to handle the edit
    bm = bmesh.new()
    bm.from_mesh(me)
    # Add a new vertex at a specific coordinate
    new_vert = bm.verts.new(new_cord)
    bm.verts.index_update() # Update indices after adding new vertex
    new_index = new_vert.index
    # Write the BMesh data back to the mesh and clean up (destroys new_vert)
    bm.to_mesh(me)
    bm.free()
    me.update()
    vgroup = obj.vertex_groups.new(name=group_name)
    if vgroup.name != group_name:
        raise Exception("Vertex group name mismatch")
    vgroup.add([new_index], 1.0, 'ADD')


# Get the active object's mesh
obj = bpy.context.active_object
if not(obj and obj.type == 'MESH'):
    raise Exception("not selected")
        
# start by cleaning out all old groups
obj.vertex_groups.clear()

base_x = 0.14
base_y = 0.0
base_z = 0.05
delta_x = 0.1
add_vertex_to_vgroup((base_x - delta_x, base_y, base_z), "laser pos")
add_vertex_to_vgroup((base_x, base_y, base_z), "laser dir")

count = 0
for i in range(0, 100, 2):
    count += 1
    angle = i / 10
    z = base_z + math.tan(angle/1000) * delta_x
    new_cord = (base_x, base_y, z)
    group_name = f"laser {i:03}"
    print(f"adding {group_name} at {new_cord}")
    add_vertex_to_vgroup(new_cord, group_name)

for i in range(100, 310, 10):
    count += 1
    angle = i / 10
    z = base_z + math.tan(angle/1000) * delta_x
    new_cord = (base_x, base_y, z)
    group_name = f"laser {i:03}"
    print(f"adding {group_name} at {new_cord}")
    add_vertex_to_vgroup(new_cord, group_name)

print(f"finished with {count} total")
