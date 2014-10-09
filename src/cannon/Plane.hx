package cannon;

@:native("CANNON.Plane")
extern class Plane extends Shape {
	//var type : Int;
	var worldNormal : Vec3;
	var worldNormalNeedsUpdate : Bool;
	function new() : Void;
	//function computeWorldNormal( quat : Quaternion ) : Void;
	//function calculateLocalInertia( mass : Float, ?target : Vec3 ) : Vec3;
	//function calculateWorldAABB( pos : Vec3, quat : Quaternion, min : Vec3, max : Vec3 ) : Void;
}
