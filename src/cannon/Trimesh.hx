package cannon;

/**
*/
@:native("CANNON.Trimesh")
extern class Trimesh extends Shape {

	var vertices : Array<Dynamic>;

	/**
		Array of integers, indicating which vertices each triangle consists of. The length of this array is thus 3 times the number of triangles.
	*/
	var indices : Array<Dynamic>;

	/**
		The normals data.
	*/
	var normals : Array<Dynamic>;

	/**
		The local AABB of the mesh.
	*/
	var aabb : Array<Dynamic>;

	/**
		References to vertex pairs, making up all unique edges in the trimesh.
	*/
	var edges : Array<Dynamic>;

	/**
		Local scaling of the mesh. Use .setScale() to set it.
	*/
	var scale : Vec3;

	/**
		The indexed triangles. Use .updateTree() to update it.
	*/
	var tree : Octree;

	function new( vertices : Array<Dynamic>, indices : Array<Dynamic> ) : Void;

	function updateTree() : Void;

	/**
		Get triangles in a local AABB from the trimesh.
	*/
	function getTrianglesInAABB( aabb : AABB, result : Array<Dynamic> ) : Void;

	function setScale( scale : Vec3 ) : Void;

	/**
		Compute the normals of the faces. Will save in the .normals array.
	*/
	function updateNormals() : Void;

	/**
		Update the .edges property
	*/
	function updateEdges() : Void;

	/**
		Get an edge vertex
	*/
	function getEdgeVertex( edgeIndex : Float, firstOrSecond : Float, vertexStore : Vec3 ) : Void;

	/**
		Get a vector along an edge.
	*/
	function getEdgeVector( edgeIndex : Float, vectorStore : Vec3 ) : Void;

	/**
		Get face normal given 3 vertices
	*/
	static function computeNormal( va : Vec3, vb : Vec3, vc : Vec3, target : Vec3 ) : Void;

	/**
		Get vertex i.
	*/
	function getVertex( i : Float, out : Vec3 ) : Vec3;

	/**
		Get raw vertex i
	*/
	function _getUnscaledVertex( i : Float, out : Vec3 ) : Vec3;

	/**
		Get a vertex from the trimesh,transformed by the given position and quaternion.
	*/
	function getWorldVertex( i : Float, pos : Vec3, quat : Quaternion, out : Vec3 ) : Vec3;

	/**
		Get the three vertices for triangle i.
	*/
	function getTriangleVertices( i : Float, a : Vec3, b : Vec3, c : Vec3 ) : Void;

	/**
		Compute the normal of triangle i.
	*/
	function getNormal( i : Float, target : Vec3 ) : Vec3;

	override function calculateLocalInertia( mass : Float, target : Vec3 ) : Vec3;

	/**
		Compute the local AABB for the trimesh
	*/
	function computeLocalAABB( aabb : AABB ) : Void;

	/**
		Update the .aabb property
	*/
	function updateAABB() : Void;

	/**
		Will update the .boundingSphereRadius property
	*/
	override function updateBoundingSphereRadius() : Void;

	function calculateWorldAABB( pos : Vec3, quat : Quaternion, min : Vec3, max : Vec3 ) : Void;

	/**
		Get approximate volume
	*/
	override function volume() : Float;

	/**
		Create a Trimesh instance, shaped as a torus.
	*/
	static function createTorus( radius : Float, tube : Float, radialSegments : Float, tubularSegments : Float, arc : Float ) : Trimesh;

}
