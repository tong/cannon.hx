package cannon;

@:native("CANNON.ConvexPolyhedron")
extern class ConvexPolyhedron extends Shape {
	function new( points : Array<Vec3>, faces : Dynamic, normals : Dynamic ) : Void;
	//TODO
}
