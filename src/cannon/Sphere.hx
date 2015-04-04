package cannon;

/**
	Spherical shape
*/
@:native("CANNON.Sphere")
extern class Sphere extends Shape {

	var radius : Float;

	function new( radius : Float ) : Void;

}
