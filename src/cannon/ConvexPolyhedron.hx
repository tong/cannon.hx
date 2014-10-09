package cannon;

@:native("CANNON.ConvexPolyhedron")
extern class ConvexPolyhedron extends Shape {
	var faceNormals : Array<Dynamic>;
	var faces : Array<Int>;
	var uniqueEdges : Array<Vec3>;
	var vertices : Array<Vec3>;
	function new( points : Array<Vec3>, faces : Array<Int>, ?normals : Dynamic ) : Void;
	//function calculateLocalInertia( mass : Float, target : Vec3 ) : Void;
	//..
}
