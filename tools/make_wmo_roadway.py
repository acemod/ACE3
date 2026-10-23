#!/usr/bin/env python3
"""Generate addons/wmo/data/roadway.p3d, the invisible roadway helper.

Run from the repo root:
    python3 tools/make_wmo_roadway.py addons/wmo/data/roadway.p3d

The model is small enough to be fully described by its geometry, so it is generated
rather than authored, and the result can be verified with:
    hemtt utils p3d json addons/wmo/data/roadway.p3d out.json


Three LODs: an empty visual LOD so nothing renders, an empty Geometry LOD, and a
Roadway LOD holding a single horizontal quad for units to stand on.

Arma model space is Y-up, so the quad lies in XZ at Y=0. Normals point down,
which is what makes the roadway collide from above.
"""
import struct
import sys

HALF = 4.0  # quad is 8x8 m

RES_VISUAL = 0.0
RES_GEOMETRY = 1e13
RES_ROADWAY = 3e15


def asciiz(s: str) -> bytes:
    return s.encode("ascii") + b"\0"


def tagg(name: str, data: bytes) -> bytes:
    # active byte, name, payload length, payload
    return b"\x01" + asciiz(name) + struct.pack("<I", len(data)) + data


def lod(points, normals, faces, taggs, resolution) -> bytes:
    out = b"P3DM"
    out += struct.pack("<II", 28, 256)                      # version major, minor
    out += struct.pack("<III", len(points), len(normals), len(faces))
    out += struct.pack("<I", 0)                             # lod flags

    for x, y, z in points:
        out += struct.pack("<fffI", x, y, z, 0)             # coords, point flags

    for x, y, z in normals:
        out += struct.pack("<fff", x, y, z)

    for verts in faces:
        out += struct.pack("<I", len(verts))
        # a face always stores four vertex slots, unused ones are zeroed
        for i in range(4):
            if i < len(verts):
                pi, ni = verts[i]
                out += struct.pack("<IIff", pi, ni, 0.0, 0.0)
            else:
                out += struct.pack("<IIff", 0, 0, 0.0, 0.0)
        out += struct.pack("<I", 0)                          # face flags
        out += asciiz("")                                    # texture
        out += asciiz("")                                    # material

    out += b"TAGG"
    for name, data in taggs:
        out += tagg(name, data)
    out += tagg("#EndOfFile#", b"")

    out += struct.pack("<f", resolution)
    return out


def uvset(face_count: int) -> bytes:
    # UV set id, then u/v per vertex per face, four vertex slots each
    return struct.pack("<I", 0) + b"\0" * (face_count * 4 * 2 * 4)


def build() -> bytes:
    visual = lod([], [], [], [("#UVSet#", uvset(0))], RES_VISUAL)

    geometry = lod([], [], [], [("#Mass#", b""), ("#UVSet#", uvset(0))], RES_GEOMETRY)

    points = [
        (-HALF, 0.0, -HALF),
        (HALF, 0.0, -HALF),
        (-HALF, 0.0, HALF),
        (HALF, 0.0, HALF),
    ]
    normals = [(0.0, -1.0, 0.0)] * 4
    # winding chosen so the surface is walked on from above
    faces = [[(3, 0), (2, 1), (0, 2), (1, 3)]]
    roadway = lod(points, normals, faces, [("#UVSet#", uvset(1))], RES_ROADWAY)

    lods = [visual, geometry, roadway]
    return b"MLOD" + struct.pack("<II", 257, len(lods)) + b"".join(lods)


if __name__ == "__main__":
    out = sys.argv[1] if len(sys.argv) > 1 else "roadway.p3d"
    with open(out, "wb") as f:
        f.write(build())
    print(f"wrote {out}")
