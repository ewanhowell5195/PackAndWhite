#version 150

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;

in vec4 vertexColor;
in vec2 texCoord0;
in vec2 texCoord1;
in vec2 texCoord2;
in vec4 normal;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0) * vertexColor;
    float gray = 0.21 * color.r + 0.71 * color.g + 0.07 * color.b;
    fragColor = vec4(color.rgb * (1.0 - 1) + (gray * 1), color.a) * ColorModulator;
}
