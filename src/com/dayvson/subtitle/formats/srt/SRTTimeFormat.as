package com.dayvson.subtitle.formats.srt
{
	public class SRTTimeFormat
	{
		public static const TIME_PATTERN:RegExp =/([0-9]{2}):([0-9]{2}):([0-9]{2}),([0-9]*)?/g;
		
		public static function resolve(value:String = "00:00:01,001"):Number{
			if(value.match(TIME_PATTERN) == false){
				return -1;
			}
			var result	:Array = value.split(TIME_PATTERN).slice(1);
			var mili	:Number = (result[3] || 0.0);
			var sec		:Number = (result[2] || 0.0);
			var min		:Number = (result[1] || 0.0) * 60;
			var hrs		:Number = (result[0] || 0.0) * 3600;
			var timestamp:Number = ((hrs + min + sec) * 1000) + mili;
			return timestamp;
		}
	}
}