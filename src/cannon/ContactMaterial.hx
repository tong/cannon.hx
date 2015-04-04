package cannon;

/**
	Defines what happens when two materials meet.
*/
@:native("CANNON.ContactMaterial")
extern class ContactMaterial {

	/**
		Identifier of this material
	*/
	var id : Float;

	/**
		Participating materials
	*/
	var materials : Array<Dynamic>;

	/**
		Friction coefficient
	*/
	var friction : Float;

	/**
		Restitution coefficient
	*/
	var restitution : Float;

	/**
		Stiffness of the produced contact equations
	*/
	var contactEquationStiffness : Float;

	/**
		Relaxation time of the produced contact equations
	*/
	var contactEquationRelaxation : Float;

	/**
		Stiffness of the produced friction equations
	*/
	var frictionEquationStiffness : Float;

	/**
		Relaxation time of the produced friction equations
	*/
	var frictionEquationRelaxation : Float;

	function new( m1 : Material, m2 : Material, ?options : Dynamic ) : Void;

}
