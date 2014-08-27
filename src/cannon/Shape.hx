package cannon;

@:enum abstract ShapeType(Int) {
	var SPHERE = 1;
	var PLANE = 2;
	var BOX = 4;
	var COMPOUND = 8;
	var CONVEXPOLYHEDRON = 16;
}

@:native("CANNON.Shape")
extern class Shape {

	static var types : ShapeType;

	var aabbmin : Vec3;
	var aabbmax : Vec3;
	var boundingSphereRadius : Float;
	var boundingSphereRadiusNeedsUpdate : Bool;

	function new() : Void;

	function computeBoundingSphereRadius() : Void;
	function getBoundingSphereRadius() : Float;
	function volume() : Void;
	function calculateLocalInertia( mass : Float, target : Vec3 ) : Void;
	function calculateTransformedInertia( mass : Float, quat : Quaternion, target : Vec3 ) : Void;
	function calculateLocalAABB() : Void;
}
