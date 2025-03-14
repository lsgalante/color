#version 440
layout(location = 0) in vec2 coord;
layout(location = 0) out vec4 fragColor;

layout(binding = 1) uniform sampler2D source;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    float sizex;
    float sizey;
    float radius;
};

void main() {

    vec2 viewportsize = vec2(sizex, sizey);
    vec2 pixelpos = coord * viewportsize;
    float dist = distance(pixelpos, vec2(sizex * 0.85, sizey * 0.5));
    
    if (dist < radius) {
        discard;
    }
    else {
        fragColor = vec4(0.1, 0.1, 0.2, 1);
    }

}
