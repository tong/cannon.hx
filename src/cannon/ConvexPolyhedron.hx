package cannon;

@:native("CANNON.ConvexPolyhedron")
extern class ConvexPolyhedron extends Shape {
	var faceNormals : Array<Vec3>;
	var faces : Array<Array<Int>>;
	var uniqueEdges : Array<Vec3>;
	var vertices : Array<Vec3>;
	function new( points : Array<Vec3>, faces : Array<Array<Int>>, ?normals : Dynamic ) : Void;
	function transformAllPoints(offset:Vec3,quat:Quaternion) : Void;
	//function calculateLocalInertia( mass : Float, target : Vec3 ) : Void;
	//..
}
