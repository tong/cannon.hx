package cannon;

@:native("CANNON.Box")
extern class Box extends Shape {
	var halfExtents : Vec3;
	var convexPolyhedronRepresentation : ConvexPolyhedron;
	function new( halfExtents : Vec3 ) : Void;
	function updateConvexPolyhedronRepresentation() : Void;
	function getSideNormals( includeNegative : Bool, quat : Quaternion ) : Array<Vec3>;
	//function forEachWorldCorner( pos : Dynamic, quat : Quaternion, callback : Dynamic ) : Void;
	//function calculateWorldAABB( pos : Dynamic, quat : Quaternion, min : Vec3, max : Vec3 ) : Void;
}
