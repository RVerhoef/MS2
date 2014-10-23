package  
{
	import flash.display.Sprite;

	/**
	 * ...
	 * @author Rob
	 */
	public class MoveCloud extends Sprite
	{
		private var _cloud:Cloud = new Cloud;
		private var _cloudVelocityX:Number;
		private var _cloudVelocityY:Number;
		
		public function MoveCloud(cloudVelocityX:Number, cloudVelocityY:Number):void
		{
			_cloudVelocityX = cloudVelocityX;
			_cloudVelocityY = cloudVelocityY;
			addChild(_cloud);
		}
		
			public function update():void
		{
			if(x < -100)
			{
				_cloudVelocityX = Math.abs(_cloudVelocityX);
				_cloud.y -= 200;
			}
			else if(x > 900)
			{
				_cloudVelocityX = -Math.abs(_cloudVelocityX); 
				_cloud.y += 200;
			}
			
			if(_cloudVelocityX > 0)
			{
				scaleX = 1;
			}
			else
			{
				scaleX = -1;
			}
			
			x += _cloudVelocityX;
			y += _cloudVelocityY;
		}
		
	}

}