package com.dayvson.subtitle.display
{
	import com.dayvson.subtitle.base.SubTitleItem;
	import com.dayvson.subtitle.config.Configuration;
	import com.dayvson.subtitle.interfaces.ISubTitle;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.utils.Timer;
	import flash.utils.getTimer;
	
	public class SubtitleViewer extends Sprite
	{
		private var configuration:Configuration;
		private var format:TextFormat; 
		private var render:TextField;
		private var subtitle:ISubTitle;
		private var lastTime:int;
		private var timer:Timer;
		public function SubtitleViewer(){
			super();
			if(stage)initilize();
			else addEventListener(Event.ADDED_TO_STAGE,initilize, false, 0, true);	
		}
		
		public function initilize(e:Event = null):void{
			format = new TextFormat();
			setupTextBox();
			if(configuration == null ){
				setConfiguration(new Configuration());	
			}
		}
		
		public function start():void{
			
			timer = new Timer(30);
			timer.addEventListener(TimerEvent.TIMER, onTime, false, 0 , true);
			timer.start();
		}
		
		public function pause():void{
			timer.stop();
			
		}
		
		public function resume():void{
			timer.start();
		}
		
		public function stop():void{
			timer.stop();
			timer.reset();
			displayMessage("");
		}
		
		public function setConfiguration(configuration:Configuration):void{
			this.configuration = configuration;
			updateRender();
		}
		
		public function getConfiguration():Configuration{
			return this.configuration;	
		}
		
		public function displayMessage(msg:String):void{
			render.text = msg;
		}
		
		public function setSubTitle(subtitle:ISubTitle):void{			
			show();
			this.subtitle = subtitle;
		}
		
		public function getSubTitle():ISubTitle{
			return subtitle;
		}
		
		public function show():void{
			
		}
		
		public function hide():void{
			
		}
		
		public function setFont(font:String):void{
			configuration.font = font;	
			updateRender();
		}
		
		public function setSize(size:Number):void{
			configuration.size = size;	
			updateRender();
		}
		
		public function setColor(color:Number):void{
			configuration.color = color;	
			updateRender();
		}
		
		private function onTime (e:TimerEvent):void{
			var time:int = timer.currentCount * timer.delay;
			var subitem:SubTitleItem = subtitle.getByTime(time);
			displayMessage(subitem == null ? "" : subitem.text);
			e.updateAfterEvent();
		}
		
		private function setupTextBox():void{
			render = new TextField();
			render.multiline = true;
			render.wordWrap = true;
			render.width = 640;
			render.height = 100;
			render.antiAliasType = AntiAliasType.ADVANCED;
			render.text = "Carregando...";
			render.selectable = false;
			render.autoSize = TextFieldAutoSize.CENTER;
			addChild(render);
		}
		
		private function updateRender():void{
			format.font = configuration.font;
			format.size = configuration.size;
			format.color = configuration.color;
			format.align = TextFormatAlign.CENTER;
			render.defaultTextFormat = format;
		}
	}
}