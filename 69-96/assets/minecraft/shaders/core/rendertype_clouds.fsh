#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:greyscale.glsl>


in float vertexDistance;
in vec4 vertexColor;

out vec4 fragColor;

void main() {
    vec4 color = vertexColor;
    color.a *= 1.0f - linear_fog_value(vertexDistance, 0, FogCloudsEnd);
    fragColor = greyscale(color);
}
