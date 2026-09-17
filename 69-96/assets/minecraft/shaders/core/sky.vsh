#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:projection.glsl>

in vec3 Position;

out float sphericalVertexDistance;
out float cylindricalVertexDistance;
out vec3 skyPos;
out float discY;

void main() {
    vec3 pos = Position;
    if (pos.y > 0.0 && (pos.x != 0.0 || pos.z != 0.0)) {
        pos.y = -512.0;
    }

    gl_Position = ProjMat * ModelViewMat * vec4(pos, 1.0);

    sphericalVertexDistance = fog_spherical_distance(Position);
    cylindricalVertexDistance = fog_cylindrical_distance(Position);
    skyPos = pos;
    discY = Position.y;
}
