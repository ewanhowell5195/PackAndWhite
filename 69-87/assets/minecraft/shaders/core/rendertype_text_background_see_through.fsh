#version 330

#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:greyscale.glsl>

in vec4 vertexColor;

out vec4 fragColor;

void main() {
    vec4 color = vertexColor;
    if (color.a < 0.1) {
        discard;
    }
    fragColor = greyscale(color * ColorModulator);
}
