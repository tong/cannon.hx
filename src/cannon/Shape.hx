package cannon;

/**
	Base class for shapes
*/
@:native("CANNON.Shape")
extern class Shape {

	/**
		Identifyer of the Shape.
	*/
	var id : Float;

	/**
		The type of this shape. Must be set to an int > 0 by subclasses.
	*/
	var type : Float;

	/**
		The local bounding sphere radius of this shape.
	*/
	var boundingSphereRadius : Float;

	/**
		Whether to produce contact forces when in contact with other bodies. Note that contacts will be generated, but they will be disabled.
	*/
	var collisionResponse : Bool;

	var material : Material;

	/**
		The available shape types.
	*/
	static var types : Dynamic;

	function new() : Void;

	/**
		Computes the bounding sphere radius. The result is stored in the property .boundingSphereRadius
	*/
	//function updateBoundingSphereRadius() : Void;

	/**
		Get the volume of this shape
	*/
	function volume() : Float;

	/**
		Calculates the inertia in the local frame for this shape.
	*/
	//function calculateLocalInertia( mass : Float, target : Vec3 ) : Void;

}
