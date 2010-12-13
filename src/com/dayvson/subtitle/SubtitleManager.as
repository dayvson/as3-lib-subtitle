package com.dayvson.subtitle
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import com.dayvson.subtitle.formats.srt.SRTSubTitle;
	
	public class SubtitleManager extends EventDispatcher
	{
		public var list:Array;
		public function SubtitleManager(target:IEventDispatcher=null)
		{
			list = [];
			super(target);
		}
		
		public function addItem(args:Object):void{
			var sub:SRTSubTitle = new SRTSubTitle();
			sub.load(args.url);
			list.push({sub:sub, idioma:args.idioma});
		}
	}
}