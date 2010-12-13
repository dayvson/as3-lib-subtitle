package com.dayvson.subtitle
{
	import flash.events.Event;
	
	public class SubtitleEvent extends Event
	{
		public var data:*;
		public static const LOADED_SUBTITLE:String = "onComplete";
		public static const NEXT_SUBTITLE:String = "onNext";
		public function SubtitleEvent(type:String, data:*=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			//TODO: implement function
			this.data = data;
			super(type, bubbles, cancelable);
		}
	}
}