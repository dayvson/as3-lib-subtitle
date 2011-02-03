package com.dayvson.subtitle
{
	import com.dayvson.subtitle.formats.SRTResource;
	import com.dayvson.subtitle.formats.SUBResource;
	import com.dayvson.subtitle.formats.srt.SRTSubTitle;
	import com.dayvson.subtitle.interfaces.ISubTitle;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class SubtitleManager extends EventDispatcher
	{
		public var list:Array;
		public function SubtitleManager(target:IEventDispatcher=null)
		{
			list = [];
			super(target);
		}
		public function getSubtitle(id:String):ISubTitle{
			list.forEach(function(item:Object){
				if(item.id == id){
					return item;
				}
			});
			return;
		}
		
		public function addItem(args:Object):void{
			var subtitle:ISubTitle;
			switch(args.kind){
				case "SUB":
					subtitle = new SUBResource();
					break;
				case "STR":
					subtitle = new SRTResource();
					break;
			}
			if(args.url){
				subtitle.load(args.url);
			}else if(args.content){
				subtitle.parse(args.content);
			}
			list.push({sub:sub, kind:args.kind, id:args.id, idioma:args.idioma});
		}
	}
}