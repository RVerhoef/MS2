package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	/**
	 * ...
	 * @author Rob
	 */
	public class Missile extends Sprite
	{
		private var _stage:Stage;
		private var _target:MovieClip;
		private var _unitV:Array = [];
		
		public function Missile(target:City) 
		{
			_target = target;
			var newMissile:EnemyMissile = new EnemyMissile;
			addChild(newMissile);
			calcTarget();
		}
		
		public function update():void
		{
			this.x += _unitV [0];
			this.y += _unitV [1];
		}
		
		private function calcTarget():void
		{
			var offset:Array = [];
			offset.push(_target.x - this.x, _target.y - this.y);
			
			var distance:Number;
			distance = Math.sqrt(offset[0] * offset[0] + offset[1] * offset[1]);
			
			_unitV.push(offset[0] / distance, offset[1] / distance);
			
		}
		
	}

}