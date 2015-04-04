package cannon;

/**
	Defines a physics material.
*/
@:native("CANNON.Material")
extern class Material {

	var name : String;

	/**
		material id.
	*/
	var id : Float;

	/**
		Friction for this material. If non-negative, it will be used instead of the friction given by ContactMaterials. If there's no matching ContactMaterial, the value from .defaultContactMaterial in the World will be used.
	*/
	var friction : Float;

	/**
		Restitution for this material. If non-negative, it will be used instead of the restitution given by ContactMaterials. If there's no matching ContactMaterial, the value from .defaultContactMaterial in the World will be used.
	*/
	var restitution : Float;

	function new( ?options : Dynamic ) : Void;

}
