package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class Player extends FlxSprite
	{
		[Embed(source = '../assets/player/porco.png')] private var playerPNG:Class;
		
		public var startX:int = 0;
		public var startY:int = 0;
		private var level:Level2 = new Level2();
		
		public function Player(X:Number, Y:Number)
		{
			super(X, Y);
			startX = X;
			startY = Y;
			
			loadGraphic(playerPNG, true, true, 87, 60, true);
			
			width = 87;
			height = 60;
			
			offset.x = 0;
			offset.y = -1;
			
			addAnimation("idle", [0], 0, false);
			addAnimation("walk", [0, 1, 0, 2], 10, true);
			addAnimation("jump", [1], 0, false);
			addAnimation("hurt", [0], 0, false);
			
			if (FlxG.getPlugin(FlxControl) == null)
			{
				FlxG.addPlugin(new FlxControl);
			}
			
			FlxControl.create(this, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES, 1, true, false);
			
			FlxControl.player1.setCursorControl(false, false, true, true);
			FlxControl.player1.setJumpButton("SPACE", FlxControlHandler.KEYMODE_PRESSED, 200, FlxObject.FLOOR, 250, 200);
			FlxControl.player1.setBounds(1, 1, level.width-50, level.height);
			FlxControl.player1.setMovementSpeed(1500, 0, 200, 200, 1000, 0);
			FlxControl.player1.setGravity(0, 100);
			
			//facing = FlxObject.RIGHT;
		}
		public function restart():void 
		{
			reset(startX, startY);
		}
		
		override public function update():void
		{
			super.update();
			
			if (touching == FlxObject.FLOOR)
			{
				if (velocity.x != 0)
				{
					play("walk");
				}
				else
				{
					play("idle");
				}
			}
			else if (velocity.y < 0)
			{
				play("jump");
			}
		}
		
	}
}