shader_type canvas_item;
uniform vec4 surfaceColor: source_color;
uniform vec4 depthColor: source_color;
uniform vec4 deepDepthColor: source_color;
uniform vec4 waterColor : source_color;
uniform vec4 foamColor : source_color;
uniform float foamWidth = 0.1;
uniform float mulscale = 5.0;
uniform float height = 0.3;
uniform float tide = 0.1;
uniform float timescale = 1.0;
uniform float foamDisapear = 0.05;
uniform vec2 water_offset = vec2(0.0,0.0);
uniform sampler2D noise_background;
uniform sampler2D noise_foam;
uniform sampler2D noise_foam2;

uniform int OCTAVE = 6;

void vertex() {
	// Called for every vertex the material is visible on.
}

float rand(vec2 input){
	return fract(sin(dot(input,vec2(23.53,44.0)))*42350.45);
}

float perlin(vec2 input){
	vec2 i = floor(input);
	vec2 j = fract(input);
	vec2 coord = smoothstep(0.,1.,j);
	
	float a = rand(i);
	float b = rand(i+vec2(1.0,0.0));
	float c = rand(i+vec2(0.0,1.0));
	float d = rand(i+vec2(1.0,1.0));

	return mix(mix(a,b,coord.x),mix(c,d,coord.x),coord.y);
}

float fbm(vec2 input){
	float value = 0.0;
	float scale = 0.5;
	
	for(int i = 0; i < OCTAVE; i++){
		value += perlin(input)*scale;
		input*=2.0;
		scale*=0.5;
	}
	return value;
}

void fragment() {
	
	float newtime = TIME*timescale;
	float fbmval = fbm(vec2(UV.x*mulscale+0.2*sin(0.3*newtime)+0.15*newtime,-0.05*newtime+UV.y*mulscale+0.1*cos(0.68*newtime)));
	
	
	vec4 new_texture = texture(noise_background, UV);
	vec4 foam_texture = texture(noise_foam, UV);
	vec4 foam_texture2 = texture(noise_foam2, UV);
	
	float myheight = height+tide*sin(newtime+5.0*UV.x-8.0*UV.y);
	
	float depth = 1.0 - smoothstep(0.1,0.4, new_texture.r);
	float deepDepth = smoothstep(0.0,0.1, new_texture.r);
	float surface = smoothstep(0.4,0.7, new_texture.r);
	float foam = step(myheight, fbmval) * step(fbmval, myheight + foamWidth) * (smoothstep(foamDisapear, 0.4, foam_texture2.r));
	
	COLOR.rgb = depth * depthColor.rgb + surface* surfaceColor.rgb  + (1.0-depth)*(1.0-surface)*waterColor.rgb;
}



//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
