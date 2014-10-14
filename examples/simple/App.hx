
import js.Browser.document;
import js.Browser.window;
import three.*;

class App {

	static var TIMESTEP = 1/60;

	static var renderer : CanvasRenderer;
	static var scene : Scene;
	static var camera : PerspectiveCamera;
	static var mesh : Mesh;
	static var world : cannon.World;
	static var body : cannon.Body;

	static function initCannon() {

		world = new cannon.World();
		world.gravity.set( 0, 0, 0 );
		world.broadphase = new cannon.NaiveBroadphase();
		untyped world.solver.iterations = 10;

		var shape = new cannon.Box( new cannon.Vec3( 1, 1, 1 ) );
		body = new cannon.Body({mass:1});
		body.addShape( shape );
		body.angularVelocity.set( 0, 10, 0 );
		body.angularDamping = 0.5;
		world.add( body );
	}

	static function initThree() {

		renderer = new CanvasRenderer();
		renderer.setSize( window.innerWidth, window.innerHeight );
		document.body.appendChild( renderer.domElement );

		scene = new Scene();
		
		camera = new PerspectiveCamera( 75, window.innerWidth/window.innerHeight, 1, 100 );
		camera.position.z = 5;
		scene.add( camera );

		mesh = new Mesh(
			new BoxGeometry( 2, 2, 2 ),
			new MeshBasicMaterial( { color:0xff0000, wireframe:true } ) );
		scene.add( mesh );
	}

	static function update() {

		window.requestAnimationFrame( untyped update );

		world.step( TIMESTEP );

		mesh.position.copy( cast body.position );
		mesh.quaternion.copy( cast body.quaternion );

		renderer.render( scene, camera );
	}

	static function main() {
		window.onload = function(_) {
			initCannon();
			initThree();
			update();
		}
	}
}