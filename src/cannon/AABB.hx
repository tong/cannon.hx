package cannon;

@:native("CANNON.AABB")
extern class AABB {
	function new( options : Dynamic ) : Void;
	function setFromPoints( points : Array<Vec3>, position : Vec3, quaternion : Quaternion, skinSize : Float ) : Void;
	function copy( aabb : AABB ) : Void;
	function extend( aabb : AABB ) : Void;
	function overlaps( aabb : AABB ) : Bool;
}
