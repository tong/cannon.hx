package cannon;

@:native("CANNON.Box")
extern class Box extends Shape {
	//var halfExtents : Vec3;
	//var type : ;
	var convexPolyhedronRepresentation : ConvexPolyhedron;
	//var updateConvexPolyhedronRepresentation : ;
	function new( halfExtents : Vec3 ) : Void;
	function updateConvexPolyhedronRepresentation() : Void;
	//function calculateLocalInertia( mass : Float, target : Vec3 ) : Vec3;
	function getSideNormals( sixTargetVectors : Bool, ?quat : Quaternion ) : Array<Vec3>;
	//function volume() : Float;
	//function computeBoundingSphereRadius() : Void;
	function forEachWorldCorner( pos : Dynamic, quat : Quaternion, callback : Dynamic ) : Void;
	function calculateWorldAABB( pos : Dynamic, quat : Quaternion, min : Vec3, max : Vec3 ) : Void;
}
