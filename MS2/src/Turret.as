package  
{
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.geom.Vector3D;
	/**
	 * ...
	 * @author Rob
	 */
	public class Turret extends Sprite
	{
		public static const DESTROY:String = "destroy";
		
		private var bullet:TurretBullet = new TurretBullet;
		private var bulletSpeed:int = 15;
		private var bulletVelocity:Vector3D;
		public var destinationX:int;
		public var destinationY:int;
		
		public var maxDistance:Number = 800;
		private var currentDistance:Number = 0;
		
		public function Turret()
		{
			addChild(TurretGun)
		}
		
		public function setDestination(x:int, y:int):void
		{
			destinationX = x;
			destinationY = y;
			calculateRotation();
			calculateVelocity();
		}
		
		public function update():void
		{
			this.x += bulletVelocity.x;
			this.y += bulletVelocity.y;
			
			currentDistance += bulletVelocity.length;
			
			if (currentDistance > maxDistance)
			{
				destroy();
			}	
		}
			
			private function calculateRotation():void
			{
				var radius:Number = Math.atan2(this.y - destinationY, this.x - destinationX);
			}
			
		}
		
	}

}