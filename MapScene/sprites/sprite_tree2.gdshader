shader_type canvas_item;

uniform vec4 new_color: source_color;

uniform float x_intensity = 1000.0;
uniform float y_intensity = 300.0;
uniform vec2 offset = vec2(0.0,0.0);
uniform float speed  = 2.0;
uniform float wave_frequency  = 20.0;
uniform float wave_length  = 200.0;


void vertex() {
	//vec2 world_coordinates = (MODEL_MATRIX * vec4(VERTEX, 0.0, 1.0)).xy;
	float final_speedX = sin(TIME + mod((offset.x * offset.y), 6)) * (speed / 4.0) ;
	float final_speedY = sin(TIME + mod((offset.x * offset.y), 6)) * (speed / 4.0) ;
	
	float time_var = (cos(final_speedX) * cos(final_speedX * 4.0) * cos(final_speedX * 2.0))/(200.0);
	float time_var2 = (cos(final_speedY) * cos(final_speedY * 6.0) * cos(final_speedY * 2.0))/(200.0);
	
	float wave_from_x = (cos(VERTEX.x * 100.0 )/1000.0);
	float wave_large_from_x = cos(TIME + (VERTEX.x * wave_frequency))/wave_length;
	
	float wave_from_y = (cos(VERTEX.y * 99000.0)/90000.0);
	
	
	VERTEX.x += ((time_var* x_intensity) + wave_from_x)  * (UV.y - 1.0) + (wave_large_from_x);
	VERTEX.y += ((time_var2* y_intensity) + wave_from_y)  * (UV.y - 1.0);
	
}

void fragment() {
	vec4 curr_color = texture(TEXTURE, UV);
	COLOR.rgb = new_color.rgb * curr_color.rgb;
}
