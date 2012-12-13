package  
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		private var player:Player;
		private var level:Level2;
		private var score:FlxText;
		
		public function PlayState() 
		{
		}
		
		override public function create():void
		{
			level = new Level2;
			
			player = new Player(4, 1400);
			
			score = new FlxText(10, 10, 500, "", true);
			score.color = 0xff000000;
			score.shadow = 0xffffffff;
			score.scrollFactor.x = 0;
			score.scrollFactor.y = 0;
			score.text = "0 / " + level.totalFolhas.toString();
			score.size = 30;
			
			add(level);
			add(player);
			add(level.folhas);
			add(score);
			
			//	Tell flixel how big our game world is
			FlxG.worldBounds = new FlxRect(0, 0, level.width, level.height);
			
			//	Don't let the camera wander off the edges of the map
			FlxG.camera.setBounds(0, 0, level.width, level.height);
			
			//	The camera will follow the player
			FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
		}
		
		override public function update():void
		{
			super.update();
			
			FlxG.collide(player, level);
			FlxG.overlap(player, level.folhas, hitFolha);
			FlxG.overlap(player, level.macas, hitMaca);
			
			//	Player walked through end of level exit?
			if (player.x > Registry.levelExit.x && player.y == Registry.levelExit.y)
			{
				player.exists = false;
				FlxG.fade(0xff000000, 2, changeState);
			}
		}
		
		private function changeState():void
		{
			FlxG.switchState(new LevelEndState);
		}
		
		private function hitMaca(p:FlxObject, maca:FlxObject):void
		{
			maca.kill();
			
			FlxG.score += 1;
			
			if (FlxG.score == level.totalMacas)
			{
				//	Opens the exit at the end of the level
				score.text = "1" + " / " + level.totalMacas.toString() + " PASSAGEM ABERTA!";
				level.openExit();
			}
			else
			{
				score.text = "1" + " / " + level.totalMacas.toString();
			}
		}
		
		private function hitFolha(p:FlxObject, folha:FlxObject):void
		{
			folha.kill();
			
			FlxG.score += 1;
			
			if (FlxG.score == level.totalFolhas)
			{
				//	Opens the exit at the end of the level
				score.text = FlxG.score.toString() + " / " + level.totalFolhas.toString() + " PEGUE A MAÇÃ!";
				level.initMacas();
				add(level.macas);
				FlxG.score = 0;
			}
			else
			{
				score.text = FlxG.score.toString() + " / " + level.totalFolhas.toString();
			}
		}
		
	}
}