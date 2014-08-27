package cannon;

@:native("CANNON.Compound")
extern class Compound extends Shape {
	function new() : Void;
	function addChild( shape : Shape, offset : Vec3, oreientation : Quaternion ) : Void;
	function volume() : Float;
	function calculateLocalInertia( mass : Float, ?target : Vec3 ) : Vec3;
	function computeBoundingSphereRadius() : Void;
	function calculateWorldAABB( pos : Dynamic, quat : Quaternion, min : Vec3, max : Vec3 ) : Void;
}
