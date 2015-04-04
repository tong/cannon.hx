package cannon;

/**
	A plane, facing in the Z direction. The plane has its surface at z=0 and everything below z=0 is assumed to be solid plane. To make the plane face in some other direction than z, you must put it inside a RigidBody and rotate that body. See the demos.
*/
@:native("CANNON.Plane")
extern class Plane extends Shape {

	function new() : Void;

}
