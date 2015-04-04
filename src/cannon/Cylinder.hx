package cannon;

/**
*/
@:native("CANNON.Cylinder")
extern class Cylinder extends ConvexPolyhedron {

	function new( radiusTop : Float, radiusBottom : Float, height : Float, numSegments : Float ) : Void;

}
