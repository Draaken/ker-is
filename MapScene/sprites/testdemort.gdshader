shader_type canvas_item;

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
	
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
