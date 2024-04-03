shader_type canvas_item;

uniform vec2 deformation = vec2(0,0);
uniform float sidewaysDeformationFactor = 5.0;

uniform vec4 new_color: source_color;

void vertex() {
	
	vec2 deformationStrength = abs(deformation);
	float sidewaysDeformation = min(deformationStrength.x, deformationStrength.y);
	float sprideWidth = abs(VERTEX.x);
	if (sign(VERTEX.y) != sign(deformation.y)) {
		VERTEX.x += sidewaysDeformation * sidewaysDeformationFactor * sprideWidth * sign(deformation.x);
	}
}

void fragment() {
	vec4 curr_color = texture(TEXTURE, UV);
	COLOR.rgb = new_color.rgb * curr_color.rgb;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
