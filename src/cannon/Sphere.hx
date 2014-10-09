package cannon;

@:native("CANNON.Sphere")
extern class Sphere extends Shape {
	var radius : Float;
	function new( ?radius : Float ) : Void;
	//function calculateLocalInertia( mass : Float, ?target : Vec3 ) : Vec3;
	//function volume() : Float;
	//function computeBoundingSphereRadius() : Void;
	//function calculateWorldAABB( pos : Vec3, quat : Quaternion, min : Vec3, max : Vec3 ) : Void;
}
