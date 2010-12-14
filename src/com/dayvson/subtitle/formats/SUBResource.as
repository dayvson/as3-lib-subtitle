package com.dayvson.subtitle.formats
{
	import com.dayvson.subtitle.base.SubTitleBase;

	public class SUBResource extends SubTitleBase
	{
		protected static const BLOCK_PATTERN:RegExp = /\r?\n/;
		protected static const ROW_PATTERN:RegExp = /^(\{.+\})/g;
		protected static const TIME_PATTERN:RegExp = /([0-9]+)/g;
		private var _fps:Number = 1; 
		public function SUBResource(){
			super();
		}

		public function get fps():Number
		{
			return _fps;
		}

		public function set fps(value:Number):void
		{
			_fps = value;
		}

		override public function parseSubtitleRowAndAddItem(item:String):Boolean{
			if(item == null ){
				return false;
			} 
			var result:Array = item.split(ROW_PATTERN).slice(1);
			if(result.length < 2) {
				return false;
			} 
			var times:Array = result[0].match(TIME_PATTERN);
			var item:Object = { startFrame: Number(times[0]), 
								endFrame: Number(times[1]),
								startTime: Number(times[0]) * this.fps,
								endTime: Number(times[1]) * this.fps,
								text: result.split("|").join("\n"),
								index: result[0] };
			var subitem:SubTitleItem = new SubTitleItem(item);
			this.lines.push(subitem);
			return true;
		}
	}
}