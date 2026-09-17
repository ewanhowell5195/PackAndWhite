#version 330
#extension GL_ARB_separate_shader_objects : require

#include <minecraft:dynamictransforms.glsl>
#include <minecraft:greyscale.glsl>

layout(location = 0) out vec4 fragColor;

void main() {
    fragColor = greyscale(ColorModulator);
}
