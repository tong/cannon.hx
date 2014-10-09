package cannon;

@:native("CANNON.JacobianElement")
extern class JacobianElement {
	var spatial : Vec3;
	var rotational : Vec3;
	function multiplyElement( element : Dynamic ) : Dynamic;
	function multiplyVectors( spatial : Dynamic, rotational : Dynamic ) : Dynamic;
}
