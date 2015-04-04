package cannon;

/**
	A 3d box shape.
*/
@:native("CANNON.Box")
extern class Box extends Shape {

	var halfExtents : Vec3;

	/**
		Used by the contact generator to make contacts with other convex polyhedra for example
	*/
	var convexPolyhedronRepresentation : ConvexPolyhedron;

	function new( halfExtents : Vec3 ) : Void;

	/**
		Updates the local convex polyhedron representation used for some collisions.
	*/
	function updateConvexPolyhedronRepresentation() : Void;

	function calculateLocalInertia( mass : Float, target : Vec3 ) : Vec3;

	/**
		Get the box 6 side normals
	*/
	function getSideNormals( sixTargetVectors : Array<Dynamic>, quat : Quaternion ) : Array<Dynamic>;

}
