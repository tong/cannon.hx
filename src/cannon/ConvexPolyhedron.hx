package cannon;

/**
	A set of polygons describing a convex shape.
*/
@:native("CANNON.ConvexPolyhedron")
extern class ConvexPolyhedron extends Shape {

	/**
		Array of Vec3
	*/
	var vertices : Array<Dynamic>;

	/**
		Array of integer arrays, indicating which vertices each face consists of
	*/
	var faces : Array<Dynamic>;

	/**
		Array of Vec3
	*/
	var faceNormals : Array<Dynamic>;

	/**
		Array of Vec3
	*/
	var uniqueEdges : Array<Dynamic>;

	/**
		If given, these locally defined, normalized axes are the only ones being checked when doing separating axis check.
	*/
	var uniqueAxes : Array<Dynamic>;

	function new( points : Array<Dynamic>, faces : Array<Dynamic> ) : Void;

	/**
		Computes uniqueEdges
	*/
	function computeEdges() : Void;

	/**
		Compute the normals of the faces. Will reuse existing Vec3 objects in the .faceNormals array if they exist.
	*/
	function computeNormals() : Void;

	/**
		Get face normal given 3 vertices
	*/
//	static function getFaceNormal( va : Vec3, vb : Vec3, vc : Vec3, target : Vec3 ) : Void;

	/**
		Compute the normal of a face from its vertices
	*/
	function getFaceNormal( i : Float, target : Vec3 ) : Void;

	function clipAgainstHull( posA : Vec3, quatA : Quaternion, hullB : ConvexPolyhedron, posB : Vec3, quatB : Quaternion, separatingNormal : Vec3, minDist : Float, maxDist : Float, result : Array<Dynamic> ) : Void;

	/**
		Find the separating axis between this hull and another
	*/
	function findSeparatingAxis( hullB : ConvexPolyhedron, posA : Vec3, quatA : Quaternion, posB : Vec3, quatB : Quaternion, target : Vec3 ) : Bool;

	/**
		Test separating axis against two hulls. Both hulls are projected onto the axis and the overlap size is returned if there is one.
	*/
	function testSepAxis( axis : Vec3, hullB : ConvexPolyhedron, posA : Vec3, quatA : Quaternion, posB : Vec3, quatB : Quaternion ) : Float;

	function calculateLocalInertia( mass : Float, target : Vec3 ) : Void;

	function getPlaneConstantOfFace( face_i : Float ) : Float;

	/**
		Clip a face against a hull.
	*/
	function clipFaceAgainstHull( separatingNormal : Vec3, posA : Vec3, quatA : Quaternion, worldVertsB1 : Array<Dynamic>, minDist : Float, maxDist : Float, Array : Array<Dynamic> ) : Void;

	/**
		Clip a face in a hull against the back of a plane.
	*/
	function clipFaceAgainstPlane( inVertices : Array<Dynamic>, outVertices : Array<Dynamic>, planeNormal : Vec3, planeConstant : Float ) : Void;

	/**
		Updates .worldVertices and sets .worldVerticesNeedsUpdate to false.
	*/
	function computeWorldFaceNormals( quat : Quaternion ) : Void;

	override function updateBoundingSphereRadius() : Void;

	function calculateWorldAABB( pos : Vec3, quat : Quaternion, min : Vec3, max : Vec3 ) : Void;

	/**
		Get approximate convex volume
	*/
	override function volume() : Float;

	/**
		Get an average of all the vertices positions
	*/
	function getAveragePointLocal( target : Vec3 ) : Vec3;

	/**
		Transform all local points. Will change the .vertices
	*/
	function transformAllPoints( offset : Vec3, quat : Quaternion ) : Void;

	/**
		Checks whether p is inside the polyhedra. Must be in local coords. The point lies outside of the convex hull of the other points if and only if the direction of all the vectors from it to those other points are on less than one half of a sphere around it.
	*/
	function pointIsInside( p : Vec3 ) : Bool;

	/**
		Get max and min dot product of a convex hull at position (pos,quat) projected onto an axis. Results are saved in the array maxmin.
	*/
	static function project( hull : ConvexPolyhedron, axis : Vec3, pos : Vec3, quat : Quaternion, result : Array<Dynamic> ) : Void;

}
