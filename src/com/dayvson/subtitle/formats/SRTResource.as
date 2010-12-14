package com.dayvson.subtitle.formats
{
	import com.dayvson.subtitle.base.SubTitleBase;
	import com.dayvson.subtitle.base.SubTitleItem;
	
	import org.osmf.net.StreamingURLResource;

	public class SRTResource extends SubTitleBase
	{
		protected static const ROW_PATTERN:RegExp = /\n\r?\n/;
		protected static const TIME_PATTERN:RegExp =/([0-9]{2}):([0-9]{2}):([0-9]{2}),([0-9]*)?/g;
		public function SRTResource()
		{
			super();
		}

		override public function parseSubtitleRowAndAddItem(item:String):Boolean{
			if(item == null ){
				return false;
			} 
			var result:Array = item.split(ROW_PATTERN);
			if(result.length < 2) {
				return false;
			} 
			var times:Array = (result[1] as String).match(TIME_PATTERN);
			var itemObject:Object = { startTime: SRTResource.getTimeStamp(times[0]), 
								endTime: SRTResource.getTimeStamp(times[1]),
								text: result.slice(2, result.length).join("\n"), 
							    index: result[0] };
			var subitem:SubTitleItem = new SubTitleItem(itemObject);
			this.lines.push(subitem);
			return true;
		}
		
		public static function getTimeStamp(value:String):Number{
			if(value.match(TIME_PATTERN) == false){
				return -1;
			}
			var result:Array = value.split(TIME_PATTERN).slice(1);
			var mili:Number = (result[3] || 0.0);
			var sec:Number = (result[2] || 0.0);
			var min:Number = (result[1] || 0.0) * 60;
			var hrs:Number = (result[0] || 0.0) * 3600;
			var timestamp:Number = ((hrs + min + sec) * 1000) + mili;
			return timestamp;
		}
	}
}