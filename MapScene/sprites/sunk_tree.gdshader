shader_type canvas_item;

uniform float depth = 0.5;

uniform vec4 new_color: source_color;

uniform float speedX = 0.3;
uniform float disX =50.0;

uniform float speedY = 0.3;
uniform float disY = 30.0;

uniform vec2 offset = vec2(0.0, 0.0);

void vertex() {
	float sinX = (TIME * speedX) + offset.x+offset.y;
	float varX = (sin(sinX)  + sin(sinX * 2.0) + sin(sinX * 6.0))  * disX /20.0 ;
	
	
	float sinY = (TIME +offset.x) * speedY;
	float varY = (cos(sinY)  + cos(sinY * 2.0))  * disY /20.0;
	
	float wave_from_x = (cos(offset.x * 100.0 )/1000.0);
	VERTEX.x += (varX + wave_from_x) * (UV.y - 1.0);
	
	VERTEX.y += (varY) * (UV.y - 1.0);
}

void fragment() {
	float depth2 = depth-0.2;
	float sunk_factor = smoothstep(depth, depth-0.3, UV.y);
	float float_line_factor = smoothstep(depth2-0.05, depth2, UV.y);
	
	vec4 curr_color = texture(TEXTURE, UV);
	COLOR.a = sunk_factor * curr_color.a;
	COLOR.rgb = ((new_color.rgb)*(float_line_factor) * curr_color.rgb) + vec3(1.0,1.0,1.0)*wave_line_factor + (1.0-float_line_factor)* curr_color.rgb;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
