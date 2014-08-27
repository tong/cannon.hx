package cannon;

@:native("CANNON.ContactMaterial")
extern class ContactMaterial {
	var id : Int;
	var materials : Array<Material>;
	var friction : Float;
	var restitution : Float;
	var contactEquationStiffness : Float;
	var contactEquationRegularizationTime : Float;
	var frictionEquationStiffness : Float;
	var frictionEquationRegularizationTime : Float;
	function new( m1 : Material, m2 : Material, friction : Float, restitution : Float ) : Void;
}
