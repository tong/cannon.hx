package cannon;

private typedef AABBOptions = {
	@:optional var lowerBound : Vec3;
	@:optional var upperBound : Vec3;
}

@:native("CANNON.AABB")
extern class AABB {
	var lowerBound : Vec3;
	var upperBound : Vec3;
	function new( options : AABBOptions ) : Void;
	function copy( aabb : AABB ) : Void;
	function extend( aabb : AABB ) : Void;
	function overlaps( aabb : AABB ) : Bool;
	//function setFromPoints( points : Array<Vec3>, position : Vec3, quaternion : Quaternion, skinSize : Float ) : Void;
	function setFromPoints( points : Array<Vec3> ) : Void;
}
