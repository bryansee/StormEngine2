#version 150
#define PC

float saturate( float v ) { return clamp( v, 0.0, 1.0 ); }
vec2 saturate( vec2 v ) { return clamp( v, 0.0, 1.0 ); }
vec3 saturate( vec3 v ) { return clamp( v, 0.0, 1.0 ); }
vec4 saturate( vec4 v ) { return clamp( v, 0.0, 1.0 ); }
vec4 tex2Dlod( sampler2D sampler, vec4 texcoord ) { return textureLod( sampler, texcoord.xy, texcoord.w ); }


uniform vec4 _va_[2];


in vec4 in_Position;
in vec2 in_TexCoord;
in vec4 in_Normal;
in vec4 in_Tangent;
in vec4 in_Color;

out vec4 vofi_TexCoord0;

void main() {
	gl_Position = in_Position ;
	vofi_TexCoord0 . xy = in_TexCoord * _va_[0 /* rpScreenCorrectionFactor */] . xy + _va_[0 /* rpScreenCorrectionFactor */] . zw ;
	vofi_TexCoord0 . zw = in_TexCoord * _va_[1 /* rpLightProjectionS */] . xy + _va_[1 /* rpLightProjectionS */] . zw ;
}