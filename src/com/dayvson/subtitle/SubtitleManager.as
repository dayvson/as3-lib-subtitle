package com.dayvson.subtitle
{
	import com.dayvson.subtitle.formats.SRTResource;
	import com.dayvson.subtitle.formats.SUBResource;
	import com.dayvson.subtitle.interfaces.ISubTitle;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class SubtitleManager extends EventDispatcher
	{
		public static const SUB_KIND:String = "SUB";
		public static const SRT_KIND:String = "SRT";
		public var list:Array;
		public function SubtitleManager(target:IEventDispatcher=null)
		{
			list = [];
			super(target);
		}
		public function getSubtitle(id:String):ISubTitle{
			list.forEach(function(item:Object):Object{
				if(item.id == id){
					return item.subtitle;
				}
				return null;
			});
			return null;
		}
		
		public function addItem(url:String = null, kind:String = "SRT", id:String = null, language:String = null, rawcontent:String = null):void{
			var subtitle:ISubTitle;
			switch(kind){
				case SUB_KIND:
					subtitle = new SUBResource();
					break;
				case SRT_KIND:
					subtitle = new SRTResource();
					break;
			}
			if(url != null){
				subtitle.load(url);
			}else if( rawcontent != null ){
				subtitle.parse(rawcontent);
			}
			list.push({subtitle:subtitle, kind:kind, id:id, language:language});
		}
	}
}