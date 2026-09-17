#version 330

#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:greyscale.glsl>

out vec4 fragColor;

void main() {
    fragColor = greyscale(ColorModulator);
}
