shader_type canvas_item;

uniform float depth_base = 0.5;
uniform float distortion_factor = 3.0;

uniform vec4 new_color: source_color;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float depth = depth_base + sin(TIME)/40.0+0.2;
	float depth2 = depth-0.2;
	float sunk_factor = smoothstep(depth, depth-0.3, UV.y);
	float float_line_factor = smoothstep(depth2-0.05, depth2, UV.y);
	float wave_line_factor = step(depth2, UV.y)+0.1*step(depth2, UV.y)-0.1;
	vec4 curr_color = texture(TEXTURE, UV);
	
	
	float time_factor = sin((UV.y*3.0+TIME*0.3)*10.0)*0.01;
	
	
	float new_x;
	float new_y;
	if(UV.y<float_line_factor){
		new_x = (UV.x + time_factor);
		new_y = UV.y;
	}
	else{
		new_x = UV.x;
		new_y = UV.y;
	}
	
	
	vec2 new_uv1 = vec2(new_x, new_y);
	vec4 new_texture = texture(TEXTURE, new_uv1);
	
	new_texture.a = sunk_factor * new_texture.a;
	new_texture.rgb = (new_color.rgb)*(float_line_factor) * new_texture.rgb + (1.0-float_line_factor)* new_texture.rgb;
	
	if(new_texture.rgb != vec3(1,1,1)){
		COLOR.rgba = new_texture.rgba;
	}
	
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
